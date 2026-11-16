import "server-only";
import { estimateCost, getAiProvider } from "@/lib/ai";
import {
  buildNotePrompt, buildQuestionsPrompt, buildTriagePrompt, caQuestionsSchema, checkCaQuestion, NOTE_SYSTEM, noteSchema,
  QUESTIONS_SYSTEM, TRIAGE_SYSTEM, triageSchema, type CaNote, type NoteSource, type Triage,
} from "@/lib/ai/current-affairs";
import { createAdminClient } from "@/lib/supabase/admin";
import { parseFeed } from "./feed";
import { fetchFeed } from "./fetch";
import { fingerprint, groupArticles } from "./group";
import { bhutanDate, outletOf, publishDecision, type CaConfig, type StoryEvidence, type Tier } from "./rules";

/**
 * The automated current-affairs pipeline (Milestone 7):
 * collect → triage → group → write notes → questions → verify/publish → daily features.
 * Runs on the server with the secret key, from the scheduler or "Run now".
 * Every step is bounded in time, items and AI budget, and logged in ca_runs.
 */

type Db = ReturnType<typeof createAdminClient>;
type Stats = Record<string, number>;
const now = () => new Date().toISOString();
const SOFT_DEADLINE_MS = 240_000; // stop starting new AI work after 4 minutes (functions allow 5)

export async function runPipeline(opts: { trigger: "schedule" | "manual"; requestedBy?: string | null }) {
  const db = createAdminClient();
  const started = Date.now();
  const timeLeft = () => SOFT_DEADLINE_MS - (Date.now() - started);

  // One run at a time.
  const { data: running } = await db.from("ca_runs").select("id").eq("status", "running").gt("started_at", new Date(Date.now() - 15 * 60 * 1000).toISOString()).limit(1);
  if (running?.length) {
    await db.from("ca_runs").insert({ trigger: opts.trigger, status: "skipped", finished_at: now(), stats: { reason: "another run in progress" }, requested_by: opts.requestedBy ?? null });
    return { status: "skipped" as const };
  }
  const { data: run } = await db.from("ca_runs").insert({ trigger: opts.trigger, requested_by: opts.requestedBy ?? null }).select("id").single();
  const stats: Stats = {};
  const errors: { step: string; message: string }[] = [];
  const add = (k: string, n = 1) => { stats[k] = (stats[k] ?? 0) + n; };

  const { data: cfgRow } = await db.from("app_settings").select("value").eq("key", "ca.config").maybeSingle();
  const cfg = (cfgRow?.value ?? {}) as CaConfig;
  if (cfg.enabled === false) {
    await db.from("ca_runs").update({ status: "skipped", finished_at: now(), stats: { reason: "disabled in settings" } }).eq("id", run!.id);
    return { status: "skipped" as const };
  }

  const step = async (name: string, fn: () => Promise<void>) => {
    try { await fn(); } catch (e) { errors.push({ step: name, message: e instanceof Error ? e.message.slice(0, 500) : "error" }); }
  };

  await step("collect", () => collect(db, add, errors));

  const budget = new Budget(db, cfg.daily_budget_usd ?? 1.5);
  await budget.load();
  const triageAi = getAiProvider(cfg.triage_model || "claude-haiku-5-5");
  const writeAi = getAiProvider(cfg.write_model || "claude-sonnet-5-5");
  if (!triageAi || !writeAi) {
    stats.ai = 0;
    errors.push({ step: "ai", message: "AI is not configured (ANTHROPIC_API_KEY). Articles are collected and wait for AI processing." });
  } else {
    await step("triage", () => triage(db, cfg, triageAi, budget, add, timeLeft));
    await step("group", () => group(db, add));
    await step("recheck", () => recheckHeld(db, cfg, add));
    await step("write", () => writeStories(db, cfg, writeAi, budget, add, timeLeft, errors));
  }
  await step("daily", () => dailyFeatures(db, add));
  await step("assessments", () => assessments(db, add));

  const status = errors.some((e) => e.step !== "ai") ? (Object.keys(stats).length ? "partial" : "failed") : "succeeded";
  await db.from("ca_runs").update({ status, finished_at: now(), stats: { ...stats, spent_usd: Number(budget.spent.toFixed(4)) }, errors }).eq("id", run!.id);
  return { status, stats, errors };
}

// ---------------------------------------------------------------------------
// Budget: today's (Bhutan time) AI spend on current affairs
// ---------------------------------------------------------------------------
class Budget {
  spent = 0;
  constructor(private db: Db, private limit: number) {}
  async load() {
    const dayStart = new Date(`${bhutanDate()}T00:00:00+06:00`).toISOString();
    const { data } = await this.db.from("ai_jobs").select("model, input_tokens, output_tokens").eq("input->>ca", "true").gte("created_at", dayStart);
    this.spent = (data ?? []).reduce((s, j) => s + estimateCost(j.model, j.input_tokens ?? 0, j.output_tokens ?? 0), 0);
  }
  ok() { return this.spent < this.limit; }
  record(model: string, i: number, o: number) { this.spent += estimateCost(model, i, o); }
}

async function logJob(db: Db, kind: string, model: string, input: Record<string, unknown>, r: { ok: boolean; inputTokens?: number; outputTokens?: number; message?: string; model?: string }, budget: Budget) {
  budget.record(r.model ?? model, r.inputTokens ?? 0, r.outputTokens ?? 0);
  const { data } = await db.from("ai_jobs").insert({
    kind, provider: "anthropic", model: r.model ?? model, status: r.ok ? "succeeded" : "failed", started_at: now(), completed_at: now(),
    input: { ca: "true", ...input }, input_tokens: r.inputTokens ?? null, output_tokens: r.outputTokens ?? null, error_message: r.ok ? null : r.message ?? null,
  }).select("id").single();
  return data?.id as string | undefined;
}

// ---------------------------------------------------------------------------
// 1. Collect
// ---------------------------------------------------------------------------
async function collect(db: Db, add: (k: string, n?: number) => void, errors: { step: string; message: string }[]) {
  const { data: sources } = await db.from("ca_sources").select("id, name, feed_url, check_interval_hours, last_checked_at, full_text_allowed, consecutive_failures, items_collected")
    .eq("is_active", true).eq("method", "rss").not("feed_url", "is", null).order("priority", { ascending: false });
  const due = (sources ?? []).filter((s) => !s.last_checked_at || Date.now() - new Date(s.last_checked_at).getTime() >= (s.check_interval_hours * 3600 - 600) * 1000
    // back off failing sources: retry at most every 12 hours after 3 failures
    && !(s.consecutive_failures >= 3 && s.last_checked_at && Date.now() - new Date(s.last_checked_at).getTime() < 12 * 3600 * 1000)).slice(0, 14);
  const cutoff = Date.now() - 7 * 24 * 3600 * 1000;

  for (let i = 0; i < due.length; i += 4) {
    await Promise.all(due.slice(i, i + 4).map(async (s) => {
      const res = await fetchFeed(s.feed_url!);
      if (!res.ok) {
        add("sources_failed");
        errors.push({ step: "collect", message: `${s.name}: ${res.reason}` });
        await db.from("ca_sources").update({ last_checked_at: now(), last_error: res.reason, consecutive_failures: s.consecutive_failures + 1 }).eq("id", s.id);
        return;
      }
      const parsed = parseFeed(res.text, { keepBody: s.full_text_allowed, max: 40 });
      const entries = parsed.filter((e) => !e.publishedAt || new Date(e.publishedAt).getTime() >= cutoff);
      const rows = entries.map((e) => ({ source_id: s.id, url: e.url, title: e.title, snippet: e.snippet, body: e.body, published_at: e.publishedAt, fingerprint: fingerprint(e.title) }));
      let inserted = 0;
      if (rows.length) {
        const { data, error } = await db.from("ca_articles").upsert(rows, { onConflict: "url", ignoreDuplicates: true }).select("id");
        if (error) errors.push({ step: "collect", message: `${s.name}: could not save entries (${error.message.slice(0, 120)})` });
        inserted = data?.length ?? 0;
      }
      // Explain empty results so a wrong or stale feed is easy to spot in admin.
      if (parsed.length === 0) {
        errors.push({ step: "collect", message: `${s.name}: feed answered but no entries could be read${/<(item|entry)[\s>]/i.test(res.text) ? " (unusual format)" : " (feed is empty)"}` });
      } else if (entries.length === 0) {
        const newest = parsed.map((e) => e.publishedAt).filter(Boolean).sort().pop();
        errors.push({ step: "collect", message: `${s.name}: all ${parsed.length} entries are older than 7 days${newest ? ` (newest ${newest.slice(0, 10)})` : ""}` });
      }
      add("sources_ok");
      add("articles_new", inserted);
      await db.from("ca_sources").update({ last_checked_at: now(), last_success_at: now(), last_error: null, consecutive_failures: 0, items_collected: s.items_collected + inserted }).eq("id", s.id);
    }));
  }
}

// ---------------------------------------------------------------------------
// 2. Triage (cheap model)
// ---------------------------------------------------------------------------
type Provider = NonNullable<ReturnType<typeof getAiProvider>>;

async function triage(db: Db, cfg: CaConfig, ai: Provider, budget: Budget, add: (k: string, n?: number) => void, timeLeft: () => number) {
  const { data } = await db.from("ca_articles").select("id, title, snippet, published_at, ca_sources(name)").eq("state", "new").order("retrieved_at", { ascending: false }).limit(150);
  const articles = (data ?? []) as unknown as { id: string; title: string; snippet: string | null; published_at: string | null; ca_sources: { name: string } }[];
  for (let i = 0; i < articles.length && timeLeft() > 60_000 && budget.ok(); i += 25) {
    const batch = articles.slice(i, i + 25);
    const r = await ai.generateStructured({
      system: TRIAGE_SYSTEM, schema: triageSchema, maxTokens: 6000, effort: "low",
      prompt: buildTriagePrompt(batch.map((a, k) => ({ n: k + 1, source: a.ca_sources.name, title: a.title, snippet: a.snippet, date: a.published_at }))),
    });
    await logJob(db, "classification", ai.model, { step: "triage", articles: batch.length }, r.ok ? { ok: true, inputTokens: r.inputTokens, outputTokens: r.outputTokens, model: r.model } : r, budget);
    if (!r.ok) { add("triage_failed", batch.length); continue; }
    const byN = new Map(r.data.items.map((t) => [t.n, t]));
    for (const [k, a] of batch.entries()) {
      const t = byN.get(k + 1);
      if (!t) continue;
      const relevant = t.relevance >= (cfg.min_relevance ?? 60);
      await db.from("ca_articles").update({ triage: t, relevance: Math.max(0, Math.min(100, t.relevance)), state: relevant ? "triaged" : "ignored" }).eq("id", a.id);
      add(relevant ? "articles_relevant" : "articles_ignored");
    }
  }
}

// ---------------------------------------------------------------------------
// 3. Group into stories
// ---------------------------------------------------------------------------
async function group(db: Db, add: (k: string, n?: number) => void) {
  const { data: fresh } = await db.from("ca_articles").select("id, url, title, fingerprint, published_at, triage, relevance").eq("state", "triaged").is("story_id", null).limit(200);
  if (!fresh?.length) return;
  const since = new Date(Date.now() - 5 * 24 * 3600 * 1000).toISOString();
  const { data: existing } = await db.from("ca_articles").select("id, fingerprint, published_at, story_id").not("story_id", "is", null).gte("retrieved_at", since).limit(1000);
  const groups = groupArticles(
    fresh.map((a) => ({ id: a.id, fingerprint: a.fingerprint, publishedAt: a.published_at })),
    (existing ?? []).map((e) => ({ id: e.id, fingerprint: e.fingerprint, publishedAt: e.published_at, storyId: e.story_id })),
  );
  const byId = new Map(fresh.map((a) => [a.id, a]));
  for (const [key, ids] of groups) {
    let storyId: string;
    if (key.startsWith("story:")) {
      storyId = key.slice(6);
      add("articles_joined_story", ids.length);
    } else {
      const lead = ids.map((id) => byId.get(id)!).sort((x, y) => (y.relevance ?? 0) - (x.relevance ?? 0))[0];
      const t = lead.triage as Triage;
      const { data: cat } = await db.from("ca_categories").select("id").eq("slug", t.category).maybeSingle();
      const { data: story, error } = await db.from("ca_items").insert({
        title: lead.title, url: lead.url, published_on: lead.published_at?.slice(0, 10) ?? null, retrieved_at: now(),
        area: t.area, countries: t.countries.slice(0, 8), category_id: cat?.id ?? null, event_date: /^\d{4}-\d{2}-\d{2}$/.test(t.event_date) ? t.event_date : null,
        importance: lead.relevance, status: "draft", pipeline_status: "collected",
      }).select("id").single();
      if (error || !story) continue;
      storyId = story.id;
      add("stories_new");
    }
    await db.from("ca_articles").update({ story_id: storyId, state: "grouped" }).in("id", ids);
  }
}

// Evidence for a story from its articles.
async function evidence(db: Db, storyId: string) {
  const { data } = await db.from("ca_articles").select("id, url, title, snippet, body, published_at, triage, ca_sources(name, tier)").eq("story_id", storyId).order("published_at", { ascending: true }).limit(8);
  return (data ?? []) as unknown as { id: string; url: string; title: string; snippet: string | null; body: string | null; published_at: string | null; triage: Triage | null; ca_sources: { name: string; tier: Tier } }[];
}

function toEvidence(arts: Awaited<ReturnType<typeof evidence>>, note: { confidence: CaNote["confidence"] | null; conflicts: boolean; text: string }): StoryEvidence {
  return {
    articles: arts.map((a) => ({ source: outletOf(a.ca_sources.name, a.title), tier: a.ca_sources.tier, kind: a.triage?.kind ?? "fact", developing: Boolean(a.triage?.developing), sensitive: Boolean(a.triage?.sensitive) })),
    noteConfidence: note.confidence, conflicts: note.conflicts, text: note.text,
  };
}

// Held stories that gained sources may now pass (e.g. single source → corroborated).
async function recheckHeld(db: Db, cfg: CaConfig, add: (k: string, n?: number) => void) {
  const { data } = await db.from("ca_items").select("id, title, summary, note, confidence, hold_reason, verification").eq("pipeline_status", "held").is("reviewed_by", null)
    .gte("created_at", new Date(Date.now() - 4 * 24 * 3600 * 1000).toISOString()).limit(50);
  for (const s of data ?? []) {
    const note = s.note as CaNote | null;
    if (!note) continue;
    const d = publishDecision(toEvidence(await evidence(db, s.id), { confidence: s.confidence, conflicts: note.conflicts, text: `${s.title} ${s.summary ?? ""}` }), cfg);
    if (d.publish) { await publishStory(db, s.id, d.verification); add("stories_published_after_recheck"); }
    else if (d.verification !== s.verification) await db.from("ca_items").update({ verification: d.verification, hold_reason: d.holdReason }).eq("id", s.id);
  }
}

// ---------------------------------------------------------------------------
// 4. Write notes + questions, then decide
// ---------------------------------------------------------------------------
async function writeStories(db: Db, cfg: CaConfig, ai: Provider, budget: Budget, add: (k: string, n?: number) => void, timeLeft: () => number, errors: { step: string; message: string }[]) {
  const today = bhutanDate();
  const quota = { bhutan: cfg.per_day?.bhutan ?? 3, regional: cfg.per_day?.regional ?? 2, world: cfg.per_day?.world ?? 2 };
  const { data: done } = await db.from("ca_items").select("area").in("pipeline_status", ["written", "held", "published"]).gte("updated_at", new Date(`${today}T00:00:00+06:00`).toISOString());
  const used = { bhutan: 0, regional: 0, world: 0 } as Record<string, number>;
  for (const d of done ?? []) if (d.area) used[d.area] = (used[d.area] ?? 0) + 1;

  const { data: candidates } = await db.from("ca_items").select("id, area, importance, created_at").eq("pipeline_status", "collected")
    .gte("created_at", new Date(Date.now() - 3 * 24 * 3600 * 1000).toISOString()).order("importance", { ascending: false }).limit(60);
  // More sources first among equally important stories.
  const counts = new Map<string, number>();
  for (const c of candidates ?? []) {
    const { count } = await db.from("ca_articles").select("id", { count: "exact", head: true }).eq("story_id", c.id);
    counts.set(c.id, count ?? 1);
  }
  const ordered = [...(candidates ?? [])].sort((a, b) => (b.importance ?? 0) + 5 * (counts.get(b.id) ?? 1) - ((a.importance ?? 0) + 5 * (counts.get(a.id) ?? 1)));

  const { data: subjects } = await db.from("subjects").select("id, slug, paper_id").in("slug", ["general-awareness-current-affairs", "english-general-knowledge"]);
  const peSubject = subjects?.find((s) => s.slug === "general-awareness-current-affairs");
  const meSubject = subjects?.find((s) => s.slug === "english-general-knowledge");

  for (const c of ordered) {
    if (timeLeft() < 70_000 || !budget.ok()) { if (!budget.ok()) errors.push({ step: "write", message: "Daily AI budget reached; remaining stories wait for tomorrow." }); break; }
    const area = (c.area ?? "world") as keyof typeof quota;
    if ((used[area] ?? 0) >= quota[area]) continue;
    const arts = await evidence(db, c.id);
    if (!arts.length) continue;
    // Opinion-only stories are not written up.
    if (arts.every((a) => a.triage?.kind && a.triage.kind !== "fact")) {
      await db.from("ca_items").update({ pipeline_status: "held", verification: "opinion", hold_reason: "Opinion or analysis, not a factual report." }).eq("id", c.id);
      continue;
    }
    const sources: NoteSource[] = arts.map((a, i) => ({ n: i + 1, outlet: outletOf(a.ca_sources.name, a.title), tier: a.ca_sources.tier, title: a.title, date: a.published_at, url: a.url, text: [a.snippet, a.body].filter(Boolean).join("\n\n") || a.title }));
    const r = await ai.generateStructured({ system: NOTE_SYSTEM, prompt: buildNotePrompt(sources), schema: noteSchema, maxTokens: 6000, effort: "medium" });
    const jobId = await logJob(db, "current_affairs_notes", ai.model, { step: "note", story: c.id }, r.ok ? { ok: true, inputTokens: r.inputTokens, outputTokens: r.outputTokens, model: r.model } : r, budget);
    if (!r.ok) { await db.from("ca_items").update({ pipeline_status: "failed", verification_notes: r.message }).eq("id", c.id); add("notes_failed"); continue; }
    const note = r.data;
    // Keep only fact citations that point at real sources.
    note.key_facts = note.key_facts.map((f) => ({ ...f, sources: f.sources.filter((n) => n >= 1 && n <= sources.length) })).filter((f) => f.sources.length);
    used[area] = (used[area] ?? 0) + 1;
    add("notes_written");

    const decision = publishDecision(toEvidence(arts, { confidence: note.key_facts.length ? note.confidence : "low", conflicts: note.conflicts, text: `${note.headline} ${note.summary}` }), cfg);
    await db.from("ca_items").update({
      title: note.headline.slice(0, 300), summary: note.summary, note, confidence: note.confidence, importance: Math.max(0, Math.min(100, note.importance)),
      verification: decision.verification, sensitive: decision.sensitive, hold_reason: decision.holdReason, ai_job_id: jobId ?? null,
      pe_relevant: true, me_relevant: true, verification_notes: note.conflicts ? note.conflict_note : null, pipeline_status: "written",
    }).eq("id", c.id);

    // Questions only for stories that are not opinion, conflicting or developing.
    if (!["opinion", "conflicting", "developing"].includes(decision.verification) && budget.ok() && timeLeft() > 50_000) {
      await writeQuestions(db, cfg, ai, budget, c.id, note, peSubject, meSubject, add);
    }
    if (decision.publish) { await publishStory(db, c.id, decision.verification); add("stories_published"); }
    else { await db.from("ca_items").update({ pipeline_status: "held" }).eq("id", c.id); add("stories_held"); }
  }
}

async function writeQuestions(db: Db, cfg: CaConfig, ai: Provider, budget: Budget, storyId: string, note: CaNote, pe: { id: string; paper_id: string | null } | undefined, me: { id: string; paper_id: string | null } | undefined, add: (k: string, n?: number) => void) {
  const count = Math.max(2, Math.min(8, cfg.questions_per_item ?? 4));
  const r = await ai.generateStructured({ system: QUESTIONS_SYSTEM, prompt: buildQuestionsPrompt(note, count, true), schema: caQuestionsSchema, maxTokens: 8000, effort: "medium" });
  const jobId = await logJob(db, "question_generation", ai.model, { step: "questions", story: storyId }, r.ok ? { ok: true, inputTokens: r.inputTokens, outputTokens: r.outputTokens, model: r.model } : r, budget);
  if (!r.ok) { add("questions_failed"); return; }
  for (const q of r.data.questions.slice(0, count + 2)) {
    if (checkCaQuestion(q)) { add("questions_rejected"); continue; }
    const written = q.format === "short_answer" || q.format === "analytical";
    const subject = written ? me : pe;
    const { data: row, error } = await db.from("questions").insert({
      stage: written ? "ME" : "PE", question_type: written ? q.format : "mcq", stem: q.stem.trim(), explanation: q.explanation,
      model_answer: written ? q.model_answer : null, marks: written ? (q.format === "analytical" ? 10 : 5) : 1, difficulty: q.difficulty,
      subject_id: subject?.id ?? null, paper_id: subject?.paper_id ?? null, origin: "current_affairs", ca_item_id: storyId, ai_job_id: jobId ?? null, status: "ai_generated",
    }).select("id").single();
    if (error || !row) { add("questions_duplicate"); continue; }
    if (!written) {
      await db.from("question_options").insert(q.options.map((body, i) => ({ question_id: row.id, label: String.fromCharCode(65 + i), body: body.trim(), is_correct: i === q.correct_option, position: i + 1 })));
    }
    add("questions_written");
  }
}

async function publishStory(db: Db, storyId: string, verification: string) {
  const at = now();
  await db.from("ca_items").update({ status: "published", pipeline_status: "published", auto_published: true, published_at: at, feature_date: bhutanDate(), verification, hold_reason: null }).eq("id", storyId);
  const { data: qs } = await db.from("questions").select("id").eq("ca_item_id", storyId).eq("status", "ai_generated");
  for (const q of qs ?? []) {
    // verified → published, marked as automatic (no human verifier).
    const { error } = await db.from("questions").update({ status: "verified", auto_published: true, verified_at: at }).eq("id", q.id);
    if (!error) await db.from("questions").update({ status: "published", published_at: at }).eq("id", q.id);
  }
}

// ---------------------------------------------------------------------------
// 5. Question of the Day, weekly and monthly assessments
// ---------------------------------------------------------------------------
async function dailyFeatures(db: Db, add: (k: string, n?: number) => void) {
  const today = bhutanDate();
  const { data: existing } = await db.from("ca_daily").select("day").eq("day", today).maybeSingle();
  if (existing) return;
  const { data: items } = await db.from("ca_items").select("id").eq("status", "published").gte("feature_date", bhutanDate(new Date(Date.now() - 2 * 86400000))).order("importance", { ascending: false }).limit(10);
  for (const it of items ?? []) {
    const { data: q } = await db.from("questions").select("id").eq("ca_item_id", it.id).eq("status", "published").eq("question_type", "mcq").limit(1).maybeSingle();
    if (q) { await db.from("ca_daily").insert({ day: today, question_id: q.id }); add("question_of_day"); return; }
  }
}

async function assessments(db: Db, add: (k: string, n?: number) => void) {
  const today = new Date(`${bhutanDate()}T00:00:00Z`);
  const dow = today.getUTCDay(); // 1 = Monday
  const lastMonday = new Date(today.getTime() - ((dow + 6) % 7 + 7) * 86400000);
  const weekStart = lastMonday.toISOString().slice(0, 10);
  const weekEnd = new Date(lastMonday.getTime() + 6 * 86400000).toISOString().slice(0, 10);
  await buildAssessment(db, "weekly", weekStart, weekEnd, 15, `Current Affairs Weekly Challenge — ${fmt(weekStart)} to ${fmt(weekEnd)}`, 15, add);
  const m = new Date(Date.UTC(today.getUTCFullYear(), today.getUTCMonth() - 1, 1));
  const monthStart = m.toISOString().slice(0, 10);
  const monthEnd = new Date(Date.UTC(today.getUTCFullYear(), today.getUTCMonth(), 0)).toISOString().slice(0, 10);
  await buildAssessment(db, "monthly", monthStart, monthEnd, 35, `Current Affairs Monthly Assessment — ${m.toLocaleDateString("en-GB", { month: "long", year: "numeric", timeZone: "UTC" })}`, 40, add);
}

const fmt = (d: string) => new Date(`${d}T00:00:00Z`).toLocaleDateString("en-GB", { day: "numeric", month: "short", timeZone: "UTC" });

async function buildAssessment(db: Db, period: "weekly" | "monthly", start: string, end: string, n: number, title: string, minutes: number, add: (k: string, n?: number) => void) {
  const { data: exists } = await db.from("exams").select("id").eq("ca_period", period).eq("ca_period_start", start).is("owner_id", null).maybeSingle();
  if (exists) return;
  const { data: items } = await db.from("ca_items").select("id").eq("status", "published").gte("feature_date", start).lte("feature_date", end);
  const ids = (items ?? []).map((i) => i.id);
  if (!ids.length) return;
  const { data: qs } = await db.from("questions").select("id, ca_item_id").in("ca_item_id", ids).eq("status", "published").eq("question_type", "mcq");
  // Spread across stories: at most 2 per story for weekly, 2 for monthly.
  const perStory = new Map<string, number>();
  const chosen: string[] = [];
  for (const q of (qs ?? []).sort(() => Math.random() - 0.5)) {
    const k = perStory.get(q.ca_item_id!) ?? 0;
    if (k >= 2) continue;
    perStory.set(q.ca_item_id!, k + 1);
    chosen.push(q.id);
    if (chosen.length >= n) break;
  }
  if (chosen.length < Math.min(n, 8)) return; // not enough verified questions yet: never publish a thin assessment
  const { data: exam, error } = await db.from("exams").insert({
    slug: `ca-${period}-${start}`, title, stage: "PE", kind: "revision", duration_minutes: minutes, is_free: false, status: "draft",
    description: `${chosen.length} questions on verified current affairs from ${fmt(start)} to ${fmt(end)}. Soma practice questions (AI-generated), not RCSC questions.`,
    ca_period: period, ca_period_start: start, shuffle_questions: true,
  }).select("id").single();
  if (error || !exam) return;
  await db.from("exam_questions").insert(chosen.map((qid, i) => ({ exam_id: exam.id, question_id: qid, position: i + 1 })));
  await db.from("exams").update({ status: "published", published_at: now() }).eq("id", exam.id);
  add(`assessment_${period}`);
}

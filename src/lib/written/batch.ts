import "server-only";
import { getAiProvider } from "@/lib/ai";
import { evaluationSchema } from "@/lib/ai/written-evaluation";
import { createAdminClient } from "@/lib/supabase/admin";
import { completeEvaluation, prepareEvaluation, runEvaluation } from "@/lib/written/runner";

/**
 * Half-price marking of mock-test answers (founder, 21 Nov 2026).
 * Run by the scheduler every 10 minutes:
 *  1. collect finished batches and save the marks;
 *  2. anything that failed, or is not back within LATE_HOURS, is marked straight away instead;
 *  3. send newly requested mock answers as one batch;
 *  4. tell the student when all answers of a mock are marked.
 */
const LATE_HOURS = 3;
const SUBMIT_LIMIT = 100;
const INSTANT_LIMIT = 6;   // instant fallbacks per run (each takes about a minute)

type Row = { id: string; answer_id: string; requested_by: string | null; batch_id: string | null; batch_submitted_at: string | null; assigned_at: string };

export async function processEvaluationBatches() {
  const db = createAdminClient();
  const provider = getAiProvider();
  const report = { collected: 0, submitted: 0, instant: 0, waiting: 0, errors: [] as string[] };
  if (!provider) return report;
  const { data } = await db.from("evaluations")
    .select("id, answer_id, requested_by, batch_id, batch_submitted_at, assigned_at")
    .eq("method", "ai_feedback").eq("delivery", "batch").eq("status", "queued")
    .order("assigned_at").limit(500);
  const rows = (data ?? []) as Row[];
  const ageHours = (t: string | null) => (t ? (Date.now() - new Date(t).getTime()) / 3_600_000 : 0);
  const instant: Row[] = [];
  const marked = new Set<string>();
  const canBatch = Boolean(provider.submitBatch && provider.batchResults);

  // 1. Collect finished batches.
  const byBatch = new Map<string, Row[]>();
  for (const r of rows) if (r.batch_id) byBatch.set(r.batch_id, [...(byBatch.get(r.batch_id) ?? []), r]);
  for (const [batchId, evs] of byBatch) {
    let results;
    try {
      results = canBatch ? await provider.batchResults!(batchId, evaluationSchema) : new Map();
    } catch (e) {
      report.errors.push(`collect ${batchId}: ${e instanceof Error ? e.message.slice(0, 120) : "failed"}`);
      if (ageHours(evs[0].batch_submitted_at) > LATE_HOURS) instant.push(...evs);
      continue;
    }
    if (results === null) {   // still processing
      if (ageHours(evs[0].batch_submitted_at) > LATE_HOURS) instant.push(...evs);
      else report.waiting += evs.length;
      continue;
    }
    for (const ev of evs) {
      const r = results.get(ev.id);
      if (!r || !r.ok) { instant.push(ev); continue; }
      try {
        const { ctx } = await prepareEvaluation(db, ev.answer_id);
        const { data: job } = await db.from("ai_jobs").insert({
          kind: "answer_feedback", provider: provider.name, model: r.model, status: "succeeded", requested_by: ev.requested_by,
          started_at: ev.batch_submitted_at, completed_at: new Date().toISOString(), input_tokens: r.inputTokens, output_tokens: r.outputTokens,
          input: { evaluation_id: ev.id, answer_id: ev.answer_id, words: ctx.wordCount, batch_id: batchId }, output: { batch: true },
        }).select("id").single();
        await completeEvaluation(db, ev.id, ctx, r, job?.id ?? null, { batch: true });
        report.collected++;
        marked.add(ev.answer_id);
      } catch (e) {
        report.errors.push(`save ${ev.id}: ${e instanceof Error ? e.message.slice(0, 120) : "failed"}`);
        instant.push(ev);
      }
    }
  }

  // 3. Submit new requests as one batch (or mark them straight away if batching is unavailable).
  const fresh = rows.filter((r) => !r.batch_id);
  if (fresh.length) {
    if (!canBatch) instant.push(...fresh);
    else {
      const send = fresh.slice(0, SUBMIT_LIMIT);
      const items: { id: string; req: Awaited<ReturnType<typeof prepareEvaluation>>["req"] }[] = [];
      for (const ev of send) {
        try { items.push({ id: ev.id, req: (await prepareEvaluation(db, ev.answer_id)).req }); }
        catch { instant.push(ev); }
      }
      if (items.length) {
        const s = await provider.submitBatch!(items);
        if (s.ok) {
          await db.from("evaluations").update({ batch_id: s.batchId, batch_submitted_at: new Date().toISOString() }).in("id", items.map((i) => i.id));
          report.submitted += items.length;
        } else {
          report.errors.push(`submit: ${s.message}`);
          // Not sent: try again next run, but do not keep a student waiting for long.
          instant.push(...send.filter((ev) => items.some((i) => i.id === ev.id) && ageHours(ev.assigned_at) > 1));
        }
      }
    }
  }

  // 2. Late or failed items: mark straight away (the normal price), a few per run.
  const now = instant.slice(0, INSTANT_LIMIT);
  if (now.length) {
    await db.from("evaluations").update({ delivery: "instant", batch_id: null }).in("id", now.map((e) => e.id));
    await Promise.all(now.map((e) => runEvaluation(e.id).then(() => { marked.add(e.answer_id); })));
    report.instant += now.length;
  }

  // 4. Notify students whose mock answers are now all marked.
  if (marked.size) await notifyMarked(db, [...marked]);
  return report;
}

async function notifyMarked(db: ReturnType<typeof createAdminClient>, answerIds: string[]) {
  const { data: answers } = await db.from("attempt_answers").select("attempt_id, exam_attempts(user_id, exams(title))").in("id", answerIds);
  const attempts = new Map<string, { user: string; title: string }>();
  for (const a of (answers ?? []) as unknown as { attempt_id: string; exam_attempts: { user_id: string; exams: { title: string } | null } | null }[]) {
    if (a.exam_attempts) attempts.set(a.attempt_id, { user: a.exam_attempts.user_id, title: a.exam_attempts.exams?.title ?? "your mock test" });
  }
  for (const [attemptId, info] of attempts) {
    const { data: ans } = await db.from("attempt_answers").select("id").eq("attempt_id", attemptId);
    const { count } = await db.from("evaluations").select("id", { count: "exact", head: true })
      .in("answer_id", (ans ?? []).map((x) => x.id)).eq("method", "ai_feedback").eq("status", "queued");
    if ((count ?? 0) > 0) continue;   // more answers of this mock still being marked
    // A duplicate (same mock, same hour) is refused by the unique dedupe key and simply skipped.
    await db.from("notifications").insert({
      user_id: info.user, kind: "mock_marked", title: "Your mock test answers are marked",
      body: `AI feedback for ${info.title} is ready.`, link: `/dashboard/results/${attemptId}`,
      dedupe_key: `mock-marked-${attemptId}-${new Date().toISOString().slice(0, 13)}`, email_status: "queued",
    });
  }
}

"use server";

import { revalidatePath, revalidateTag, updateTag } from "next/cache";
import { after } from "next/server";
import { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission, AuthorizationError, getCurrentUser } from "@/lib/auth/dal";
import { runPipeline } from "@/lib/ca/pipeline";
import { bhutanDate } from "@/lib/ca/rules";
import { CACHE_TAGS } from "@/lib/data/public";
import { createClient } from "@/lib/supabase/server";

async function guard(): Promise<ActionState | null> {
  try { await assertPermission("ca.manage"); return null; }
  catch (e) { return { status: "error", message: e instanceof AuthorizationError ? e.message : "Not allowed." }; }
}
const done = (message: string, paths: string[] = []): ActionState => {
  for (const p of ["/admin/current-affairs", ...paths]) revalidatePath(p);
  updateTag(CACHE_TAGS.currentAffairs);
  return { status: "success", message };
};

export async function runPipelineNowAction(_prev: ActionState): Promise<ActionState> {
  void _prev;
  const denied = await guard();
  if (denied) return denied;
  const user = await getCurrentUser();
  after(async () => {
    await runPipeline({ trigger: "manual", requestedBy: user?.id ?? null });
    try { revalidateTag(CACHE_TAGS.currentAffairs, "max"); } catch {}
  });
  return done("Run started. Refresh in a few minutes to see the results.");
}

const storyAction = z.object({ id: z.uuid(), action: z.enum(["publish", "unpublish", "reject"]), note: z.string().trim().max(1000).optional() });

/** Publish (as reviewed by you), unpublish or reject a story; its questions follow. */
export async function storyStatusAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = storyAction.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Invalid request." };
  const user = await getCurrentUser();
  const db = await createClient();
  const { id, action } = parsed.data;
  const at = new Date().toISOString();
  if (action === "publish") {
    const { error } = await db.from("ca_items").update({ status: "published", pipeline_status: "published", reviewed_by: user!.id, reviewed_at: at, published_at: at, feature_date: bhutanDate(), hold_reason: null }).eq("id", id);
    if (error) return { status: "error", message: "Could not publish." };
    // Its AI questions are published too, as reviewed by you.
    const { data: qs } = await db.from("questions").select("id, status").eq("ca_item_id", id).in("status", ["ai_generated", "awaiting_review", "verified"]);
    let failed = 0;
    for (const q of qs ?? []) {
      if (q.status !== "verified") {
        const { error: e1 } = await db.from("questions").update({ status: "verified" }).eq("id", q.id);
        if (e1) { failed++; continue; }
      }
      const { error: e2 } = await db.from("questions").update({ status: "published" }).eq("id", q.id);
      if (e2) failed++;
    }
    return done(failed ? `Published. ${failed} question(s) could not be published — open them in the question bank.` : "Published with its questions.", [`/admin/current-affairs/${id}`]);
  }
  if (action === "unpublish") {
    await db.from("questions").update({ status: "verified" }).eq("ca_item_id", id).eq("status", "published");
    const { error } = await db.from("ca_items").update({ status: "draft", pipeline_status: "held", hold_reason: parsed.data.note || "Unpublished by an editor." }).eq("id", id);
    if (error) return { status: "error", message: "Could not unpublish." };
    return done("Unpublished. It stays in the archive for staff only.", [`/admin/current-affairs/${id}`]);
  }
  await db.from("questions").update({ status: "rejected" }).eq("ca_item_id", id).neq("status", "published");
  const { error } = await db.from("ca_items").update({ status: "rejected", pipeline_status: "rejected", hold_reason: parsed.data.note || "Rejected by an editor." }).eq("id", id);
  if (error) return { status: "error", message: "Could not reject." };
  return done("Rejected.", [`/admin/current-affairs/${id}`]);
}

const noteSchema = z.object({
  id: z.uuid(), title: z.string().trim().min(5).max(300), summary: z.string().trim().min(10).max(3000),
  background: z.string().trim().max(4000), why_it_matters: z.string().trim().max(3000), bhutan_relevance: z.string().trim().max(3000),
  category_id: z.union([z.uuid(), z.literal("")]), area: z.enum(["bhutan", "regional", "world"]),
});

export async function saveStoryAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = noteSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: parsed.error.issues[0]?.message ?? "Check the fields." };
  const d = parsed.data;
  const db = await createClient();
  const { data: cur } = await db.from("ca_items").select("note").eq("id", d.id).maybeSingle();
  const note = { ...((cur?.note as Record<string, unknown>) ?? {}), summary: d.summary, background: d.background, why_it_matters: d.why_it_matters, bhutan_relevance: d.bhutan_relevance, headline: d.title };
  const { error } = await db.from("ca_items").update({ title: d.title, summary: d.summary, note, area: d.area, category_id: d.category_id || null }).eq("id", d.id);
  if (error) return { status: "error", message: "Could not save." };
  return done("Saved.", [`/admin/current-affairs/${d.id}`]);
}

const sourceSchema = z.object({
  name: z.string().trim().min(2).max(120), base_url: z.url().startsWith("https://"), feed_url: z.url().startsWith("https://"),
  area: z.enum(["bhutan", "regional", "world"]), tier: z.enum(["official", "established", "other"]), country: z.string().trim().max(60).optional(),
});

export async function addSourceAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = sourceSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: parsed.error.issues[0]?.message ?? "Check the fields (https links only)." };
  const d = parsed.data;
  const db = await createClient();
  const { error } = await db.from("ca_sources").insert({
    name: d.name, base_url: d.base_url, feed_url: d.feed_url, area: d.area, tier: d.tier, country: d.country || null,
    kind: d.tier === "official" ? "official" : "news", full_text_allowed: d.tier === "official", is_active: true, check_interval_hours: 6,
  });
  if (error) return { status: "error", message: error.code === "23505" ? "That source already exists." : "Could not add the source." };
  return done("Source added. It will be checked on the next run.");
}

export async function toggleSourceAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = z.object({ id: z.uuid(), active: z.enum(["true", "false"]) }).safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  const { error } = await db.from("ca_sources").update({ is_active: parsed.data.active === "true", consecutive_failures: 0 }).eq("id", parsed.data.id);
  if (error) return { status: "error", message: "Could not update." };
  return done(parsed.data.active === "true" ? "Source switched on." : "Source switched off.");
}

export async function addCategoryAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = z.object({ name: z.string().trim().min(2).max(80), parent_id: z.union([z.uuid(), z.literal("")]) }).safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Enter a name." };
  const slug = parsed.data.name.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 60);
  const db = await createClient();
  const { error } = await db.from("ca_categories").insert({ name: parsed.data.name, slug, parent_id: parsed.data.parent_id || null, sort_order: 500 });
  if (error) return { status: "error", message: error.code === "23505" ? "That category exists." : "Could not add." };
  return done("Category added.");
}

const settingsSchema = z.object({
  enabled: z.preprocess((v) => v === "on", z.boolean()),
  auto_publish: z.preprocess((v) => v === "on", z.boolean()),
  allow_single_source: z.preprocess((v) => v === "on", z.boolean()),
  bhutan: z.coerce.number().int().min(0).max(10), regional: z.coerce.number().int().min(0).max(10), world: z.coerce.number().int().min(0).max(10),
  min_relevance: z.coerce.number().int().min(0).max(100),
  daily_budget_usd: z.coerce.number().min(0).max(50),
  write_model: z.enum(["claude-sonnet-5-5", "claude-opus-5-5"]),
  questions_per_item: z.coerce.number().int().min(2).max(8),
  sensitive_terms: z.string().max(4000),
});

export async function saveCaSettingsAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  try { await assertPermission("settings.manage"); } catch { return { status: "error", message: "Only users with the settings permission can change these." }; }
  const parsed = settingsSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: parsed.error.issues[0]?.message ?? "Check the values." };
  const d = parsed.data;
  const db = await createClient();
  const { data: cur } = await db.from("app_settings").select("value").eq("key", "ca.config").maybeSingle();
  const value = {
    ...((cur?.value as Record<string, unknown>) ?? {}),
    enabled: d.enabled, auto_publish: d.auto_publish, allow_single_source: d.allow_single_source,
    per_day: { bhutan: d.bhutan, regional: d.regional, world: d.world }, min_relevance: d.min_relevance, daily_budget_usd: d.daily_budget_usd,
    write_model: d.write_model, questions_per_item: d.questions_per_item,
    sensitive_terms: d.sensitive_terms.split("\n").map((t) => t.trim()).filter(Boolean).slice(0, 100),
  };
  const { error } = await db.from("app_settings").upsert({ key: "ca.config", value, is_public: false });
  if (error) return { status: "error", message: "Could not save settings." };
  return done("Settings saved.");
}

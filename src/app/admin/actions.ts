"use server";

import { revalidatePath, updateTag } from "next/cache";
import type { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission, AuthorizationError } from "@/lib/auth/dal";
import type { Permission } from "@/lib/auth/permissions";
import { PACKAGE_FEATURES } from "@/lib/commerce/features";
import { CACHE_TAGS } from "@/lib/data/public";
import { createClient } from "@/lib/supabase/server";
import {
  categoryUpdateSchema,
  cycleUpdateSchema,
  messageStatusSchema,
  packageUpdateSchema, packageCreateSchema,
  paperUpdateSchema,
  roleChangeSchema,
  subjectCreateSchema,
  toggleSchema,
  topicCreateSchema,
} from "@/lib/validation/admin";
import { toFieldErrors } from "@/lib/validation/auth";

/**
 * Every admin mutation follows the same steps:
 *  1. Re-check the permission on the server (never trust the UI).
 *  2. Validate input with zod.
 *  3. Write as the signed-in user, so Row Level Security applies as a second check
 *     and audit triggers record the actor.
 *  4. Invalidate affected caches.
 */
async function run<S extends z.ZodType>(
  permission: Permission,
  schema: S,
  formData: FormData,
  write: (
    data: z.infer<S>,
    db: Awaited<ReturnType<typeof createClient>>,
  ) => PromiseLike<{ error: { message: string; code?: string } | null; data?: unknown }>,
  after: () => void,
  successMessage = "Saved.",
): Promise<ActionState> {
  try {
    await assertPermission(permission);
  } catch (e) {
    return { status: "error", message: e instanceof AuthorizationError ? e.message : "Not allowed." };
  }
  const parsed = schema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Please correct the errors below.", fieldErrors: toFieldErrors(parsed.error) };
  const db = await createClient();
  const { error, data } = await write(parsed.data, db);
  if (error) {
    console.error("admin action failed", permission, error.code, error.message);
    if (error.code === "23505") return { status: "error", message: "An item with that identifier already exists." };
    if (error.code === "42501") return { status: "error", message: "The database refused this change (insufficient permission)." };
    if (error.code === "23514") return { status: "error", message: "The change breaks a data rule. Check the values and try again." };
    return { status: "error", message: "The change could not be saved." };
  }
  // Writes that use .select() return the affected rows; none means RLS or a stale id blocked it.
  if (Array.isArray(data) && data.length === 0) {
    return { status: "error", message: "Nothing was changed. The item may no longer exist, or you may not have access to it." };
  }
  after();
  return { status: "success", message: successMessage };
}

const refreshStructure = () => {
  updateTag(CACHE_TAGS.examStructure);
  revalidatePath("/admin/exam-structure");
};

export async function updatePaper(_prev: ActionState, formData: FormData) {
  return run("exam_config.manage", paperUpdateSchema, formData, ({ id, ...rest }, db) => db.from("exam_papers").update(rest).eq("id", id).select("id"), refreshStructure);
}

export async function updateCycle(_prev: ActionState, formData: FormData) {
  return run("exam_config.manage", cycleUpdateSchema, formData, ({ id, ...rest }, db) => db.from("exam_cycles").update(rest).eq("id", id).select("id"), refreshStructure);
}

export async function updateCategory(_prev: ActionState, formData: FormData) {
  return run("exam_config.manage", categoryUpdateSchema, formData, ({ id, ...rest }, db) => db.from("exam_categories").update(rest).eq("id", id).select("id"), refreshStructure);
}

const refreshSyllabus = () => {
  updateTag(CACHE_TAGS.examStructure);
  revalidatePath("/admin/syllabus");
};

export async function createSubject(_prev: ActionState, formData: FormData) {
  return run("syllabus.manage", subjectCreateSchema, formData, (d, db) => db.from("subjects").insert({ ...d, is_official: false, sort_order: 900 }), refreshSyllabus, "Subject added.");
}

export async function createTopic(_prev: ActionState, formData: FormData) {
  return run("syllabus.manage", topicCreateSchema, formData, (d, db) => db.from("topics").insert(d), refreshSyllabus, "Topic added.");
}

export async function setSubjectActive(_prev: ActionState, formData: FormData) {
  return run("syllabus.manage", toggleSchema, formData, ({ id, is_active }, db) => db.from("subjects").update({ is_active }).eq("id", id).select("id"), refreshSyllabus);
}

export async function setTopicActive(_prev: ActionState, formData: FormData) {
  return run("syllabus.manage", toggleSchema, formData, ({ id, is_active }, db) => db.from("topics").update({ is_active }).eq("id", id).select("id"), refreshSyllabus);
}

export async function updatePackage(_prev: ActionState, formData: FormData) {
  // Multi-select checkboxes arrive as repeated keys.
  const data = new FormData();
  for (const [k, v] of formData.entries()) if (k !== "feature_keys") data.append(k, v);
  const keys = formData.getAll("feature_keys");
  return run(
    "packages.manage",
    packageUpdateSchema.transform((v) => ({ ...v, feature_keys: keys.map(String).filter((k) => k in PACKAGE_FEATURES) })),
    data,
    ({ id, ...rest }, db) => db.from("packages").update(rest).eq("id", id).select("id"),
    () => {
      updateTag(CACHE_TAGS.packages);
      revalidatePath("/admin/packages");
    },
  );
}

export async function createPackage(_prev: ActionState, formData: FormData) {
  return run(
    "packages.manage",
    packageCreateSchema,
    formData,
    (d, db) => db.from("packages").insert({ ...d, status: "draft", features: [], sort_order: 100 }),
    () => {
      updateTag(CACHE_TAGS.packages);
      revalidatePath("/admin/packages");
    },
    "Package created as a draft. Open it below to complete it.",
  );
}

export async function grantRole(_prev: ActionState, formData: FormData) {
  return run(
    "roles.manage",
    roleChangeSchema,
    formData,
    async ({ user_id, role }, db) => {
      const { data } = await db.auth.getClaims();
      return db.from("user_roles").upsert({ user_id, role, granted_by: data?.claims?.sub }, { onConflict: "user_id,role", ignoreDuplicates: true });
    },
    () => revalidatePath("/admin/users"),
    "Role granted.",
  );
}

export async function revokeRole(_prev: ActionState, formData: FormData) {
  return run(
    "roles.manage",
    roleChangeSchema,
    formData,
    async ({ user_id, role }, db) => {
      const { data: claims } = await db.auth.getClaims();
      if (claims?.claims?.sub === user_id) return { error: { message: "self", code: "42501" } };
      return db.from("user_roles").delete().eq("user_id", user_id).eq("role", role).select("user_id");
    },
    () => revalidatePath("/admin/users"),
    "Role removed.",
  );
}

export async function setMessageStatus(_prev: ActionState, formData: FormData) {
  return run(
    "support.manage",
    messageStatusSchema,
    formData,
    async ({ id, status }, db) => {
      const { data } = await db.auth.getClaims();
      return db.from("contact_messages").update({ status, handled_by: data?.claims?.sub, handled_at: new Date().toISOString() }).eq("id", id).select("id");
    },
    () => revalidatePath("/admin/messages"),
    "Updated.",
  );
}

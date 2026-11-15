/**
 * Grants the Super Administrator role to an EXISTING account.
 *
 *   1. Register normally on the website with the founder's email and confirm it.
 *   2. Run (locally, never in the browser):
 *        NEXT_PUBLIC_SUPABASE_URL=... SUPABASE_SECRET_KEY=... \
 *        npm run admin:bootstrap -- founder@example.com
 *
 * Uses the secret key, so it must only be run from a trusted machine.
 */
import { createClient } from "@supabase/supabase-js";

async function main() {
  const email = process.argv[2]?.trim().toLowerCase();
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const secret = process.env.SUPABASE_SECRET_KEY;
  if (!email || !email.includes("@")) throw new Error("Usage: npm run admin:bootstrap -- <email>");
  if (!url || !secret) throw new Error("Set NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SECRET_KEY in the environment.");

  const db = createClient(url, secret, { auth: { persistSession: false, autoRefreshToken: false } });

  let userId: string | undefined;
  for (let page = 1; page <= 50 && !userId; page++) {
    const { data, error } = await db.auth.admin.listUsers({ page, perPage: 200 });
    if (error) throw error;
    userId = data.users.find((u) => u.email?.toLowerCase() === email)?.id;
    if (data.users.length < 200) break;
  }
  if (!userId) throw new Error(`No account found for ${email}. Register on the website first.`);

  const { error } = await db.from("user_roles").upsert({ user_id: userId, role: "super_admin" }, { onConflict: "user_id,role", ignoreDuplicates: true });
  if (error) throw error;
  console.log(`✓ ${email} is now a Super Administrator.`);
}

main().catch((e) => {
  console.error(`✗ ${e instanceof Error ? e.message : e}`);
  process.exit(1);
});

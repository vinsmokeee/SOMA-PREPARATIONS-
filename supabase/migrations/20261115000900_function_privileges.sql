-- =============================================================================
-- Soma Preparations — Migration 0009: Tighten function privileges
-- Supabase's default privileges grant EXECUTE on new functions to anon and
-- authenticated directly, so `revoke ... from public` alone does not remove it.
-- Every function below already refuses unauthorised callers internally; this
-- removes the ability to call them at all from roles that never need to.
-- =============================================================================

-- Trigger-only functions: no client role should call them directly.
revoke execute on function public.set_updated_at() from public, anon, authenticated;
revoke execute on function public.handle_new_user() from public, anon, authenticated;
revoke execute on function public.audit_row_change() from public, anon, authenticated;
revoke execute on function public.enforce_question_workflow() from public, anon, authenticated;

-- Signed-in-only helpers.
revoke execute on function public.has_role(public.app_role) from anon;
revoke execute on function public.is_super_admin() from anon;
revoke execute on function public.my_permissions() from anon;
revoke execute on function public.owns_answer(uuid) from anon;
revoke execute on function public.is_evaluator_for(uuid) from anon;
revoke execute on function public.has_stage_access(public.exam_stage) from anon;
revoke execute on function public.admin_list_users(text, int, int) from anon;
revoke execute on function public.admin_overview_counts() from anon;

-- Remain callable by anon by design: has_permission() and is_staff() (used in
-- RLS policies evaluated for anonymous visitors) and get_official_citations().

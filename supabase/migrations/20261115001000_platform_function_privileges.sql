-- =============================================================================
-- Soma Preparations — Migration 0010: Lock down platform-created helpers
-- Supabase's "Enable automatic RLS" project option creates public.rls_auto_enable()
-- (an event-trigger function). Event triggers run it as its owner, so client
-- roles never need EXECUTE. Conditional, because the function only exists on
-- projects created with that option.
-- =============================================================================
do $$
begin
  if to_regprocedure('public.rls_auto_enable()') is not null then
    execute 'revoke execute on function public.rls_auto_enable() from public, anon, authenticated';
  end if;
end;
$$;

-- Test helpers (installed into a "tests" schema in the throw-away database).
create schema if not exists tests;
grant usage on schema tests to anon, authenticated, service_role;

create or replace function tests.create_user(_email text, _name text default 'Test User')
returns uuid language plpgsql as $$
declare _id uuid;
begin
  insert into auth.users (email, raw_user_meta_data) values (_email, jsonb_build_object('full_name', _name))
  returning id into _id;
  return _id;
end $$;

-- Switch the session to an authenticated Supabase user (or anon when null).
create or replace function tests.login(_uid uuid) returns void language plpgsql as $$
begin
  perform set_config('request.jwt.claim.sub', coalesce(_uid::text, ''), false);
end $$;

create or replace function tests.assert(_cond boolean, _msg text) returns void language plpgsql as $$
begin
  if _cond is distinct from true then raise exception 'ASSERTION FAILED: %', _msg; end if;
end $$;

-- Asserts that a statement raises an error (any error: RLS violation, check, exception).
create or replace function tests.assert_fails(_sql text, _msg text) returns void language plpgsql as $$
begin
  begin
    execute _sql;
  exception when others then
    return;
  end;
  raise exception 'ASSERTION FAILED (expected error): %', _msg;
end $$;

grant execute on all functions in schema tests to anon, authenticated, service_role;

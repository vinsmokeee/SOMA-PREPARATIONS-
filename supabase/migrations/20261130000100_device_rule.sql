-- Account security: one phone opened from several apps (Gmail, Messenger,
-- Safari) has a separate browser cookie in each, which counted as several new
-- devices and asked for e-mail confirmation too often. The new-device risk
-- signal now counts distinct kinds of device instead.
create or replace function public.touch_session(_session_id uuid, _device_key text, _label text, _country text, _user_agent text, _verified_method boolean)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _cfg jsonb := public.setting('security.config');
  _dev public.user_devices%rowtype;
  _s public.user_sessions%rowtype;
  _new_device boolean := false;
  _devices int; _countries int; _failed int; _elevated int; _over int; _revoked int := 0;
  _verify boolean := false;
  r record;
begin
  if _uid is null or _session_id is null then return jsonb_build_object('status', 'none'); end if;
  if exists (select 1 from public.profiles where id = _uid and account_status = 'restricted') then
    return jsonb_build_object('status', 'restricted');
  end if;
  if _device_key !~ '^[0-9a-f]{64}$' then _device_key := encode(sha256(convert_to(_session_id::text, 'UTF8')), 'hex'); end if;
  _country := case when _country ~ '^[A-Z]{2}$' then _country else null end;

  select * into _s from public.user_sessions where id = _session_id;
  if _s.id is not null then
    if _s.revoked_at is not null then return jsonb_build_object('status', 'revoked', 'reason', _s.revoked_reason); end if;
    if _s.verification_required and _verified_method then
      update public.user_sessions set verification_required = false where id = _s.id;
      update public.user_devices set trusted = true where id = _s.device_id;
      insert into public.login_events (user_id, kind, device_id, country) values (_uid, 'verified', _s.device_id, _country);
      _s.verification_required := false;
    end if;
    if _s.last_seen_at < now() - interval '5 minutes' then
      update public.user_sessions set last_seen_at = now(), country = coalesce(_country, country) where id = _s.id;
      update public.user_devices set last_seen = now(), last_country = coalesce(_country, last_country) where id = _s.device_id;
    end if;
    return jsonb_build_object('status', case when _s.verification_required then 'verify' else 'ok' end);
  end if;

  -- First sight of this session: device, sign-in record, limits, risk.
  select * into _dev from public.user_devices where user_id = _uid and device_key = _device_key;
  if _dev.id is null then
    insert into public.user_devices (user_id, device_key, label, last_country, trusted)
    values (_uid, _device_key, left(_label, 120), _country, coalesce(_verified_method, false)) returning * into _dev;
    _new_device := true;
  else
    update public.user_devices set last_seen = now(), last_country = coalesce(_country, last_country), revoked_at = null,
      trusted = trusted or coalesce(_verified_method, false) where id = _dev.id returning * into _dev;
  end if;
  insert into public.user_sessions (id, user_id, device_id, country, user_agent) values (_session_id, _uid, _dev.id, _country, left(_user_agent, 300))
  on conflict (id) do nothing;
  insert into public.login_events (user_id, kind, device_id, country) values (_uid, case when _new_device then 'new_device' else 'sign_in' end, _dev.id, _country);

  -- Risk signals (never a single-signal suspension).
  -- Count kinds of device (e.g. "Safari on iPhone"), not browser cookies: the
  -- Gmail, Messenger and Safari browsers on one phone each get their own cookie
  -- but are the same phone.
  select count(distinct coalesce(label, id::text)) into _devices from public.user_devices where user_id = _uid
    and first_seen > now() - make_interval(days => coalesce((_cfg ->> 'new_device_window_days')::int, 7));
  select count(distinct country) into _countries from public.login_events where user_id = _uid and country is not null and created_at > now() - interval '24 hours';
  select count(*) into _failed from public.login_events where user_id = _uid and kind = 'sign_in_failed' and created_at > now() - interval '1 hour';
  if not _dev.trusted and (_devices > coalesce((_cfg ->> 'max_devices_per_window')::int, 4) or _countries > 1
                           or _failed >= coalesce((_cfg ->> 'failed_login_threshold')::int, 8)) then
    _verify := true;
    update public.user_sessions set verification_required = true where id = _session_id;
    insert into public.login_events (user_id, kind, device_id, country, detail)
    values (_uid, 'risk_elevated', _dev.id, _country, jsonb_build_object('devices_recent', _devices, 'countries_24h', _countries, 'failed_1h', _failed));
    select count(*) into _elevated from public.login_events where user_id = _uid and kind = 'risk_elevated' and created_at > now() - interval '30 days';
    if _elevated >= coalesce((_cfg ->> 'flag_after_elevated_events')::int, 3)
       and not exists (select 1 from public.security_flags where user_id = _uid and status = 'open') then
      insert into public.security_flags (user_id, kind, detail)
      values (_uid, 'possible_account_sharing', jsonb_build_object('elevated_events_30d', _elevated, 'devices_recent', _devices, 'countries_24h', _countries));
    end if;
  end if;

  -- Concurrent-session limit: sign out the oldest sessions beyond the limit.
  select count(*) - coalesce((_cfg ->> 'max_concurrent_sessions')::int, 2) into _over from public.user_sessions
  where user_id = _uid and revoked_at is null and last_seen_at > now() - interval '14 days';
  if _over > 0 then
    for r in select id from public.user_sessions where user_id = _uid and revoked_at is null and id <> _session_id
             and last_seen_at > now() - interval '14 days' order by last_seen_at asc limit _over loop
      perform public.end_session(r.id, 'Signed out because the account was used on another device (device limit).');
      _revoked := _revoked + 1;
    end loop;
    insert into public.login_events (user_id, kind, device_id, detail) values (_uid, 'session_limit', _dev.id, jsonb_build_object('signed_out', _revoked));
    perform public.notify(_uid, 'security', 'Signed out on another device',
      'Your account was opened on a new device, so the oldest session was signed out. If this was not you, change your password.', '/dashboard/security', null, true);
  end if;
  if _new_device and not _verify then
    perform public.notify(_uid, 'security', 'New sign-in to your Soma account',
      'If this was not you, change your password and sign out other devices.', '/dashboard/security', null, false);
  end if;
  return jsonb_build_object('status', case when _verify then 'verify' else 'ok' end, 'signed_out_others', _revoked);
end;
$$;

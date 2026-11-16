-- =============================================================================
-- Soma Preparations — Migration 0019: public site assets (payment QR codes)
-- A public-read bucket for images students must see (e.g. the bank QR code on
-- the payment page). Only staff with settings.manage may upload or delete.
-- =============================================================================
do $$
begin
  if to_regclass('storage.buckets') is not null then
    insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
    values ('site-assets', 'site-assets', true, 2097152, array['image/png', 'image/jpeg', 'image/webp'])
    on conflict (id) do update set public = true, file_size_limit = excluded.file_size_limit, allowed_mime_types = excluded.allowed_mime_types;
    execute $p$
      create policy "site assets: staff upload" on storage.objects for insert to authenticated
      with check (bucket_id = 'site-assets' and public.has_permission('settings.manage'))
    $p$;
    execute $p$
      create policy "site assets: staff delete" on storage.objects for delete to authenticated
      using (bucket_id = 'site-assets' and public.has_permission('settings.manage'))
    $p$;
  end if;
end;
$$;

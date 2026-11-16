-- Schedules the current-affairs pipeline (Milestone 7) with Supabase Cron.
-- Run once in the Supabase SQL editor (or via the Management API) after the
-- 20261121000100_current_affairs migration. Requires SUPABASE_SECRET_KEY in Vercel.
-- Every 3 hours at minute 5 (UTC; Bhutan time is UTC+6).
create extension if not exists pg_cron;
create extension if not exists pg_net;

select cron.unschedule(jobid) from cron.job where jobname = 'soma-current-affairs';
select cron.schedule(
  'soma-current-affairs',
  '5 */3 * * *',
  $job$
    select net.http_post(
      url := 'https://soma-preparations.vercel.app/api/cron/current-affairs',
      headers := jsonb_build_object(
        'Authorization', 'Bearer ' || (select token from public.ca_scheduler where id = 1),
        'Content-Type', 'application/json'),
      body := '{}'::jsonb,
      timeout_milliseconds := 300000
    );
  $job$
);

-- =============================================================================
-- Soma Preparations — Migration 0017: Current-affairs intelligence (Milestone 7)
-- Additive: extends the M1 tables ca_sources / ca_items (unused until now).
--
--  * ca_sources  — configured feeds with area, tier and health tracking.
--  * ca_articles — every retrieved entry (headline, link, dates, snippet); the
--                  raw evidence. Grouped into stories.
--  * ca_items    — one story: verification status, confidence, sensitivity,
--                  structured learning note, linked questions. Published to
--                  students automatically when the rules allow, otherwise held.
--  * ca_categories, ca_runs (pipeline log), ca_daily (Question of the Day).
--  * Access: anyone sees the last 7 days; packages unlock the archive.
--  * Weekly / monthly assessments are ordinary examinations (exams.ca_period).
-- Pipeline writes run on the server with the secret key; staff with ca.manage
-- edit through RLS. Students never write current-affairs content.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Settings
-- -----------------------------------------------------------------------------
insert into public.app_settings (key, value, is_public) values
  ('ca.config', jsonb_build_object(
     'enabled', true,
     'auto_publish', true,               -- founder decision (M7): publish automatically when rules pass
     'per_day', jsonb_build_object('bhutan', 3, 'regional', 2, 'world', 2),
     'min_relevance', 60,                -- 0-100 BCSE relevance from triage
     'daily_budget_usd', 1.5,
     'triage_model', 'claude-haiku-5-5',
     'write_model', 'claude-sonnet-5-5',
     'questions_per_item', 4,
     'sensitive_terms', jsonb_build_array('His Majesty', 'Royal Family', 'Druk Gyalpo', 'national security', 'court case', 'sub judice', 'religion', 'ethnic', 'border dispute', 'refugee')
   ), false)
on conflict (key) do nothing;

create or replace function public.ca_config()
returns jsonb language sql stable security definer set search_path = '' as $$
  select coalesce((select value from public.app_settings where key = 'ca.config'), '{}'::jsonb)
$$;
revoke all on function public.ca_config() from public, anon;
grant execute on function public.ca_config() to authenticated, service_role;

-- -----------------------------------------------------------------------------
-- Categories
-- -----------------------------------------------------------------------------
create table public.ca_categories (
  id          uuid primary key default gen_random_uuid(),
  slug        text not null unique check (slug ~ '^[a-z0-9-]+$'),
  name        text not null,
  parent_id   uuid references public.ca_categories (id) on delete set null,
  description text,
  sort_order  int not null default 0,
  is_active   boolean not null default true,
  created_at  timestamptz not null default now()
);
alter table public.ca_categories enable row level security;
create policy ca_categories_read on public.ca_categories for select to anon, authenticated using (is_active or public.has_permission('ca.manage'));
create policy ca_categories_write on public.ca_categories for all to authenticated
  using (public.has_permission('ca.manage')) with check (public.has_permission('ca.manage'));

insert into public.ca_categories (slug, name, sort_order, description) values
  ('governance', 'Governance, policy and institutions', 10, 'Government decisions, legislation, Parliament, constitutional bodies'),
  ('gmc', 'Gelephu Mindfulness City', 15, 'GMC developments, investment, legislation and infrastructure'),
  ('economy', 'Economy, budget, trade and investment', 20, 'Budget, taxation, fiscal and monetary policy, trade, FDI'),
  ('hydropower-infrastructure', 'Hydropower, energy and infrastructure', 30, null),
  ('education-employment', 'Education, employment and public service', 40, null),
  ('health-social', 'Health and social development', 50, null),
  ('environment-climate', 'Environment, climate and conservation', 60, null),
  ('foreign-relations', 'Foreign relations and diplomacy', 70, null),
  ('culture-history', 'Culture, history and national events', 80, null),
  ('science-technology', 'Science, technology and AI', 90, null),
  ('tourism', 'Tourism', 95, null),
  ('international-organisations', 'International organisations and agreements', 100, 'UN system, World Bank, IMF, WHO, summits and treaties'),
  ('security-conflict', 'Security, conflicts and geopolitics', 110, null),
  ('other', 'Other', 999, null);

-- -----------------------------------------------------------------------------
-- Sources
-- -----------------------------------------------------------------------------
alter table public.ca_sources
  add column feed_url text check (feed_url is null or feed_url ~* '^https://'),
  add column method text not null default 'rss' check (method in ('rss', 'manual')),
  add column area text not null default 'bhutan' check (area in ('bhutan', 'regional', 'world')),
  add column country text,
  add column tier text not null default 'established' check (tier in ('official', 'established', 'other')),
  add column full_text_allowed boolean not null default false,   -- official/public-information sources only
  add column last_success_at timestamptz,
  add column last_error text,
  add column consecutive_failures int not null default 0,
  add column items_collected int not null default 0;

-- Starting list. Feed addresses are checked by the first live run; failures appear in admin.
insert into public.ca_sources (name, base_url, feed_url, kind, area, country, tier, full_text_allowed, priority, check_interval_hours, is_active, notes) values
  ('Kuensel', 'https://kuenselonline.com', 'https://kuenselonline.com/feed/', 'news', 'bhutan', 'Bhutan', 'established', false, 90, 3, true, 'National newspaper'),
  ('BBS', 'https://www.bbs.bt', 'https://www.bbs.bt/news/?feed=rss2', 'news', 'bhutan', 'Bhutan', 'established', false, 90, 3, true, 'Bhutan Broadcasting Service'),
  ('The Bhutanese', 'https://thebhutanese.bt', 'https://thebhutanese.bt/feed/', 'news', 'bhutan', 'Bhutan', 'established', false, 80, 6, true, null),
  ('Business Bhutan', 'https://businessbhutan.bt', 'https://businessbhutan.bt/feed/', 'news', 'bhutan', 'Bhutan', 'established', false, 70, 6, true, null),
  ('Gelephu Mindfulness City (official)', 'https://gmc.bt', null, 'official', 'bhutan', 'Bhutan', 'official', true, 95, 24, false, 'No feed found yet; add one when available. GMC news is also collected from Bhutanese outlets.'),
  ('UN News — Asia Pacific', 'https://news.un.org/en/asia-pacific', 'https://news.un.org/feed/subscribe/en/news/region/asia-pacific/feed/rss.xml', 'international', 'regional', null, 'official', true, 75, 6, true, null),
  ('UN News — all', 'https://news.un.org/en', 'https://news.un.org/feed/subscribe/en/news/all/rss.xml', 'international', 'world', null, 'official', true, 70, 6, true, null),
  ('WHO news', 'https://www.who.int', 'https://www.who.int/rss-feeds/news-english.xml', 'international', 'world', null, 'official', true, 60, 12, true, null),
  ('IMF news', 'https://www.imf.org', 'https://www.imf.org/en/News/RSS?language=eng', 'international', 'world', null, 'official', true, 60, 12, true, null),
  ('The Hindu — national', 'https://www.thehindu.com/news/national', 'https://www.thehindu.com/news/national/feeder/default.rss', 'news', 'regional', 'India', 'established', false, 60, 6, true, null),
  ('The Hindu — international', 'https://www.thehindu.com/news/international', 'https://www.thehindu.com/news/international/feeder/default.rss', 'news', 'world', null, 'established', false, 55, 6, true, null),
  ('The Kathmandu Post', 'https://kathmandupost.com', 'https://kathmandupost.com/rss', 'news', 'regional', 'Nepal', 'established', false, 55, 6, true, null),
  ('The Daily Star', 'https://www.thedailystar.net', 'https://www.thedailystar.net/frontpage/rss.xml', 'news', 'regional', 'Bangladesh', 'established', false, 55, 6, true, null),
  ('Al Jazeera', 'https://www.aljazeera.com', 'https://www.aljazeera.com/xml/rss/all.xml', 'news', 'world', null, 'established', false, 50, 6, true, null)
on conflict (base_url) do nothing;

-- -----------------------------------------------------------------------------
-- Articles (raw evidence)
-- -----------------------------------------------------------------------------
create table public.ca_articles (
  id             uuid primary key default gen_random_uuid(),
  source_id      uuid not null references public.ca_sources (id) on delete cascade,
  url            text not null unique check (url ~* '^https?://'),
  title          text not null check (char_length(title) <= 1000),
  snippet        text check (snippet is null or char_length(snippet) <= 4000),
  body           text check (body is null or char_length(body) <= 30000),  -- only for full_text_allowed sources; never shown
  published_at   timestamptz,
  retrieved_at   timestamptz not null default now(),
  fingerprint    text not null,                                 -- normalised title for duplicate detection
  story_id       uuid,                                          -- fk added below
  state          text not null default 'new' check (state in ('new', 'triaged', 'grouped', 'ignored')),
  triage         jsonb,                                         -- relevance, area, category, kind, developing, sensitive...
  relevance      int check (relevance between 0 and 100),
  created_at     timestamptz not null default now()
);
create index ca_articles_state_idx on public.ca_articles (state, retrieved_at desc);
create index ca_articles_story_idx on public.ca_articles (story_id);
create index ca_articles_published_idx on public.ca_articles (published_at desc);
create index ca_articles_fp_trgm on public.ca_articles using gin (fingerprint extensions.gin_trgm_ops);
alter table public.ca_articles enable row level security;
create policy ca_articles_staff on public.ca_articles for all to authenticated
  using (public.has_permission('ca.manage')) with check (public.has_permission('ca.manage'));

-- -----------------------------------------------------------------------------
-- Stories (ca_items) — extended
-- -----------------------------------------------------------------------------
alter table public.ca_items drop constraint if exists ca_items_check;
alter table public.ca_items
  add column area text check (area in ('bhutan', 'regional', 'world')),
  add column countries text[] not null default '{}',
  add column category_id uuid references public.ca_categories (id) on delete set null,
  add column event_date date,
  add column verification text not null default 'single_source'
    check (verification in ('official', 'corroborated', 'single_source', 'developing', 'conflicting', 'opinion')),
  add column confidence text check (confidence in ('high', 'medium', 'low')),
  add column sensitive boolean not null default false,
  add column hold_reason text,
  add column importance int check (importance between 0 and 100),
  add column note jsonb,                 -- {summary, key_facts[{fact, source}], background, why_it_matters, bhutan_relevance, entities, dates}
  add column pipeline_status text not null default 'collected'
    check (pipeline_status in ('collected', 'awaiting_ai', 'written', 'held', 'published', 'rejected', 'failed')),
  add column auto_published boolean not null default false,
  add column feature_date date,          -- the Bhutan-time day it is featured in "Today"
  add column search tsvector generated always as (
    to_tsvector('english', coalesce(title, '') || ' ' || coalesce(summary, '') || ' ' || coalesce(note ->> 'background', ''))) stored;
alter table public.ca_items add constraint ca_items_publish_check
  check (status <> 'published' or reviewed_by is not null or auto_published);
create index ca_items_feature_idx on public.ca_items (feature_date desc, area) where status = 'published';
create index ca_items_search_idx on public.ca_items using gin (search);
create index ca_items_pipeline_idx on public.ca_items (pipeline_status, created_at desc);
alter table public.ca_articles add constraint ca_articles_story_fk foreign key (story_id) references public.ca_items (id) on delete set null;

-- Students: the last 7 days are open to everyone; older items need a package.
create or replace function public.has_any_package()
returns boolean language sql stable security definer set search_path = '' as $$
  select auth.uid() is not null and (public.has_stage_access('PE') or public.has_stage_access('ME'))
$$;
revoke all on function public.has_any_package() from public;
grant execute on function public.has_any_package() to anon, authenticated, service_role;

drop policy if exists ca_items_public on public.ca_items;
create policy ca_items_public on public.ca_items for select to anon, authenticated
  using (
    (status = 'published' and (published_at > now() - interval '7 days' or public.has_any_package()))
    or public.has_permission('ca.manage')
  );

-- Public view of a story's sources (headline, link, outlet, date) — never the article body.
create or replace function public.ca_item_sources(_item_id uuid)
returns table (title text, url text, source text, tier text, published_at timestamptz)
language plpgsql stable security definer set search_path = '' as $$
begin
  if not exists (
    select 1 from public.ca_items i where i.id = _item_id and (
      (i.status = 'published' and (i.published_at > now() - interval '7 days' or public.has_any_package()))
      or public.has_permission('ca.manage'))) then
    return;
  end if;
  return query
    select a.title, a.url, s.name, s.tier, a.published_at
    from public.ca_articles a join public.ca_sources s on s.id = a.source_id
    where a.story_id = _item_id
    order by case s.tier when 'official' then 0 when 'established' then 1 else 2 end, a.published_at nulls last
    limit 10;
end;
$$;
revoke all on function public.ca_item_sources(uuid) from public;
grant execute on function public.ca_item_sources(uuid) to anon, authenticated, service_role;

-- -----------------------------------------------------------------------------
-- Pipeline log and daily features
-- -----------------------------------------------------------------------------
create table public.ca_runs (
  id           uuid primary key default gen_random_uuid(),
  trigger      text not null check (trigger in ('schedule', 'manual')),
  status       text not null default 'running' check (status in ('running', 'succeeded', 'partial', 'failed', 'skipped')),
  started_at   timestamptz not null default now(),
  finished_at  timestamptz,
  stats        jsonb not null default '{}'::jsonb,
  errors       jsonb not null default '[]'::jsonb,
  requested_by uuid references auth.users (id) on delete set null
);
create index ca_runs_started_idx on public.ca_runs (started_at desc);
alter table public.ca_runs enable row level security;
create policy ca_runs_staff on public.ca_runs for select to authenticated using (public.has_permission('ca.manage'));

create table public.ca_daily (
  day          date primary key,          -- Bhutan Standard Time
  question_id  uuid references public.questions (id) on delete set null,
  created_at   timestamptz not null default now()
);
alter table public.ca_daily enable row level security;
create policy ca_daily_read on public.ca_daily for select to anon, authenticated using (true);
create policy ca_daily_staff on public.ca_daily for all to authenticated
  using (public.has_permission('ca.manage')) with check (public.has_permission('ca.manage'));

create or replace function public.bhutan_today()
returns date language sql stable set search_path = '' as $$ select (now() at time zone 'Asia/Thimphu')::date $$;

-- Questions published by the pipeline are marked as such.
alter table public.questions add column auto_published boolean not null default false;
-- Auto-published current-affairs questions have no human verifier; everything else still needs one.
alter table public.questions drop constraint if exists questions_check;
alter table public.questions add constraint questions_verified_check
  check (status not in ('verified', 'published') or verified_by is not null or (auto_published and origin = 'current_affairs'));
create index questions_ca_item_idx on public.questions (ca_item_id) where ca_item_id is not null;

-- Weekly / monthly assessments are examinations tagged with their period.
alter table public.exams
  add column ca_period text check (ca_period in ('weekly', 'monthly')),
  add column ca_period_start date;
create unique index exams_ca_period_uniq on public.exams (ca_period, ca_period_start) where ca_period is not null and owner_id is null;

-- -----------------------------------------------------------------------------
-- Student functions
-- -----------------------------------------------------------------------------
-- Today's feed (Bhutan time): featured published items plus the Question of the Day.
create or replace function public.ca_today(_day date default null)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  with d as (select coalesce(_day, public.bhutan_today()) as day)
  select jsonb_build_object(
    'day', (select day from d),
    'items', coalesce((
      select jsonb_agg(jsonb_build_object('id', i.id, 'title', i.title, 'summary', i.summary, 'area', i.area, 'category', c.name,
               'verification', i.verification, 'event_date', i.event_date, 'published_on', i.published_on, 'importance', i.importance)
             order by case i.area when 'bhutan' then 0 when 'regional' then 1 else 2 end, i.importance desc nulls last)
      from public.ca_items i left join public.ca_categories c on c.id = i.category_id, d
      where i.status = 'published' and i.feature_date = d.day), '[]'::jsonb),
    'question', (
      select jsonb_build_object('id', q.id, 'stem', q.stem, 'ca_item_id', q.ca_item_id)
      from public.ca_daily cd join public.questions q on q.id = cd.question_id, d
      where cd.day = d.day and q.status = 'published')
  );
$$;
revoke all on function public.ca_today(date) from public;
grant execute on function public.ca_today(date) to anon, authenticated;

-- Start the Question of the Day as a one-question practice (free for everyone signed in).
create or replace function public.start_question_of_day()
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _uid uuid := auth.uid(); _q uuid; _exam uuid; _day date := public.bhutan_today();
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  select cd.question_id into _q from public.ca_daily cd join public.questions q on q.id = cd.question_id
  where cd.day = _day and q.status = 'published';
  if _q is null then raise exception 'NO_QUESTION_TODAY' using errcode = 'P0001'; end if;
  select e.id into _exam from public.exams e join public.exam_questions eq on eq.exam_id = e.id
  where e.owner_id = _uid and e.slug like 'qotd-%' and eq.question_id = _q limit 1;
  if _exam is null then
    insert into public.exams (slug, title, description, stage, kind, duration_minutes, is_free, status, owner_id)
    values ('qotd-' || replace(gen_random_uuid()::text, '-', ''), 'Question of the Day — ' || to_char(_day, 'DD Mon YYYY'),
            'Current affairs', 'PE', 'practice', 5, true, 'draft', _uid)
    returning id into _exam;
    insert into public.exam_questions (exam_id, question_id, position) values (_exam, _q, 1);
    update public.exams set status = 'published' where id = _exam;
  end if;
  -- Already answered today: return the finished attempt so the result page opens.
  return coalesce(
    (select a.id from public.exam_attempts a where a.exam_id = _exam and a.user_id = _uid and a.status <> 'in_progress' order by a.started_at desc limit 1),
    public.start_attempt(_exam));
end;
$$;
revoke all on function public.start_question_of_day() from public, anon;
grant execute on function public.start_question_of_day() to authenticated;

-- Personalised current-affairs practice (packages only): this week's important
-- stories first, then unseen questions from the student's weakest categories.
create or replace function public.create_ca_practice(_count int default 10, _area text default null)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _uid uuid := auth.uid(); _n int := least(greatest(coalesce(_count, 10), 5), 30); _ids uuid[]; _exam uuid;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  if not public.has_any_package() and not public.has_permission('exams.manage') then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;
  if _area is not null and _area not in ('bhutan', 'regional', 'world') then raise exception 'INVALID_AREA' using errcode = 'P0001'; end if;
  if (select count(*) from public.exams where owner_id = _uid and created_at > now() - interval '1 day') >= 40 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;

  with seen as (select * from public.my_latest_answers()),
  weak as (
    select i.category_id, avg(case when s.is_correct then 1.0 else 0.0 end) as acc
    from seen s join public.questions q on q.id = s.question_id join public.ca_items i on i.id = q.ca_item_id
    group by i.category_id having count(*) >= 2
  )
  select array_agg(x.id) into _ids from (
    select q.id
    from public.questions q
    join public.ca_items i on i.id = q.ca_item_id
    left join seen on seen.question_id = q.id
    left join weak on weak.category_id = i.category_id
    where q.status = 'published' and q.question_type = 'mcq' and q.origin = 'current_affairs'
      and i.status = 'published' and (_area is null or i.area = _area)
    order by
      case when seen.question_id is null and i.importance >= 75 and i.published_at > now() - interval '7 days' then 0
           when seen.question_id is null and weak.acc < 0.6 then 1
           when seen.question_id is null then 2
           when seen.is_correct is false then 3
           else 4 end,
      random()
    limit _n
  ) x;
  if _ids is null then raise exception 'NO_QUESTIONS' using errcode = 'P0001'; end if;

  insert into public.exams (slug, title, description, stage, kind, duration_minutes, is_free, status, owner_id)
  values ('ca-practice-' || replace(gen_random_uuid()::text, '-', ''),
          'Current affairs practice' || coalesce(' — ' || initcap(_area), ''), array_length(_ids, 1) || ' questions chosen for you.',
          'PE', 'practice', greatest(array_length(_ids, 1), 5), true, 'draft', _uid)
  returning id into _exam;
  insert into public.exam_questions (exam_id, question_id, position) select _exam, x.id, x.n from unnest(_ids) with ordinality as x(id, n);
  update public.exams set status = 'published' where id = _exam;
  return public.start_attempt(_exam);
end;
$$;
revoke all on function public.create_ca_practice(int, text) from public, anon;
grant execute on function public.create_ca_practice(int, text) to authenticated;

-- Number of published practice questions for a story (questions themselves stay hidden).
create or replace function public.ca_question_count(_item_id uuid)
returns int language sql stable security definer set search_path = '' as $$
  select count(*)::int from public.questions where ca_item_id = _item_id and status = 'published'
$$;
revoke all on function public.ca_question_count(uuid) from public;
grant execute on function public.ca_question_count(uuid) to anon, authenticated, service_role;

-- Archive listing by month / area / category (RLS on ca_items decides what the caller may see).
create or replace function public.ca_archive(_month date default null, _area text default null, _category uuid default null, _q text default null)
returns table (id uuid, title text, summary text, area text, category text, verification text, feature_date date, event_date date, questions int)
language sql
stable
security invoker
set search_path = ''
as $$
  select i.id, i.title, i.summary, i.area, c.name, i.verification, i.feature_date, i.event_date,
         public.ca_question_count(i.id)
  from public.ca_items i left join public.ca_categories c on c.id = i.category_id
  where i.status = 'published'
    and (_month is null or date_trunc('month', coalesce(i.feature_date, i.published_on)) = date_trunc('month', _month))
    and (_area is null or i.area = _area)
    and (_category is null or i.category_id = _category)
    and (_q is null or i.search @@ websearch_to_tsquery('english', _q))
  order by coalesce(i.feature_date, i.published_on) desc nulls last, i.importance desc nulls last
  limit 200;
$$;
revoke all on function public.ca_archive(date, text, uuid, text) from public;
grant execute on function public.ca_archive(date, text, uuid, text) to anon, authenticated;

-- Start a one-story practice (the questions linked to a published story).
create or replace function public.create_ca_item_practice(_item_id uuid)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _uid uuid := auth.uid(); _ids uuid[]; _exam uuid; _title text;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  select i.title into _title from public.ca_items i where i.id = _item_id and i.status = 'published'
    and (i.published_at > now() - interval '7 days' or public.has_any_package() or public.has_permission('ca.manage'));
  if _title is null then raise exception 'ACCESS_REQUIRED' using errcode = '42501'; end if;
  if (select count(*) from public.exams where owner_id = _uid and created_at > now() - interval '1 day') >= 40 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;
  select array_agg(q.id order by q.created_at) into _ids from public.questions q
  where q.ca_item_id = _item_id and q.status = 'published' and q.question_type = 'mcq';
  if _ids is null then raise exception 'NO_QUESTIONS' using errcode = 'P0001'; end if;
  insert into public.exams (slug, title, description, stage, kind, duration_minutes, is_free, status, owner_id)
  values ('ca-item-' || replace(gen_random_uuid()::text, '-', ''), 'Current affairs: ' || left(_title, 80), 'Practice questions on one story.',
          'PE', 'practice', greatest(array_length(_ids, 1) * 2, 5), true, 'draft', _uid)
  returning id into _exam;
  insert into public.exam_questions (exam_id, question_id, position) select _exam, x.id, x.n from unnest(_ids) with ordinality as x(id, n);
  update public.exams set status = 'published' where id = _exam;
  return public.start_attempt(_exam);
end;
$$;
revoke all on function public.create_ca_item_practice(uuid) from public, anon;
grant execute on function public.create_ca_item_practice(uuid) to authenticated;

-- Staff overview for the admin dashboard.
create or replace function public.ca_overview(_days int default 7)
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if not public.has_permission('ca.manage') then raise exception 'Missing permission' using errcode = '42501'; end if;
  return jsonb_build_object(
    'articles', (select count(*) from public.ca_articles where retrieved_at > now() - make_interval(days => _days)),
    'stories', (select jsonb_object_agg(pipeline_status, n) from (select pipeline_status, count(*) n from public.ca_items
                where created_at > now() - make_interval(days => _days) group by 1) x),
    'held', (select count(*) from public.ca_items where pipeline_status = 'held'),
    'questions', (select count(*) from public.questions where origin = 'current_affairs' and created_at > now() - make_interval(days => _days)),
    'failing_sources', (select count(*) from public.ca_sources where is_active and consecutive_failures >= 3),
    'ai', coalesce((select jsonb_agg(jsonb_build_object('model', model, 'calls', n, 'input_tokens', i, 'output_tokens', o))
           from (select model, count(*) n, coalesce(sum(input_tokens), 0) i, coalesce(sum(output_tokens), 0) o from public.ai_jobs
                 where kind in ('current_affairs_notes', 'classification', 'question_generation') and input ->> 'ca' = 'true'
                   and created_at > now() - make_interval(days => _days) group by model) x), '[]'::jsonb)
  );
end;
$$;
revoke all on function public.ca_overview(int) from public, anon;
grant execute on function public.ca_overview(int) to authenticated;

src=open('supabase/migrations/20261214000100_paper_passage_group.sql').read()
s=src.index('create or replace function public.get_attempt_paper'); e=src.index('$$;',s)+3
gap=src[s:e]
gap=gap.replace("""      'deadline_at', _a.deadline_at, 'server_now', now()),""","""      'deadline_at', _a.deadline_at, 'server_now', now(), 'chosen_groups', to_jsonb(_a.chosen_groups)),""")
gap=gap.replace("""      'omr_mode', _e.omr_mode, 'negative_mark_per_wrong', _e.negative_mark_per_wrong),""","""      'omr_mode', _e.omr_mode, 'negative_mark_per_wrong', _e.negative_mark_per_wrong, 'reading_minutes', _e.reading_minutes),""")
gap=gap.replace("""        'passage_group', q.passage_group,""","""        'passage_group', q.passage_group,
        'choice_group', eq.choice_group,
        'choose_any', eq.choose_any,
        'section_order', eq.section_order,""")
assert 'chosen_groups' in gap and 'choose_any' in gap and 'reading_minutes' in gap
mig="""-- Real RCSC feeling for "answer any N" papers (founder, 20 Nov 2026): a mock opens with reading time and the whole
-- question paper; the student ticks the questions to answer (e.g. 2 of 4 in Part A, 3 of 5 in Part B), then writes
-- only those, one part per screen.

alter table public.exam_papers add column if not exists reading_minutes int check (reading_minutes between 1 and 60);
comment on column public.exam_papers.reading_minutes is 'Reading time before writing, from the RCSC paper; NULL = not stated';
-- RCSC BCSE 2025 General Papers II and III: "Reading Time: 15 minutes (prior to writing time)".
update public.exam_papers set reading_minutes = 15 where code in ('me-general-2', 'me-general-3');

alter table public.exams add column if not exists reading_minutes int check (reading_minutes between 1 and 60);
alter table public.exam_questions
  add column if not exists choice_group text,
  add column if not exists choose_any int check (choose_any > 0),
  add column if not exists section_order int;
comment on column public.exam_questions.choice_group is 'The RCSC question this part belongs to; chosen as a whole';
comment on column public.exam_questions.choose_any is 'This section: answer any N questions';
alter table public.exam_attempts add column if not exists chosen_groups text[];

-- The student's choice of questions in a mock with "answer any N" sections.
create or replace function public.choose_mock_questions(_attempt_id uuid, _groups text[])
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare _a public.exam_attempts%rowtype; _bad int;
begin
  select * into _a from public.exam_attempts where id = _attempt_id;
  if not found or _a.user_id is distinct from auth.uid() then raise exception 'ATTEMPT_NOT_FOUND' using errcode = 'P0002'; end if;
  if _a.status <> 'in_progress' then raise exception 'ATTEMPT_CLOSED' using errcode = 'P0001'; end if;
  if exists (select 1 from unnest(coalesce(_groups, '{}')) g
             where not exists (select 1 from public.exam_questions eq where eq.exam_id = _a.exam_id and eq.choice_group = g and eq.choose_any is not null)) then
    raise exception 'INVALID_CHOICE' using errcode = 'P0001';
  end if;
  select count(*) into _bad from (
    select eq.section_order, max(eq.choose_any) as need,
           count(distinct eq.choice_group) filter (where eq.choice_group = any (coalesce(_groups, '{}'))) as got
    from public.exam_questions eq where eq.exam_id = _a.exam_id and eq.choose_any is not null
    group by eq.section_order) s
  where s.got <> s.need;
  if _bad > 0 then raise exception 'WRONG_NUMBER_CHOSEN' using errcode = 'P0001'; end if;
  update public.exam_attempts set chosen_groups = (select array_agg(distinct g) from unnest(_groups) g) where id = _attempt_id;
end;
$$;
revoke all on function public.choose_mock_questions(uuid, text[]) from public, anon;
grant execute on function public.choose_mock_questions(uuid, text[]) to authenticated;

"""+gap+"\n"
m=open('supabase/migrations/20261221000100_me_question_parts.sql').read()
s=m.index('create or replace function public.start_paper_mock'); e=m.index('$$;',s)+3
mock=m[s:e]
reps=[("""          coalesce(_p.duration_minutes, 600), _p.max_marks, false, 'draft', _uid, _p.duration_minutes is null)""","""          coalesce(_p.duration_minutes + coalesce(_p.reading_minutes, 0), 600), _p.max_marks, false, 'draft', _uid, _p.duration_minutes is null)"""),
("""      select q.id, q.marks, g.ord""","""      select q.id, q.marks, g.ord, g.grp"""),
("""      insert into public.exam_questions (exam_id, question_id, position, section, marks, is_optional)
      values (_exam, _q.id, _pos,
              _s.title || case when _s.answer_any is not null then ' (answer any ' || _s.answer_any || ' of the ' || _s.question_count || ' questions)' else '' end,
              _q.marks, _s.answer_any is not null);""","""      insert into public.exam_questions (exam_id, question_id, position, section, marks, is_optional, choice_group, choose_any, section_order)
      values (_exam, _q.id, _pos,
              _s.title || case when _s.answer_any is not null then ' (answer any ' || _s.answer_any || ' of the ' || _s.question_count || ' questions)' else '' end,
              _q.marks, _s.answer_any is not null, _q.grp, _s.answer_any, _s.sort_order);"""),
("""  update public.exams set total_marks = coalesce(_p.max_marks, nullif(_total, 0)), status = 'published' where id = _exam;""","""  update public.exams set total_marks = coalesce(_p.max_marks, nullif(_total, 0)), status = 'published',
    reading_minutes = case when _p.duration_minutes is not null then _p.reading_minutes end where id = _exam;""")]
for a,b in reps:
    assert a in mock, a[:60]
    mock=mock.replace(a,b)
open('supabase/migrations/20261222000100_me_choose_questions.sql','w').write(mig+"-- Mocks record each part's question group, the section's \"answer any N\" and the reading time.\n"+mock+"\n")
print('ok')

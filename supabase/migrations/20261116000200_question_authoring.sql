-- =============================================================================
-- Soma Preparations — Migration 0012: Question authoring
--
-- save_question() writes a question with its options, rubric and references in
-- ONE transaction. It is SECURITY INVOKER: it runs with the caller's own
-- privileges, so Row Level Security and the workflow/guard triggers apply.
-- New questions always start as drafts; status changes happen through
-- review_question().
-- =============================================================================

-- Allow options to be re-lettered inside a single transaction.
alter table public.question_options drop constraint question_options_question_id_label_key;
alter table public.question_options
  add constraint question_options_question_id_label_key unique (question_id, label) deferrable initially deferred;

create or replace function public.save_question(
  _id uuid,
  _q jsonb,
  _options jsonb default '[]'::jsonb,
  _rubric jsonb default '[]'::jsonb,
  _refs jsonb default '[]'::jsonb
)
returns uuid
language plpgsql
security invoker
set search_path = ''
as $$
declare
  _qid uuid := _id;
  _type public.question_type := (_q ->> 'question_type')::public.question_type;
  _keep uuid[];
  _o record;
begin
  if _qid is null then
    insert into public.questions (
      stage, question_type, stem, explanation, model_answer, word_limit, subject_id, topic_id,
      paper_id, category_id, difficulty, marks, estimated_seconds, is_free_sample, origin, status, created_by)
    values (
      (_q ->> 'stage')::public.exam_stage, _type, _q ->> 'stem', nullif(_q ->> 'explanation', ''),
      nullif(_q ->> 'model_answer', ''), nullif(_q ->> 'word_limit', '')::int,
      nullif(_q ->> 'subject_id', '')::uuid, nullif(_q ->> 'topic_id', '')::uuid,
      nullif(_q ->> 'paper_id', '')::uuid, nullif(_q ->> 'category_id', '')::uuid,
      coalesce(nullif(_q ->> 'difficulty', ''), 'standard')::public.difficulty_level,
      coalesce(nullif(_q ->> 'marks', '')::numeric, 1), nullif(_q ->> 'estimated_seconds', '')::int,
      coalesce((_q ->> 'is_free_sample')::boolean, false),
      coalesce(nullif(_q ->> 'origin', ''), 'original')::public.question_origin,
      'draft', auth.uid())
    returning id into _qid;
  else
    update public.questions set
      stage = (_q ->> 'stage')::public.exam_stage,
      question_type = _type,
      stem = _q ->> 'stem',
      explanation = nullif(_q ->> 'explanation', ''),
      model_answer = nullif(_q ->> 'model_answer', ''),
      word_limit = nullif(_q ->> 'word_limit', '')::int,
      subject_id = nullif(_q ->> 'subject_id', '')::uuid,
      topic_id = nullif(_q ->> 'topic_id', '')::uuid,
      paper_id = nullif(_q ->> 'paper_id', '')::uuid,
      category_id = nullif(_q ->> 'category_id', '')::uuid,
      difficulty = coalesce(nullif(_q ->> 'difficulty', ''), 'standard')::public.difficulty_level,
      marks = coalesce(nullif(_q ->> 'marks', '')::numeric, 1),
      estimated_seconds = nullif(_q ->> 'estimated_seconds', '')::int,
      is_free_sample = coalesce((_q ->> 'is_free_sample')::boolean, false)
    where id = _qid;
    if not found then
      raise exception 'QUESTION_NOT_FOUND' using errcode = 'P0002';
    end if;
  end if;

  -- Options (objective questions only). Existing ids are updated in place so
  -- students' saved selections keep pointing at the same option.
  if _type = 'mcq' then
    select coalesce(array_agg((x ->> 'id')::uuid) filter (where nullif(x ->> 'id', '') is not null), '{}')
      into _keep from jsonb_array_elements(_options) x;
    delete from public.question_options where question_id = _qid and not (id = any(_keep));
    for _o in select x, n from jsonb_array_elements(_options) with ordinality as t(x, n) loop
      if nullif(_o.x ->> 'id', '') is not null then
        update public.question_options
        set label = chr(64 + _o.n::int), body = _o.x ->> 'body',
            is_correct = coalesce((_o.x ->> 'is_correct')::boolean, false), position = _o.n
        where id = (_o.x ->> 'id')::uuid and question_id = _qid;
      else
        insert into public.question_options (question_id, label, body, is_correct, position)
        values (_qid, chr(64 + _o.n::int), _o.x ->> 'body', coalesce((_o.x ->> 'is_correct')::boolean, false), _o.n);
      end if;
    end loop;
  else
    delete from public.question_options where question_id = _qid;
  end if;

  -- Rubric (written questions only)
  if _type <> 'mcq' then
    select coalesce(array_agg((x ->> 'id')::uuid) filter (where nullif(x ->> 'id', '') is not null), '{}')
      into _keep from jsonb_array_elements(_rubric) x;
    delete from public.rubric_criteria where question_id = _qid and not (id = any(_keep));
    for _o in select x, n from jsonb_array_elements(_rubric) with ordinality as t(x, n) loop
      if nullif(_o.x ->> 'id', '') is not null then
        update public.rubric_criteria
        set label = _o.x ->> 'label', description = _o.x ->> 'description',
            max_marks = (_o.x ->> 'max_marks')::numeric, position = _o.n
        where id = (_o.x ->> 'id')::uuid and question_id = _qid;
      else
        insert into public.rubric_criteria (question_id, label, description, max_marks, position)
        values (_qid, _o.x ->> 'label', _o.x ->> 'description', (_o.x ->> 'max_marks')::numeric, _o.n);
      end if;
    end loop;
  else
    delete from public.rubric_criteria where question_id = _qid;
  end if;

  -- References are simple citations: replace them.
  delete from public.question_references where question_id = _qid;
  insert into public.question_references (question_id, citation, url)
  select _qid, x ->> 'citation', nullif(x ->> 'url', '')
  from jsonb_array_elements(_refs) x
  where coalesce(btrim(x ->> 'citation'), '') <> '';

  return _qid;
end;
$$;
revoke execute on function public.save_question(uuid, jsonb, jsonb, jsonb, jsonb) from public, anon;
grant execute on function public.save_question(uuid, jsonb, jsonb, jsonb, jsonb) to authenticated;

-- -----------------------------------------------------------------------------
-- review_question: status transitions with checks and a review-history entry.
-- SECURITY INVOKER: permissions are enforced by RLS and the workflow trigger;
-- this function adds the allowed-transition and completeness rules.
-- -----------------------------------------------------------------------------
create or replace function public.review_question(_id uuid, _action text, _comment text default null)
returns public.content_status
language plpgsql
security invoker
set search_path = ''
as $$
declare
  _q public.questions%rowtype;
  _to public.content_status;
  _correct int;
  _opts int;
begin
  select * into _q from public.questions where id = _id;
  if _q.id is null then
    raise exception 'QUESTION_NOT_FOUND' using errcode = 'P0002';
  end if;

  _to := case _action
    when 'submit' then case when _q.status in ('draft', 'revision_requested', 'ai_generated', 'rejected') then 'awaiting_review' end
    when 'verify' then case when _q.status = 'awaiting_review' then 'verified' end
    when 'request_revision' then case when _q.status in ('awaiting_review', 'verified', 'ai_generated') then 'revision_requested' end
    when 'reject' then case when _q.status in ('draft', 'ai_generated', 'awaiting_review', 'verified', 'revision_requested') then 'rejected' end
    when 'publish' then case when _q.status = 'verified' then 'published' end
    when 'unpublish' then case when _q.status = 'published' then 'verified' end
    when 'archive' then case when _q.status <> 'archived' then 'archived' end
  end::public.content_status;
  if _to is null then
    raise exception 'INVALID_TRANSITION' using errcode = 'P0001';
  end if;
  if _action in ('request_revision', 'reject') and coalesce(btrim(_comment), '') = '' then
    raise exception 'COMMENT_REQUIRED' using errcode = 'P0001';
  end if;
  if _action in ('archive', 'request_revision', 'reject') and not public.has_permission('questions.review') then
    raise exception 'Missing permission questions.review' using errcode = '42501';
  end if;
  if _action = 'unpublish' and not public.has_permission('questions.publish') then
    raise exception 'Missing permission questions.publish' using errcode = '42501';
  end if;

  -- Completeness checks before a question can be verified.
  if _action = 'verify' then
    if _q.question_type = 'mcq' then
      select count(*), count(*) filter (where is_correct) into _opts, _correct
      from public.question_options where question_id = _id;
      if _opts < 2 or _correct <> 1 then
        raise exception 'MCQ_NEEDS_TWO_OPTIONS_ONE_CORRECT' using errcode = 'P0001';
      end if;
      if coalesce(btrim(_q.explanation), '') = '' then
        raise exception 'EXPLANATION_REQUIRED' using errcode = 'P0001';
      end if;
    elsif coalesce(btrim(_q.model_answer), '') = '' then
      raise exception 'MODEL_ANSWER_REQUIRED' using errcode = 'P0001';
    end if;
    if _q.subject_id is null then
      raise exception 'SUBJECT_REQUIRED' using errcode = 'P0001';
    end if;
  end if;

  -- An exam that is live must not lose a question.
  if _action in ('unpublish', 'archive') and exists (
    select 1 from public.exam_questions eq join public.exams e on e.id = eq.exam_id
    where eq.question_id = _id and e.status = 'published') then
    raise exception 'QUESTION_IN_PUBLISHED_EXAM' using errcode = 'P0001';
  end if;

  update public.questions set status = _to where id = _id;
  if not found then
    raise exception 'Missing permission' using errcode = '42501';
  end if;

  insert into public.content_reviews (entity_type, entity_id, reviewer_id, action, from_status, to_status, comment)
  values ('question', _id, auth.uid(),
          case _action when 'verify' then 'approve' else _action end,
          _q.status, _to, nullif(btrim(_comment), ''));
  return _to;
end;
$$;
revoke execute on function public.review_question(uuid, text, text) from public, anon;
grant execute on function public.review_question(uuid, text, text) to authenticated;

-- =============================================================================
-- Exam builder helpers (SECURITY INVOKER: RLS requires exams.manage)
-- =============================================================================
alter table public.exam_questions drop constraint exam_questions_exam_id_position_key;
alter table public.exam_questions
  add constraint exam_questions_exam_id_position_key unique (exam_id, position) deferrable initially deferred;

create or replace function public.add_exam_question(_exam_id uuid, _question_id uuid, _section text default null)
returns uuid
language plpgsql
security invoker
set search_path = ''
as $$
declare _id uuid; _stage public.exam_stage; _qstage public.exam_stage; _qstatus public.content_status;
begin
  select stage into _stage from public.exams where id = _exam_id;
  select stage, status into _qstage, _qstatus from public.questions where id = _question_id;
  if _stage is null or _qstage is null then
    raise exception 'NOT_FOUND' using errcode = 'P0002';
  end if;
  if _stage <> _qstage then
    raise exception 'STAGE_MISMATCH' using errcode = 'P0001';
  end if;
  if _qstatus in ('rejected', 'archived') then
    raise exception 'QUESTION_NOT_USABLE' using errcode = 'P0001';
  end if;
  insert into public.exam_questions (exam_id, question_id, position, section)
  values (_exam_id, _question_id,
          coalesce((select max(position) from public.exam_questions where exam_id = _exam_id), 0) + 1,
          nullif(btrim(_section), ''))
  returning id into _id;
  return _id;
end;
$$;

create or replace function public.remove_exam_question(_exam_question_id uuid)
returns void
language plpgsql
security invoker
set search_path = ''
as $$
declare _exam uuid; _status public.content_status;
begin
  select eq.exam_id, e.status into _exam, _status
  from public.exam_questions eq join public.exams e on e.id = eq.exam_id where eq.id = _exam_question_id;
  if _exam is null then
    raise exception 'NOT_FOUND' using errcode = 'P0002';
  end if;
  if _status = 'published' then
    raise exception 'EXAM_PUBLISHED' using errcode = 'P0001';
  end if;
  if exists (select 1 from public.exam_attempts where exam_id = _exam) then
    raise exception 'EXAM_HAS_ATTEMPTS' using errcode = 'P0001';
  end if;
  delete from public.exam_questions where id = _exam_question_id;
  -- Close the gap so positions stay 1..n.
  update public.exam_questions eq set position = r.n
  from (select id, row_number() over (order by position) as n from public.exam_questions where exam_id = _exam) r
  where eq.id = r.id and eq.position <> r.n;
end;
$$;

create or replace function public.move_exam_question(_exam_question_id uuid, _direction int)
returns void
language plpgsql
security invoker
set search_path = ''
as $$
declare _exam uuid; _pos int; _other uuid; _other_pos int;
begin
  select exam_id, position into _exam, _pos from public.exam_questions where id = _exam_question_id;
  if _exam is null then
    raise exception 'NOT_FOUND' using errcode = 'P0002';
  end if;
  select id, position into _other, _other_pos from public.exam_questions
  where exam_id = _exam and (case when _direction < 0 then position < _pos else position > _pos end)
  order by case when _direction < 0 then -position else position end
  limit 1;
  if _other is null then
    return;
  end if;
  update public.exam_questions set position = _other_pos where id = _exam_question_id;
  update public.exam_questions set position = _pos where id = _other;
end;
$$;

revoke execute on function public.add_exam_question(uuid, uuid, text) from public, anon;
revoke execute on function public.remove_exam_question(uuid) from public, anon;
revoke execute on function public.move_exam_question(uuid, int) from public, anon;
grant execute on function public.add_exam_question(uuid, uuid, text) to authenticated;
grant execute on function public.remove_exam_question(uuid) to authenticated;
grant execute on function public.move_exam_question(uuid, int) to authenticated;

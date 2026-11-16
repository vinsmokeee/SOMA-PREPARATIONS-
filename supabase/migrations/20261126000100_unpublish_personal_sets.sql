-- =============================================================================
-- Soma Preparations — Fix: personal practice sets no longer block unpublishing
--
-- review_question() refused to unpublish or archive a question used in any
-- published exam, including students' own practice sets and daily-training
-- sets (owner_id set). Those sets are created automatically, so a question
-- could become impossible to withdraw. Only shared examinations (owner_id
-- null) now block it.
--
-- Also: the review history did not allow the 'archive' action, so archiving a
-- question always failed. It is now allowed.
-- =============================================================================

alter table public.content_reviews drop constraint content_reviews_action_check;
alter table public.content_reviews add constraint content_reviews_action_check
  check (action in ('submit', 'approve', 'reject', 'request_revision', 'publish', 'unpublish', 'archive', 'comment'));

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

  -- An exam that is live must not lose a question. Students' personal practice
  -- sets (owner_id set) do not block it: they only ever serve published questions.
  if _action in ('unpublish', 'archive') and exists (
    select 1 from public.exam_questions eq join public.exams e on e.id = eq.exam_id
    where eq.question_id = _id and e.status = 'published' and e.owner_id is null) then
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

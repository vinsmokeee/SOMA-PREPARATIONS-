-- Publish a whole batch of new questions with one tap (founder, 20 Nov 2026). Questions written by Claude carry their
-- batch name in ai_review.batch. Each question still goes through review_question (verify, then publish), so the
-- same checks and the audit trail apply, with the person who taps the button recorded as the reviewer.
create or replace function public.question_batches_waiting()
returns table (batch text, waiting bigint, first_added timestamptz)
language sql
stable
set search_path = ''
as $$
  select q.ai_review ->> 'batch', count(*), min(q.created_at)
  from public.questions q
  where q.status = 'awaiting_review' and q.ai_review ? 'batch'
  group by 1 order by 3;
$$;
revoke all on function public.question_batches_waiting() from public, anon;
grant execute on function public.question_batches_waiting() to authenticated;

create or replace function public.publish_question_batch(_batch text)
returns integer
language plpgsql
set search_path = ''
as $$
declare _id uuid; _n int := 0;
begin
  if not public.has_permission('questions.publish') then
    raise exception 'Missing permission questions.publish' using errcode = '42501';
  end if;
  for _id in select q.id from public.questions q
             where q.status = 'awaiting_review' and q.ai_review ->> 'batch' = _batch order by q.created_at loop
    begin
      perform public.review_question(_id, 'verify', 'Batch "' || _batch || '" approved by the founder.');
      perform public.review_question(_id, 'publish', null);
      _n := _n + 1;
    exception when others then
      null; -- leave this question waiting; the rest of the batch continues
    end;
  end loop;
  return _n;
end;
$$;
revoke all on function public.publish_question_batch(text) from public, anon;
grant execute on function public.publish_question_batch(text) to authenticated;

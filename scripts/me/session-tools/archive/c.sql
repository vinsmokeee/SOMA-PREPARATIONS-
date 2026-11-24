select p.code, q.status, count(*) n from public.questions q join public.exam_papers p on p.id=q.paper_id
where p.code in ('me-general-1','me-general-2','me-general-3') and q.parent_question_id is null
group by 1,2 order by 1,2;

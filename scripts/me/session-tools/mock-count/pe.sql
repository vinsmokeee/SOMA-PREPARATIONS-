select coalesce(s.name,'?') subj, count(*) filter (where q.status='published') pub, count(*) filter (where q.status<>'archived') allq
from public.questions q left join public.subjects s on s.id=q.subject_id where q.stage='PE' and q.question_type='mcq' group by 1 order by 2 desc;

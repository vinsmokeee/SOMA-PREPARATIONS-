select p.code paper, coalesce(sp.code, '-') spec, coalesce(sg.code,'-') grp, coalesce(ai_review->>'batch', q.origin::text) batch, q.status, count(*) n
from questions q join exam_papers p on p.id=q.paper_id
left join specialisations sp on sp.id=q.specialisation_id left join subject_groups sg on sg.id=q.subject_group_id
where q.stage='ME' and q.status<>'archived' and p.code in ('me-technical-2','me-technical-3')
group by 1,2,3,4,5 order by 1,2,3,4

select p.code, p.title, p.paper_number, p.bank_scope, b.specialisation_id::text spec, b.subject_group_id::text grp, b.question_type::text t, b.topic_slug topic, b.question_count n, b.sort_order so
from public.paper_blueprint_sections b join public.exam_papers p on p.id=b.paper_id where p.stage='ME' order by p.code, b.sort_order;

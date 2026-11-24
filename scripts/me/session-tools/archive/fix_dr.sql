begin;
create temp table t on commit drop as select id from public.questions where ai_review->>'batch' = 'ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers' and passage_group in ('me-technical-3-tradmed2024-sectiona','me-technical-3-tradmed2024-sectionb');
update public.questions set stem = stem || E'\n\n(Marks: 5 - set to the latest RCSC layout; the 2024 paper gave ' || marks::int || '.)' where id in (select id from t) and marks <> 5;
update public.questions set marks = 5, passage_group = null, passage_position = null where id in (select id from t) and passage_group = 'me-technical-3-tradmed2024-sectiona';
update public.questions set marks = 5, question_type = 'passage' where id in (select id from t) and passage_group = 'me-technical-3-tradmed2024-sectionb';
delete from public.rubric_criteria where question_id in (select id from t);
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select t.id, v.l, v.d, v.m, v.p from t, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
commit;
select question_type, passage_group is null single, count(*), sum(marks) from public.questions where ai_review->>'batch' = 'ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers' group by 1,2 order by 1;

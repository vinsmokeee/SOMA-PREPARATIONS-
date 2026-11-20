-- B.Ed. Papers I, II and III (RCSC BCSE 2025 question papers): writing time 3 hours, 100 marks each (reading 15 min was
-- set in 20261229000100). Papers I and II also carry this per graduate group in paper_group_settings; Paper III is
-- common, so the paper itself needs it (without it a Paper III mock had no time limit).
update public.exam_papers set duration_minutes = 180, max_marks = 100
where code in ('me-bed-1', 'me-bed-2', 'me-bed-3') and duration_minutes is null;

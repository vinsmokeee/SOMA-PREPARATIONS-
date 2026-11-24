select stage, kind, omr_mode, count(*) from exams group by 1,2,3 order by 1,2,3;

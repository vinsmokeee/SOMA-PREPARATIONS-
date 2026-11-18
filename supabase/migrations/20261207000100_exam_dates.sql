-- Exam-day countdown (founder, 19 Nov 2026). RCSC sets new PE and ME dates every year, so each student enters the
-- date of the exam they are sitting; Soma never invents it. PE and ME are kept apart: a student who passes PE and
-- moves on to ME is asked again for the ME date.
alter table public.profiles
  add column if not exists pe_exam_date date check (pe_exam_date is null or pe_exam_date between date '2024-01-01' and date '2100-01-01'),
  add column if not exists me_exam_date date check (me_exam_date is null or me_exam_date between date '2024-01-01' and date '2100-01-01');
comment on column public.profiles.pe_exam_date is 'PE exam date the student entered for their countdown (not an official RCSC record).';
comment on column public.profiles.me_exam_date is 'ME exam date the student entered for their countdown (not an official RCSC record).';

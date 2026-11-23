begin;
-- Founder, 25 Nov 2026: every PE exam uses OMR shading; ME exams keep their own setting.
select tests.create_user('omr-boss@test.bt', 'Boss') as b \gset
insert into public.exams (slug, title, stage, kind, duration_minutes, omr_mode, status, owner_id)
  values ('omr-pe-practice', 'PE practice', 'PE', 'practice', 10, false, 'draft', :'b') returning id as pe \gset
select tests.assert((select omr_mode from public.exams where id = :'pe'), 'a new PE practice set is created in OMR mode');
update public.exams set omr_mode = false where id = :'pe';
select tests.assert((select omr_mode from public.exams where id = :'pe'), 'a PE exam cannot be switched out of OMR mode');
insert into public.exams (slug, title, stage, kind, duration_minutes, omr_mode, status, owner_id)
  values ('omr-me-practice', 'ME practice', 'ME', 'practice', 10, false, 'draft', :'b') returning id as me \gset
select tests.assert(not (select omr_mode from public.exams where id = :'me'), 'ME exams keep omr_mode off');
select tests.assert(not exists (select 1 from public.exams where stage = 'PE' and not omr_mode), 'no PE exam is left without OMR');
rollback;

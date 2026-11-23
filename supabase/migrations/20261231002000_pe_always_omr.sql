-- Founder, 25 Nov 2026: every PE question is answered by shading the OMR circle, as in the real PE - not only in mock
-- tests. Practice sets ("What to practise next", quick practice, retry mistakes, today's plan, revision) were created
-- with omr_mode off, so they showed plain tap-to-choose options. From now on every PE exam is an OMR exam: existing
-- ones are switched on and a trigger keeps any new or edited PE exam in OMR mode. ME is unchanged.

update public.exams set omr_mode = true where stage = 'PE' and not omr_mode;

create or replace function public.exams_pe_always_omr()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  if new.stage = 'PE' then
    new.omr_mode := true;
  end if;
  return new;
end;
$$;

drop trigger if exists exams_pe_always_omr on public.exams;
create trigger exams_pe_always_omr
  before insert or update of stage, omr_mode on public.exams
  for each row execute function public.exams_pe_always_omr();

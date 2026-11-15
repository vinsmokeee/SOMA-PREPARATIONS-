begin;
-- Paper weightages per BCSR 2023: written papers sum to 70% (others) and 60% (B.Ed)
select tests.assert(
  (select sum(p.weightage_percent) from public.exam_papers p
     join public.exam_paper_categories pc on pc.paper_id = p.id
     join public.exam_categories c on c.id = pc.category_id
   where c.code = 'administrative' and p.stage = 'ME') = 70, 'admin written weightage 70');
select tests.assert(
  (select sum(p.weightage_percent) from public.exam_papers p
     join public.exam_paper_categories pc on pc.paper_id = p.id
     join public.exam_categories c on c.id = pc.category_id
   where c.code = 'bed' and p.stage = 'ME') = 60, 'B.Ed written weightage 60');
-- ME components sum to 100 for every category
select tests.assert(
  not exists (select 1 from public.me_components group by category_id having sum(weightage_percent) <> 100),
  'ME components sum to 100%');
-- Written-examination component equals the sum of paper weightages
select tests.assert(
  not exists (
    select 1 from public.me_components m
    where m.component = 'written_examination'
      and m.weightage_percent <> (
        select sum(p.weightage_percent) from public.exam_papers p
        join public.exam_paper_categories pc on pc.paper_id = p.id
        where pc.category_id = m.category_id and p.stage = 'ME')),
  'WE weightage consistent with papers');
-- B.Ed is PE-exempt and does not sit the PE paper
select tests.assert(not exists (
  select 1 from public.exam_paper_categories pc join public.exam_papers p on p.id = pc.paper_id
  join public.exam_categories c on c.id = pc.category_id where p.code = 'pe' and c.code = 'bed'), 'B.Ed not mapped to PE');
-- Unknown official values stay NULL rather than invented
select tests.assert((select duration_minutes is null and question_count is null and max_marks is null
                     from public.exam_papers where code = 'pe'), 'PE numeric parameters not invented');
-- Packages cannot be made available without an access period
select tests.assert_fails($$update public.packages set status = 'available' where slug = 'pe-premium'$$, 'available requires access period');
-- Anonymous visitors can read citations (but not rights notes) of official sources
set local role anon;
select tests.login(null);
select tests.assert((select count(*) from public.get_official_citations()) >= 1, 'citations visible to anon');
select tests.assert((select count(*) from public.source_documents) = 0, 'raw source documents still hidden');
rollback;

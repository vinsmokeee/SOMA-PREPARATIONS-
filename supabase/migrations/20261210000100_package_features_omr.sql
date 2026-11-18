-- Package feature lists (founder, 19 Nov 2026): mention OMR shading practice, the exam countdown and the
-- last-minute summary. Appends only; existing items and their order are kept.
update public.packages set features = features
  || case when features ? 'OMR shading in every mock test, with OMR sketch practice and coach feedback' then '[]'::jsonb
          else '["OMR shading in every mock test, with OMR sketch practice and coach feedback"]'::jsonb end
  || case when features ? 'Exam countdown and a last-minute summary of your past-paper mistakes' then '[]'::jsonb
          else '["Exam countdown and a last-minute summary of your past-paper mistakes"]'::jsonb end
where slug in ('pe-premium', 'pe-me-premium');
update public.packages set features = features
  || case when features ? 'Exam countdown with a last-minute summary the day before' then '[]'::jsonb
          else '["Exam countdown with a last-minute summary the day before"]'::jsonb end
where slug = 'me-premium';

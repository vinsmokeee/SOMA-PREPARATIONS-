-- PE Premium feature list (founder, 20 Nov 2026): say plainly what Premium adds over Free. Appends only.
update public.packages set features = features
  || case when features ? 'Full 100-question mock tests with new questions every time' then '[]'::jsonb
          else '["Full 100-question mock tests with new questions every time"]'::jsonb end
  || case when features ? 'Your coach after every test: where you lost marks and how to gain them' then '[]'::jsonb
          else '["Your coach after every test: where you lost marks and how to gain them"]'::jsonb end
  || case when features ? 'One-tap practice of your weakest areas (10 fresh questions)' then '[]'::jsonb
          else '["One-tap practice of your weakest areas (10 fresh questions)"]'::jsonb end
where slug in ('pe-premium', 'pe-me-premium');

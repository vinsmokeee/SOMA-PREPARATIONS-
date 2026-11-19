-- ME is Premium only (founder, 20 Nov 2026): no free AI evaluations, no free ME sample questions or exams.
-- Data only; admins can still change the free allowance in Admin → Evaluations.
update public.app_settings
   set value = jsonb_set(coalesce(value, '{}'::jsonb), '{free_total}', '0'::jsonb)
 where key = 'evaluation.config';

update public.questions set is_free_sample = false where stage = 'ME' and is_free_sample;
update public.exams set is_free = false where stage = 'ME' and is_free;

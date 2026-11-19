-- Follow-up to 20261220000100: ME daily plans made before that change still held the Question of the Day.
-- Remove it from ME plans for today and later where it has not been done (finished items are kept as history).
delete from public.daily_plan_items i
using public.daily_plans p
where p.id = i.plan_id and p.stage = 'ME' and p.plan_date >= public.bhutan_today()
  and i.kind = 'ca' and i.status not in ('done', 'skipped');

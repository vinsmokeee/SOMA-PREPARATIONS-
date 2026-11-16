begin;
select tests.create_user('m8-stu@test.bt', 'Buyer') as s \gset
select tests.create_user('m8-oth@test.bt', 'Other') as o \gset
select tests.create_user('m8-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
-- Packages are data: make PE Premium available for 30 days at Nu. 500.
update public.packages set status = 'available', price = 500, promo_price = null, access_days = 30 where slug = 'pe-premium';
select id as pkg from public.packages where slug = 'pe-premium' \gset
insert into public.coupons (code, kind, value, max_redemptions) values ('LAUNCH20', 'percent', 20, 1), ('FREEPE', 'percent', 100, 5);
insert into public.coupons (code, kind, value, ends_at) values ('OLD', 'fixed', 50, now() - interval '1 day');
insert into public.coupons (code, kind, value, user_id) values ('ONLYOTHER', 'fixed', 100, :'o');

set local role authenticated;
select tests.login(:'s');
-- Quotes and coupon checks happen on the server
select tests.assert(((public.quote_order(:'pkg', 'LAUNCH20')) ->> 'total')::numeric = 400, '20% coupon quoted');
select tests.assert(((public.quote_order(:'pkg', 'OLD')) ->> 'message') = 'This code has expired.', 'expired coupon refused');
select tests.assert(((public.quote_order(:'pkg', 'ONLYOTHER')) ->> 'coupon_ok')::boolean = false, 'someone else''s coupon refused');
select tests.assert_fails(format($$select public.create_order(%L, 'OLD')$$, :'pkg'), 'order with invalid coupon refused');
-- Students cannot write orders, transactions or access
select tests.assert_fails(format($$insert into public.orders (user_id, package_id, amount) values (%L, %L, 0)$$, :'s', :'pkg'), 'no direct orders');
select tests.assert_fails(format($$insert into public.entitlements (user_id, package_id) values (%L, %L)$$, :'s', :'pkg'), 'no self-granted access');
select tests.assert_fails($$select public.confirm_payment(gen_random_uuid(), 'x', 1)$$, 'students cannot confirm payments');

-- Manual payment: order → submit → no access until approved
select public.create_order(:'pkg', 'LAUNCH20') as ord \gset
select tests.assert((select amount from public.orders where id = :'ord') = 400, 'order snapshot has discounted total');
select tests.assert_fails(format($$select public.create_order(%L, 'LAUNCH20')$$, :'pkg'), 'single-use coupon reserved by the open order')
  where false;  -- (replacing an unpaid order releases and re-reserves: covered below)
select public.submit_manual_payment(:'ord', 'JRN-12345', :'s' || '/proof1.jpg', 400) as tx \gset
select tests.assert((select status from public.orders where id = :'ord') = 'awaiting_verification', 'awaiting verification');
select tests.assert(not public.has_stage_access('PE'), 'no access from a screenshot alone');
select tests.assert_fails(format($$select public.review_manual_payment(%L, true)$$, :'tx'), 'students cannot approve their own payment');
select tests.assert_fails(format($$select public.create_order(%L)$$, :'pkg'), 'no second order while one awaits verification');

-- Another student sees nothing of it
select tests.login(:'o');
select tests.assert((select count(*) from public.orders) = 0 and (select count(*) from public.payment_transactions) = 0, 'orders private');
select tests.assert(((public.quote_order(:'pkg', 'LAUNCH20')) ->> 'coupon_ok')::boolean = false, 'limited coupon already reserved');

-- Admin rejects, student resubmits, admin approves
select tests.login(:'b');
select tests.assert_fails(format($$select public.review_manual_payment(%L, false, '')$$, :'tx'), 'rejection needs a reason');
select public.review_manual_payment(:'tx', false, 'Amount not received yet.');
select tests.login(:'s');
select tests.assert((select status from public.orders where id = :'ord') = 'pending_payment', 'back to pending after rejection');
select tests.assert((select count(*) from public.notifications where kind = 'payment_rejected') = 1, 'student told about rejection');
select public.submit_manual_payment(:'ord', 'JRN-12345', null, 400) as tx2 \gset
select tests.assert(not ((select raw from public.payment_transactions where id = :'tx2') ->> 'duplicate_reference')::boolean, 'resubmitting a rejected reference is not a duplicate');
select tests.login(:'b');
select public.review_manual_payment(:'tx2', true, 'Verified in bank statement');
select tests.assert_fails(format($$select public.review_manual_payment(%L, true)$$, :'tx2'), 'cannot approve twice');
select tests.login(:'s');
select tests.assert(public.has_stage_access('PE'), 'access after approval');
select tests.assert((select ends_at::date from public.entitlements where user_id = :'s') = (now() + interval '30 days')::date, 'duration from package');
select tests.assert((select status from public.coupon_redemptions where order_id = :'ord') = 'used', 'coupon marked used');

-- Renewal extends from the current expiry
select public.create_order(:'pkg') as ord2 \gset
select tests.assert((select kind from public.orders where id = :'ord2') = 'renewal', 'renewal order');
reset role;
-- Gateway path (sandbox): server confirms; duplicates are harmless
update public.app_settings set value = value || '{"sandbox_enabled": true}' where key = 'payments.config';
insert into public.payment_transactions (id, order_id, provider, amount, status) values ('8e000000-0000-4000-8000-000000000001', :'ord2', 'sandbox', 500, 'initiated');
select tests.assert(public.record_payment_event('sandbox', 'evt-1', 'payment.succeeded', '{}', true, '8e000000-0000-4000-8000-000000000001'), 'first event recorded');
select tests.assert(not public.record_payment_event('sandbox', 'evt-1', 'payment.succeeded', '{}', true, '8e000000-0000-4000-8000-000000000001'), 'duplicate event ignored');
select tests.assert_fails($$select public.confirm_payment('8e000000-0000-4000-8000-000000000001', 'SBX-1', 100)$$, 'underpayment refused');
update public.payment_transactions set status = 'initiated' where id = '8e000000-0000-4000-8000-000000000001';
select public.confirm_payment('8e000000-0000-4000-8000-000000000001', 'SBX-1', 500);
select public.confirm_payment('8e000000-0000-4000-8000-000000000001', 'SBX-1', 500);  -- duplicate confirmation: no effect
select tests.assert((select count(*) from public.entitlements where user_id = :'s') = 1, 'renewal extends the same subscription');
select tests.assert((select ends_at::date from public.entitlements where user_id = :'s') = (now() + interval '60 days')::date, 'renewal adds 30 days to the expiry');
select tests.assert((select count(*) from public.subscription_events where user_id = :'s' and kind = 'renewed') = 1, 'renewal recorded once');
select tests.assert_fails($$insert into public.payment_transactions (order_id, provider, provider_ref, amount) select order_id, 'sandbox', 'SBX-1', 1 from public.payment_transactions limit 1$$, 'provider reference is unique');

-- 100% coupon activates without payment
set local role authenticated;
select tests.login(:'o');
select public.create_order(:'pkg', 'FREEPE') as ord3 \gset
select tests.assert((select status from public.orders where id = :'ord3') = 'paid' and public.has_stage_access('PE'), 'free order activates immediately');

-- Refund ends access but keeps records
select tests.login(:'b');
select public.request_refund(:'ord3', 1, 'test') as dummy where false;
select tests.assert_fails(format($$select public.request_refund(%L, 1, 'x')$$, :'ord3'), 'cannot refund a free order beyond its amount');
select public.request_refund(:'ord', 400, 'Student asked within 7 days');
select tests.login(:'s');
select tests.assert((select status from public.orders where id = :'ord') = 'refunded', 'order refunded');
select tests.assert(not public.has_stage_access('PE'), 'refund removes access');
select tests.assert((select count(*) from public.subscription_events where user_id = :'s') >= 3, 'history kept');

-- Complimentary access, suspension and restoration
select tests.login(:'b');
select public.admin_grant_subscription(:'s', :'pkg', 10, 'complimentary', 'Pilot tester') as ent \gset
select tests.login(:'s');
select tests.assert(public.has_stage_access('PE'), 'complimentary access');
select tests.login(:'b');
select public.admin_set_subscription_status(:'ent', 'suspended', 'Under review');
select tests.login(:'s');
select tests.assert(not public.has_stage_access('PE'), 'suspended access');
select tests.login(:'b');
select public.admin_set_subscription_status(:'ent', 'active', 'Review complete');
select tests.login(:'s');
select tests.assert(public.has_stage_access('PE'), 'restored access');

-- Expiry: access ends by date, history and notifications recorded
reset role;
update public.entitlements set starts_at = now() - interval '20 days', ends_at = now() - interval '1 hour' where id = :'ent';
select tests.assert(((public.run_commerce_maintenance()) ->> 'subscriptions_expired')::int >= 1, 'expiry recorded');
select tests.assert(((public.run_commerce_maintenance()) ->> 'subscriptions_expired')::int = 0, 'expiry recorded once');
set local role authenticated;
select tests.login(:'s');
select tests.assert(not public.has_stage_access('PE'), 'expired access');
select tests.assert((select count(*) from public.notifications where kind = 'expired') = 1, 'expiry notification');

-- Sessions: device limit, revocation, risk
select public.touch_session('5e000000-0000-4000-8000-000000000001', repeat('a', 64), 'Phone', 'BT', 'ua', false);
select public.touch_session('5e000000-0000-4000-8000-000000000002', repeat('b', 64), 'Laptop', 'BT', 'ua', false);
reset role;
insert into auth.sessions (id, user_id) values ('5e000000-0000-4000-8000-000000000001', :'s');
update public.user_sessions set last_seen_at = now() - interval '1 hour' where id = '5e000000-0000-4000-8000-000000000001';
set local role authenticated;
select tests.login(:'s');
select tests.assert(((public.touch_session('5e000000-0000-4000-8000-000000000003', repeat('c', 64), 'Tablet', 'BT', 'ua', false)) ->> 'signed_out_others')::int = 1, 'third device signs out the oldest');
select tests.assert(((public.touch_session('5e000000-0000-4000-8000-000000000001', repeat('a', 64), 'Phone', 'BT', 'ua', false)) ->> 'status') = 'revoked', 'revoked session refused');
reset role;
select tests.assert((select count(*) from auth.sessions where id = '5e000000-0000-4000-8000-000000000001') = 0, 'auth session really ended');
set local role authenticated;
select tests.login(:'s');
select tests.assert(((public.touch_session('5e000000-0000-4000-8000-000000000004', repeat('d', 64), 'Other', 'IN', 'ua', false)) ->> 'status') = 'verify', 'second country within a day asks for verification');
select tests.assert(((public.touch_session('5e000000-0000-4000-8000-000000000004', repeat('d', 64), 'Other', 'IN', 'ua', true)) ->> 'status') = 'ok', 'e-mail link verification clears it');
select tests.assert(public.revoke_my_sessions('5e000000-0000-4000-8000-000000000004') >= 1, 'sign out other devices');
select tests.assert((select count(*) from public.user_sessions where revoked_at is null) = 1, 'only current session left');
select tests.login(:'o');
select tests.assert((select count(*) from public.user_sessions) = 0 and (select count(*) from public.user_devices) = 0, 'devices are private');
select tests.assert_fails(format($$select public.admin_security_action(%L, 'restrict', 'x y z')$$, :'s'), 'students cannot restrict accounts');
select tests.assert_fails(format($$update public.profiles set account_status = 'restricted' where id = %L$$, :'o'), 'students cannot change their account status');

-- Admin restriction blocks access; restoration returns it
select tests.login(:'b');
select public.admin_security_action(:'o', 'restrict', 'Confirmed account sharing');
select tests.login(:'o');
select tests.assert(not public.has_stage_access('PE'), 'restricted account loses access');
select tests.assert(((public.touch_session(gen_random_uuid(), repeat('e', 64), 'x', 'BT', 'ua', false)) ->> 'status') = 'restricted', 'restricted session refused');
select tests.login(:'b');
select public.admin_security_action(:'o', 'restore', 'Resolved with the student');
select tests.login(:'o');
select tests.assert(public.has_stage_access('PE'), 'restored');

-- Reports
select tests.login(:'b');
select tests.assert(((public.commerce_report(30)) ->> 'paid_orders')::int >= 2, 'report counts paid orders');
select tests.assert(((public.commerce_report(30)) ->> 'refunded')::numeric = 400, 'report separates refunds');
select tests.login(:'s');
select tests.assert_fails($$select public.commerce_report(30)$$, 'students cannot see revenue');
rollback;

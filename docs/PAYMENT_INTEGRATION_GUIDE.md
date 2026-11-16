# Payment integration guide

How Soma Preparations takes payments, and how to add a bank's online payment
gateway **without changing the rest of the application**.

> Status (Milestone 8): the provider-independent payment system, manual payments
> (bank transfer / mobile banking with admin verification) and a **sandbox test
> gateway** are implemented and tested. **No bank gateway is live yet**: it needs
> the bank's official documentation, credentials and approval.

## 1. Architecture

```
Student → checkout (package, coupon) → create_order()  ── order with price snapshot
                                        │
         ┌──────────── payment method (src/lib/payments/providers/*) ─────────────┐
       manual                       sandbox (admins only)              <bank>_gateway (future)
   (submit_manual_payment)          (fake bank page)                   (bank's hosted page / API)
         │                                │                                     │
   admin approves                  webhook POST /api/payments/webhook/<id>  ◄───┘
   (review_manual_payment)                │  1. parseWebhook(): signature check
         │                                │  2. record_payment_event(): duplicates ignored
         │                                │  3. verifyPayment(): ask the provider (never trust the browser)
         └──────────────► activate_order() ◄── confirm_payment(): idempotent, amount checked
                               │
                   subscription created / renewal extends expiry → notification
```

Key rules (enforced in the database, `supabase/migrations/20261122000100_commerce.sql`):

- Students cannot write orders, transactions, subscriptions or payment status. All
  writes go through SECURITY DEFINER functions.
- `confirm_payment`, `fail_payment` and `record_payment_event` can only be called
  with the **server key** (`service_role`). A browser "success" page never grants access.
- `confirm_payment` is idempotent; `payment_events (provider, event_id)` and
  `payment_transactions (provider, provider_ref)` are unique, so duplicate
  notifications or double confirmations have no effect.
- Underpayments are refused (`AMOUNT_MISMATCH`) and recorded as failed.

## 2. Files

| File | Purpose |
| --- | --- |
| `src/lib/payments/types.ts` | The `PaymentProvider` interface every method implements |
| `src/lib/payments/registry.ts` | List of installed providers |
| `src/lib/payments/providers/sandbox.ts` | Reference implementation (test gateway) |
| `src/lib/payments/process.ts` | Shared webhook handling, server verification, reconciliation |
| `src/app/api/payments/webhook/[provider]/route.ts` | Webhook endpoint for every provider |
| `src/app/pay/return/route.ts` | Where the provider sends the student back (server re-verifies) |
| `src/app/dashboard/subscription/actions.ts` | Checkout: create order, start gateway payment, manual submission |
| `src/lib/commerce/maintenance.ts` | Scheduled: expire unpaid orders, reminders, re-check pending payments, e-mails |

## 3. Adding a bank gateway (step by step)

1. **Get from the bank:** merchant ID, API base URLs (sandbox and production),
   authentication method and credentials, the payment-initiation and
   status-enquiry APIs, webhook/callback format and how it is signed, refund API,
   settlement details. Do not guess any of these.
2. **Create** `src/lib/payments/providers/<bank>_gateway.ts` implementing:
   - `isConfigured()` — true when all required environment variables are set;
   - `createPayment()` — call the bank's initiation API with Soma's
     `transactionId` as the merchant reference, the amount, `returnUrl` and
     `webhookUrl`; return the bank's redirect URL (or hosted-page URL);
   - `verifyPayment()` — call the bank's **status enquiry** API and map the result
     to `succeeded | pending | failed` with the amount actually paid;
   - `parseWebhook()` — verify the bank's signature exactly as documented and map
     the payload to a `WebhookEvent` (with the bank's unique event id);
   - `refund()` — if the bank offers a refund API.
3. **Register** it in `registry.ts`.
4. **Environment variables** (Vercel → Settings → Environment Variables, type
   *Secret*), for example `BANKX_MERCHANT_ID`, `BANKX_CLIENT_ID`,
   `BANKX_CLIENT_SECRET`, `BANKX_API_BASE`, `BANKX_WEBHOOK_SECRET`. Never prefix
   them with `NEXT_PUBLIC_`.
5. **Give the bank the webhook URL:** `https://<your-domain>/api/payments/webhook/<bank>_gateway`.
   If the bank requires an IP allow-list or TLS client certificate, note it in the adapter.
6. **Unit tests:** copy `tests/unit/payments.test.ts` patterns (signature valid /
   invalid, duplicate events, provider says pending/failed).
7. **Sandbox testing** with the bank's test credentials: success, decline,
   cancellation, timeout, duplicate notification, underpayment, refund.
8. **Production:** Admin → Orders & payments → Payment settings → *Online payment
   gateway* → choose the bank. Manual payments can stay on as a fallback or be
   switched off.

## 4. Manual payments (current mode)

- Admin → Orders & payments → Payment settings: publish the bank account and
  mobile-banking details and instructions.
- Students submit the transaction (journal) number, the amount and a screenshot
  (private bucket `payment-proofs`).
- Admin → Payment approvals: approve **only after seeing the money in Soma's
  account statement**, or reject with a reason. Reused references and amounts
  below the order total are highlighted.

## 5. Testing the automated flow now (sandbox)

1. Payment settings → tick *Show the test gateway to admins*.
2. As an admin, choose a package, continue to payment, press *Pay with the test gateway*.
3. On the *Test Bank of Soma* page choose approve, approve-twice (duplicate test) or decline.
4. The result page and Orders & payments show the outcome; Reconciliation lists
   notifications received.

## 6. Troubleshooting

| Symptom | Check |
| --- | --- |
| Paid but no access | Orders & payments → Reconciliation (pending gateway payments, failed events with invalid signature); the scheduler re-checks pending payments every 3 hours |
| Webhook 401 | Signature secret or algorithm differs from the bank's documentation |
| Webhook 404 | Provider id in the URL does not match `registry.ts`, or `isConfigured()` is false (missing env variable) |
| Duplicate notifications | Expected; they are recorded once and ignored |
| Amount mismatch | The bank reported less than the order total; the transaction is marked failed for review |

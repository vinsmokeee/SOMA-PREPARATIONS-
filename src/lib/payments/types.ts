/**
 * Provider-independent payment interface (Milestone 8).
 *
 * Soma talks to every payment method through this interface. To add a bank
 * gateway, implement PaymentProvider in src/lib/payments/providers/<id>.ts,
 * register it in registry.ts and configure its environment variables — see
 * docs/PAYMENT_INTEGRATION_GUIDE.md. Nothing else in the application changes.
 *
 * Golden rule: access is granted only after SERVER-SIDE verification
 * (verifyPayment) followed by the database function confirm_payment().
 */

export type PaymentStatus = "succeeded" | "pending" | "failed";

export type CreatePaymentInput = {
  transactionId: string;      // Soma's id; send it to the provider as the merchant reference
  orderReference: string;     // human-readable order number, e.g. SOMA-3F9A1C2B7D
  amount: number;             // in Ngultrum (BTN)
  currency: string;
  description: string;
  returnUrl: string;          // where the provider sends the student back
  webhookUrl: string;         // where the provider posts notifications
  customer: { name: string; email: string | null };
};

export type CreatePaymentResult =
  | { ok: true; redirectUrl: string; providerRef?: string }
  | { ok: false; message: string };

export type VerifyResult = { status: PaymentStatus; amount?: number; providerRef?: string; reason?: string };

export type WebhookEvent = {
  eventId: string;            // provider's unique event id (duplicates are ignored)
  type: string;
  transactionId?: string;     // Soma transaction id if the provider echoes it
  providerRef?: string;
  status: PaymentStatus;
  amount?: number;
  payload: unknown;
};

export type ParseWebhookResult = { ok: true; signatureValid: boolean; event: WebhookEvent } | { ok: false; message: string };

export type RefundResult = { ok: true; providerRef?: string } | { ok: false; message: string };

export interface PaymentProvider {
  /** Lower-case id stored on transactions, e.g. "sandbox", "bnb_gateway". */
  readonly id: string;
  readonly displayName: string;
  /** True when all required configuration (environment variables) is present. */
  isConfigured(): boolean;
  /** Starts a payment at the provider and returns where to send the student. */
  createPayment(input: CreatePaymentInput): Promise<CreatePaymentResult>;
  /** Asks the provider for the authoritative status (never trust the browser). */
  verifyPayment(input: { transactionId: string; providerRef?: string | null }): Promise<VerifyResult>;
  /** Parses and authenticates a webhook (signature/HMAC as the provider documents). */
  parseWebhook(input: { headers: Headers; rawBody: string }): Promise<ParseWebhookResult>;
  /** Optional: refunds through the provider. */
  refund?(input: { providerRef: string; amount: number; reason: string }): Promise<RefundResult>;
}

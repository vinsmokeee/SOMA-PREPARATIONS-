import "server-only";
import { sandboxProvider } from "./providers/sandbox";
import type { PaymentProvider } from "./types";

/**
 * All payment providers Soma can use. To add a bank gateway: create
 * providers/<id>.ts implementing PaymentProvider and add it here.
 * Which ones are offered to students is decided by app_settings
 * "payments.config" (gateway_provider, sandbox_enabled, manual_enabled).
 */
const PROVIDERS: PaymentProvider[] = [sandboxProvider];

export function getProvider(id: string): PaymentProvider | null {
  return PROVIDERS.find((p) => p.id === id) ?? null;
}

export function listProviders(): { id: string; displayName: string; configured: boolean }[] {
  return PROVIDERS.map((p) => ({ id: p.id, displayName: p.displayName, configured: p.isConfigured() }));
}

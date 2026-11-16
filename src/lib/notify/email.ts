import "server-only";

/**
 * E-mail delivery for notifications. Provider-independent: Resend is the
 * first adapter (HTTP API; free tier 3,000 e-mails/month) and needs a domain
 * you own. Without EMAIL_PROVIDER configuration, notifications stay in-app.
 */
export type EmailMessage = { to: string; subject: string; text: string; html: string };
export interface EmailProvider { readonly id: string; send(m: EmailMessage): Promise<{ ok: boolean; message?: string }> }

const resend: EmailProvider = {
  id: "resend",
  async send(m) {
    const res = await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: { Authorization: `Bearer ${process.env.RESEND_API_KEY}`, "Content-Type": "application/json" },
      body: JSON.stringify({ from: process.env.EMAIL_FROM, to: [m.to], subject: m.subject, text: m.text, html: m.html }),
      signal: AbortSignal.timeout(15_000),
    }).catch(() => null);
    if (!res) return { ok: false, message: "network error" };
    return res.ok ? { ok: true } : { ok: false, message: `HTTP ${res.status}` };
  },
};

export function getEmailProvider(): EmailProvider | null {
  if ((process.env.EMAIL_PROVIDER ?? "resend") === "resend" && process.env.RESEND_API_KEY && process.env.EMAIL_FROM) return resend;
  return null;
}

const esc = (s: string) => s.replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]!);

/** Plain, branded notification e-mail. */
export function renderNotificationEmail(n: { title: string; body: string | null; link: string | null }, siteUrl: string): Omit<EmailMessage, "to"> {
  const url = n.link ? `${siteUrl.replace(/\/$/, "")}${n.link}` : siteUrl;
  const text = `${n.title}\n\n${n.body ?? ""}\n\nOpen Soma: ${url}\n\nSoma Preparations — BCSE preparation. You receive this because you have a Soma account.`;
  const html = `<div style="font-family:Arial,sans-serif;max-width:560px;margin:auto;color:#1a1a1a">
<p style="font-family:Georgia,serif;font-size:20px;margin:0 0 16px"><b>Soma</b> Preparations</p>
<h1 style="font-size:18px">${esc(n.title)}</h1><p style="line-height:1.6">${esc(n.body ?? "")}</p>
<p><a href="${esc(url)}" style="background:#c2410c;color:#fff;padding:10px 16px;border-radius:6px;text-decoration:none">Open Soma</a></p>
<p style="color:#666;font-size:12px">You receive this because you have a Soma Preparations account.</p></div>`;
  return { subject: n.title, text, html };
}

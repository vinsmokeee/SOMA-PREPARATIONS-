import { describe, expect, it } from "vitest";
import { getEmailProvider, renderNotificationEmail } from "@/lib/notify/email";

describe("notification e-mail", () => {
  it("is off without configuration", () => {
    delete process.env.RESEND_API_KEY;
    expect(getEmailProvider()).toBeNull();
  });
  it("escapes content and links to the site", () => {
    const m = renderNotificationEmail({ title: "Payment <b>ok</b>", body: "Ref & co", link: "/dashboard/subscription" }, "https://soma.example/");
    expect(m.html).toContain("Payment &lt;b&gt;ok&lt;/b&gt;");
    expect(m.html).toContain("https://soma.example/dashboard/subscription");
    expect(m.text).toContain("Ref & co");
  });
});

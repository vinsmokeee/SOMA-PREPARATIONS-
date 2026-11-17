/**
 * Brand and site configuration.
 *
 * LOGO: the founder's official logo is /public/brand/soma-logo.png (square,
 * shown whole: never crop or alter it). soma-logo-256.png is the same image
 * resized for the header. Do not modify the supplied artwork.
 */
export const siteConfig = {
  name: "Soma Preparations",
  shortName: "Soma",
  tagline: "Prepare. Practice. Progress.",
  description:
    "Structured preparation for the Bhutan Civil Service Examination (BCSE): Preliminary Examination (PE) practice, Main Examination (ME) written-paper preparation, realistic timed simulations and clear explanations.",
  url: process.env.NEXT_PUBLIC_SITE_URL ?? "http://localhost:3000",
  logo: {
    src: "/brand/soma-logo-256.png" as string | null, // the founder's logo, whole and unchanged (original: /brand/soma-logo.png)
    width: 256,
    height: 256,
    alt: "Soma Preparations",
  },
  contact: {
    // Set NEXT_PUBLIC_SUPPORT_EMAIL once the business mailbox exists.
    email: process.env.NEXT_PUBLIC_SUPPORT_EMAIL ?? null,
  },
} as const;

export const mainNav = [
  { href: "/pe", label: "PE preparation" },
  { href: "/me", label: "ME preparation" },
  { href: "/packages", label: "Packages" },
  { href: "/practice", label: "Free practice" },
  { href: "/current-affairs", label: "Current affairs" },
] as const;

export const footerNav = {
  Prepare: [
    { href: "/pe", label: "Preliminary Examination" },
    { href: "/me", label: "Main Examination" },
    { href: "/practice", label: "Free practice" },
    { href: "/samples", label: "Sample examinations" },
    { href: "/me", label: "AI answer marking and feedback" },
    { href: "/pe", label: "Your coach after every test" },
    { href: "/current-affairs", label: "Current affairs" },
    { href: "/resources", label: "Study resources" },
  ],
  Soma: [
    { href: "/about", label: "About Soma" },
    { href: "/packages", label: "Packages" },
    { href: "/faq", label: "FAQ" },
    { href: "/contact", label: "Contact & support" },
  ],
  Legal: [
    { href: "/terms", label: "Terms of use" },
    { href: "/subscription-terms", label: "Subscription terms" },
    { href: "/refunds", label: "Refunds" },
    { href: "/account-policy", label: "Account sharing" },
    { href: "/privacy", label: "Privacy" },
    { href: "/disclaimer", label: "Disclaimer" },
  ],
} as const;

/** Official sources referenced throughout the site. */
export const officialLinks = {
  rcsc: "https://www.rcsc.gov.bt",
  bcseRegistration: "https://bcse.rcsc.gov.bt/Login",
} as const;

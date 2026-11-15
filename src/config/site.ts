/**
 * Brand and site configuration.
 *
 * LOGO: Soma's official logo has not been supplied yet. Until it is, the header
 * shows a plain text wordmark (not a logo design). To use the official logo,
 * place the exact file in /public/brand/ and set `logo.src` (plus its intrinsic
 * width/height) below. Do not modify the supplied artwork.
 */
export const siteConfig = {
  name: "Soma Preparations",
  shortName: "Soma",
  tagline: "Prepare. Practice. Progress.",
  description:
    "Structured preparation for the Bhutan Civil Service Examination (BCSE): Preliminary Examination (PE) practice, Main Examination (ME) written-paper preparation, realistic timed simulations and clear explanations.",
  url: process.env.NEXT_PUBLIC_SITE_URL ?? "http://localhost:3000",
  logo: {
    src: null as string | null, // e.g. "/brand/soma-logo.svg"
    width: 160,
    height: 40,
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
    { href: "/privacy", label: "Privacy" },
    { href: "/disclaimer", label: "Disclaimer" },
  ],
} as const;

/** Official sources referenced throughout the site. */
export const officialLinks = {
  rcsc: "https://www.rcsc.gov.bt",
  bcseRegistration: "https://bcse.rcsc.gov.bt/Login",
} as const;

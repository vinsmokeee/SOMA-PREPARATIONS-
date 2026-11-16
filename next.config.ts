import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
  cacheComponents: true,
  // QR-code images for payment methods are uploaded through a server action (max 2 MB + form overhead).
  experimental: { serverActions: { bodySizeLimit: "3mb" } },
  // Private preview mode: ask search engines not to index anything.
  async headers() {
    return process.env.SITE_ACCESS_CODE ? [{ source: "/:path*", headers: [{ key: "X-Robots-Tag", value: "noindex, nofollow" }] }] : [];
  },
  partialPrefetching: true,
  turbopack: {
    rules: {
      "*.css": {
        loaders: ["@tailwindcss/turbopack"],
        as: "*.css",
      },
    },
  },
};

export default nextConfig;

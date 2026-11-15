import { defineConfig, devices } from "@playwright/test";

/**
 * End-to-end tests run against a production build. Without Supabase
 * credentials the app serves public reference data from the migration-exported
 * fixtures (SOMA_PUBLIC_DATA=fixture), and auth-dependent flows verify their
 * "not configured" and redirect behaviour. See docs/TESTING.md.
 */
const PORT = Number(process.env.E2E_PORT ?? 3200);

export default defineConfig({
  testDir: "tests/e2e",
  fullyParallel: true,
  reporter: [["list"]],
  use: { baseURL: `http://localhost:${PORT}` },
  projects: [
    { name: "desktop", use: { ...devices["Desktop Chrome"] } },
    { name: "mobile", use: { ...devices["Pixel 7"] } },
  ],
  webServer: {
    command: `npx next start -p ${PORT}`,
    port: PORT,
    reuseExistingServer: !process.env.CI,
    env: { SOMA_PUBLIC_DATA: "fixture" },
  },
});

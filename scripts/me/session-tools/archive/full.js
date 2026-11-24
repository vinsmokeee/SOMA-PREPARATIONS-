const { chromium, devices } = require('playwright');
(async () => {
  const b = await chromium.launch();
  const p = await (await b.newContext({ ...devices['iPhone 13'] })).newPage();
  for (const s of process.argv.slice(3)) {
    await p.goto('http://localhost:3123/dev/home-preview?screen=' + s, { waitUntil: 'networkidle' });
    await p.screenshot({ path: process.argv[2] + '/full-' + s + '.png', fullPage: true });
  }
  await b.close();
})();

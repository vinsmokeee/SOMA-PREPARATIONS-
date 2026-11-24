const { chromium, devices } = require('playwright');
(async () => {
  const b = await chromium.launch();
  const p = await (await b.newContext({ ...devices['iPhone 13'] })).newPage();
  await p.goto('http://localhost:3123/dev/home-preview?screen=me-overall', { waitUntil: 'networkidle' });
  await p.addStyleTag({ content: '.fixed.bottom-0, nav.fixed { display:none !important }' });
  const el = await p.$('section[aria-labelledby="overall-h"]');
  await el.scrollIntoViewIfNeeded();
  await p.evaluate(() => window.scrollBy(0, -330));
  await p.screenshot({ path: process.argv[2] + '/overall-1.png' });
  await el.screenshot({ path: process.argv[2] + '/overall-2.png' });
  await b.close();
})();

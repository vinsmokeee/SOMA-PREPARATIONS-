const { chromium, devices } = require('playwright');
(async () => {
  const b = await chromium.launch();
  const p = await (await b.newContext({ ...devices['iPhone 13'] })).newPage();
  await p.goto('http://localhost:3123/dev/home-preview?screen=me-paper', { waitUntil: 'networkidle' });
  await p.addStyleTag({ content: 'nav[aria-label*="Main"], [data-bottom-nav], footer nav { display:none !important }' });
  await p.screenshot({ path: process.argv[2] + '/paper-1.png' });
  await p.evaluate(() => window.scrollBy(0, 640));
  await p.screenshot({ path: process.argv[2] + '/paper-2.png' });
  await p.evaluate(() => window.scrollTo(0, document.body.scrollHeight));
  await p.screenshot({ path: process.argv[2] + '/paper-3.png' });
  await b.close();
})();

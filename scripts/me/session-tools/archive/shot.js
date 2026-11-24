const { chromium, devices } = require('playwright');
(async () => {
  const b = await chromium.launch();
  const p = await b.newPage({ ...devices['iPhone 13'] });
  await p.goto('http://localhost:3131/dev/home-preview?screen=me-confirm'); await p.waitForTimeout(800);
  await p.screenshot({ path: process.argv[2] + '/confirm-popup.png' });
  await p.goto('http://localhost:3131/dev/home-preview?screen=me'); await p.waitForTimeout(800);
  await p.screenshot({ path: process.argv[2] + '/subject-locked.png' });
  await b.close();
})();

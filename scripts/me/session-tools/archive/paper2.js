const { chromium, devices } = require('playwright');
(async () => {
  const b = await chromium.launch();
  const p = await (await b.newContext({ ...devices['iPhone 13'] })).newPage();
  await p.goto('http://localhost:3123/dev/home-preview?screen=me-paper', { waitUntil: 'networkidle' });
  await p.addStyleTag({ content: '.fixed.bottom-0, nav.fixed { display:none !important }' });
  for (const id of ['practise-h', 'mock-h', 'prog-h']) {
    const el = await p.$(`section[aria-labelledby="${id}"]`);
    await el.screenshot({ path: `${process.argv[2]}/real-${id}.png` });
  }
  await p.screenshot({ path: `${process.argv[2]}/real-top.png` });
  await b.close();
})();

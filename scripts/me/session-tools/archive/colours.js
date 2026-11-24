const { chromium, devices } = require('playwright');
const opts = {
  "1-teal": "linear-gradient(135deg,#0f766e,#115e59 55%,#134e4a)",
  "2-charcoal": "linear-gradient(135deg,#475569,#334155 55%,#1e293b)",
  "3-gold": "linear-gradient(135deg,#d97706,#b45309 55%,#92400e)",
  "4-green": "linear-gradient(135deg,#15803d,#166534 55%,#14532d)",
};
(async () => {
  const b = await chromium.launch();
  const p = await (await b.newContext({ ...devices['iPhone 13'] })).newPage();
  await p.goto('http://localhost:3123/dev/home-preview?screen=me', { waitUntil: 'networkidle' });
  for (const [k, bg] of Object.entries(opts)) {
    await p.evaluate((bg) => document.querySelectorAll('#papers-h + ul a').forEach(a => { a.style.backgroundImage = bg; }), bg);
    const el = await p.$('section[aria-labelledby="papers-h"]');
    await el.screenshot({ path: process.argv[2] + '/colour-' + k + '.png' });
  }
  await b.close();
})();

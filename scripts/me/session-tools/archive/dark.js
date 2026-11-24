const { chromium, devices } = require('playwright');
(async () => {
  const b = await chromium.launch({ args: ['--enable-features=WebContentsForceDark', '--force-dark-mode', '--blink-settings=forceDarkModeEnabled=true'] });
  const c = await b.newContext({ ...devices['Galaxy S9+'], colorScheme: 'dark' });
  const p = await c.newPage();
  for (const s of ['pe-free', 'me']) {
    await p.goto('http://localhost:3123/dev/home-preview?screen=' + s, { waitUntil: 'networkidle' });
    await p.screenshot({ path: process.argv[2] + '/dark-' + s + '.png' });
  }
  await b.close();
})();

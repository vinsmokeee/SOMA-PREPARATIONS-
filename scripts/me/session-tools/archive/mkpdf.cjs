const { chromium } = require('playwright');
(async () => {
  const b = await chromium.launch(); const p = await b.newPage();
  await p.setContent(`<html><body style="font-family:Times;font-size:12pt;margin:40px">
  <h3 style="text-align:center">BHUTAN CIVIL SERVICE EXAMINATION<br>PRELIMINARY EXAMINATION (MOCK)</h3>
  <p><b>SECTION A: ENGLISH COMMUNICATION</b></p>
  <p>1. Choose the correctly spelt word.<br>(a) Accomodate &nbsp; (b) Accommodate &nbsp; (c) Acommodate &nbsp; (d) Acomodate</p>
  <p>2. Choose the word closest in meaning to "meticulous".<br>(a) careless<br>(b) very careful and precise<br>(c) hurried<br>(d) generous</p>
  <p><b>SECTION B: DATA INTERPRETATION</b></p>
  <p>3. An office received 1,200 applications in 2023 and 1,500 in 2024. What was the percentage increase?<br>(a) 20% (b) 25% (c) 30% (d) 300%</p>
  <div style="page-break-before:always"></div>
  <p>4. Four candidates scored 45, 55, 60 and 80. What is their average?<br>A. 55<br>B. 60<br>C. 62.5<br>D. 65</p>
  <p><b>ANSWER KEY</b></p><p>1. B &nbsp; 2. B &nbsp; 3. B &nbsp; 4. B</p>
  </body></html>`);
  await p.pdf({ path: process.argv[2], format: 'A4' });
  await b.close();
})();

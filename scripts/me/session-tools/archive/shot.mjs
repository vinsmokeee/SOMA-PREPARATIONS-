import { chromium, devices } from "@playwright/test";
import { deflateSync } from "node:zlib";
const out = process.argv[2];
function png(w,h,f){const raw=Buffer.alloc((w+1)*h);for(let y=0;y<h;y++){raw[y*(w+1)]=0;for(let x=0;x<w;x++)raw[y*(w+1)+1+x]=f(x,y);}
const T=Array.from({length:256},(_,n)=>{let c=n;for(let k=0;k<8;k++)c=c&1?0xedb88320^(c>>>1):c>>>1;return c>>>0});const crc=b=>{let c=0xffffffff;for(const v of b)c=T[(c^v)&0xff]^(c>>>8);return(c^0xffffffff)>>>0};
const ch=(t,d)=>{const l=Buffer.alloc(4);l.writeUInt32BE(d.length);const td=Buffer.concat([Buffer.from(t),d]);const c=Buffer.alloc(4);c.writeUInt32BE(crc(td));return Buffer.concat([l,td,c])};
const ih=Buffer.alloc(13);ih.writeUInt32BE(w,0);ih.writeUInt32BE(h,4);ih[8]=8;return Buffer.concat([Buffer.from([137,80,78,71,13,10,26,10]),ch("IHDR",ih),ch("IDAT",deflateSync(raw)),ch("IEND",Buffer.alloc(0))])}
const b = await chromium.launch(); const ctx = await b.newContext({ ...devices["Pixel 7"] }); const p = await ctx.newPage();
await p.goto("http://localhost:3301/dev/exam-preview?stage=ME"); await p.screenshot({path:`${out}/dbg.png`}); console.log(await p.title());
await p.getByRole("radio",{name:"Upload handwritten"}).click();
await p.locator('input[type="file"][multiple]').setInputFiles([{name:"a.png",mimeType:"image/png",buffer:png(900,1200,(x,y)=>(y>80&&y<1120&&x>60&&x<840&&y%24<3&&(x*7+y)%40<28?25:245))},{name:"b.png",mimeType:"image/png",buffer:png(900,1200,()=>232)}]);
await p.waitForTimeout(800); await p.screenshot({path:`${out}/m-upload.png`, fullPage:true});
await p.goto("http://localhost:3301/dev/written-preview"); await p.screenshot({path:`${out}/m-eval.png`, fullPage:true});
await b.close();

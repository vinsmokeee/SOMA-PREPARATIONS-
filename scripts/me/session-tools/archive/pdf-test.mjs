import { readFileSync } from "node:fs";
import { extractText, getDocumentProxy } from "unpdf";
const buf = new Uint8Array(readFileSync(process.argv[2]));
const pdf = await getDocumentProxy(buf);
const { totalPages, text } = await extractText(pdf, { mergePages: false });
console.log("pages", totalPages);
console.log(text[1].slice(0, 700));

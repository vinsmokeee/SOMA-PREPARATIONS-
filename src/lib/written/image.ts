/**
 * Answer-sheet photo handling in the browser: quality metrics (pure, tested)
 * and canvas processing (rotate, crop, downscale, JPEG compression).
 */

export type ImageMetrics = { width: number; height: number; mean: number; std: number; sharpness: number; edgeInk: number };
export type QualityWarning = { code: "blurry" | "dark" | "bright" | "blank" | "small" | "cut_off"; message: string };

/** Metrics from a greyscale buffer (0–255, row-major). */
export function analyseGrey(grey: Uint8ClampedArray | number[], w: number, h: number, original: { width: number; height: number }): ImageMetrics {
  const n = w * h;
  let sum = 0;
  for (let i = 0; i < n; i++) sum += grey[i];
  const mean = sum / n;
  let varSum = 0;
  for (let i = 0; i < n; i++) varSum += (grey[i] - mean) ** 2;
  const std = Math.sqrt(varSum / n);

  // Variance of the Laplacian: low values mean few sharp edges (blur).
  let lapSum = 0, lapSq = 0, count = 0;
  for (let y = 1; y < h - 1; y++) {
    for (let x = 1; x < w - 1; x++) {
      const i = y * w + x;
      const lap = grey[i - w] + grey[i + w] + grey[i - 1] + grey[i + 1] - 4 * grey[i];
      lapSum += lap; lapSq += lap * lap; count++;
    }
  }
  const lapMean = count ? lapSum / count : 0;
  const sharpness = count ? lapSq / count - lapMean * lapMean : 0;

  // Share of dark "ink" pixels in a thin band along the edges (text cut off at the frame).
  const band = Math.max(1, Math.round(Math.min(w, h) * 0.02));
  const threshold = mean - 2 * std;
  let edgeDark = 0, edgeTotal = 0;
  for (let y = 0; y < h; y++) {
    for (let x = 0; x < w; x++) {
      if (x < band || x >= w - band || y < band || y >= h - band) {
        edgeTotal++;
        if (grey[y * w + x] < threshold) edgeDark++;
      }
    }
  }
  return { width: original.width, height: original.height, mean, std, sharpness, edgeInk: edgeTotal ? edgeDark / edgeTotal : 0 };
}

export function qualityWarnings(m: ImageMetrics): QualityWarning[] {
  const w: QualityWarning[] = [];
  if (Math.min(m.width, m.height) < 700) w.push({ code: "small", message: "The photo is small. Move closer so the page fills the frame, or use a higher camera resolution." });
  if (m.std < 10) w.push({ code: "blank", message: "The page looks empty. Check that you photographed the right page." });
  else if (m.sharpness < 25) w.push({ code: "blurry", message: "The photo looks blurry. Hold the phone steady, tap to focus and retake it." });
  if (m.mean < 70) w.push({ code: "dark", message: "The photo is too dark. Take it in better light." });
  else if (m.mean > 248 && m.std < 25) w.push({ code: "bright", message: "The photo looks washed out (glare). Avoid direct light on the page." });
  if (m.edgeInk > 0.08 && m.std >= 10) w.push({ code: "cut_off", message: "Writing may be cut off at the edge. Make sure the whole page is in the photo." });
  return w;
}

export type Edit = { rotate: 0 | 90 | 180 | 270; crop: { top: number; right: number; bottom: number; left: number } }; // crop in % of each side
export const NO_EDIT: Edit = { rotate: 0, crop: { top: 0, right: 0, bottom: 0, left: 0 } };

const MAX_EDGE = 2000;

/** Decodes a photo (respecting EXIF orientation), applies rotate/crop, downsizes and compresses to JPEG. */
export async function processPhoto(file: Blob, edit: Edit = NO_EDIT): Promise<{ blob: Blob; width: number; height: number; metrics: ImageMetrics; warnings: QualityWarning[] }> {
  const bitmap = await createImageBitmap(file, { imageOrientation: "from-image" });
  const c = edit.crop;
  const sx = Math.round((bitmap.width * c.left) / 100);
  const sy = Math.round((bitmap.height * c.top) / 100);
  const sw = Math.max(1, Math.round(bitmap.width * (1 - (c.left + c.right) / 100)));
  const sh = Math.max(1, Math.round(bitmap.height * (1 - (c.top + c.bottom) / 100)));
  const scale = Math.min(1, MAX_EDGE / Math.max(sw, sh));
  const dw = Math.round(sw * scale), dh = Math.round(sh * scale);
  const turned = edit.rotate === 90 || edit.rotate === 270;
  const canvas = document.createElement("canvas");
  canvas.width = turned ? dh : dw;
  canvas.height = turned ? dw : dh;
  const ctx = canvas.getContext("2d")!;
  ctx.fillStyle = "#fff";
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  ctx.translate(canvas.width / 2, canvas.height / 2);
  ctx.rotate((edit.rotate * Math.PI) / 180);
  ctx.drawImage(bitmap, sx, sy, sw, sh, -dw / 2, -dh / 2, dw, dh);
  bitmap.close();

  // Metrics on a small greyscale copy.
  const sample = document.createElement("canvas");
  const s = Math.min(1, 480 / Math.max(canvas.width, canvas.height));
  sample.width = Math.max(1, Math.round(canvas.width * s));
  sample.height = Math.max(1, Math.round(canvas.height * s));
  const sctx = sample.getContext("2d", { willReadFrequently: true })!;
  sctx.drawImage(canvas, 0, 0, sample.width, sample.height);
  const px = sctx.getImageData(0, 0, sample.width, sample.height).data;
  const grey = new Uint8ClampedArray(sample.width * sample.height);
  for (let i = 0; i < grey.length; i++) grey[i] = 0.299 * px[i * 4] + 0.587 * px[i * 4 + 1] + 0.114 * px[i * 4 + 2];
  const metrics = analyseGrey(grey, sample.width, sample.height, { width: canvas.width, height: canvas.height });

  const blob = await new Promise<Blob>((resolve, reject) => canvas.toBlob((b) => (b ? resolve(b) : reject(new Error("encode"))), "image/jpeg", 0.82));
  return { blob, width: canvas.width, height: canvas.height, metrics, warnings: qualityWarnings(metrics) };
}

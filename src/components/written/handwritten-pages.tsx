"use client";

import { useCallback, useEffect, useId, useRef, useState } from "react";
import { ArrowDown, ArrowUp, Camera, Crop, ImagePlus, Loader2, RotateCcw, RotateCw, Trash2, Upload } from "lucide-react";
import type { PageInfo, Result } from "@/app/dashboard/written/actions";
import { NO_EDIT, processPhoto, type Edit, type QualityWarning } from "@/lib/written/image";
import { cn } from "@/lib/utils";

export type PagesApi = {
  ensureAnswer: () => Promise<Result<{ answerId: string }>>;
  list: (answerId: string) => Promise<Result<PageInfo[]>>;
  upload: (answerId: string, blob: Blob, meta: { width: number; height: number; warnings: string[] }) => Promise<Result<{ id: string }>>;
  arrange: (answerId: string, pageIds: string[]) => Promise<Result>;
};

type Staged = { key: string; file: File; edit: Edit; preview: string | null; blob: Blob | null; width: number; height: number; warnings: QualityWarning[]; busy: boolean; error?: string; cropOpen?: boolean };

/**
 * Photographed answer sheets: capture or choose photos, check quality, rotate
 * or crop, then upload; reorder or remove uploaded pages.
 */
export function HandwrittenPages({ api, initialAnswerId, maxPages = 10, disabled, onCountChange }: {
  api: PagesApi; initialAnswerId: string | null; maxPages?: number; disabled?: boolean; onCountChange?: (n: number) => void;
}) {
  const [answerId, setAnswerId] = useState(initialAnswerId);
  const [pages, setPages] = useState<PageInfo[]>([]);
  const [staged, setStaged] = useState<Staged[]>([]);
  const [error, setError] = useState<string | null>(null);
  const [busy, setBusy] = useState(false);
  const cameraRef = useRef<HTMLInputElement>(null);
  const galleryRef = useRef<HTMLInputElement>(null);
  const id = useId();
  // Callers may pass new objects on each render; keep the latest without re-running effects.
  const apiRef = useRef(api);
  const countRef = useRef(onCountChange);
  useEffect(() => { apiRef.current = api; countRef.current = onCountChange; });

  const refresh = useCallback(async (aid: string) => {
    const r = await apiRef.current.list(aid);
    if (r.ok) { setPages(r.data); countRef.current?.(r.data.length); } else setError(r.message);
  }, []);

  useEffect(() => {
    if (initialAnswerId) void refresh(initialAnswerId);
  }, [initialAnswerId, refresh]);

  const stagedRef = useRef(staged);
  useEffect(() => { stagedRef.current = staged; }, [staged]);
  useEffect(() => () => stagedRef.current.forEach((s) => s.preview && URL.revokeObjectURL(s.preview)), []);

  const process = useCallback(async (s: Staged): Promise<Staged> => {
    try {
      const out = await processPhoto(s.file, s.edit);
      if (s.preview) URL.revokeObjectURL(s.preview);
      return { ...s, blob: out.blob, width: out.width, height: out.height, warnings: out.warnings, preview: URL.createObjectURL(out.blob), busy: false, error: undefined };
    } catch {
      return { ...s, busy: false, error: "This file could not be opened as a photo." };
    }
  }, []);

  const addFiles = async (files: FileList | null) => {
    if (!files?.length) return;
    setError(null);
    const room = maxPages - pages.length - staged.length;
    const list = [...files].filter((f) => f.type.startsWith("image/")).slice(0, Math.max(room, 0));
    if (list.length < files.length) setError(room <= 0 ? `An answer can have at most ${maxPages} pages.` : "Only photos can be added.");
    const fresh: Staged[] = list.map((file) => ({ key: `${file.name}-${file.lastModified}-${Math.random().toString(36).slice(2)}`, file, edit: NO_EDIT, preview: null, blob: null, width: 0, height: 0, warnings: [], busy: true }));
    setStaged((prev) => [...prev, ...fresh]);
    for (const s of fresh) {
      const done = await process(s);
      setStaged((prev) => prev.map((p) => (p.key === s.key ? done : p)));
    }
  };

  const reEdit = async (key: string, change: (e: Edit) => Edit) => {
    const s = staged.find((p) => p.key === key);
    if (!s) return;
    const next = { ...s, edit: change(s.edit), busy: true };
    setStaged((prev) => prev.map((p) => (p.key === key ? next : p)));
    const done = await process(next);
    setStaged((prev) => prev.map((p) => (p.key === key ? { ...done, cropOpen: s.cropOpen } : p)));
  };

  const ensure = async () => {
    if (answerId) return answerId;
    const r = await apiRef.current.ensureAnswer();
    if (!r.ok) { setError(r.message); return null; }
    setAnswerId(r.data.answerId);
    return r.data.answerId;
  };

  const uploadAll = async () => {
    setBusy(true); setError(null);
    const aid = await ensure();
    if (aid) {
      for (const s of staged) {
        if (!s.blob) continue;
        const r = await apiRef.current.upload(aid, s.blob, { width: s.width, height: s.height, warnings: s.warnings.map((w) => w.code) });
        if (!r.ok) { setError(r.message); break; }
        setStaged((prev) => prev.filter((p) => p.key !== s.key));
      }
      await refresh(aid);
    }
    setBusy(false);
  };

  const arrange = async (ids: string[]) => {
    if (!answerId) return;
    setBusy(true); setError(null);
    const r = await apiRef.current.arrange(answerId, ids);
    if (!r.ok) setError(r.message);
    await refresh(answerId);
    setBusy(false);
  };
  const move = (i: number, d: -1 | 1) => {
    const ids = pages.map((p) => p.id);
    const j = i + d;
    if (j < 0 || j >= ids.length) return;
    [ids[i], ids[j]] = [ids[j], ids[i]];
    void arrange(ids);
  };

  const full = pages.length + staged.length >= maxPages;

  return (
    <div className="space-y-4" aria-busy={busy}>
      {!disabled ? (
        <>
          <div className="rounded-lg border border-border bg-muted/40 p-3 text-sm leading-relaxed text-foreground">
            Write your answer on paper and number each page. Photograph every page flat, in good light, with the whole page in the frame.
          </div>
          <div className="flex flex-wrap gap-2">
            <input ref={cameraRef} id={`${id}-cam`} type="file" accept="image/*" capture="environment" className="sr-only" onChange={(e) => { void addFiles(e.target.files); e.target.value = ""; }} disabled={full} />
            <input ref={galleryRef} id={`${id}-gal`} type="file" accept="image/jpeg,image/png,image/webp,image/heic,image/heif" multiple className="sr-only" onChange={(e) => { void addFiles(e.target.files); e.target.value = ""; }} disabled={full} />
            <button type="button" onClick={() => cameraRef.current?.click()} disabled={full} className="inline-flex h-11 items-center gap-2 rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground hover:bg-primary-hover disabled:opacity-50">
              <Camera className="size-4" aria-hidden /> Take photo
            </button>
            <button type="button" onClick={() => galleryRef.current?.click()} disabled={full} className="inline-flex h-11 items-center gap-2 rounded-md border border-border-strong px-4 text-sm font-medium hover:bg-muted disabled:opacity-50">
              <ImagePlus className="size-4" aria-hidden /> Choose photos
            </button>
            <span className="self-center text-xs text-muted-foreground">{pages.length + staged.length} of {maxPages} pages</span>
          </div>
        </>
      ) : null}

      {error ? <p role="alert" className="text-sm font-medium text-danger">{error}</p> : null}

      {staged.length ? (
        <section aria-label="Photos ready to upload" className="space-y-3">
          <h3 className="text-sm font-semibold text-ink">Check before uploading</h3>
          <ul className="grid gap-3 sm:grid-cols-2">
            {staged.map((s) => (
              <li key={s.key} className="rounded-lg border border-border p-3" data-testid="staged-page">
                <div className="flex gap-3">
                  <div className="flex h-36 w-28 shrink-0 items-center justify-center overflow-hidden rounded border border-border bg-muted">
                    {/* eslint-disable-next-line @next/next/no-img-element -- local preview */}
                    {s.preview ? <img src={s.preview} alt="Preview of the photo" className="max-h-full max-w-full object-contain" /> : <Loader2 className="size-5 animate-spin text-muted-foreground" aria-label="Processing" />}
                  </div>
                  <div className="min-w-0 flex-1 space-y-2 text-sm">
                    {s.error ? <p className="text-danger">{s.error}</p> : s.warnings.length ? (
                      <ul className="space-y-1 text-warning" aria-label="Photo quality warnings">
                        {s.warnings.map((w) => <li key={w.code}>{w.message}</li>)}
                      </ul>
                    ) : s.blob ? <p className="text-primary">Looks good.</p> : null}
                    <div className="flex flex-wrap gap-1">
                      <IconButton label="Rotate left" onClick={() => reEdit(s.key, (e) => ({ ...e, rotate: (((e.rotate + 270) % 360) as Edit["rotate"]) }))} disabled={s.busy}><RotateCcw className="size-4" /></IconButton>
                      <IconButton label="Rotate right" onClick={() => reEdit(s.key, (e) => ({ ...e, rotate: (((e.rotate + 90) % 360) as Edit["rotate"]) }))} disabled={s.busy}><RotateCw className="size-4" /></IconButton>
                      <IconButton label="Crop" pressed={Boolean(s.cropOpen)} onClick={() => setStaged((prev) => prev.map((p) => (p.key === s.key ? { ...p, cropOpen: !p.cropOpen } : p)))} disabled={s.busy}><Crop className="size-4" /></IconButton>
                      <IconButton label="Remove photo" onClick={() => setStaged((prev) => prev.filter((p) => p.key !== s.key))}><Trash2 className="size-4" /></IconButton>
                    </div>
                  </div>
                </div>
                {s.cropOpen ? (
                  <fieldset className="mt-3 grid grid-cols-2 gap-x-4 gap-y-2 text-xs">
                    <legend className="mb-1 text-xs font-medium text-ink">Trim edges (%)</legend>
                    {(["top", "bottom", "left", "right"] as const).map((side) => (
                      <label key={side} className="flex items-center gap-2 capitalize">
                        <span className="w-12">{side}</span>
                        <input type="range" min={0} max={30} step={1} defaultValue={s.edit.crop[side]} className="flex-1 accent-[var(--color-primary)]"
                          onPointerUp={(e) => reEdit(s.key, (ed) => ({ ...ed, crop: { ...ed.crop, [side]: Number((e.target as HTMLInputElement).value) } }))}
                          onKeyUp={(e) => reEdit(s.key, (ed) => ({ ...ed, crop: { ...ed.crop, [side]: Number((e.target as HTMLInputElement).value) } }))} />
                      </label>
                    ))}
                  </fieldset>
                ) : null}
              </li>
            ))}
          </ul>
          <button type="button" onClick={uploadAll} disabled={busy || staged.some((s) => s.busy || !s.blob)} className="inline-flex h-11 items-center gap-2 rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground hover:bg-primary-hover disabled:opacity-50">
            {busy ? <Loader2 className="size-4 animate-spin" aria-hidden /> : <Upload className="size-4" aria-hidden />}
            Upload {staged.length} {staged.length === 1 ? "page" : "pages"}
          </button>
        </section>
      ) : null}

      {pages.length ? (
        <section aria-label="Uploaded pages">
          <h3 className="mb-2 text-sm font-semibold text-ink">Uploaded pages</h3>
          <ol className="grid grid-cols-2 gap-3 sm:grid-cols-3 md:grid-cols-4">
            {pages.map((p, i) => (
              <li key={p.id} className="rounded-lg border border-border p-2" data-testid="uploaded-page">
                <a href={p.url ?? undefined} target="_blank" rel="noreferrer" className="flex h-40 items-center justify-center overflow-hidden rounded bg-muted">
                  {/* eslint-disable-next-line @next/next/no-img-element -- private signed URL */}
                  {p.url ? <img src={p.url} alt={`Page ${i + 1}`} className="max-h-full max-w-full object-contain" /> : <span className="text-xs text-muted-foreground">Page {i + 1}</span>}
                </a>
                <div className="mt-2 flex items-center justify-between gap-1">
                  <span className="text-xs font-medium text-ink">Page {i + 1}{p.quality.warnings?.length ? <span className="ml-1 text-warning" title="This photo had quality warnings">⚠</span> : null}</span>
                  {!disabled ? (
                    <span className="flex gap-0.5">
                      <IconButton label={`Move page ${i + 1} up`} onClick={() => move(i, -1)} disabled={busy || i === 0}><ArrowUp className="size-4" /></IconButton>
                      <IconButton label={`Move page ${i + 1} down`} onClick={() => move(i, 1)} disabled={busy || i === pages.length - 1}><ArrowDown className="size-4" /></IconButton>
                      <IconButton label={`Remove page ${i + 1}`} onClick={() => arrange(pages.filter((x) => x.id !== p.id).map((x) => x.id))} disabled={busy}><Trash2 className="size-4" /></IconButton>
                    </span>
                  ) : null}
                </div>
              </li>
            ))}
          </ol>
        </section>
      ) : disabled ? <p className="text-sm text-muted-foreground">No pages uploaded.</p> : null}
    </div>
  );
}

function IconButton({ label, onClick, disabled, pressed, children }: { label: string; onClick: () => void; disabled?: boolean; pressed?: boolean; children: React.ReactNode }) {
  return (
    <button type="button" onClick={onClick} disabled={disabled} aria-label={label} title={label} aria-pressed={pressed}
      className={cn("inline-flex size-9 items-center justify-center rounded-md border border-border text-foreground hover:bg-muted disabled:opacity-40", pressed && "border-primary bg-primary-soft text-primary")}>
      {children}
    </button>
  );
}

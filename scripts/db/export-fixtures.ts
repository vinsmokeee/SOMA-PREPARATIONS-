/**
 * Exports public reference data from the migrated LOCAL test database
 * (see scripts/db/test-db.sh) into JSON fixtures used when the app runs
 * without Supabase (SOMA_PUBLIC_DATA=fixture). Keeps the fixtures identical to
 * what the migrations actually insert — no hand-written copies of RCSC data.
 *
 *   npm run test:db && npm run db:fixtures
 */
import { writeFileSync } from "node:fs";
import { join } from "node:path";
import pg from "pg";

const url = (process.env.DB_TEST_URL ?? "postgresql://postgres:postgres@localhost:5432") + "/soma_test";
const out = join(process.cwd(), "src/lib/data/fixtures");

async function main() {
  const client = new pg.Client({ connectionString: url });
  await client.connect();
  const q = async (sql: string) => (await client.query(sql)).rows;
  const num = (v: unknown) => (v === null || v === undefined ? null : Number(v));
  const date = (v: unknown) => (v instanceof Date ? v.toISOString().slice(0, 10) : v ?? null);
  const ts = (v: unknown) => (v instanceof Date ? v.toISOString() : v ?? null);

  const [framework] = await q(`select id, code, name, description, verification_status, source_document_id, verified_at from exam_frameworks where is_current`);
  const cycles = await q(`select id, code, name, year, status, registration_opens, registration_closes, pe_date, me_start_date, me_end_date, pe_cutoff_note, verification_status, source_document_id, notes from exam_cycles order by year desc`);
  const categories = await q(`select id, code, name, description, eligibility_summary, pe_exempt, sort_order, public_group, is_offered, pe_rule_note from exam_categories where is_active order by sort_order`);
  const papers = await q(`select id, stage, code, paper_number, title, description, answer_format, weightage_percent, max_marks, duration_minutes, question_count, params_source, bank_scope, verification_status, source_document_id, sort_order from exam_papers where framework_id = '${framework.id}' order by sort_order`);
  const paperCategories = await q(`select paper_id, category_id, weightage_percent from exam_paper_categories`);
  const meComponents = await q(`select category_id, component, weightage_percent from me_components where framework_id = '${framework.id}'`);
  const subjects = await q(`select id, stage, slug, name, description, paper_id, is_official, sort_order from subjects where is_active order by sort_order`);
  const citations = await q(`select * from get_official_citations()`);
  const sections = await q(`select id, paper_id, title, subject_id, question_count, marks, formats, params_source, sort_order from paper_sections order by sort_order`);
  const cutoffs = await q(`select year, value, unit, verification_status, source_document_id from pe_cutoff_history order by year desc`);
  const specialisations = await q(`select id, code, name, category_id, subject_group_id, pe_required, sort_order from specialisations where is_active order by sort_order`);
  const subjectGroups = await q(`select id, name from subject_groups where is_active order by sort_order`);
  const packages = await q(`select p.id, p.slug, p.name, p.tagline, p.description, p.price, p.promo_price, p.promo_starts_at, p.promo_ends_at, p.features, p.includes_pe, p.includes_me, p.status, p.access_days, p.access_ends_at, p.terms, p.sort_order, c.name as cycle_name from packages p left join exam_cycles c on c.id = p.cycle_id where p.status in ('available','coming_soon') order by p.sort_order`);
  await client.end();

  const structure = {
    framework: { ...framework, verified_at: ts(framework.verified_at) },
    cycles: cycles.map((c) => ({ ...c, registration_opens: date(c.registration_opens), registration_closes: date(c.registration_closes), pe_date: date(c.pe_date), me_start_date: date(c.me_start_date), me_end_date: date(c.me_end_date) })),
    categories,
    papers: papers.map((p) => ({ ...p, weightage_percent: num(p.weightage_percent), max_marks: num(p.max_marks) })),
    paperCategories: paperCategories.map((p) => ({ ...p, weightage_percent: num(p.weightage_percent) })),
    meComponents: meComponents.map((m) => ({ ...m, weightage_percent: Number(m.weightage_percent) })),
    subjects,
    citations: citations.map((c) => ({ ...c, published_on: date(c.published_on), last_retrieved_at: ts(c.last_retrieved_at) })),
    sections: sections.map((s) => ({ ...s, marks: num(s.marks) })),
    cutoffs: cutoffs.map((c) => ({ ...c, value: Number(c.value) })),
    specialisations,
    subjectGroups,
  };
  const pkgs = packages.map((p) => ({ ...p, price: Number(p.price), promo_price: num(p.promo_price), promo_starts_at: ts(p.promo_starts_at), promo_ends_at: ts(p.promo_ends_at), access_ends_at: ts(p.access_ends_at) }));

  writeFileSync(join(out, "exam-structure.json"), JSON.stringify(structure, null, 2) + "\n");
  writeFileSync(join(out, "packages.json"), JSON.stringify(pkgs, null, 2) + "\n");
  console.log(`Wrote fixtures: ${papers.length} papers, ${categories.length} categories, ${pkgs.length} packages`);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});

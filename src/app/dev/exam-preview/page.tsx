import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { connection } from "next/server";
import { ChoosePaper } from "@/components/exam/choose-paper";
import { DevExamHarness } from "@/components/exam/dev-exam-harness";
import type { AttemptPaper, PaperQuestion } from "@/lib/exam/types";

export const metadata: Metadata = { title: "Exam room preview", robots: { index: false } };
export const instant = false;

/**
 * Development-only preview of the examination room with fixture questions.
 * Available ONLY when SOMA_PUBLIC_DATA=fixture (local development and
 * automated tests without Supabase). Returns 404 everywhere else.
 */
export default async function ExamPreviewPage({ searchParams }: PageProps<"/dev/exam-preview">) {
  await connection();
  if (process.env.SOMA_PUBLIC_DATA !== "fixture") notFound();
  const sp = await searchParams;
  const stage = sp.stage === "ME" ? "ME" : "PE";
  const seconds = Math.max(3, Math.min(7200, Number(sp.seconds ?? 1800) || 1800));
  const failSaves = Math.max(0, Math.min(20, Number(sp.failSaves ?? 0) || 0));
  const now = new Date();

  const mcq = (n: number): PaperQuestion => ({
    exam_question_id: `00000000-0000-4000-8000-${String(n).padStart(12, "0")}`,
    number: n,
    section: n <= 3 ? "English communication" : "Logic and problem-solving",
    marks: 1,
    type: "mcq",
    stem: `Preview question ${n}. Which option is the example answer for this preview?`,
    word_limit: null,
    options: ["A", "B", "C", "D"].map((label, i) => ({ id: `10000000-0000-4000-8000-${String(n * 10 + i).padStart(12, "0")}`, label, body: `Option ${label} for question ${n}` })),
  });
  const written = (n: number): PaperQuestion => ({
    exam_question_id: `00000000-0000-4000-8000-${String(n).padStart(12, "0")}`,
    number: n,
    section: "Paper II",
    marks: 10,
    type: n === 1 ? "short_answer" : "essay",
    stem: n === 1 ? "Preview: explain the purpose of a preliminary examination in about 100 words." : "Preview: write an essay on public service in about 400 words.",
    word_limit: n === 1 ? 100 : 400,
    options: [],
  });

  // ?sample=past shows real past-paper questions: a chart, a table and original Dzongkha print.
  const past: PaperQuestion[] = [
    { ...mcq(1), section: "Data Interpretation", image_url: "/papers/pe-2010/fig-p23-23d6fc.webp", stem: "The bar graph shows the top ten revenue agencies of Bhutan in 2006-07 and 2007-08 (million Ngultrum).\n\nWhat was the total contribution of the top ten agencies in 2006-07?" },
    { ...mcq(2), section: "Data Interpretation", stem: "Sonam’s scores in 4 mock tests:\n\n| Mock | English | Dzongkha | Data Interpretation |\n|---|---|---|---|\n| 1 | 23 | 12 | 19 |\n| 2 | 24 | 17 | 18 |\n| 3 | 22 | 11 | 23 |\n| 4 | 20 | 21 | 22 |\n\nIn which mock test did Sonam score the highest total?" },
    { ...mcq(3), section: "Dzongkha", image_url: "/papers/pe-2010/dz-q41.webp", stem: "Read the question in the picture (from the original paper) and choose the correct answer: ཀ, ཁ, ག or ང.", options: ["ཀ", "ཁ", "ག", "ང"].map((body, i) => ({ id: `20000000-0000-4000-8000-${String(i).padStart(12, "0")}`, label: "ABCD"[i], body })) },
  ];
  // ?sample=passage: three questions sharing one reading passage (shown once, then folded).
  const passageText = "Read the passage and answer the question.\n\nMost of us know the feeling of leaving an important task for later. We tidy the desk, answer messages and make another cup of tea, yet the report stays unwritten. Researchers suggest people delay not because they dislike work, but because the task stirs an unpleasant feeling.\n\n";
  const passage: PaperQuestion[] = ["According to the passage, why do people delay tasks?", "Which word best describes the tone of the passage?", "Which title best suits the passage?"]
    .map((q, i) => ({ ...mcq(i + 1), section: "English", passage_group: "preview-passage", stem: passageText + q }));
  // ?sample=bed (with stage=ME): real B.Ed. 2025 questions - Paper III chart and figure MCQs, a Paper II grammar MCQ,
  // a Paper II comprehension question on its passage, and a Paper I Dzongkha essay.
  const bedPassage = "Read the passage below and answer the questions that follow.\n\nBhutaneseness: Preserving Identity in a Rapidly Changing World\n\nIn today’s fast-paced global landscape, where cultures blend and identities often blur, the concept of Bhutaneseness stands as a vital beacon of national identity and cultural preservation. Bhutaneseness is more than just being from Bhutan; it is the essence of what it means to live, think, and belong as a Bhutanese in the 21st century. As the world races toward modernization and globalization, the urgency to understand, protect, and nurture Bhutaneseness has never been greater. This essay explores the meaning of Bhutaneseness, its significance in contemporary times, and why it is crucial for Bhutan’s youth and graduates to uphold this identity amid global pressures.\n\nBhutaneseness refers to the collective identity, values, traditions, and worldview that define the Bhutanese people. Rooted deeply in the country’s history, geography, and spiritual heritage, it is a complex interplay of cultural pride, social norms, and philosophical outlooks. At its core, Bhutaneseness embodies the principles of compassion, community, and harmony with nature— values that have been nurtured by Bhutan’s Buddhist traditions and the guiding philosophy of Gross National Happiness (GNH).\n\nUnlike many nations that measure progress solely by economic growth, Bhutan has prioritized holistic well-being and cultural preservation. This unique approach has shaped Bhutaneseness into a living, breathing identity that balances tradition and modernity. It is reflected in the everyday lives of Bhutanese people—from the national dress (gho and kira) worn with pride, to the celebration of festivals like Tshechu, which reinforce communal bonds and spiritual values.";
  const bed: PaperQuestion[] = [
    { ...mcq(1), section: "Paper III: Basic data interpretation", image_url: "/papers/me/bed3-2025-study-hours.png", stem: "The plot shows average study hours per week (x-axis) against average academic performance (y-axis) across 15 schools. Which school appears to perform better than expected based on study hours?", options: ["School C", "School D", "School J", "School O"].map((body, i) => ({ id: `30000000-0000-4000-8000-${String(1 * 10 + i).padStart(12, "0")}`, label: "ABCD"[i], body })) },
    { ...mcq(2), section: "Paper III: Problem solving", image_url: "/papers/me/bed3-2025-triangle.png", stem: "In the figure, the area of triangle ABC is 20 cm², BD = 4 cm is the height, and AD = BD. What is the length of DC?", options: ["2 cm", "2√2 cm", "4√2 cm", "6 cm"].map((body, i) => ({ id: `30000000-0000-4000-8000-${String(2 * 10 + i).padStart(12, "0")}`, label: "ABCD"[i], body })) },
    { ...mcq(3), section: "Paper II: Grammar and language", stem: "He ______ just ______ home when it began to rain.", options: ["has, left", "had, left", "had, leave", "have, leave"].map((body, i) => ({ id: `30000000-0000-4000-8000-${String(3 * 10 + i).padStart(12, "0")}`, label: "ABCD"[i], body })) },
    { ...written(4), number: 4, section: "Paper II: Comprehension", type: "passage", marks: 5, word_limit: null, passage_group: "bed-passage", stem: bedPassage + "\n\n" + "Question II. 1. In what ways can teachers balance teaching global knowledge alongside Bhutanese cultural preservation to prepare students for a globalized world? (5 marks)" },
    { ...written(5), number: 5, section: "Paper I: Essay (འབྲི་རྩོམ།)", type: "essay", marks: 30, word_limit: null, stem: "འོག་ལུ་བཀོད་ཡོད་པའི་ འབྲི་རྩོམ་ དོན་ཚན་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༦༠༠ གི་ནང་འཁོད་བྲིས། (སྐུགས་ ༣༠)\n(བརྗོད་དོན་ལུ་སྐུགས་ ༡༧། ཚིག་སྦྱོར་ལུ་སྐུགས་ ༨། འབྲི་བཀོད་ལུ་སྐུགས་ ༥།)\n\nརོགས་ཁ་མ་ཤེས་རང་ཁ་འབྱང་། ཟེར་བའི་དཔེ་གཏམ་ལུ་གཞི་བཞག་སྟེ་ ང་བཅས་འབྲུགཔ་རྒན་གཞོན་བར་མ་ག་ར་གིས་ གཞུང་སྐད་རྫོང་ཁ་ལུ་ བརྩི་མཐོང་བསྐྱེད་དེ་ ལག་ལེན་འཐབ་པ་ཅིན་ ཕན་ཐོགས་ཡོད་པའི་ཁུངས་དང་ གལ་སྲིད་ལག་ལེན་མ་འཐབ་པ་ཅིན་ གནོད་པ་ག་ཅི་བཟུམ་འོང་ནི་ཨིན་ན? བཤད་པ་རྒྱས་སྤྲོས་བྲིས།" },
  ];
  const questions = sp.sample === "bed" ? bed : sp.sample === "passage" ? passage : sp.sample === "past" ? past : stage === "PE" ? Array.from({ length: 10 }, (_, i) => mcq(i + 1)) : [written(1), written(2)];
  const paper: AttemptPaper = {
    attempt: {
      id: "99999999-0000-4000-8000-000000000001",
      status: "in_progress",
      started_at: now.toISOString(),
      deadline_at: new Date(now.getTime() + seconds * 1000).toISOString(),
      server_now: now.toISOString(),
    },
    exam: { id: "x", title: stage === "PE" ? "PE preview examination" : "ME preview paper", stage, kind: "sample", instructions: null, duration_minutes: Math.ceil(seconds / 60), omr_mode: stage === "PE" && sp.omr !== "0", negative_mark_per_wrong: 0 },
    questions,
    answers: [],
  };
  if (sp.sample === "choose") {
    // "Answer any N" question paper (ME Paper III style): Part A any 2 of 4, Part B any 3 of 5 (shortened here to 2 + 2).
    let id = 100;
    const part = (grp: string, order: number, any: number, total: number, title: string, stem: string, marks: number): PaperQuestion => ({
      exam_question_id: `00000000-0000-4000-8000-${String(++id).padStart(12, "0")}`, number: id, marks, type: order === 1 ? "long_answer" : "analytical",
      section: `${title} (answer any ${any} of the ${total} questions)`, stem, word_limit: null, options: [], choice_group: grp, choose_any: any, section_order: order,
    });
    const A = "Part A: Bhutan and its socio-political institutions", B = "Part B: Bhutan and its socio-economic development since 1961";
    const gst = "The National Assembly adopted the Goods and Services Tax (Amendment) Bill, reducing the GST rate to 5 percent on taxable goods and services.";
    const choose: AttemptPaper = {
      ...paper,
      attempt: { ...paper.attempt, deadline_at: new Date(now.getTime() + 195 * 60_000).toISOString() },
      exam: { ...paper.exam, title: "Paper III mock: Bhutan and its institutions and development", stage: "ME", kind: "mock", reading_minutes: 15, omr_mode: false },
      questions: [
        part("a1", 1, 2, 4, A, "a) How would you present the distinct and visionary features of Bhutan's Constitution at an international seminar? (10 marks)", 10),
        part("a1", 1, 2, 4, A, "b) Analyse how the purpose and significance of dzongs differ across the pre-Zhabdrung era, the Zhabdrung era and the modern period. (10 marks)", 10),
        part("a2", 1, 2, 4, A, "a) Express three Kidu initiatives undertaken by His Majesty The Druk Gyalpo and discuss their benefits. (10 marks)", 10),
        part("a2", 1, 2, 4, A, "b) What roles can you play as a citizen to promote Bhutan's cultural values, language and traditions? (10 marks)", 10),
        part("a3", 1, 2, 4, A, "a) Discuss the five ancient names attributed to Bhutan. (10 marks)", 10),
        part("a4", 1, 2, 4, A, "a) Explain the significance of the 2007 revision of the Bhutan-India Friendship Treaty. (10 marks)", 10),
        part("b1", 2, 3, 5, B, `${gst}\n\na) How might the reduction of GST to 5 percent affect government revenue and consumer prices? (10 marks)`, 10),
        part("b1", 2, 3, 5, B, `${gst}\n\nb) To what extent can this reform support sustainable growth and social equity? (10 marks)`, 10),
        part("b2", 2, 3, 5, B, "a) Why is raising the RNR sector's contribution to GDP important for Bhutan's self-reliance? (5 marks)", 5),
        part("b3", 2, 3, 5, B, "a) What are the possible reasons behind the increasing migration of Bhutanese workers? (5 marks)", 5),
        part("b4", 2, 3, 5, B, "a) What are the possible causes of declining fertility in Bhutan? (6 marks)", 6),
        part("b5", 2, 3, 5, B, "a) What do you understand by the Economic Stimulus Plan? (7 marks)", 7),
      ],
    };
    return <ChoosePaper paper={choose} changing={false} />;
  }
  return <DevExamHarness paper={paper} failSaves={failSaves} untimed={sp.untimed === "1"} />;
}

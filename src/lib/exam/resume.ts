/**
 * Where to reopen an unfinished test (founder, 20 Nov 2026: "Continue where you left off" must open exactly
 * where the student stopped). The question last open on this device wins; on another device, the first
 * question not yet answered; if everything is answered, the last question.
 */
export function resumeIndex(
  saved: number | null,
  questionIds: string[],
  answered: (id: string) => boolean,
): number {
  if (!questionIds.length) return 0;
  if (saved !== null && Number.isInteger(saved) && saved >= 0 && saved < questionIds.length) return saved;
  const first = questionIds.findIndex((id) => !answered(id));
  return first === -1 ? questionIds.length - 1 : first;
}

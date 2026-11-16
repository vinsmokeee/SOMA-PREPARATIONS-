import { z } from "zod";

const int = (min: number, max: number) => z.coerce.number().int().min(min).max(max);
export const trainingConfigSchema = z.object({
  cycle_days: int(7, 120),
  practice_questions: int(5, 50),
  revision_questions: int(0, 30),
  weak_questions: int(0, 30),
  weekly_test_questions: int(5, 100),
  weekly_test_minutes: int(5, 180),
  fortnight_test_questions: int(5, 100),
  fortnight_test_minutes: int(5, 180),
  mock_questions: int(10, 200),
  mock_minutes: int(10, 300),
  readiness_days: int(0, 60),
  weekly_goal_questions: int(10, 1000),
});

import { z } from "zod";

export const DZONGKHAGS = [
  "Bumthang", "Chhukha", "Dagana", "Gasa", "Haa", "Lhuentse", "Mongar", "Paro", "Pemagatshel", "Punakha",
  "Samdrup Jongkhar", "Samtse", "Sarpang", "Thimphu", "Trashigang", "Trashiyangtse", "Trongsa", "Tsirang",
  "Wangdue Phodrang", "Zhemgang",
] as const;

const optional = (schema: z.ZodString) =>
  z.preprocess((v) => (typeof v === "string" && v.trim() === "" ? null : v), schema.nullable());

export const profileSchema = z.object({
  fullName: z.string().trim().min(2, "Enter your full name.").max(120, "Name is too long."),
  phone: optional(z.string().trim().regex(/^[0-9+ ()-]{6,20}$/, "Enter a valid phone number.")),
  dzongkhag: optional(z.string().refine((v) => (DZONGKHAGS as readonly string[]).includes(v), "Choose a dzongkhag from the list.")),
  targetCycle: optional(z.string().trim().max(40)),
});

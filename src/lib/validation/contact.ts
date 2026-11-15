import { z } from "zod";

export const CONTACT_TOPICS = {
  general: "General question",
  payment: "Payments and access",
  technical: "Technical problem",
  content: "Report a content error",
  partnership: "Partnership or contributor enquiry",
} as const;

export const contactSchema = z.object({
  name: z.string().trim().min(1, "Please enter your name.").max(120, "Name is too long."),
  email: z.string().trim().toLowerCase().pipe(z.email("Please enter a valid email address.")).refine((v) => v.length <= 200, "Email is too long."),
  topic: z.enum(Object.keys(CONTACT_TOPICS) as [keyof typeof CONTACT_TOPICS, ...(keyof typeof CONTACT_TOPICS)[]]),
  message: z.string().trim().min(10, "Please write at least 10 characters.").max(5000, "Message is too long (5,000 characters maximum)."),
});

export type ContactInput = z.infer<typeof contactSchema>;

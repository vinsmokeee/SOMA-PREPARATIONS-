-- Founder, 22 Nov 2026: "I've checked all year papers and I couldn't find Bio Science" as a Paper III. RCSC sets no
-- separate Bio Science Subject Specialisation paper, so "Bio Science" is no longer offered as a Paper III choice
-- (switched off, not deleted; no student had chosen it and it had no questions or pattern). The Bio Science
-- subject group for Technical Paper II (Agriculture, Forestry, Food Science ...) is unchanged.
update public.specialisations set is_active = false where code = 'bio-science';

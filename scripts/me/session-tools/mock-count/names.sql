select 'spec' k, s.id::text id, s.name, s.subject_group_id::text grp from public.specialisations s
union all select 'group', g.id::text, g.name, null from public.subject_groups g;

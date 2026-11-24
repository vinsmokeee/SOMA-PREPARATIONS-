select version, name from supabase_migrations.schema_migrations where name='pe_always_omr' union all select tgname, 'trigger' from pg_trigger where tgname='exams_pe_always_omr';

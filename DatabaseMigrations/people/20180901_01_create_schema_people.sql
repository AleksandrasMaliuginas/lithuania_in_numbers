BEGIN;

DROP SCHEMA IF EXISTS people CASCADE;

CREATE SCHEMA people;

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_01_create_schema_people', 'people', now());

COMMIT;

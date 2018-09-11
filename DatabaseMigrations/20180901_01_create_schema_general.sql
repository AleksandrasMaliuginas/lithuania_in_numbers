BEGIN;

DROP SCHEMA IF EXISTS general CASCADE;

CREATE SCHEMA general;

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_01_create_schema_general', 'general', now());

COMMIT;

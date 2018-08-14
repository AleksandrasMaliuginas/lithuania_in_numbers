BEGIN;

-- CREATE TEMP TABLE import
-- (
--   municipality_id SMALLINT,
--   age_period_id INT,
--   total INT,
--   men INT,
--   women INT
-- ) ON COMMIT DROP;
--
-- COPY pg_temp.import FROM :path DELIMITER ';' CSV;
--
--
-- TRUNCATE TABLE people."Population";
--
-- INSERT INTO people."Population"
-- (municipality_id, age_period_id, total, men, women)
--
-- SELECT csv.municipality_id, csv.age_period_id, csv.total, csv.men, csv.women
-- FROM pg_temp.import AS csv;

COPY people."Population"(municipality_id, age_period_id, total, men, women)
FROM :path DELIMITER ';' CSV;

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180801_07_import_Population', 'people', now());

COMMIT;

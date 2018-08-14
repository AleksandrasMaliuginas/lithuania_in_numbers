BEGIN;

-- CREATE TEMP TABLE import
-- (
--   municipality_id SMALLINT,
--   year INT,
--   total INT,
--   rural INT,
--   urban INT
-- ) ON COMMIT DROP;
--
-- COPY pg_temp.import FROM :path DELIMITER ';' CSV;
--
--
-- TRUNCATE TABLE people."PlaceOfResidence";
--
-- INSERT INTO people."PlaceOfResidence"
-- (municipality_id, year, total, rural, urban)
--
-- SELECT csv.municipality_id, csv.year, csv.total, csv.rural, csv.urban
-- FROM pg_temp.import AS csv;

COPY people."PlaceOfResidence"(municipality_id, year_id, total, rural, urban)
FROM :path DELIMITER ';' CSV;

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180801_06_import_PlaceOfResidence', 'people', now());

COMMIT;

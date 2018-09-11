BEGIN;

-- create temporary table for csv file data
CREATE TEMP TABLE import (
    year INT,
    age INT
) ON COMMIT DROP;
-- copy data from csv file to temporary table
COPY pg_temp.import FROM :path DELIMITER ';' CSV HEADER;

TRUNCATE TABLE people."AgePeriods" CASCADE;

-- In age column value:
-- -1 means total (all ages)
-- 85 means age 85 and more (85, 86, 87 etc.)

INSERT INTO people."AgePeriods"
(year_id, age)
  SELECT y.id, i.age
  FROM pg_temp.import AS i
  INNER JOIN general."Years" AS y
    ON i.year = y.year;

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_06_import_AgePeriods', 'people', now());

COMMIT;

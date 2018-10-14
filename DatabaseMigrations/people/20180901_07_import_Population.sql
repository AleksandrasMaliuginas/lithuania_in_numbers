BEGIN;

-- create temporary table for csv file data
CREATE TEMP TABLE import (
  territory VARCHAR(100) NOT NULL,
  year INT,
  age INT,
  total INT,
  men INT,
  women INT
) ON COMMIT DROP;
-- copy data from csv file to temporary table
COPY pg_temp.import FROM :path DELIMITER ';' CSV HEADER;

TRUNCATE TABLE people."Population" CASCADE;

INSERT INTO people."Population"
(territory_id, age_period_id, total, men, women)
  SELECT t.id, ap.id, i.total, i.men, i.women
  FROM pg_temp.import AS i
  INNER JOIN general."Territories" AS t
    ON i.territory = t.title
  INNER JOIN general."Years" AS y
    ON i.year = y.year
  INNER JOIN people."AgePeriods" AS ap
    ON y.id = ap.year_id AND i.age = ap.age;

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_07_import_Population', 'people', now());

COMMIT;

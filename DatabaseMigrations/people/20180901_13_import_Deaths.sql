BEGIN;

-- create temporary table for csv file data
CREATE TEMP TABLE import (
  territory VARCHAR(100) NOT NULL,
  year INT,
  total INT,
  infant INT
) ON COMMIT DROP;
-- copy data from csv file to temporary table
COPY pg_temp.import FROM :path DELIMITER ';' CSV HEADER;

TRUNCATE TABLE people."Deaths" CASCADE;

INSERT INTO people."Deaths"
(territory_id, year_id, total, infant)
  SELECT t.id, y.id, i.total, i.infant
  FROM pg_temp.import AS i
  INNER JOIN general."Territories" AS t
    ON i.territory = t.title
  INNER JOIN general."Years" AS y
    ON i.year = y.year;

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_13_import_Deaths', 'people', now());

COMMIT;

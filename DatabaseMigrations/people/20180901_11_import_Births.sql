BEGIN;

-- create temporary table for csv file data
CREATE TEMP TABLE import (
  territory VARCHAR(100) NOT NULL,
  year INT,
  total INT,
  men INT,
  women INT
) ON COMMIT DROP;
-- copy data from csv file to temporary table
COPY pg_temp.import FROM :path DELIMITER ';' CSV HEADER;

TRUNCATE TABLE people."Births" CASCADE;

INSERT INTO people."Births"
(territory_id, year_id, total)
  SELECT t.id, y.id, i.total
  FROM pg_temp.import AS i
  INNER JOIN general."Territories" AS t
    ON i.territory = t.title
  INNER JOIN general."Years" AS y
    ON i.year = y.year;

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_11_import_Births', 'people', now());

COMMIT;

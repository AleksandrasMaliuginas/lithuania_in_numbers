BEGIN;

-- create temporary table for csv file data
CREATE TEMP TABLE import (
  territory VARCHAR(100) NOT NULL,
  year INT,
  total INT,
  urban INT,
  rural INT
) ON COMMIT DROP;
-- copy data from csv file to temporary table
COPY pg_temp.import FROM :path DELIMITER ';' CSV HEADER;

TRUNCATE TABLE people."PlaceOfResidence" CASCADE;

INSERT INTO people."PlaceOfResidence"
(territory_id, year_id, total, rural, urban)
  SELECT t.id, y.id, i.total, i.rural, i.urban
  FROM pg_temp.import AS i
  INNER JOIN general."Territories" AS t
    ON i.territory = t.title
  INNER JOIN general."Years" AS y
    ON i.year = y.year;

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_07_import_PlaceOfResidence', 'people', now());

COMMIT;

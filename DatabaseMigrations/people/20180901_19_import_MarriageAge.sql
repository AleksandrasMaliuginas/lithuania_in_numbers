BEGIN;

-- create temporary table for csv file data
CREATE TEMP TABLE import (
  territory VARCHAR(100) NOT NULL,
  year INT,
  men FLOAT,
  women FLOAT,
  -- First marriage
  men_first FLOAT,
  women_first FLOAT
) ON COMMIT DROP;
-- copy data from csv file to temporary table
COPY pg_temp.import FROM :path DELIMITER ';' CSV HEADER;

TRUNCATE TABLE people."MarriageAge" CASCADE;

INSERT INTO people."MarriageAge"
(territory_id, year_id, men, women, men_first, women_first)
  SELECT t.id, y.id, i.men, i.women, i.men_first, i.women_first
  FROM pg_temp.import AS i
  INNER JOIN general."Territories" AS t
    ON i.territory = t.title
  INNER JOIN general."Years" AS y
    ON i.year = y.year;

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_19_import_MarriageAge', 'people', now());

COMMIT;

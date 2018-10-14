BEGIN;

DROP TABLE IF EXISTS people."Deaths" CASCADE;

CREATE TABLE people."Deaths" (
	id BIGSERIAL NOT NULL,
	territory_id INT NOT NULL,
	year_id INT NOT NULL,
	total INT DEFAULT(NULL),
	-- infant deaths at first year of life
	infant INT DEFAULT(NULL),

	CONSTRAINT "pk_people_Deaths" PRIMARY KEY(id),
	CONSTRAINT "uq_people_Deaths__TerritoryId_YearId" UNIQUE(territory_id, year_id),
	CONSTRAINT "fk_people_Deaths__general_Territories__TerritoryId" FOREIGN KEY(territory_id)
		REFERENCES general."Territories"(id),
	CONSTRAINT "fk_people_Deaths__people_Years__YearId" FOREIGN KEY(year_id)
		REFERENCES general."Years"(id)
);

CREATE INDEX "index_people_Deaths__TerritoryId"
ON people."Deaths"(territory_id);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_12_create_Deaths', 'people', now());

COMMIT;

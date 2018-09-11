BEGIN;

DROP TABLE IF EXISTS people."PlaceOfResidence" CASCADE;

CREATE TABLE people."PlaceOfResidence" (
	id BIGSERIAL NOT NULL,
	territory_id INT NOT NULL,
	year_id SMALLINT NOT NULL,
	total INT DEFAULT(NULL),
	rural INT DEFAULT(NULL),
	urban INT DEFAULT(NULL),

	CONSTRAINT "pk_people_PlaceOfResidence" PRIMARY KEY(id),
	CONSTRAINT "uq_people_PlaceOfResidence__TerritoryId_Year" UNIQUE(territory_id, year_id),
	CONSTRAINT "fk_people_PlaceOfResidence__general_Territories" FOREIGN KEY(territory_id)
		REFERENCES general."Territories"(id),
	CONSTRAINT "fk_people_PlaceOfResidence__general_Years" FOREIGN KEY(year_id)
		REFERENCES general."Years"(id)
);

CREATE INDEX "index_people_PlaceOfResidence__TerritoryId"
ON people."PlaceOfResidence"(territory_id);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_03_create_PlaceOfResidence', 'people', now());

COMMIT;

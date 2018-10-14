BEGIN;

DROP TABLE IF EXISTS people."Births" CASCADE;

CREATE TABLE people."Births" (
	id BIGSERIAL NOT NULL,
	territory_id INT NOT NULL,
	year_id INT NOT NULL,
	total INT DEFAULT(NULL),
	men INT DEFAULT(NULL),
	women INT DEFAULT(NULL),

	CONSTRAINT "pk_people_Births" PRIMARY KEY(id),
	CONSTRAINT "uq_people_Births__TerritoryId_YearId" UNIQUE(territory_id, year_id),
	CONSTRAINT "fk_people_Births__general_Territories__TerritoryId" FOREIGN KEY(territory_id)
		REFERENCES general."Territories"(id),
	CONSTRAINT "fk_people_Births__people_Years__YearId" FOREIGN KEY(year_id)
		REFERENCES general."Years"(id)
);

CREATE INDEX "index_people_Births__TerritoryId"
ON people."Births"(territory_id);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_10_create_Births', 'people', now());

COMMIT;

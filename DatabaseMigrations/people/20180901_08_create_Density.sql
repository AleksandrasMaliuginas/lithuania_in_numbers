BEGIN;

DROP TABLE IF EXISTS people."Density" CASCADE;

CREATE TABLE people."Density" (
	id BIGSERIAL NOT NULL,
	territory_id INT NOT NULL,
	year_id INT NOT NULL,
	total FLOAT DEFAULT(NULL),

	CONSTRAINT "pk_people_Density" PRIMARY KEY(id),
	CONSTRAINT "uq_people_Density__TerritoryId_YearId" UNIQUE(territory_id, year_id),
	CONSTRAINT "fk_people_Density__general_Territories__TerritoryId" FOREIGN KEY(territory_id)
		REFERENCES general."Territories"(id),
	CONSTRAINT "fk_people_Density__people_Years__YearId" FOREIGN KEY(year_id)
		REFERENCES general."Years"(id)
);

CREATE INDEX "index_people_Density__TerritoryId"
ON people."Density"(territory_id);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_08_create_Density', 'people', now());

COMMIT;

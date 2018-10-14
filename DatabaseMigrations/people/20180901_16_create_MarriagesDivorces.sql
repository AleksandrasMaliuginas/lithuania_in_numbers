BEGIN;

DROP TABLE IF EXISTS people."MarriagesDivorces" CASCADE;

CREATE TABLE people."MarriagesDivorces" (
	id BIGSERIAL NOT NULL,
	territory_id INT NOT NULL,
	year_id INT NOT NULL,
	marriages INT DEFAULT(NULL),
	divorces INT DEFAULT(NULL),

	CONSTRAINT "pk_people_MarriagesDivorces" PRIMARY KEY(id),
	CONSTRAINT "uq_people_MarriagesDivorces__TerritoryId_YearId" UNIQUE(territory_id, year_id),
	CONSTRAINT "fk_people_MarriagesDivorces__general_Territories__TerritoryId" FOREIGN KEY(territory_id)
		REFERENCES general."Territories"(id),
	CONSTRAINT "fk_people_MarriagesDivorces__people_Years__YearId" FOREIGN KEY(year_id)
		REFERENCES general."Years"(id)
);

CREATE INDEX "index_people_MarriagesDivorces__TerritoryId"
ON people."MarriagesDivorces"(territory_id);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_16_create_MarriagesDivorces', 'people', now());

COMMIT;

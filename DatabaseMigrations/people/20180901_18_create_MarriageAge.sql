BEGIN;

DROP TABLE IF EXISTS people."MarriageAge" CASCADE;

CREATE TABLE people."MarriageAge" (
	id BIGSERIAL NOT NULL,
	territory_id INT NOT NULL,
	year_id INT NOT NULL,
	men FLOAT DEFAULT(NULL),
	women FLOAT DEFAULT(NULL),
	-- First marriage
	men_first FLOAT DEFAULT(NULL),
	women_first FLOAT DEFAULT(NULL),

	CONSTRAINT "pk_people_MarriageAge" PRIMARY KEY(id),
	CONSTRAINT "uq_people_MarriageAge__TerritoryId_YearId" UNIQUE(territory_id, year_id),
	CONSTRAINT "fk_people_MarriageAge__general_Territories__TerritoryId" FOREIGN KEY(territory_id)
		REFERENCES general."Territories"(id),
	CONSTRAINT "fk_people_MarriageAge__people_Years__YearId" FOREIGN KEY(year_id)
		REFERENCES general."Years"(id)
);

CREATE INDEX "index_people_MarriageAge__TerritoryId"
ON people."MarriageAge"(territory_id);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_18_create_MarriageAge', 'people', now());

COMMIT;

BEGIN;

DROP TABLE IF EXISTS people."LifeExpectancy" CASCADE;

CREATE TABLE people."LifeExpectancy" (
	id BIGSERIAL NOT NULL,
	territory_id INT NOT NULL,
	year_id INT NOT NULL,
	total FLOAT DEFAULT(NULL),
	men FLOAT DEFAULT(NULL),
	women FLOAT DEFAULT(NULL),

	CONSTRAINT "pk_people_LifeExpectancy" PRIMARY KEY(id),
	CONSTRAINT "uq_people_LifeExpectancy__TerritoryId_YearId" UNIQUE(territory_id, year_id),
	CONSTRAINT "fk_people_LifeExpectancy__general_Territories__TerritoryId" FOREIGN KEY(territory_id)
		REFERENCES general."Territories"(id),
	CONSTRAINT "fk_people_LifeExpectancy__people_Years__YearId" FOREIGN KEY(year_id)
		REFERENCES general."Years"(id)
);

CREATE INDEX "index_people_LifeExpectancy__TerritoryId"
ON people."LifeExpectancy"(territory_id);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_14_create_LifeExpectancy', 'people', now());

COMMIT;

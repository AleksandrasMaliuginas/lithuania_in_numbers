BEGIN;

DROP TABLE IF EXISTS people."Population" CASCADE;

CREATE TABLE people."Population" (
	id BIGSERIAL NOT NULL,
	territory_id INT NOT NULL,
	age_period_id INT NOT NULL,
	total INT DEFAULT(NULL),
	men INT DEFAULT(NULL),
	women INT DEFAULT(NULL),

	CONSTRAINT "pk_people_Population" PRIMARY KEY(id),
	CONSTRAINT "uq_people_Population__TerritoryId_AgePeriodId" UNIQUE(territory_id, age_period_id),
	CONSTRAINT "fk_people_Population__general_Territories__TerritoryId" FOREIGN KEY(territory_id)
		REFERENCES general."Territories"(id),
	CONSTRAINT "fk_people_Population__people_AgePeriods__AgePeriodId" FOREIGN KEY(age_period_id)
		REFERENCES people."AgePeriods"(id)
);

CREATE INDEX "index_people_Population__TerritoryId"
ON people."Population"(territory_id);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_06_create_Population', 'people', now());

COMMIT;

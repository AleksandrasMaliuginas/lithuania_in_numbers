BEGIN;

DROP TABLE IF EXISTS people."Population" CASCADE;

CREATE TABLE people."Population" (
	id BIGSERIAL NOT NULL,
	municipality_id INT NOT NULL,
	age_period_id INT NOT NULL,
	total INT DEFAULT(NULL),
	men INT DEFAULT(NULL),
	women INT DEFAULT(NULL),

	CONSTRAINT "pk_people_Population" PRIMARY KEY(id),
	CONSTRAINT "uq_people_Population__MunicipalityId_AgePeriodId" UNIQUE(municipality_id, age_period_id),
	CONSTRAINT "fk_people_Population__general_Municipalities__MunicipalityId" FOREIGN KEY(municipality_id)
		REFERENCES general."Municipalities"(id),
	CONSTRAINT "fk_people_Population__people_AgePeriods__AgePeriodId" FOREIGN KEY(age_period_id)
		REFERENCES people."AgePeriods"(id)
);

CREATE INDEX "index_people_Population__MunicipalityId"
ON people."Population"(municipality_id);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180801_04_create_Population', 'people', now());

COMMIT;

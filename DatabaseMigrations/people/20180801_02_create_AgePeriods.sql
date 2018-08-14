BEGIN;

DROP TABLE IF EXISTS people."AgePeriods" CASCADE;

CREATE TABLE people."AgePeriods" (
	id SERIAL NOT NULL,
	year_id SMALLINT NOT NULL,
	age SMALLINT NOT NULL CHECK (age >= -1 AND age <= 150),

	CONSTRAINT "pk_people_AgePeriods" PRIMARY KEY(id),
	CONSTRAINT "uq_people_AgePeriods__year_age" UNIQUE(year_id, age),
	CONSTRAINT "fk_people_AgePeriods__general_Years" FOREIGN KEY(year_id)
		REFERENCES general."Years"(id)
);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180801_02_create_AgePeriods', 'people', now());

COMMIT;

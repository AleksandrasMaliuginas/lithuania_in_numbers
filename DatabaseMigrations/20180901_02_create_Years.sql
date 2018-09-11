BEGIN;

DROP TABLE IF EXISTS general."Years" CASCADE;

CREATE TABLE general."Years" (
	id SERIAL NOT NULL,
	year SMALLINT NOT NULL,

	CONSTRAINT "pk_general_Years" PRIMARY KEY(id),
	CONSTRAINT "uq_general_Years__year" UNIQUE(year)
);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_02_create_Years', 'general', now());

COMMIT;

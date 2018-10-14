BEGIN;

DROP TABLE IF EXISTS general."Territories" CASCADE;

CREATE TABLE general."Territories" (
	id SERIAL NOT NULL,
	title VARCHAR(100) NOT NULL,
	county INT,
	area INT NOT NULL,

	CONSTRAINT "pk_general_Territories" PRIMARY KEY(id),
	CONSTRAINT "uq_general_Territories__title" UNIQUE(title)
);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_04_create_Territories', 'general', now());

COMMIT;

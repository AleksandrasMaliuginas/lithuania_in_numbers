BEGIN;

DROP TABLE IF EXISTS general."Municipalities" CASCADE;

CREATE TABLE general."Municipalities" (
	id SERIAL NOT NULL,
	title VARCHAR(100) NOT NULL,
	county_id INT,
	area INT NOT NULL,

	CONSTRAINT "pk_general_Municipalities" PRIMARY KEY(id),
	CONSTRAINT "uq_general_Municipalities__title" UNIQUE(title)
);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180801_03_create_Municipalities', 'general', now());

COMMIT;

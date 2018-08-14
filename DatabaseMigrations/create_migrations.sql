BEGIN;

DROP TABLE IF EXISTS public.migrations CASCADE;

CREATE TABLE public.migrations (
  id SERIAL NOT NULL,
  label VARCHAR(200) NOT NULL,
  schema VARCHAR(100) NOT NULL,
  migrate_date TIMESTAMP NOT NULL,

  CONSTRAINT pk__public_migrations PRIMARY KEY(id),
  CONSTRAINT uq__public_migrations__label UNIQUE(label)
);

COMMIT;

BEGIN;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP SCHEMA IF EXISTS sdg CASCADE;

CREATE SCHEMA sdg;

CREATE TABLE sdg.resource_topic (
      id    SERIAL PRIMARY KEY,
      topic LTREE NOT NULL,
      label TEXT NOT NULL
);

CREATE TABLE sdg.region (
      m49       CHARACTER(3) PRIMARY KEY,
      hierarchy LTREE UNIQUE NOT NULL,
      name      TEXT NOT NULL
);

CREATE TABLE sdg.country (
      iso_alpha3 CHARACTER(3) PRIMARY KEY,
      region_m49 CHARACTER(3) REFERENCES sdg.region (m49),
      name       TEXT NOT NULL
);

CREATE TABLE sdg.language (
      ietf_tag TEXT PRIMARY KEY,
      name     TEXT NOT NULL,
      label    TEXT NOT NULL
);

CREATE TABLE sdg.resource
(
      id             SERIAL PRIMARY KEY,
      uuid           UUID UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
      country_id     CHARACTER(3) REFERENCES sdg.country (iso_alpha3),
      title          TEXT NOT NULL,
      organization   TEXT,
      url            TEXT NOT NULL,
      date_published TIMESTAMPTZ,
      image_url      TEXT,
      description    TEXT,
      type           TEXT,
      tags           TEXT[],
      publish        BOOLEAN,
      created        TIMESTAMPTZ NOT NULL DEFAULT now(),
      last_modified  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE sdg.topic_resources (
      topic_id    INTEGER REFERENCES sdg.resource_topic (id),
      resource_id INTEGER REFERENCES sdg.resource (id)
);

CREATE TABLE sdg.resource_languages (
      resource_id INTEGER REFERENCES sdg.resource (id),
      language_ietf_tag    TEXT REFERENCES sdg.language (ietf_tag)
);

COMMIT;

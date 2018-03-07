BEGIN;

/* Provides UUID generation functions. */
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

/* Clear all pre-existing schema. */
DROP TRIGGER IF EXISTS resource_tsv_update ON sdg.resource CASCADE;
DROP FUNCTION IF EXISTS resource_tsv_update_trigger() CASCADE;
DROP SCHEMA IF EXISTS sdg CASCADE;

CREATE SCHEMA sdg;

CREATE TABLE sdg.topic (
    id SERIAL PRIMARY KEY,
    topic TEXT UNIQUE NOT NULL,
    path LTREE UNIQUE NOT NULL,
    label TEXT NOT NULL,
    ordering LTREE UNIQUE NOT NULL
);

CREATE TABLE sdg.region (
    m49 CHARACTER(3) PRIMARY KEY,
    path LTREE UNIQUE NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE sdg.country (
    iso_alpha3 CHARACTER(3) PRIMARY KEY,
    region_id CHARACTER(3) REFERENCES sdg.region (m49) ON UPDATE CASCADE,
    income_group TEXT CHECK (income_group IN ('High', 'Upper-middle', 'Lower-middle', 'Low')),
    name TEXT NOT NULL
);

CREATE TABLE sdg.language (
    ietf_tag TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    label TEXT NOT NULL
);

CREATE TABLE sdg.content_type (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE sdg.tag (
    uuid UUID PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE sdg.resource (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v1mc(),
    content_type_id INTEGER REFERENCES sdg.content_type (id) ON UPDATE CASCADE,
    country_id CHARACTER(3) REFERENCES sdg.country (iso_alpha3) ON UPDATE CASCADE,
    title TEXT NOT NULL,
    organization TEXT,
    url TEXT NOT NULL,
    date_published TIMESTAMPTZ,
    image_url TEXT,
    description TEXT,
    tags TEXT[],
    publish BOOLEAN DEFAULT FALSE,
    tsv TSVECTOR,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE sdg.submission_status (
    id SERIAL PRIMARY KEY,
    status TEXT NOT NULL
);

CREATE TABLE sdg.submission (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v1mc(),
    resource_id UUID REFERENCES sdg.resource (uuid) ON UPDATE CASCADE ON DELETE CASCADE,
    status_id INTEGER REFERENCES sdg.submission_status (id),
    submitter_country_id CHARACTER(3) REFERENCES sdg.country (iso_alpha3) ON UPDATE CASCADE,
    submitter_name TEXT,
    submitter_organization TEXT,
    submitter_title TEXT,
    submitter_email TEXT,
    submitter_city TEXT,
    tags TEXT[],
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE sdg.news (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v1mc(),
    title TEXT NOT NULL,
    organization TEXT,
    url TEXT,
    description TEXT,
    tags TEXT[],
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE sdg.event (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v1mc(),
    title TEXT NOT NULL,
    url TEXT,
    description TEXT,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ,
    locations TEXT[],
    tags TEXT[],
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

/**
 * Create associative tables.
 */
CREATE TABLE sdg.resource_topics (
    resource_id UUID REFERENCES sdg.resource (uuid) ON UPDATE CASCADE ON DELETE CASCADE,
    topic_id INTEGER REFERENCES sdg.topic (id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (topic_id, resource_id)
);

CREATE TABLE sdg.resource_languages (
    resource_id UUID REFERENCES sdg.resource (uuid) ON UPDATE CASCADE ON DELETE CASCADE,
    language_id TEXT REFERENCES sdg.language (ietf_tag) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (resource_id, language_id)
);

CREATE TABLE sdg.resource_content_types (
    resource_id UUID REFERENCES sdg.resource (uuid) ON UPDATE CASCADE ON DELETE CASCADE,
    content_type_id INTEGER REFERENCES sdg.content_type (id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (resource_id, content_type_id)
);

CREATE TABLE sdg.resource_tags (
    resource_id UUID REFERENCES sdg.resource (uuid) ON UPDATE CASCADE ON DELETE CASCADE,
    tag_id UUID REFERENCES sdg.tag (uuid) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (resource_id, tag_id)
);

/* Create search index on resource text search field. */
CREATE INDEX resource_tsv_idx ON sdg.resource USING gin(tsv);

/* Create search index update function. */
CREATE FUNCTION resource_tsv_update_trigger() RETURNS trigger AS $$
BEGIN
  NEW.tsv :=
    setweight(to_tsvector('english', COALESCE(NEW.title,'')), 'A') ||
    setweight(to_tsvector('english', COALESCE(NEW.description,'')), 'B') ||
    setweight(to_tsvector('english', COALESCE(NEW.description,'')), 'C');
  RETURN NEW;
END
$$ LANGUAGE plpgsql;

/* Trigger search index (re)generation on resource row inserts or updates. */
CREATE TRIGGER resource_tsv_update BEFORE INSERT OR UPDATE ON sdg.resource FOR EACH ROW EXECUTE PROCEDURE resource_tsv_update_trigger();

COMMIT;
BEGIN;

/* Create singleton configuration table. */
CREATE TABLE IF NOT EXISTS sdg.db_settings (
    id INTEGER PRIMARY KEY DEFAULT 1,
    version INTEGER NOT NULL,
    CONSTRAINT singleton CHECK (id = 1)
);

INSERT INTO sdg.db_settings (version) VALUES (1);

COMMIT;

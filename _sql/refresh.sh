#!/bin/sh

cat schema_sdg.sql | heroku pg:psql --app sdg-prototype
cat data_region.sql | heroku pg:psql --app sdg-prototype
cat data_country.sql | heroku pg:psql --app sdg-prototype
cat data_language.sql | heroku pg:psql --app sdg-prototype
cat data_topic.sql | heroku pg:psql --app sdg-prototype

BEGIN;

DELETE FROM sdg.event;

INSERT INTO sdg.event (title, url, start_time, end_time, locations) VALUES
('GPSDD: Data for Development Festival', 'http://www.data4sdgs.org/news/data-development-festival', '2018-03-21 09:00:00+00', '2018-03-23 17:00:00+00', '{"Bristol, UK"}'),
('UN Seminar on Open Data & SDGs', 'https://unstats.un.org/sdgs/meetings/sdg-seminar-seoul-2017/', '2017-09-26 00:00:00+00', '2017-09-28 00:00:00+00', '{"Seoul, South Korea"}'),
('National Platforms for SDG Reporting - Identifying Best Practices and Solutions', 'https://unstats.un.org/unsd/capacity-building/meetings/National_Platforms_for_SDGs', '2018-01-22 00:00:00+00', '2018-01-24 00:00:00+00', '{"New York, USA"}');

COMMIT;
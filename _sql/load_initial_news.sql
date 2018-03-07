BEGIN;

INSERT INTO sdg.news (title, organization, url, description, tags) VALUES
('Sustainable Development Goals: progress and possibilities: November 2017',
'UK Office of National Statistics',
'https://www.ons.gov.uk/economy/environmentalaccounts/articles/sustainabledevelopmentgoalstakingstockprogressandpossibilities/november2017',
'Publication of the first report on progress made towards measuring the global Sustainable Development Goal indicators in the UK.',
'{UK,"open source","progress update"}'),
('Announcing the SDG National Reporting Initiative',
'Center for Open Data Enterprise',
'https://www.huffingtonpost.com/entry/59c04fb8e4b082fd4205b948',
'Launch of the SDG National Reporting Initiative to support government reporting on the SDGs for data-driven policymaking.',
'{"SDG National Reporting Initiative","open source"}');

COMMIT;
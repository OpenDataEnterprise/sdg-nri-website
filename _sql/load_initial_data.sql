BEGIN;

INSERT INTO sdg.topic (tag, path, label, ordering) VALUES
('sdg', 'sdg', 'Why SDG Reporting?', '1'),
('intro', 'sdg.intro', 'What are SDGs and the Data Revolution?', '1.1'),
('reporting', 'sdg.reporting', 'What is SDG Reporting?', '1.2'),
('indicators', 'sdg.indicators', 'Global SDG Indicators', '1.3'),
('approaches', 'approaches', 'Current Approaches to SDG Reporting', '2'),
('assessment', 'assessment', 'Assessing Reporting Priorities and Needs', '3'),
('policy', 'assessment.policy', 'Policy Considerations', '3.1'),
('engagement', 'assessment.engagement', 'Stakeholder Engagement', '3.2'),
('financing', 'assessment.financing', 'Financing SDG Reporting', '3.3'),
('capacity', 'assessment.capacity', 'Capacity Building', '3.4'),
('data', 'data', 'Data and Technical', '4'),
('sourcing', 'data.sourcing', 'Identifying Data Sources and Gaps', '4.1'),
('standards', 'data.standards', 'Data and Metadata Standards', '4.2'),
('technology', 'data.technology', 'Types of Technology', '4.3'),
('features', 'data.features', 'Features and Functionality', '4.4'),
('opensource', 'opensource', 'Open Source Solutions', '5'),
('examples', 'opensource.examples', 'Current Open-Source Examples', '5.1'),
('versioncontrol', 'opensource.versioncontrol', 'Introduction to Version Control', '5.2'),
('forking', 'opensource.forking', 'Forking an Open-Source Platform', '5.3'),
('formats', 'opensource.formats', 'Adding Data to a Platform', '5.4'),
('customization', 'opensource.customization', 'Customization and Additional Features', '5.5'),
('countries', 'countries', 'Country Experiences', '6');

COMMIT;

BEGIN;

INSERT INTO sdg.language (ietf_tag, name, label) VALUES
('en', 'English', 'English'),
('fr', 'French', 'français'),
('es', 'Spanish', 'Español'),
('ru', 'Russian', 'Русский'),
('zh', 'Chinese', '中文'),
('ar', 'Arabic', 'العربية'),
('de', 'German', 'Deutsch'),
('ja', 'Japanese', '日本語'),
('ko', 'Korean', '한국어'),
('da', 'Danish', 'dansk'),
('cz', 'Czech', 'čeština'),
('et', 'Estonian', 'eesti'),
('fi', 'Finnish', 'suomi'),
('el', 'Greek', 'ελληνικά'),
('he', 'Hebrew', 'עברית'),
('hu', 'Hungarian', 'magyar'),
('is', 'Icelandic', 'Íslenska'),
('it', 'Italian', 'Italiano'),
('lv', 'Latvian', 'Latviešu Valoda'),
('no', 'Norwegian', 'Norsk'),
('pl', 'Polish', 'Polszczyzna'),
('pt', 'Portuguese', 'Português'),
('sl', 'Slovenian', 'Slovenščina'),
('sv', 'Swedish', 'Svenska'),
('tr', 'Turkish', 'Türkçe');

COMMIT;

BEGIN;

INSERT INTO sdg.region (m49, path, name) VALUES
('001', '001', 'World'), 
('002', '001.002', 'Africa'),
('015', '001.015', 'Northern Africa'),
('202', '001.202', 'Sub-Saharan Africa'),
('014', '001.202.014', 'Eastern Africa'),
('017', '001.202.017', 'Middle Africa'),
('018', '001.202.018', 'Southern Africa'),
('011', '001.202.011', 'Western Africa'),
('019', '001.019', 'The Americas'),
('419', '001.019.419', 'Latin America and the Caribbean'),
('029', '001.019.419.029', 'Caribbean'),
('013', '001.019.419.013', 'Central America'),
('005', '001.019.419.005', 'South America'),
('021', '001.019.021', 'Northern America'),
('142', '001.142', 'Asia'),
('143', '001.142.143', 'Central Asia'),
('030', '001.142.030', 'Eastern Asia'),
('035', '001.142.035', 'South-eastern Asia'),
('034', '001.142.034', 'Southern Asia'),
('145', '001.142.145', 'Western Asia'),
('150', '001.150', 'Europe'),
('151', '001.150.151', 'Eastern Europe'),
('154', '001.150.154', 'Northern Europe'),
('039', '001.150.039', 'Southern Europe'),
('155', '001.150.155', 'Western Europe'),
('009', '001.009', 'Oceania'),
('053', '001.009.053', 'Australia and New Zealand'),
('054', '001.009.054', 'Melanesia'),
('057', '001.009.057', 'Micronesia'),
('061', '001.009.061', 'Polynesia');

COMMIT;

BEGIN;

INSERT INTO sdg.country (iso_alpha3, region_id, name) VALUES
('AFG', '034', 'Afghanistan'),
('ALB', '039', 'Albania'),
('DZA', '015', 'Algeria'),
('AND', '039', 'Andorra'),
('AGO', '017', 'Angola'),
('ATG', '029', 'Antigua and Barbuda'),
('ARG', '005', 'Argentina'),
('ARM', '145', 'Armenia'),
('AUS', '053', 'Australia'),
('AUT', '155', 'Austria'),
('AZE', '145', 'Azerbaijan'),
('BHS', '029', 'Bahamas'),
('BHR', '145', 'Bahrain'),
('BGD', '034', 'Bangladesh'),
('BRB', '029', 'Barbados'),
('BLR', '151', 'Belarus'),
('BEL', '155', 'Belgium'),
('BLZ', '005', 'Belize'),
('BEN', '011', 'Benin'),
('BTN', '034', 'Bhutan'),
('BOL', '005', 'Bolivia'),
('BIH', '039', 'Bosnia and Herzegovina'),
('BWA', '018', 'Botswana'),
('BRA', '005', 'Brazil'),
('BRN', '035', 'Brunei Darussalam'),
('BGR', '151', 'Bulgaria'),
('BFA', '011', 'Burkina Faso'),
('BDI', '014', 'Burundi'),
('CPV', '011', 'Cabo Verde'),
('KHM', '035', 'Cambodia'),
('CMR', '017', 'Cameroon'),
('CAN', '021', 'Canada'),
('CAF', '017', 'Central African Republic'),
('TCD', '017', 'Chad'),
('CHL', '005', 'Chile'),
('CHN', '030', 'China'),
('COL', '005', 'Colombia'),
('COM', '014', 'Comoros'),
('COG', '017', 'Congo'),
('CRI', '029', 'Costa Rica'),
('CIV', '011', 'Côte d''Ivoire'),
('HRV', '039', 'Croatia'),
('CUB', '029', 'Cuba'),
('CYP', '145', 'Cyprus'),
('CZE', '151', 'Czech Republic'),
('DNK', '155', 'Denmark'),
('DJI', '014', 'Djibouti'),
('DMA', '029', 'Dominica'),
('DOM', '029', 'Dominican Republic'),
('COD', '017', 'DR Congo'),
('ECU', '005', 'Ecuador'),
('EGY', '015', 'Egypt'),
('SLV', '013', 'El Salvador'),
('GNQ', '017', 'Equatorial Guinea'),
('ERI', '014', 'Eritrea'),
('EST', '154', 'Estonia'),
('ETH', '014', 'Ethiopia'),
('FJI', '054', 'Fiji'),
('FIN', '154', 'Finland'),
('FRA', '155', 'France'),
('GAB', '017', 'Gabon'),
('GMB', '011', 'Gambia'),
('GEO', '145', 'Georgia'),
('DEU', '155', 'Germany'),
('GHA', '011', 'Ghana'),
('GRC', '039', 'Greece'),
('GRD', '029', 'Grenada'),
('GTM', '013', 'Guatemala'),
('GIN', '011', 'Guinea'),
('GNB', '011', 'Guinea-Bissau'),
('GUY', '005', 'Guyana'),
('HTI', '029', 'Haiti'),
('VAT', '039', 'Holy See'),
('HND', '013', 'Honduras'),
('HUN', '151', 'Hungary'),
('ISL', '154', 'Iceland'),
('IND', '034', 'India'),
('IDN', '035', 'Indonesia'),
('IRN', '145', 'Iran'),
('IRQ', '145', 'Iraq'),
('IRL', '155', 'Ireland'),
('ISR', '145', 'Israel'),
('ITA', '039', 'Italy'),
('JAM', '029', 'Jamaica'),
('JPN', '030', 'Japan'),
('JOR', '145', 'Jordan'),
('KAZ', '143', 'Kazakhstan'),
('KEN', '014', 'Kenya'),
('KIR', '057', 'Kiribati'),
('KWT', '145', 'Kuwait'),
('KGZ', '143', 'Kyrgyzstan'),
('LAO', '035', 'Laos'),
('LVA', '154', 'Latvia'),
('LBN', '145', 'Lebanon'),
('LSO', '018', 'Lesotho'),
('LBR', '011', 'Liberia'),
('LBY', '015', 'Libya'),
('LIE', '155', 'Liechtenstein'),
('LTU', '154', 'Lithuania'),
('LUX', '155', 'Luxembourg'),
('MKD', '039', 'Macedonia'),
('MDG', '014', 'Madagascar'),
('MWI', '014', 'Malawi'),
('MYS', '035', 'Malaysia'),
('MDV', '034', 'Maldives'),
('MLI', '011', 'Mali'),
('MLT', '039', 'Malta'),
('MHL', '057', 'Marshall Islands'),
('MRT', '011', 'Mauritania'),
('MUS', '014', 'Mauritius'),
('MEX', '013', 'Mexico'),
('FSM', '057', 'Micronesia'),
('MDA', '151', 'Moldova'),
('MCO', '155', 'Monaco'),
('MNG', '030', 'Mongolia'),
('MNE', '039', 'Montenegro'),
('MAR', '015', 'Morocco'),
('MOZ', '014', 'Mozambique'),
('MMR', '035', 'Myanmar'),
('NAM', '018', 'Namibia'),
('NRU', '057', 'Nauru'),
('NPL', '034', 'Nepal'),
('NLD', '155', 'Netherlands'),
('NZL', '053', 'New Zealand'),
('NIC', '013', 'Nicaragua'),
('NER', '011', 'Niger'),
('NGA', '011', 'Nigeria'),
('PRK', '030', 'North Korea'),
('NOR', '154', 'Norway'),
('OMN', '145', 'Oman'),
('PAK', '034', 'Pakistan'),
('PLW', '057', 'Palau'),
('PAN', '013', 'Panama'),
('PNG', '054', 'Papua New Guinea'),
('PRY', '005', 'Paraguay'),
('PER', '005', 'Peru'),
('PHL', '035', 'Philippines'),
('POL', '151', 'Poland'),
('PRT', '039', 'Portugal'),
('QAT', '145', 'Qatar'),
('ROU', '151', 'Romania'),
('RUS', '151', 'Russian Federation'),
('RWA', '014', 'Rwanda'),
('KNA', '029', 'Saint Kitts and Nevis'),
('LCA', '029', 'Saint Lucia'),
('VCT', '029', 'Saint Vincent and the Grenadines'),
('WSM', '061', 'Samoa'),
('SMR', '039', 'San Marino'),
('STP', '017', 'Sao Tome and Principe'),
('SAU', '145', 'Saudi Arabia'),
('SEN', '011', 'Senegal'),
('SRB', '039', 'Serbia'),
('SYC', '014', 'Seychelles'),
('SLE', '011', 'Sierra Leone'),
('SGP', '035', 'Singapore'),
('SVK', '151', 'Slovakia'),
('SVN', '039', 'Slovenia'),
('SLB', '054', 'Solomon Islands'),
('SOM', '014', 'Somalia'),
('ZAF', '018', 'South Africa'),
('ROK', '030', 'South Korea'),
('SSD', '014', 'South Sudan'),
('ESP', '039', 'Spain'),
('LKA', '034', 'Sri Lanka'),
('SDN', '015', 'Sudan'),
('SUR', '005', 'Suriname'),
('SWZ', '018', 'Swaziland'),
('SWE', '154', 'Sweden'),
('CHE', '155', 'Switzerland'),
('SYR', '145', 'Syria'),
('TJK', '143', 'Tajikistan'),
('TZA', '014', 'Tanzania'),
('THA', '035', 'Thailand'),
('TLS', '035', 'Timor-Leste'),
('TGO', '011', 'Togo'),
('TON', '061', 'Tonga'),
('TTO', '029', 'Trinidad and Tobago'),
('TUN', '015', 'Tunisia'),
('TUR', '145', 'Turkey'),
('TKM', '143', 'Turkmenistan'),
('TUV', '061', 'Tuvalu'),
('UGA', '014', 'Uganda'),
('UKR', '151', 'Ukraine'),
('ARE', '145', 'United Arab Emirates'),
('GBR', '155', 'United Kingdom'),
('USA', '021', 'United States'),
('URY', '005', 'Uruguay'),
('UZB', '143', 'Uzbekistan'),
('VUT', '054', 'Vanuatu'),
('VEN', '005', 'Venezuela'),
('VNM', '035', 'Vietnam'),
('YEM', '145', 'Yemen'),
('ZMB', '014', 'Zambia'),
('ZWE', '014', 'Zimbabwe');

COMMIT;

BEGIN;

INSERT INTO sdg.content_type (id, name) VALUES
(1, 'Report'),
(2, 'Article'),
(3, 'Guide'),
(4, 'Assessment'),
(5, 'Webinar'),
(6, 'Presentation'),
(7, 'Website'),
(8, 'Conference Proceedings');

COMMIT;

BEGIN;

INSERT INTO sdg.submission_status (status) VALUES
('Unreviewed'),
('Under review'),
('Accepted');

COMMIT;

/* DEVELOPMENT TESTING DATA */

/* Resource Data */

BEGIN;

INSERT INTO sdg.resource (title, organization, date_published, url, description, tags, publish) VALUES
('SDG COUNTRY REPORTING GUIDELINES', 'UN Development Group', '2017-03-01 00:00+00', 'https://unstats.un.org/sdgs/files/meetings/sdg-inter-agency-meeting-2017/8.UNDG%20WG%20on%20SD-SDG%20Country%20Reporting%20Guidelines.pdf', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in nibh et est porta auctor sed ac nunc. Fusce magna arcu, euismod quis urna elementum, semper maximus elit. Nullam molestie eros efficitur semper suscipit. Curabitur eleifend velit orci, sed posuere enim fermentum eget.', '{"SDG Reporting"}', true),
('Data Tools for the California Bay Area: Actionable Intelligence for Cities to Support SDG Achievement', 'SDSN / Stanford University', '2017-08-01 00:00+00', 'http://unsdsn.org/resources/publications/data-tools-for-the-california-bay-area-actionable-intelligence-for-cities-to-support-sdg-achievement/', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in nibh et est porta auctor sed ac nunc. Fusce magna arcu, euismod quis urna elementum, semper maximus elit. Nullam molestie eros efficitur semper suscipit. Curabitur eleifend velit orci, sed posuere enim fermentum eget.', '{"subnational", "cities"}', true),
('Hacking the Sustainable Development Goals: Can US Cities Measure Up?', 'Urban Institute', '2017-09-01 00:00+00', 'https://www.urban.org/research/publication/hacking-sustainable-development-goals/view/full_report', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in nibh et est porta auctor sed ac nunc. Fusce magna arcu, euismod quis urna elementum, semper maximus elit. Nullam molestie eros efficitur semper suscipit. Curabitur eleifend velit orci, sed posuere enim fermentum eget.', '{"subnational", "cities"}', true),
('Handbook on Major Statistical Data Management Platforms', 'UNECA', '2011-10-01 00:00+00', 'http://nsdsguidelines.paris21.org/sites/default/files/EDITED_Handbook_SDMS_final_2-edited-clean.doc', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in nibh et est porta auctor sed ac nunc. Fusce magna arcu, euismod quis urna elementum, semper maximus elit. Nullam molestie eros efficitur semper suscipit. Curabitur eleifend velit orci, sed posuere enim fermentum eget.', '{"data management", "platforms", "Africa"}', true),
('Development Co-operation Report 2017', 'OECD', '2017-10-01 00:00+00', 'http://www.oecd.org/dac/development-co-operation-report-20747721.htm', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in nibh et est porta auctor sed ac nunc. Fusce magna arcu, euismod quis urna elementum, semper maximus elit. Nullam molestie eros efficitur semper suscipit. Curabitur eleifend velit orci, sed posuere enim fermentum eget.', '{"big data", "internet of things"}', true),
('A World That Counts: Mobilising the Data Revolution for Sustainable Development', 'UN Independent Expert Advisory Group on a Data Revolution for Sustainable Development (IAEG-SDGs)', '2014-11-01 00:00+00', 'http://www.undatarevolution.org/wp-content/uploads/2014/11/A-World-That-Counts.pdf', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in nibh et est porta auctor sed ac nunc. Fusce magna arcu, euismod quis urna elementum, semper maximus elit. Nullam molestie eros efficitur semper suscipit. Curabitur eleifend velit orci, sed posuere enim fermentum eget.', '{"UN"}', true),
('Cape Town Global Action Plan for Sustainable Development Data (CTGAP)', 'UN STATS', '2017-01-01 00:00+00', 'https://unstats.un.org/sdgs/hlg/Cape-Town-Global-Action-Plan/', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in nibh et est porta auctor sed ac nunc. Fusce magna arcu, euismod quis urna elementum, semper maximus elit. Nullam molestie eros efficitur semper suscipit. Curabitur eleifend velit orci, sed posuere enim fermentum eget.','{"roadmap", "UN"}', true),
('Localizing the Sustainable Development Goals for San Jose & the Bay Area', 'SDSN / Stanford University', '2017-08-01 00:00+00', 'https://docs.google.com/presentation/d/18W8ksej9cj-ZQ3TwckFPZjZ2HrvkcWsolfBAiPp82_w/edit', 'Nullam consectetur orci non magna maximus, non egestas tellus elementum. Mauris nibh ipsum, mattis eu massa sed, dignissim gravida diam. Maecenas ut justo non quam hendrerit vulputate eget quis turpis. Phasellus non urna velit.', '{"subnational", "US"}', true),
('Guidelines for National SDG Indicators Reporting Mechanisms', 'UNECE, Task Force on Reporting SDG Indicators Using National Reporting Platforms', '2017-10-01 00:00+00', '', 'Quisque tristique nisi erat, et tincidunt odio accumsan sed. Nullam et finibus orci. Sed ultricies tortor ut lectus ornare, eu pulvinar ligula facilisis. Sed euismod condimentum augue tempor tempus. Vestibulum euismod felis quis volutpat sollicitudin. Morbi odio lectus, porta sit amet mauris et, ultricies suscipit eros.', '{}', true),
('SDG Indicators Global Database', 'UNSD', '2017-09-12 00:00+00', 'https://unstats.un.org/sdgs/indicators/database/', 'Nunc posuere aliquam urna. Donec finibus suscipit justo. Morbi ligula lacus, molestie sit amet sem sed, suscipit tempus ipsum. Donec feugiat sollicitudin aliquet. Sed gravida lectus volutpat, condimentum neque ut, placerat turpis. Vivamus vehicula arcu vel tincidunt volutpat.', '{}', true),
('Strategic and managerial issues of official statistics', 'UNECE', '2014-11-01 00:00+00', 'https://statswiki.unece.org/display/train/5.+Strategic+and+managerial+issues+of+official+statistics#expand-Statisticalprogrammescoordinationwithinstatisticalsystems', 'Quisque tristique nisi erat, et tincidunt odio accumsan sed. Nullam et finibus orci. Sed ultricies tortor ut lectus ornare, eu pulvinar ligula facilisis. Sed euismod condimentum augue tempor tempus. Vestibulum euismod felis quis volutpat sollicitudin. Morbi odio lectus, porta sit amet mauris et, ultricies suscipit eros.', '{}', true),
('Data for Development: A Needs Assessment for SDG Monitoring and Statistical Capacity Development', 'SDSN', '2015-04-01 00:00+00', 'http://unsdsn.org/resources/publications/a-needs-assessment-for-sdg-monitoring-and-statistical-capacity-development/', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eleifend vitae mi nec sodales. Etiam id sem id augue ornare vehicula. Quisque lacinia sem a accumsan faucibus. Nullam feugiat mi ligula, cursus accumsan tortor pharetra sit amet. Curabitur sed vestibulum ex. Suspendisse accumsan, tellus id faucibus fringilla, neque quam tempor quam, non rutrum libero erat eu dui.','{"capacity", "subnational"}', true),
('Declaration on the role of national statistical offices in measuring and monitoring the Sustainable Development Goals', 'UNECE', '2015-06-01 00:00+00', 'http://www.unece.org/fileadmin/DAM/stats/documents/ece/ces/2015/CES_89_Add.1-E.pdf', 'Ut interdum eu risus et euismod. Aenean commodo, orci et consectetur mattis, elit ex vehicula lacus, vitae hendrerit leo ante ut mi. Cras accumsan nisl non diam tempor, nec auctor lectus vestibulum. Aenean ut mauris elementum, ullamcorper metus ut, commodo enim. Praesent placerat ligula urna, vel fermentum velit condimentum eget. Fusce malesuada enim nec commodo pretium. Duis dignissim, eros vel maximus aliquet, ipsum nulla iaculis elit, eu lobortis neque felis eget justo.', '{}', true),
('Value of official statistics: Recommendations on promoting, measuring and communicating the value of official statistics', 'UNECE, Task Force on the Value of Official Statistics', '2017-06-01 00:00+00', 'http://www.unece.org/statistics/statstos/task-force-on-the-value-of-official-statistics.html', 'Vestibulum vel lectus ligula. Etiam congue erat vel orci accumsan ornare. Phasellus lobortis pellentesque aliquam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras eu quam at sapien vehicula euismod a at nulla. Fusce laoreet quam in tortor pulvinar, et vestibulum tellus ullamcorper. Morbi auctor a risus vel pellentesque. Sed dolor enim, auctor id tincidunt vel, pretium suscipit elit.', '{"NSO"}', true),
('Self-assessment template for countries on availability of global SDG indicators', 'UNECE', '2017-09-12 00:00+00', 'https://statswiki.unece.org/display/SFSDG/Assessments+on+readiness+to+report', 'Curabitur rutrum commodo lacus, id tristique lorem blandit lobortis. Nunc eu viverra lorem, sed consectetur lorem. Ut pretium ex ac dignissim condimentum. Vestibulum id lectus sit amet eros sodales faucibus. Etiam vestibulum ac purus nec venenatis.', '{}', true),
('Technical Assessment of Open Data Platforms for NSOs', 'World Bank Group', '2014-10-01 00:00+00', 'http://documents.worldbank.org/curated/en/744241468334210686/Technical-assessment-of-open-data-platforms-for-national-statistical-organisations', 'Duis id eros vel nulla pellentesque tempus. Quisque pulvinar dolor et ante varius, eu bibendum quam mattis. Nunc eu lacinia mi.','{"open data", "NSO", "platforms"}', true),
('Making Data Portals work for SDGs: A view on deployment, design and technology', 'Paris21', '2016-04-01 00:00+00', 'https://www.paris21.org/sites/default/files/Paper_on_Data_Portals%20wcover_WEB.pdf', 'Nunc eu viverra lorem, sed consectetur lorem. Ut pretium ex ac dignissim condimentum. Vestibulum id lectus sit amet eros sodales faucibus. Etiam vestibulum ac purus nec venenatis. In scelerisque maximus dolor sed viverra. Proin aliquet magna eget metus lobortis, laoreet dignissim metus tempor.', '{"portals", "platforms"}', true),
('Description of National Reporting Platforms', 'UNECE, Task Force on Reporting SDG Indicators Using National Reporting Platforms', '2017-10-01 00:00+00', '', 'Vivamus quis ex odio. Aenean et ligula sit amet orci blandit molestie. Aenean tempor tincidunt libero at elementum. Nam nec dignissim nisi.', '{}', true),
('Getting to grips with platforms', 'European Data Portal', '2015-07-15 00:00+00', 'https://www.europeandataportal.eu/elearning/en/module8/#/id/co-01', 'Fusce malesuada enim nec commodo pretium. Duis dignissim, eros vel maximus aliquet, ipsum nulla iaculis elit, eu lobortis neque felis eget justo. Vestibulum vel lectus ligula. Etiam congue erat vel orci accumsan ornare. Phasellus lobortis pellentesque aliquam.', '{}', true),
('Conference of European Statisticians’ Road Map on Statistics for Sustainable Development Goals, First Edition', 'UNECE, Steering Group on Statistics for SDGs', '2017-06-01 00:00+00', 'https://statswiki.unece.org/display/SFSDG/Statistics+for+SDGs+Home?preview=/127666441/141230208/CES%20Road%20Map%20for%20SDGs_First%20Edition_final.pdf', 'Suspendisse gravida lacus ut ante pulvinar, non eleifend augue porta. Praesent dui arcu, fermentum pretium iaculis ut, pretium non lacus. Suspendisse placerat nunc vel eros viverra porttitor. Ut tempor tellus at massa posuere eleifend.', '{}', true);

COMMIT;

BEGIN;

/* Populates all resources with English as a default language. */

INSERT INTO sdg.resource_languages (resource_id, language_id)
SELECT uuid, 'en' as language_id
FROM sdg.resource;

/* Populate a record with foreign languages. */

INSERT INTO sdg.resource_languages(resource_id, language_id)
SELECT uuid, unnest(ARRAY['ar', 'zh', 'en', 'fr', 'ru', 'es']) AS language_id
FROM sdg.resource
WHERE title ~ 'Cape Town Global Action Plan for Sustainable Development Data (CTGAP)';

COMMIT;

/* News Data */

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

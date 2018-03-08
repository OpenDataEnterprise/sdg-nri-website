BEGIN;

INSERT INTO sdg.topic (topic, path, label, ordering) VALUES
('sdg', 'sdg', 'Why SDG reporting?', '1'),
('intro', 'sdg.intro', 'What are the SDGs and the Data Revolution?', '1.1'),
('reporting', 'sdg.reporting', 'What is SDG reporting?', '1.2'),
('indicators', 'sdg.indicators', 'The global SDG indicators', '1.3'),
('approaches', 'approaches', 'Current approaches to SDG reporting', '2'),
('priorities', 'priorities', 'Assessing reporting priorities and needs', '3'),
('policy', 'priorities.policy', 'Policy considerations', '3.1'),
('engagement', 'priorities.engagement', 'Stakeholder engagement', '3.2'),
('financing', 'priorities.financing', 'Financing and sustainability', '3.3'),
('capacity', 'priorities.capacity', 'Capacity-building', '3.4'),
('data', 'data', 'Data and technical', '4'),
('assessment', 'data.assessment', 'Identifying data sources and gaps', '4.1'),
('standards', 'data.standards', 'Open data, metadata, and standards', '4.2'),
('technology', 'data.technology', 'Types of technology', '4.3'),
('features', 'data.features', 'Features and functionality', '4.4'),
('opensource', 'opensource', 'Open-source solutions', '5'),
('platforms', 'opensource.platforms', 'Open-source reporting platforms', '5.1'),
('versioncontrol', 'opensource.versioncontrol', 'Introduction to version control', '5.2'),
('forking', 'opensource.forking', 'Forking an open-source platform', '5.3'),
('addingdata', 'opensource.addingdata', 'Adding data to a platform', '5.4'),
('customization', 'opensource.customization', 'Customization and additional features', '5.5'),
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
(8, 'Conference Proceedings'),
(9, 'Repository'),
(10, 'Video');

COMMIT;

BEGIN;

INSERT INTO sdg.submission_status (id, status) VALUES
(1, 'Unreviewed'),
(2, 'Under review'),
(3, 'Accepted');

COMMIT;

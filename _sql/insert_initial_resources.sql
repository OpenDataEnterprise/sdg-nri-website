BEGIN;

/* Template
WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (

  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = '')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = '')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);
*/

DELETE FROM sdg.resource;

WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES
  (
    'Center for Open Data Enterprise',
    'SDG reporting links, by country',
    'https://docs.google.com/spreadsheets/d/1kaODycDA6QH5OTbyD1tUws1xtxNfGltROco5xebXKrc/edit#gid=630534804',
    'A working list of links to country SDG reporting websites, data assessments and Voluntary National Reports',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'approaches')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN Development Group',
    'SDG Country Reporting Guidelines - Presentation',
    'https://unstats.un.org/sdgs/files/meetings/sdg-inter-agency-meeting-2017/8.UNDG%20WG%20on%20SD-SDG%20Country%20Reporting%20Guidelines.pdf',
    'A summary of UNDP''s "Guidelines to Support Country Reporting" paper.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'reporting')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'engagement')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Presentation')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN Economic Comission for Europe (UNECE) Steering Group on SDG Statistics',
    'Self-assessment template for countries on availability of global SDG indicators',
    'http://www1.unece.org/stat/platform/download/attachments/127666441/Self-assessment%20template%20on%20availability%20of%20SDG%20indicators.xlsx?version=3&modificationDate=1484038447257&api=v2',
    'A template for governments to assess their data availability for the global SDG indicators.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'assessment')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'indicators')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Guide')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Statistical Data and Metadata eXchange (SDMX)',
    'Learning about Statistical Data and Metadata eXchange (SDMX) basics',
    'https://sdmx.org/?page_id=2555/',
    'An introduction to SDMX, an international initiative that aims at standardizing and modernizing the mechanisms and processes for the exchange of statistical data and metadata among international organizations and countries.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'standards')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Guide')
  ),
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN Statistical Division',
    'Cape Town Global Action Plan for Sustainable Development Data (CTGAP)',
    'https://unstats.un.org/sdgs/hlg/Cape-Town-Global-Action-Plan/',
    'Prepared by the High-level Group for Partnership, Coordination and Capacity-Building for Statistics for the 2030 Agenda for Sustainable Development, the Plan proposes six strategic areas, each associated with several objectives and implementation actions.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'intro')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'financing')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'policy')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  ),
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Arabic')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Chinese')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'French')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Russian')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Spanish')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN Independent Expert Advisory Group on a Data Revolution for Sustainable Development (IAEG-SDGs)',
    'A World That Counts: Mobilising the Data Revolution for Sustainable Development',
    'http://www.undatarevolution.org/wp-content/uploads/2014/11/A-World-That-Counts.pdf',
    'An overview of the data revolution for sustainable development, recomendations, and a call to action to the global community.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'intro')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'SDSN',
    'SDG Index and Dashboards Report',
    'http://sdgindex.org/#full-report',
    'An index and report card for each country on its performance on the 2030 Agenda and the SDGs.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  ),
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN Development Group',
    'Guidelines to Support Country Reporting on the Sustainable Development Goals',
    'https://undg.org/wp-content/uploads/2017/03/Guidelines-to-Support-Country-Reporting-on-SDGs-1.pdf',
    'UN guidelines for creating national reports on the SDGs, including: SDG review and follow-up process; elements for inclusive country-led reporting; SDG indicators, data, and progressive reviews; and stakeholder engagement.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'reporting')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  ),
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Guide')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Paris21',
    'Making Data Portals work for SDGs: A view on deployment, design and technology',
    'https://www.paris21.org/sites/default/files/Paper_on_Data_Portals%20wcover_WEB.pdf',
    'An analysis of the sustainability and current use of data portals, and recommendations on the design and technology considerations for countries and their National Statistical Offices (NSOs).',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'technology')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'PARIS21',
    'Advanced Data Planning Tool (ADAPT)',
    'http://adapt.paris21.org/auth/login',
    'A consultative tool that brings development stakeholders together to define measurement standards within indicator frameworks in order to monitor development.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'assessment')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Center for Open Data Enterprise',
    'U.S. SDG Data Revolution Roadmap - Roundtable Report',
    'http://reports.opendataenterprise.org/us-sdg-report.pdf',
    'A report from a Roundtable to develop a Sustainable Development Goals Data Roadmap for the US Government.',
    'USA'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN',
    'United Nations Sustainable Development Goals',
    'http://www.un.org/sustainabledevelopment/sustainable-development-goals/',
    'A UN website including information on the SDGs, their targets and indicators, as well as facts and links providing information on the current status of the SDGs.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'intro')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Arabic')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Chinese')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'French')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Russian')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Spanish')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN',
    'What is the ‘data revolution’?',
    'http://www.undatarevolution.org/data-revolution/',
    'An explanation of the Data Revolution for Sustainable Development.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'intro')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN Independent Expert Advisory Group on a Data Revolution for Sustainable Development (IAEG-SDGs)',
    'IAEG-SDGs - Tier Classification for Global SDG Indicators',
    'https://unstats.un.org/sdgs/iaeg-sdgs/tier-classification/',
    'Guidelines on the three different tiers of indicators on the basis of their level of methodological development and the availability of data at the global level.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'indicators')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Arabic')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Chinese')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'French')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Russian')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Spanish')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UK Office for National Statistics',
    'How should the UK report progress towards the Sustainable Development Goals? A summary of responses from non-governmental organisations',
    'https://www.ons.gov.uk/file?uri=/aboutus/whatwedo/programmesandprojects/sustainabledevelopmentgoals/howshouldtheukreportprogresstowardsthesustainabledevelopmentgoals.pdf',
    'A summary of responses from a consultation with non-government actors on how the UK should report progress on the SDGs.',
    'GBR'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'engagement')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UK Office for National Statistics',
    'Sustainable Development Goals: progress and possibilities',
    'https://www.ons.gov.uk/economy/environmentalaccounts/articles/sustainabledevelopmentgoalstakingstockprogressandpossibilities/november2017',
    'An initial assessment of SDG measuring and reporting efforts in the UK.',
    'GBR'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  ),
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UNECE, Steering Group on Statistics for SDGs',
    'Conference of European Statisticians’ Road Map on Statistics for Sustainable Development Goals, First Edition',
    'https://statswiki.unece.org/display/SFSDG/Statistics+for+SDGs+Home?preview=/127666441/141230208/CES%20Road%20Map%20for%20SDGs_First%20Edition_final.pdf',
    'This document lays out the activities associated with producing statistics on the SDGs and provides recommendations and actions to NSOs for more efficient implementation of reporting systems.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'reporting')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'policy')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'engagement')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    NULL,
    'UK national reporting platform repository',
    'https://github.com/datasciencecampus/sdg-indicators',
    'An open-source SDG NRP based on Jekyll and leveraging Github for static hosting, user-management, and data management (with Prose.io). Features include disaggregation, automated tests, and accessibility compliance.',
    'GBR'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'platforms')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Repository')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    NULL,
    'US national reporting platform repository',
    'https://github.com/GSA/sdg-indicators',
    'An open-source SDG NRP based on Jekyll and leveraging Github for static hosting, user-management, and data management (with Prose.io). Features include multilingual capabilities.',
    'USA'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'platforms')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Repository')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    NULL,
    'Mexico national reporting platform repository',
    'https://github.com/danvaros/visualizadorObjetivosV2',
    'An open-source web-based front-end for sharing and visualizing data from the ods.org.mx API. Features include: subnational mapping, search, calendar.',
    'MEX'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'platforms')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Repository')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Spanish')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Center for Policy Dialogue',
    'Implementing Agenda 2030: Unpacking the Data Revolution at Country Level',
    'http://www.post2015datatest.com/wp-content/uploads/2016/07/Implementing-Agenda-2030-Unpacking-the-Data-Revolution-at-Country-Level.pdf',
    'This report examines data availability and quality for tracking progress of the SDGs at the country level.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Center for Open Data Enterprise',
    'Strategies for SDG National Reporting: A Review of Current Approaches and Key Considerations for Governmnet Reporting on the UN Sustainable Development Goals.',
    '',
    'An overview of the various approaches to SDG reporting and key policy and technical considerations for national governments.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'reporting')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'approaches')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'policy')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'technology')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UNECE, Steering Group on Statistics for SDGs',
    'Conference of European Statisticians’ Guidelines on National Mechanisms for Providing Data on SDG indicators',
    'https://statswiki.unece.org/download/attachments/128451803/National%20mechanisms%20for%20providing%20data%20on%20SDGs_note%20from%20UNCES%20SG%20SDG%20TF....docx?api=v2',
    'This document analyzes types of data and data flows for the purpose of offering recommendations to NSOs on national SDG reporting mechanisms.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'reporting')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'assessment')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'technology')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Guide')
  ),
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN',
    'Global indicator framework for the Sustainable Development Goals and targets of the 2030 Agenda for Sustainable Development',
    'https://unstats.un.org/sdgs/indicators/indicators-list/',
    'This document lists the SDG targets and indicators.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'indicators')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  ),
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Guide')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UNECE, Steering Group on Statistics for SDGs',
    'Survey on NSOs strategies and plans related to statistics for SDGs - Questionnaire',
    'https://statswiki.unece.org/download/attachments/127666441/CES%20Survey%20on%20statistics%20for%20SDGs.docx?version=1&modificationDate=1485182757591&api=v2',
    'An assessment tool designed to gather information about National Statistical Offices (NSOs) in four areas: SDG indicators at the country level, communication between policy level and other stakeholders in the country, statistical capacities of NSOs, and strategic issues and challenges.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'assessment')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'policy')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Guide')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'GPSDD',
    'Data Roadmaps for Sustainable Development Guidelines',
    'http://www.data4sdgs.org/sites/default/files/2017-09/Data%20Roadmaps%20for%20Sustainable%20Development%20Guidelines%20-%20Data4SDGs%20Toolbox.pdf',
    'Guidelines to help governments advance their own data roadmaps and align them with the global SDGs.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'policy')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'OECD',
    'Development Cooperation Report 2017: Data for Development',
    'http://www.oecd-ilibrary.org/docserver/download/4317041e.pdf?expires=1519316350&id=id&accname=guest&checksum=857EDCA9BD41E8C9F3193FE7DEDAC71C',
    'This report focuses on making data work for development by recognizing the importance of NSOs in the data revolution, gaining donor support in order to increase the statistical capacity of NSOs, and making better use of results data in order to get development finances right.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'financing')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN',
    'Addis Ababa Action Agenda: Monitoring commitments and actions',
    'http://www.un.org/esa/ffd/wp-content/uploads/2016/03/Report_IATF-2016-full.pdf',
    'This report outlines the commitments and action items from the Addis Ababa Action Agenda and outlines how the Inter-Agency Task Force on Financing and Development will monitor implementation in the future.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'financing')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'GPSDD',
    'Data Financing and Mutual Accountability Pact',
    'http://www.data4sdgs.org/resources/data-financing-and-mutual-accountability-pact',
    'An agreement between national governments, local governments, funders, and other relevant parties whereby funders reward subnational governments for progress in producing and publishing better (more timely, open, accurate, complete) data.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'financing')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'SDSN',
    'Data for Development: A Needs Assessment for SDG Monitoring and Statistical Capacity Development',
    'http://unsdsn.org/wp-content/uploads/2015/04/Data-for-Development-Full-Report.pdf',
    'This document informs the discussion at the Financing for Development Conference by demonstrating the scale of need, including total and additional resources required, as well as the key areas for investment.  The document also identifies some ways in which data production and communication can be modernized.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'financing')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'capacity')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'International Association for Statistical Education (IASE)',
    'International Statistical Literacy Project',
    'https://iase-web.org/islp/',
    'A project that aims to promote statistical literacy across all demographics all over the world.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'capacity')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Statistics Sweden',
    'Statistical follow-up of the 2030 Agenda for Sustainable development',
    'https://www.scb.se/contentassets/cc84f7debf404250a146e1204ea589b0/mi1303_2017a01_br_x41br1701eng.pdf',
    'This document is an analysis of Sweden’s data and results, as they pertain to the SDGs and their targets in 2017.',
    'SWE'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Paris21',
    'NSDS Guidelines',
    'http://nsdsguidelines.paris21.org/node/717',
    'This document is a frequently updated list of rules and guidelines that outline how to create a coherent national statistics strategy.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'standards')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'policy')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Guide')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN Statistics Division',
    'Fundamental Principles of Official Statistics',
    'https://unstats.un.org/unsd/dnss/gp/FP-New-E.pdf',
    'A set of principles, adopted by the UN in 2014, that outlines the importance of official statistics across international boundaries as well as offers guidelines for international professional and scientific statistical standards.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'standards')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'assessment')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Africa Development Bank',
    'A New Lane for the Sustainable Development Goals',
    'https://unstats.un.org/sdgs/files/meetings/sdg-seminar-seoul-2017/S1_P2_Louis_Kouakou_and_Momar_Kouta.pdf',
    'This presentation outlines key features of the Africa Information Highway, a regional open data platform that electronically links all 54 African nations. The presentation displays the components, objectives, features, functionalities, and benefits of the platform.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'approaches')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Presentation')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Africa Development Bank',
    'Africa''s Information Highway: "New Approaches to Capacity Development linked with Data Access and Use"',
    '',
    'This report outlines the unique aspects of the Africa Information Highway (AIH) capacity development approach, including its system coverage, geographical scope, strategic alignment, effective partnership, and guiding principles. The document further assesses the effectiveness of the AIH''s capacity development activities and as well as outlining the AIH''s flagship initiatives.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'approaches')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN',
    'The Sustainable Development Goals Report',
    'https://unstats.un.org/sdgs/report/2017/',
    'This report reviews progress made towards the 17 Goals in the second year of implementation of the 2030 Agenda for Sustainable Development.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'reporting')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Arabic')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Chinese')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'French')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Russian')
),
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'Spanish')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN Statistics Division',
    'Guidelines and Best Practices on Data Flows and Global Data Reporting for the Sustainable Development Goals',
    'https://unstats.un.org/sdgs/files/meetings/iaeg-sdgs-meeting-06/20171108_Draft%20Guidelines%20and%20Best%20Practices%20for%20Global%20SDG%20Data%20Reporting.pdf',
    'This document establishes principles for global SDG data reporting, and identifies an approach for National and International Statistical Systems to ensure the quality of the official data and official statistics used for global reporting.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'reporting')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'standards')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);




WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN Statistics Division',
    'Overview of Standards for Data Disaggregation',
    'https://unstats.un.org/sdgs/files/meetings/iaeg-sdgs-meeting-06/20170607_updated%20version-overview%20of%20standards%20of%20data%20disaggregation.pdf',
    'A collection of standards already in use for presenting disaggregated data, and a table including ideas on how to proceed with data disaggregation for the SDG indicators.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'standards')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Guide')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN Statistics Division',
    'Summary Table of SDG Indicators',
    'https://unstats.un.org/sdgs/files/meetings/iaeg-sdgs-meeting-06/Summary%20Table_Global%20Indicator%20Framework_08.11.2017.pdf',
    'A list of all SDG indicators and their associated tier classification, custodian agencies, and work plans.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'indicators')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Assessment')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Central Statistics Office of Ireland',
    'Ireland Update on SDG Reporting',
    'https://unstats.un.org/sdgs/files/meetings/iaeg-sdgs-meeting-06/8.%20Ireland%20SDG%20Monitoring%20and%20Implementation.pdf',
    'An overview of Ireland''s reporting platform, developed in partnership with Esri. The presentation outlines key functional features of the site, key stakeholders and their roles.',
    'IRL'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Presentation')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Central Statistics Office of India',
    'Sustainable Development Goals - Indian Status',
    'https://unstats.un.org/sdgs/files/meetings/iaeg-sdgs-meeting-06/8.%20India%20SDG%20Implementation.pdf',
    'An overview of India''s SDG data roadmap.',
    'IND'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Presentation')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Philippine Statistics Authority',
    'Sustainable Development Goals: Implementation and Reporting in the Philippines',
    'https://unstats.un.org/sdgs/files/meetings/iaeg-sdgs-meeting-06/8.%20Philippines%20SDG%20Implementation%20and%20Reporting.pdf',
    'A summary of current and future SDG reporting efforts in the Philippines',
    'PHL'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Presentation')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'National Statistics Institute of Cameroon',
    'SDG Reporting Mechanism and Process in Cameroon',
    'https://unstats.un.org/sdgs/files/meetings/iaeg-sdgs-meeting-06/8.%20Cameroon%20SDG%20Reporting%20and%20Implementation.pdf',
    'A summary of Cameroon''s current and future plans to report on the SDG indicators',
    'CMR'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Presentation')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Brazilian Institute of Geography and Statistics (IBGE)',
    'SDG Indicators in Brazil',
    'https://unstats.un.org/sdgs/files/meetings/iaeg-sdgs-meeting-06/8.%20Brazil%20SDG%20Monitoring%20and%20Implementation.pdf',
    'A summary of Brazil''s current and future plans to report on the SDG indicators.',
    'BRA'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Presentation')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    NULL,
    'Introduction to GitHub for Newcomers',
    'https://www.youtube.com/watch?v=uNa9GOtM6NE',
    'An introduction to using Github.com for version control and issue tracking.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'versioncontrol')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Presentation')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    NULL,
    'Introduction to GitLab Workflow',
    'https://www.youtube.com/watch?v=enMumwvLAug',
    'An introduction to using Gitlab for version control and issue tracking.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'versioncontrol')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Presentation')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    NULL,
    'Introduction to Bitbucket',
    'https://www.youtube.com/watch?v=7vOgKcG5mw8',
    'An introduction to using Bitbucket.org for version control and issue tracking.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'versioncontrol')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Presentation')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UK Office for National Statistics',
    'How do we create our own NRP',
    'https://github.com/datasciencecampus/sdg-indicators/wiki/How-do-we-create-our-own-NRP',
    'Forking guidance for the UK national reporting platform.',
    'GBR'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'forking')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'US Office of the Chief Statistician',
    'How do we create our own NRP',
    'https://github.com/GSA/sdg-indicators/wiki/How-do-we-create-our-own-NRP',
    'Forking guidance for the US national reporting platform.',
    'USA'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'forking')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'US Office of the Chief Statistician',
    'How do we put our own statistics into the NRP',
    'https://github.com/GSA/sdg-indicators/wiki/How-do-we-put-our-own-statistics-into-the-NRP',
    'Data entry guidance for the US national reporting platform.',
    'USA'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'addingdata')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UK Office for National Statistics',
    'Raw data format',
    'https://github.com/datasciencecampus/sdg-indicators/wiki/Raw-data-format',
    'Explanation of the data format used in the UK national reporting platform.',
    'GBR'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'addingdata')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UK Office for National Statistics',
    'Metadata format',
    'https://github.com/datasciencecampus/sdg-indicators/wiki/Metadata-format',
    'Explanation of the metadata format used in the UK national reporting platform.',
    'GBR'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'addingdata')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UK Office for National Statistics',
    'Permissions for Adding Data',
    'https://github.com/datasciencecampus/sdg-indicators/wiki/Permissions-for-Adding-Data',
    'Explanation of the permissions system for entering data in the UK national reporting platform.',
    'GBR'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'customization')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'addingdata')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UK Office for National Statistics',
    'Data scenarios and characteristics',
    'https://github.com/datasciencecampus/sdg-indicators/wiki/Data-scenarios-and-characteristics',
    'Explanation of the supported types of visualizations and disaggregations in the UK national reporting platform.',
    'GBR'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'customization')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'GPSDD',
    'API Highways',
    'http://apihighways.data4sdgs.org/',
    'Proof-of-concept website providing API access to SDG data.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'features')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'technology')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UK Office for National Statistics',
    'What do we need to change',
    'https://github.com/datasciencecampus/sdg-indicators/wiki/What-do-we-need-to-change',
    'Explanation of how to customise the UK national reporting platform for use by other countries.',
    'GBR'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'customization')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UK Office for National Statistics',
    'Differences between US and UK NRPs',
    'https://github.com/datasciencecampus/sdg-indicators/wiki/Differences-between-the-US-and-UK-NRPs',
    'List of differences between the US and UK national reporting platforms.',
    'GBR'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'customization')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN',
    'Voluntary National Reviews Database',
    'https://sustainabledevelopment.un.org/vnrs/',
    'An online platform compiling information from countries participating in the voluntary national reviews of the High-level Political Forum on Sustainable Development.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'reporting')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UN',
    'Resolution adopted by the General Assembly on 25 September 2015',
    'http://www.un.org/en/development/desa/population/migration/generalassembly/docs/globalcompact/A_RES_70_1_E.pdf,2015-10-21',
    'The UN Resolution adopted by the General Assembly for the 2030 Agenda for Sustainable Development.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'intro')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'PARIS21',
    'Realising the Data Revolution for Sustainable Development: Towards Capacity Development 4.0',
    'https://www.paris21.org/sites/default/files/CapacityDevelopment4.0_FINAL_0.pdf',
    'This document outlines a vision improving support for and increasing statistical capacity development',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'capacity')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Open Data Knowledge',
    'Frictionless Data',
    'https://frictionlessdata.io',
    'Open-source software that can be used to standardize and improve the quality of data.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'technology')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'features')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'UNECE',
    'Generic Statistical Business Process Model',
    'https://statswiki.unece.org/display/GSBPM/GSBPM+v5.0,2013-12',
    'This document describes and defines the set of business processes needed to produce official statistics.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'assessment')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'features')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Report')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'OECD',
    '.Stat Suite',
    'https://siscc.oecd.org/Home/Product?Length=4',
    'An SDMX based modular platform covering the complete end-to-end data lifecycle to build tailored data portals and reporting platforms.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'technology')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'features')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'OECD',
    'Statistical Information System Collaboration Community',
    'https://siscc.oecd.org',
    'A community of .Stat users which was setup so that participating members could share experiences, knowledge, and best practices.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'engagement')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'technology')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Community Systems Foundation (CSF)',
    'Data For All',
    'https://info.dataforall.org',
    'This platform provides a range of open-source tools for data capture, management, and analysis to help countries develop custom, modular platforms for monitoring their national development.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'technology')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'features')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Data Act Lab',
    'Data Act Lab',
    'http://dataactlab.com/',
    'Solutions that deliver powerful visualizations to help actors make sense of complex data.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'technology')
  ),
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'features')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'African Development Bank Group',
    'Africa Information Highway',
    'http://sdg.opendataforafrica.org',
    'An SDG reporting platform for African countries.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'approaches')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Eurostat',
    'Eurostat Overview of the Sustainable Development Goals',
    'http://ec.europa.eu/eurostat/web/sdi/overview',
    'An SDG reporting platform for European countries.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'approaches')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Asia Pacific SDG Partnership',
    'Asia Pacific SDG Partnership',
    'http://data.unescap.org/sdg/',
    'An SDG reporting platform for countries in Asia and the Pacific.',
    NULL
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'approaches')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Website')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);



WITH insert1 AS (
  -- Create resource.
  INSERT INTO sdg.resource (organization, title, url, description, country_id) VALUES    
  (
    'Statistics Institute of Belize',
    'Contribution of the Belize National Statistical System to National SDG Review & Reporting Systems',
    'https://www.cepal.org/sites/default/files/presentations/si-dcastillotrejo-contribution-belize-nationalsdg-review.pdf',
    'An overview of coordination processes on SDG reporting in Belize.',
    'BLZ'
  )
  RETURNING uuid
), insert2 AS (
  -- Associate topics.
  INSERT INTO sdg.resource_topics (resource_id, topic_id) VALUES
  (
    (SELECT uuid FROM insert1),
    (SELECT id FROM sdg.topic WHERE topic = 'countries')
  )
  RETURNING *
), insert3 AS (
  -- Associate content types.
  INSERT INTO sdg.resource_content_types (resource_id, content_type_id) VALUES
  (
    (SELECT DISTINCT (resource_id) FROM insert2),
    (SELECT id FROM sdg.content_type WHERE name = 'Presentation')
  )
  RETURNING *
)
-- Associate languages.
INSERT INTO sdg.resource_languages (resource_id, language_id) VALUES
(
  (SELECT DISTINCT (resource_id) FROM insert3),
  (SELECT ietf_tag FROM sdg.language WHERE name = 'English')
);

-- Set all resources to be published.
UPDATE sdg.resource SET publish = true;

COMMIT;
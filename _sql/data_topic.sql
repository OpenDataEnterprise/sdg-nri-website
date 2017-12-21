BEGIN;

INSERT INTO sdg.topic (tag, path, label) VALUES
('sdg', 'sdg', 'Why SDG Reporting'),
('intro', 'sdg.intro', 'The SDGs and the Data Revolution'),
('indicators', 'sdg.indicators', 'The Global SDG indicators'),
('reporting', 'sdg.reporting', 'National Reporting on the SDGs'),
('impact', 'sdg.impact', 'Data-driven Decision-making'),
('stakeholders', 'sdg.stakeholders', 'Key Stakeholders'),
('approaches', 'approaches', 'Current approaches to SDG reporting'),
('data', 'data', 'Data and Technical'),
('platforms', 'data.platforms', 'Types of Technology Platforms'),
('sourcing', 'data.sourcing', 'Identifying Data Sources and Gaps'),
('standards', 'data.standards', 'Data and Metadata Standards'),
('privacy', 'data.privacy', 'Privacy'),
('security', 'data.security', 'Security'),
('opensource', 'opensource', 'Open Source NRP Solutions'),
('overview', 'opensource.overview', 'Overview of NRPs'),
('github', 'opensource.github', 'Introduction to GitHub'),
('forking', 'opensource.forking', 'Forking an NRP'),
('formats', 'opensource.formats', 'Adding Data to the NRP'),
('customization', 'opensource.customization', 'Customizing Language and Branding'),
('visualization', 'opensource.visualization', 'Visualization'),
('features', 'opensource.features', 'Additional Features'),
('assessment', 'assessment', 'Assessing Reporting Priorities and Needs'),
('policy', 'assessment.policy', 'Policy Considerations'),
('engagement', 'assessment.engagement', 'Stakeholder Engagement'),
('legal', 'assessment.legal', 'Institutional and Legal'),
('financing', 'assessment.financing', 'Financing SDG Reporting');

COMMIT;

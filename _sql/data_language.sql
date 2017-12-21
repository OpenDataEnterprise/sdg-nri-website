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

-- Export flat topics to file as JSON array.
\COPY (SELECT array_to_json(array_agg(json_build_object('topic', topic.topic, 'label', topic.label, 'path', topic.path))) FROM (SELECT * FROM sdg.topic ORDER BY topic.ordering ASC) AS topic) to '_data/topics.json';

-- Export hierarchically organized topics to file as JSON array.
\COPY (SELECT array_to_json(array_agg(json_build_object('topic', topic.topic, 'label', topic.label, 'subtopics', (SELECT COALESCE(array_to_json(array_agg(subtopic)), '[]') FROM sdg.topic AS subtopic WHERE subtopic.path <@ topic.path AND subtopic.path <> topic.path)))) FROM sdg.topic AS topic WHERE topic.path ~ '*{,1}') to '_data/nested_topics.json';
CALL algo.closeness.harmonic(
  'MATCH (n:Neighborhood) RETURN id(n) as id',
  'MATCH (tpp:Touristic_point_type {name:\'Museos\'})<-[:type]-(:Tourist_point)-[:is_located]->(n)-[:close_to]->(n2:Neighborhood)
   RETURN id(n) as source, id(n2) as target, count(*) as weight',
  {graph:'cypher', write: true, writeProperty: 'score_museum'});

CALL algo.closeness.harmonic(
  'MATCH (n:Neighborhood) RETURN id(n) as id',
  'MATCH (tpp:Touristic_point_type {name:\'Bares y cafeterias\'})<-[:type]-(:Tourist_point)-[:is_located]->(n)-[:close_to]->(n2:Neighborhood)
   RETURN id(n) as source, id(n2) as target, count(*) as weight',
  {graph:'cypher', write: true, writeProperty: 'score_cafe'});

CALL algo.closeness.harmonic(
  'MATCH (n:Neighborhood) RETURN id(n) as id',
  'MATCH (tpp:Touristic_point_type {name:\'Bares y pubs musicales\'})<-[:type]-(:Tourist_point)-[:is_located]->(n)-[:close_to]->(n2:Neighborhood)
   RETURN id(n) as source, id(n2) as target, count(*) as weight',
  {graph:'cypher', write: true, writeProperty: 'score_pub'});

CALL algo.closeness.harmonic(
  'MATCH (n:Neighborhood) RETURN id(n) as id',
  'MATCH (tpp:Touristic_point_type {name:\'Arquitectura\'})<-[:type]-(:Tourist_point)-[:is_located]->(n)-[:close_to]->(n2:Neighborhood)
   RETURN id(n) as source, id(n2) as target, count(*) as weight',
  {graph:'cypher', write: true, writeProperty: 'score_architecture'});

MATCH (n:Neighborhood)
MATCH (tpp:Touristic_point_type {name:'Museos'})
WITH tpp, n, n.score_museum as measured_score
REMOVE n.score_museum
WITH tpp, n, measured_score
WHERE measured_score <> 0
MERGE (tpp)-[:availability_in {score: measured_score}]->(n);

MATCH (n:Neighborhood)
MATCH (tpp:Touristic_point_type {name:'Bares y cafeterias'})
WITH tpp, n, n.score_cafe as measured_score
REMOVE n.score_cafe
WITH tpp, n, measured_score
WHERE measured_score <> 0
MERGE (tpp)-[:availability_in {score: measured_score}]->(n);

MATCH (n:Neighborhood)
MATCH (tpp:Touristic_point_type {name:'Bares y pubs musicales'})
WITH tpp, n, n.score_pub as measured_score
REMOVE n.score_pub
WITH tpp, n, measured_score
WHERE measured_score <> 0
MERGE (tpp)-[:availability_in {score: measured_score}]->(n);

MATCH (n:Neighborhood)
MATCH (tpp:Touristic_point_type {name:'Arquitectura'})
WITH tpp, n, n.score_architecture as measured_score
REMOVE n.score_architecture
WITH tpp, n, measured_score
WHERE measured_score <> 0
MERGE (tpp)-[:availability_in {score: measured_score}]->(n);
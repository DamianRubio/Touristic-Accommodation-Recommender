USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM 'file:///turismo.csv' AS line FIELDTERMINATOR ','
MERGE (tpt:Touristic_point_type { name: line['type']})
MERGE (t: Tourist_point {name: line['name']})
MERGE (n:Neighborhood { name:line['neighborhood']})
CREATE (t)-[:type]-> (tpt)
CREATE (t)-[:is_located]-> (n)

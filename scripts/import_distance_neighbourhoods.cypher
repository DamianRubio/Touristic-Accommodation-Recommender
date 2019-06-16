USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM 'file:///distance_neighbourhoods.csv' AS line FIELDTERMINATOR ','
MERGE (n1:Neighborhood { name:line['n1']})
MERGE (n2:Neighborhood { name:line['n2']})
CREATE (n1) -[:close_to]-> (n2) -[:close_to]-> (n1);

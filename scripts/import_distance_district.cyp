// CLOSE_TO LOAD
MATCH (d1:District)<-[:belongs_to]-(n1:Neighborhood)-[:close_to]->(n2:Neighborhood)-[:belongs_to]->(d2:District)
WHERE d1 <> d2
MERGE (d1) -[:close_to]-> (d2) -[:close_to]-> (d1);
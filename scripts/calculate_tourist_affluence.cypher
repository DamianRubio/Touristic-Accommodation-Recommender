MATCH (n:Neighborhood)
MATCH (a:Accomodation)-[:located_in]-> (n)
WITH n,  (n.range18 + n.range24 + n.range35 + n.range50 + n.range60) AS total_population, SUM(toInteger(a.beds)) AS total_turist
SET n.touristic_affluence = toFloat(total_turist)/ total_population

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM 'file:///negocios.csv' AS line FIELDTERMINATOR ','
MERGE (n:Neighborhood { name:line['Nom_Barri'] })
MERGE (b:Business_type { name:line['N_ACT'] })
MERGE (b) -[o:operates_in]-> (n)
ON CREATE SET o.quantity = 0
SET o.quantity = o.quantity + 1;

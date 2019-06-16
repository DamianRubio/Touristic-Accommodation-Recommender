// DISTRICT LOAD
CREATE INDEX ON :District(id);

USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///padron_bcn.csv" AS row FIELDTERMINATOR ','
WITH row AS district
MERGE (d:District {id:district.Codi_Districte, name:district.Nom_Districte});

// NEIGHBORHOOD LOAD
CREATE INDEX ON :Neighborhood(id);

USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///padron_bcn.csv" AS row FIELDTERMINATOR ','
WITH row AS hood
MERGE (n:Neighborhood {id:hood.Codi_Barri, name:hood.Nom_Barri, range18:0, range24:0, range35:0, range50:0, range60:0})
WITH hood, n
MATCH (d:District {id:hood.Codi_Districte})
MERGE (n)-[:belongs_to]->(d);

// 18 RANGES LOAD
WITH ['0 anys', '1 any', '2 anys', '3 anys', '4 anys', '5 anys', '6 anys', '7 anys', '8 anys', '9 anys', '10 anys', '11 anys', '12 anys', '13 anys', '14 anys', '15 anys', '16 anys', '17 anys'] AS range18
LOAD CSV WITH HEADERS FROM "file:///padron_bcn.csv" AS row FIELDTERMINATOR ','
WITH range18, row AS hood
MATCH (n:Neighborhood {id:hood.Codi_Barri})
WITH range18, hood, n
WHERE hood.Edat_any_a_any in range18
SET n.range18 = toInteger(hood.Nombre) + toInteger(n.range18);

// 24 RANGES LOAD
WITH ['18 anys', '19 anys', '20 anys', '21 anys', '22 anys', '23 anys'] AS range24
LOAD CSV WITH HEADERS FROM "file:///padron_bcn.csv" AS row FIELDTERMINATOR ','
WITH range24, row AS hood
MATCH (n:Neighborhood {id:hood.Codi_Barri})
WITH range24, hood, n
WHERE hood.Edat_any_a_any in range24
SET n.range24 = toInteger(hood.Nombre) + toInteger(n.range24);

// 35 RANGES LOAD
WITH ['24 anys', '25 anys', '26 anys', '27 anys', '28 anys', '29 anys', '30 anys', '31 anys', '32 anys', '33 anys', '34 anys'] AS range35
LOAD CSV WITH HEADERS FROM "file:///padron_bcn.csv" AS row FIELDTERMINATOR ','
WITH range35, row AS hood
MATCH (n:Neighborhood {id:hood.Codi_Barri})
WITH range35, hood, n
WHERE hood.Edat_any_a_any in range35
SET n.range35 = toInteger(hood.Nombre) + toInteger(n.range35);

// 50 RANGES LOAD
WITH ['35 anys', '36 anys', '37 anys', '38 anys', '39 anys', '40 anys', '41 anys', '42 anys', '43 anys', '44 anys', '45 anys', '46 anys', '46 anys', '47 anys', '48 anys', '49 anys'] AS range50
LOAD CSV WITH HEADERS FROM "file:///padron_bcn.csv" AS row FIELDTERMINATOR ','
WITH range50, row AS hood
MATCH (n:Neighborhood {id:hood.Codi_Barri})
WITH range50, hood, n
WHERE hood.Edat_any_a_any in range50
SET n.range50 = toInteger(hood.Nombre) + toInteger(n.range50);

// 60 RANGES LOAD
WITH ['50 anys', '51 anys', '52 anys', '53 anys', '54 anys', '55 anys', '56 anys', '57 anys', '58 anys', '59 anys', '60 anys', '61 anys', '62 anys', '63 anys', '64 anys', '65 anys', '66 anys', '67 anys', '68 anys', '69 anys', '70 anys', '71 anys', '72 anys', '73 anys', '74 anys', '75 anys', '76 anys', '77 anys', '78 anys', '79 anys', '80 anys', '81 anys', '82 anys', '83 anys', '84 anys', '85 anys', '86 anys', '87 anys', '88 anys', '89 anys', '90 anys', '91 anys', '92 anys', '93 anys', '94 anys', '95 anys', '96 anys', '97 anys', '98 anys', '99 anys', '100 anys', '101 anys', '102 anys', '103 anys', '104 anys', '105 anys', '106 anys', '107 anys', '108 anys', '109 anys', '110 anys', '111 anys', '112 anys', '113 anys', '114 anys', '115 anys', '116 anys', '117 anys', '118 anys', '119 anys', '120 anys', '121 anys', '122 anys', '123 anys', '124 anys'] AS range60
LOAD CSV WITH HEADERS FROM "file:///padron_bcn.csv" AS row FIELDTERMINATOR ','
WITH range60, row AS hood
MATCH (n:Neighborhood {id:hood.Codi_Barri})
WITH range60, hood, n
WHERE hood.Edat_any_a_any in range60
SET n.range60 = toInteger(hood.Nombre) + toInteger(n.range60);

// SET RANGE PERCENTAGES
MATCH (n:Neighborhood)
WITH n, ((n.range18 + n.range24 + n.range35 + n.range50 + n.range60) * 1.0) AS total_population
SET n.range18_per = toInteger(n.range18) / total_population
WITH n, total_population
SET n.range24_per = toInteger(n.range24) / total_population
WITH n, total_population
SET n.range35_per = toInteger(n.range35) / total_population
WITH n, total_population
SET n.range50_per = toInteger(n.range50) / total_population
WITH n, total_population
SET n.range60_per = toInteger(n.range60) / total_population;
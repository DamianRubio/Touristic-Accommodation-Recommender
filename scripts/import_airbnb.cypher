USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM 'file:///airbnb.csv' AS line FIELDTERMINATOR ','
CREATE (ac:Accomodation { price: line['price'], url: line['listing_url'], beds: line['beds'] })
MERGE (n:Neighborhood { name:line['neighbourhood_cleansed']})
CREATE (ac)-[:located_in]-> (n);

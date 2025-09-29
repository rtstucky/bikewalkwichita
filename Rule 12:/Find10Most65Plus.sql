SELECT
dp1_0024p as percentabove65,
ST_Transform(ST_MakeValid(geom), 4326),
"geo_id"
name
FROM "AgePopulation2020" 
ORDER BY dp1_0024p DESC
LIMIT 10;
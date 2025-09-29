ALTER TABLE "AgePopulation2020"
ADD COLUMN geom geometry;

UPDATE "AgePopulation2020"
SET geom = t.geom
FROM "SedgwickCountyCensusTracts" AS t
WHERE RIGHT("AgePopulation2020"."geo_id", 11) = t."GEOID20";

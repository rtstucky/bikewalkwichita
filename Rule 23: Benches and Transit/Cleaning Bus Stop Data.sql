ALTER TABLE "WichitaBusStops"
ADD COLUMN "BenchRTS" VARCHAR(3); 
UPDATE "WichitaBusStops"
SET "BenchRTS" = CASE
WHEN "Bench" = '1' Or "Bench" = 'X' THEN 'Yes' ELSE 'No' END;

SELECT 
"BenchRTS2",
COUNT ("BenchRTS") as benchcount,
COUNT("BenchRTS")/SUM(COUNT("BenchRTS")) OVER() as perc
FROM "WichitaBusStops"
WHERE "OBJECTID_1" IS NOT NULL
GROUP BY "BenchRTS"


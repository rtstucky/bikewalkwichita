
WITH months AS (
    SELECT generate_series(1,12) AS month
),
years AS (
    SELECT generate_series(2022,2025) AS year
)
INSERT INTO "TransitRidership" (route, month, year, riders)
SELECT
    t."Route" AS route, 
    m.month,
    y.year,
    NULL AS riders    
FROM "TransitRoutes" t
CROSS JOIN months m
CROSS JOIN years y
ORDER BY t."Route", y.year, m.month;

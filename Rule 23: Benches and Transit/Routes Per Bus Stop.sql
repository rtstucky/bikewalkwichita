SELECT 
    b."Stop",
    string_agg(
            DISTINCT r."Route" || ' (' || r."NAME" || ')',
            ', '
        ) AS All_Routes_Served,
    ST_Transform(
        ST_Buffer(ST_Transform(b.geom, 3420), 100),
        4326
    ) AS geom_buffered
FROM "WichitaBusStops" AS b
JOIN "TransitRoutes" AS r
ON ST_Intersects(
    ST_Transform(
        ST_Buffer(ST_Transform(b.geom, 3420), 100),
        4326
    ),
    r.geom
)
GROUP BY 
    b."Stop",
    b.geom;

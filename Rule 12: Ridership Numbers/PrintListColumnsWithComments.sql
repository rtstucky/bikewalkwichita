SELECT
    attname || ': ' || col_description(attrelid, attnum) AS "column: comment"
FROM pg_attribute
WHERE attrelid = '"AgePopulation2020"'::regclass

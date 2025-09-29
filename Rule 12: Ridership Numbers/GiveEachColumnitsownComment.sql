CREATE TEMP TABLE col_comments (
    colname TEXT,
    description TEXT
);

COPY col_comments(colname, description)
FROM '/Users/rts/Desktop/DECENNIALDP2020.DP1_2025-09-25T113533/DECENNIALDP2020.DP1-Column-Metadata.csv'
DELIMITER ','
CSV HEADER;

SELECT 
    'COMMENT ON COLUMN AgePopulation2020."' || colname || '" IS ''' || description || ''';'
FROM col_comments;
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN SELECT * FROM col_comments LOOP
        BEGIN
            EXECUTE 'COMMENT ON COLUMN "AgePopulation2020"."'
                    || lower(r.colname) || '" IS '''
                    || r.description || '''';
        EXCEPTION WHEN undefined_column THEN
            RAISE NOTICE 'Column % not found in AgePopulation2020', r.colname;
        END;
    END LOOP;
END $$;

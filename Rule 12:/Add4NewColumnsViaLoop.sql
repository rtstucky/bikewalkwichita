DO $$
DECLARE
    yr INT;
BEGIN
    FOR yr IN 2022..2025 LOOP
        EXECUTE format('
            ALTER TABLE "TransitRoutes"
            ADD COLUMN IF NOT EXISTS ridership_%s INT;', yr);
    END LOOP;
END $$;

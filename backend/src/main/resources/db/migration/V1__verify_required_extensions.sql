DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'postgis') THEN
        RAISE EXCEPTION 'Required extension postgis is not installed';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'btree_gist') THEN
        RAISE EXCEPTION 'Required extension btree_gist is not installed';
    END IF;
END
$$;

-- Example query (PostgreSQL)
-- SELECT * FROM "CharlotteChaze/BreakIntoTech"."netflix_people";

SELECT 
    "CharlotteChaze/BreakIntoTech"."netflix_titles_info"."title" AS "Title",
    "CharlotteChaze/BreakIntoTech"."netflix_people"."director" AS "Director",
    "CharlotteChaze/BreakIntoTech"."netflix_titles_info"."rating" AS "MPAA Rating"
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
INNER JOIN "CharlotteChaze/BreakIntoTech"."netflix_people"
ON "CharlotteChaze/BreakIntoTech"."netflix_titles_info"."show_id" = "CharlotteChaze/BreakIntoTech"."netflix_people"."show_id";


-- Tips:
-- (*) Table names containing punctuation, capitalization, or spaces should be
--     quoted, e.g. "Test Data.csv".
-- (*) Add more data by using the Upload Data button.
-- (*) Create additional schemas for namespacing your tables, e.g. "CREATE SCHEMA my_schema;".
-- (*) When querying tables created outside of the public (default) schema,
--     be sure to specify the desired schema, e.g. "SELECT * FROM my_schema."my data.csv";".

-- 1) How many movie titles are there in the database? (movies only, not tv shows)
SELECT COUNT(*)
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
WHERE type = 'Movie';
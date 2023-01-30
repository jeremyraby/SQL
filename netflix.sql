-- Example query (PostgreSQL)
-- SELECT * FROM "CharlotteChaze/BreakIntoTech"."netflix_people";

SELECT * FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info";


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

-- Assignment questions
-- 1) How many movie titles are there in the database? (movies only, not tv shows)
SELECT COUNT(*)
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
WHERE type = 'Movie';

-- 2) When was the most recent batch of tv shows and/or movies added to the database?

SELECT MAX(DATE(date_added)) -- DATE converts datetime format to only date, which can then by aggregated
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info";

-- 3) List all the movies and tv shows in alphabetical order.

SELECT title
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
ORDER BY title;

-- 4) Who was the Director for the movie Bright Star?

SELECT director
FROM 
    "CharlotteChaze/BreakIntoTech"."netflix_people" people
LEFT JOIN
    "CharlotteChaze/BreakIntoTech"."netflix_titles_info" titles
ON 
    "people"."show_id" = "titles"."show_id"
WHERE "titles"."title" = 'Bright Star';

-- 5) What is the oldest movie in the database and what year was it made?

SELECT 
    title,
    release_year
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info" titles
WHERE type = 'Movie'
ORDER BY release_year
LIMIT 1;
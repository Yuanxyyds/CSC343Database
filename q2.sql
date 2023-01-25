SET SEARCH_PATH TO ticketchema;
DROP TABLE IF EXISTS q2 CASCADE;

CREATE TABLE q2(
    owner_id INTEGER,
    name VARCHAR(100),
    num INTEGER
);


-- Your query that answers the question goes below the "insert into" line:
-- For each owner existing in Owner table, report the number of their owned Venue.
INSERT INTO q2
    SELECT Owner.owner_id as owner_id, Owner.name as name, count(venue_id) as num
    FROM Owner LEFT JOIN Venue ON Owner.owner_id = Venue.owner_id
    GROUP BY Owner.owner_id, Owner.name
    ORDER BY Owner.owner_id;

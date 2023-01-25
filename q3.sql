SET SEARCH_PATH TO ticketchema;
DROP TABLE IF EXISTS q3 CASCADE;

CREATE TABLE q3(
    venue_id INTEGER,
    name VARCHAR(100),
    percentage Float
);


-- Your query that answers the question goes below the "insert into" line:
-- Report the percentage of accessible seats for each venue. We achieve this by "Natural" Joining Venue, Section, Seat
-- and calculate the percentage by count of accessibility divide by total count of seat after grouping by each venue
INSERT INTO q3
    SELECT Venue.venue_id AS venue_id, Venue.name AS name,
    CAST(sum(CAST(accessibility AS INTEGER)) AS FLOAT)/count(seat_id) AS percentage
    FROM Venue, Section, Seat
    WHERE Venue.venue_id = Section.venue_id AND Section.section_id = Seat.section_id
    GROUP BY Venue.venue_id, Venue.name
    ORDER BY venue_id


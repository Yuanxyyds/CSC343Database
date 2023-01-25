SET SEARCH_PATH TO ticketchema;
DROP TABLE IF EXISTS q1 CASCADE;

CREATE TABLE q1(
    concert_id INTEGER,
    name VARCHAR(100),
    datetime TIMESTAMP,
    value FLOAT,
    percentage FLOAT
);


DROP VIEW IF EXISTS ticketSold CASCADE;
DROP VIEW IF EXISTS ticketWithSectionSold CASCADE;
DROP VIEW IF EXISTS ticketSoldWithPrice CASCADE;
DROP VIEW IF EXISTS concertWithSectionID CASCADE;
DROP VIEW IF EXISTS concertWithCount CASCADE;
DROP VIEW IF EXISTS report CASCADE;

-- ticketSold is a view that stores the concert_id and seat_id of all tickets being sold
CREATE VIEW ticketSold AS
    SELECT concert_id, seat_id
    FROM Ticket NATURAL JOIN Purchase;

-- ticketWithSectionSold is a view that stores concert_id, seat_id, and the section_id of all tickets being sold, where
-- section_id is the section this seat located in order to look for price
CREATE VIEW ticketWithSectionSold AS
    SELECT concert_id, seat_id, section_id
    FROM ticketSold NATURAL JOIN Seat;

-- ticketSoldWithPrice is a view with all tickets being sold associated with the price of that tickets
CREATE VIEW ticketSoldWithPrice AS
    SELECT concert_id, seat_id, price
    FROM ticketWithSectionSold NATURAL JOIN Price;

-- concertWithSectionID contains all possible combination between concerts (concert_id, name, datetime) and the section
-- available (section_id) for this concerts.
CREATE VIEW concertWithSectionID AS
    SELECT concert_id, Concert.name AS name, datetime, section_id
    FROM Concert, Section
    WHERE Concert.venue_id = Section.venue_id;

-- concert With Count contains the total number of seats available (num_seats) for each concerts
-- (concert_id, name, datetime)
CREATE VIEW concertWithCount AS
    SELECT concert_id, concertWithSectionID.name AS name, datetime, count(*) AS num_seats
    FROM Seat, concertWithSectionID
    WHERE Seat.section_id = concertWithSectionID.section_id
    GROUP BY concert_id, concertWithSectionID.name, datetime;

-- Find out the value and percentage as described in question.
CREATE VIEW report AS
    SELECT concert_id, name, datetime,
    CASE WHEN sum(price) IS NULL THEN 0 ELSE sum(price) END AS value,
    CAST(count(seat_id) AS FLOAT)/num_seats as percentage
    FROM concertWithCount NATURAL LEFT JOIN ticketSoldWithPrice
    GROUP BY concert_id, name, datetime, num_seats
    ORDER BY concert_id;




-- Your query that answers the question goes below the "insert into" line:
INSERT INTO q1
    SELECT * FROM report;

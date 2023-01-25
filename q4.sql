SET SEARCH_PATH TO ticketchema;
DROP TABLE IF EXISTS q4 CASCADE;

CREATE TABLE q4(
    username VARCHAR(100),
    num INTEGER
);

DROP VIEW IF EXISTS allUserWithCount CASCADE;

-- We create this table in case none of the registered Users have bought any tickets
CREATE VIEW allUserWithCount AS
    SELECT username, count(ticket_id) as num
    FROM Users NATURAL LEFT JOIN Purchase
    GROUP BY username;

-- Your query that answers the question goes below the "insert into" line:

-- Report the maximum of the num using a sub-query
INSERT INTO q4
    SELECT username, num
    FROM allUserWithCount
    WHERE num >= ALL(SELECT num FROM allUserWithCount)


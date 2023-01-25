DROP SCHEMA IF EXISTS ticketchema CASCADE;
CREATE SCHEMA ticketchema;
SET SEARCH_PATH TO ticketchema;

-- COULD NOT:
    -- Every Venue has at least 10 seats and there is no upper limit
-- DID NOT:
    -- NOT ANY
-- EXTRA CONSTRAINTS:
    -- No two tickets have the same seats at the same concert
    -- Each ticket can be purchased at most once, or not be purchased at all
    -- We add max-length limit for some attributes as shown in the tables below
-- ASSUMPTION:
    -- All seats in the venue are available for every concert
    -- We won't worry about concert durations or end times
    -- Tickets stores the information about the seat
    -- Users get the ticket immediately after purchasing
    -- Every concert has post its price for each section
    -- Each Venue has at least one section
    -- All section and seats must be well-defined when a venue is added to table


-- A Table of Owners, owner_id is the identifier of the Owner, phone_number is the unique phone_number of the owner,
-- name is the name (not unique) of the owner.
CREATE TABLE Owner  (
    owner_id INTEGER PRIMARY KEY,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL
);

-- A Table of Venues, venue_id is the identifier of the venue, name is the name (not unique) of the venue,
-- city and street_address are strings specifying the location of the venue, and owner_id is the owner of this venue.
CREATE TABLE Venue(
    venue_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(15) NOT NULL,
    street_address VARCHAR(100) NOT NULL,
    owner_id INTEGER NOT NULL REFERENCES Owner      -- All venues have a single owner is enforced here, and
                                                    -- Some people/organization own multiple venues is enforced here.
);

-- A Table of Concerts, concert_id is the identifier of the concert, name is the title (not unique) of the concert,
-- datetime is when this concert is held, venue_id indicates which Venue this concert is held in.
CREATE TABLE Concert(
    concert_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    datetime TIMESTAMP NOT NULL,
    venue_id INTEGER NOT NULL REFERENCES Venue,
    UNIQUE (venue_id, datetime)                     -- A Venue can only have one concert at a time is enforced here.
);

-- A Table of Section, with the unique identifier section_id, a venue_id telling which venue this section belongs to,
-- and the name of this section.
CREATE TABLE Section(
    section_id INTEGER PRIMARY KEY,
    venue_id INTEGER NOT NULL REFERENCES Venue,
    name VARCHAR(25) NOT NULL,
    UNIQUE (venue_id, name)                       -- Section name is unique in single venue but not all venues
                                                  -- is enforced here.
);

-- A Table of Seats, with the unique identifier seat_id, name/label (not unique) of this seat, the section_id which
-- this seat is located, and a boolean attribute accessibility.
CREATE TABLE Seat(
    seat_id INTEGER PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    section_id INTEGER NOT NULL REFERENCES Section,
    accessibility BOOLEAN NOT NULL DEFAULT FALSE,
    UNIQUE (name, section_id)                      -- Seat name is unique in single section but not all
                                                   -- sections is enforced here.
);

-- A table of Users, with unique identifier username, and the real name of the user
CREATE TABLE Users(
    username VARCHAR(15) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- A table of Price, which price is determined by concert_id, section_id.
CREATE TABLE Price(
    concert_id INTEGER NOT NULL REFERENCES Concert,
    section_id INTEGER NOT NULL REFERENCES Section,
    price FLOAT NOT NULL,
    PRIMARY KEY (concert_id, section_id)
);

-- A table of Tickets, ticket_id is the unique identifier of this ticket, concert_id is the concert this ticket using
-- for, seat_id is the seat on this ticket.
CREATE TABLE Ticket(
    ticket_id INTEGER PRIMARY KEY,
    concert_id INTEGER NOT NULL REFERENCES Concert,
    seat_id INTEGER NOT NULL REFERENCES Seat,
    UNIQUE (concert_id, seat_id)                    -- No two tickets have the same seats at the same concert.
);

-- A table of Purchase history, username is the username of buyer, datetime is the date and time of purchase, and the
-- ticket_id is the ticket purchased. A user can purchase one or more tickets to any concert is enforced here.
CREATE TABLE Purchase(
    username VARCHAR(50) NOT NULL REFERENCES Users,
    datetime TIMESTAMP NOT NULL,
    ticket_id INTEGER PRIMARY KEY REFERENCES Ticket -- Each ticket belongs to zero or one Purchase is enforced.
);



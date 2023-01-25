SET SEARCH_PATH TO ticketchema;

INSERT INTO Owner(owner_id, phone_number, name) VALUES
    (1, '647-666-6666', 'The Corporation of Massey Hall and Roy Thomson Hall'),
    (2, '647-555-5555', 'Maple Leaf Sports & Entertainment');

INSERT INTO Venue(venue_id, name, city, street_address, owner_id) VALUES
	(101, 'Massey Hall', 'Toronto', '178 Victoria Street',  1),
	(102, 'Roy Thomson Hall', 'Toronto', '60 Simcoe St',  1),
	(103, 'ScotiaBank Arena', 'Toronto', '40 Bay St',  2);


INSERT INTO Concert(concert_id, name, datetime, venue_id) VALUES
	(201, 'Ron Sexsmith', '2022-12-03 19:30', 101),
	(202, 'Women''s Blues Review', '2022-11-25 20:00', 101),
	(203, 'Mariah Carey - Merry Christmas', '2022-12-09 20:00', 103),
	(204, 'Mariah Carey - Merry Christmas', '2022-12-11 20:00', 103),
	(205, 'TSO - Elf', '2022-12-09 19:30', 102),
	(206, 'TSO - Elf', '2022-12-10 14:30', 102),
	(207, 'TSO - Elf', '2022-12-10 19:30', 102);


INSERT INTO Section(section_id, venue_id, name) VALUES
	-- Massey Hall
	(301, 101, 'floor'),
	(302, 101, 'balcony'),
	-- Roy Thomson Hall
	(303, 102, 'main hall'),
	-- ScotiaBank Arena
	(304, 103, '100'),
	(305, 103, '200'),
	(306, 103, '300');


INSERT INTO Seat(seat_id, name, section_id, accessibility) VALUES
	-- floor
	(401, 'A1', 301, TRUE),
	(402, 'A2', 301, TRUE),
	(403, 'A3', 301, TRUE),
	(404, 'A4', 301, FALSE),
	(405, 'A5', 301, FALSE),
	(406, 'A6', 301, FALSE),
	(407, 'A7', 301, FALSE),
	(408, 'A8', 301, FALSE),
	(409, 'A9', 301, FALSE),
	(410, 'A10', 301, FALSE),
	(411, 'B1', 301, FALSE),
	(412, 'B2', 301, FALSE),
	(413, 'B3', 301, FALSE),
	(414, 'B4', 301, FALSE),
	(415, 'B5', 301, FALSE),
	(416, 'B6', 301, FALSE),
	(417, 'B7', 301, FALSE),
	(418, 'B8', 301, TRUE),
	(419, 'B9', 301, TRUE),
	(420, 'B10', 301, TRUE),
	-- Balcony
	(421, 'C1', 302, FALSE),
	(422, 'C2', 302, FALSE),
	(423, 'C3', 302, FALSE),
	(424, 'C4', 302, FALSE),
	(425, 'C5', 302, FALSE),
	-- Main Hall
	(426, 'AA1', 303, FALSE),
	(427, 'AA2', 303, FALSE),
	(428, 'AA3', 303, FALSE),
	(429, 'BB1', 303, FALSE),
	(430, 'BB2', 303, FALSE),
	(431, 'BB3', 303, FALSE),
	(432, 'BB4', 303, FALSE),
	(433, 'BB5', 303, FALSE),
	(434, 'BB6', 303, FALSE),
	(435, 'BB7', 303, FALSE),
	(436, 'BB8', 303, FALSE),
	(437, 'CC1', 303, FALSE),
	(438, 'CC2', 303, FALSE),
	(439, 'CC3', 303, FALSE),
	(440, 'CC4', 303, FALSE),
	(441, 'CC5', 303, FALSE),
	(442, 'CC6', 303, FALSE),
	(443, 'CC7', 303, FALSE),
	(444, 'CC8', 303, FALSE),
	(445, 'CC9', 303, FALSE),
	(446, 'CC10', 303, FALSE),
	-- 100
	(447, 'row 1, seat 1', 304, TRUE),
	(448, 'row 1, seat 2', 304, TRUE),
	(449, 'row 1, seat 3', 304, TRUE),
	(450, 'row 1, seat 4', 304, TRUE),
	(451, 'row 1, seat 5', 304, TRUE),
	(452, 'row 2, seat 1', 304, TRUE),
	(453, 'row 2, seat 2', 304, TRUE),
	(454, 'row 2, seat 3', 304, TRUE),
	(455, 'row 2, seat 4', 304, TRUE),
	(456, 'row 2, seat 5', 304, TRUE),
	-- 200
	(457, 'row 1, seat 1', 305, FALSE),
	(458, 'row 1, seat 2', 305, FALSE),
	(459, 'row 1, seat 3', 305, FALSE),
	(460, 'row 1, seat 4', 305, FALSE),
	(461, 'row 1, seat 5', 305, FALSE),
	(462, 'row 2, seat 1', 305, FALSE),
	(463, 'row 2, seat 2', 305, FALSE),
	(464, 'row 2, seat 3', 305, FALSE),
	(465, 'row 2, seat 4', 305, FALSE),
	(466, 'row 2, seat 5', 305, FALSE),
	-- 300
	(467, 'row 1, seat 1', 306, FALSE),
	(468, 'row 1, seat 2', 306, FALSE),
	(469, 'row 1, seat 3', 306, FALSE),
	(470, 'row 1, seat 4', 306, FALSE),
	(471, 'row 1, seat 5', 306, FALSE),
	(472, 'row 2, seat 1', 306, FALSE),
	(473, 'row 2, seat 2', 306, FALSE),
	(474, 'row 2, seat 3', 306, FALSE),
	(475, 'row 2, seat 4', 306, FALSE),
	(476, 'row 2, seat 5', 306, FALSE);



INSERT INTO Users(username, name) VALUES
	('ahightower', 'Alicent Hightower'),
	('d_targaryen', 'Daemon Targaryen'),
	('cristonc', 'Criston Cole');


INSERT INTO Price(concert_id, section_id, price) VALUES
	(201, 301, 130),
	(201, 302, 99),
	(202, 301, 150),
	(202, 302, 125),
	(203, 304, 986),
	(203, 305, 244),
	(203, 306, 176),
	(204, 304, 936),
	(204, 305, 194),
	(204, 306, 126),
	(205, 303, 159),
	(206, 303, 159),
	(207, 303, 159);

-- Note: Every seat in every concert_id should have a ticket, but in this case, we only show what we are interested.
INSERT INTO Ticket(ticket_id, concert_id, seat_id) VALUES
    (501, 202, 405),
    (502, 202, 422),
    (503, 201, 413),
    (504, 207, 435),
    (505, 203, 449),
    (506, 204, 464),
    (507, 204, 465);


INSERT INTO Purchase(username, datetime, ticket_id) VALUES
	('ahightower', '2022-11-09 19:31', 501),
	('ahightower', '2022-11-09 19:32', 502),
	('d_targaryen', '2022-11-09 19:33', 503),
	('d_targaryen', '2022-11-09 19:34', 504),
	('cristonc', '2022-11-09 19:35', 505),
	('cristonc', '2022-11-09 19:36', 506),
	('cristonc', '2022-11-09 19:37', 507);



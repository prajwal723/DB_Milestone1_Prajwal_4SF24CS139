SELECT 
    m.movie_name,
    COUNT(b.book_id) AS total
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
GROUP BY m.movie_id
ORDER BY total DESC
LIMIT 1;





SELECT 
    b.book_id,
    m.movie_name,
    t.t_name,
    s.show_time,
    count(se.seat_no) as seats_booked
FROM Bookings b
JOIN Booking_Users bu ON b.book_id = bu.booking_id
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
JOIN Screens sc ON s.screen_id = sc.screen_id
JOIN Theatre t ON sc.theatre_id = t.t_id
JOIN BookedSeats bs ON b.book_id = bs.bookid
JOIN Seats se ON bs.seatid = se.seat_id
WHERE bu.user_id = 1
GROUP BY b.book_id;






SELECT 
    s.show_id,
    s.show_time,
    COUNT(bs.seatid) AS booked
FROM Shows s
JOIN Screens sc ON s.screen_id = sc.screen_id
JOIN Theatre t ON sc.theatre_id = t.t_id
LEFT JOIN BookedSeats bs ON s.show_id = bs.showid
WHERE t.t_id = 1
GROUP BY s.show_id;





BEGIN TRANSACTION;

SELECT *
FROM BookedSeats
WHERE showid = 1 AND seatid IN (1,2);


INSERT INTO Bookings 
VALUES (101, 'Confirmed', 500, 1, 1);

INSERT INTO Booking_Users VALUES (101, 1);
INSERT INTO Booking_Users VALUES (101, 2);

INSERT INTO BookedSeats VALUES (1, 1, 101, 1);
INSERT INTO BookedSeats VALUES (1, 2, 101, 2);

COMMIT;

CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY,
    user_name VARCHAR(100),
    user_email VARCHAR(100) UNIQUE
);


CREATE TABLE Movies (
    movie_id INTEGER PRIMARY KEY,
    movie_name VARCHAR(100)
);


CREATE TABLE Theatres (
    theatre_id INTEGER PRIMARY KEY,
    theatre_name VARCHAR(100),
    theatre_location VARCHAR(100)
);


CREATE TABLE Screens (
    screen_id INTEGER PRIMARY KEY,
    theatre_id INT,
    screen_no INT,
    FOREIGN KEY (theatre_id) REFERENCES Theatres(theatre_id),
    UNIQUE (theatre_id, screen_no)
);


CREATE TABLE Shows (
    show_id INTEGER PRIMARY KEY,
    movie_id INT,
    screen_id INT,
    show_time DATETIME,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);


CREATE TABLE Seats (
    seat_id INTEGER PRIMARY KEY,
    screen_id INT,
    seat_no VARCHAR(10),
    seat_type VARCHAR(20),
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id),
    UNIQUE (screen_id, seat_no)
);


CREATE TABLE Payments (
    payment_id INTEGER PRIMARY KEY,
    payment_status VARCHAR(20),
    payment_time DATETIME
);



CREATE TABLE Bookings (
    booking_id INTEGER PRIMARY KEY,
    user_id INT,
    show_id INT,
    payment_id INT,
    booking_status VARCHAR(20),
    total_price DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id),
    FOREIGN KEY (payment_id) REFERENCES Payments(payment_id)
);


CREATE TABLE Booked_Seats (
    show_id INT,
    seat_id INT,
    booking_id INT,
    PRIMARY KEY (show_id, seat_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);



INSERT INTO Users (user_id, user_name, user_email) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Alice Smith', 'alice@example.com'),
(3, 'Bob Lee', 'bob@example.com');


INSERT INTO Movies (movie_id, movie_name) VALUES
(1, 'Inception'),
(2, 'Avengers'),
(3, 'Interstellar');


INSERT INTO Theatres (theatre_id, theatre_name, theatre_location) VALUES
(1, 'PVR', 'Bangalore'),
(2, 'INOX', 'Mumbai'),
(3, 'Cinepolis', 'Delhi');


INSERT INTO Screens (screen_id, theatre_id, screen_no) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1);


INSERT INTO Shows (show_id, movie_id, screen_id, show_time) VALUES
(1, 1, 1, '2026-05-01 10:00:00'),
(2, 2, 2, '2026-05-01 14:00:00'),
(3, 3, 3, '2026-05-01 18:00:00');


INSERT INTO Seats (seat_id, screen_id, seat_no, seat_type) VALUES
(1, 1, 'A1', 'Regular'),
(2, 1, 'A2', 'Regular'),
(3, 2, 'B1', 'Premium');


INSERT INTO Payments (payment_id, payment_status, payment_time) VALUES
(1, 'Paid', '2026-05-01 09:50:00'),
(2, 'Paid', '2026-05-01 13:50:00'),
(3, 'Pending', '2026-05-01 17:50:00');


INSERT INTO Bookings (booking_id, user_id, show_id, payment_id, booking_status, total_price) VALUES
(1, 1, 1, 1, 'Confirmed', 500.00),
(2, 2, 2, 2, 'Confirmed', 600.00),
(3, 3, 3, 3, 'Pending', 450.00);



INSERT INTO Booked_Seats (show_id, seat_id, booking_id) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 2, 3);


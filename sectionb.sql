
CREATE TABLE Users (
    u_id INT PRIMARY KEY,
    u_name VARCHAR(100),
    u_email VARCHAR(100) UNIQUE
);

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100)
);

CREATE TABLE Theatre (
    t_id INT PRIMARY KEY,
    t_name VARCHAR(100),
    t_location VARCHAR(100)
);

CREATE TABLE Screens (
    screen_id INT PRIMARY KEY,
    screen_no INT,
    theatre_id INT,
    FOREIGN KEY (theatre_id) REFERENCES Theatre(t_id),
    UNIQUE (theatre_id, screen_no)
);

CREATE TABLE Shows (
    show_id INT PRIMARY KEY,
    show_time DATETIME,
    screen_id INT,
    movie_id INT,
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

CREATE TABLE Seat_Type (
    type_id INT PRIMARY KEY,
    seat_type VARCHAR(50)
);

CREATE TABLE Seats (
    seat_id INT PRIMARY KEY,
    seat_no VARCHAR(10),
    screen_id INT,
    type_id INT,
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id),
    FOREIGN KEY (type_id) REFERENCES Seat_Type(type_id),
    UNIQUE (screen_id, seat_no)
);

CREATE TABLE Payment (
    p_id INT PRIMARY KEY,
    status VARCHAR(50),
    time DATETIME
);

CREATE TABLE Bookings (
    book_id INT PRIMARY KEY,
    book_status VARCHAR(50),
    totalprice DECIMAL(10,2),
    u_id INT,
    show_id INT,
    p_id INT,
    FOREIGN KEY (u_id) REFERENCES Users(u_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id),
    FOREIGN KEY (p_id) REFERENCES Payment(p_id)
);

CREATE TABLE BookedSeats (
    seatid INT,
    showid INT,
    bookid INT,
    PRIMARY KEY (showid, seatid),
    FOREIGN KEY (seatid) REFERENCES Seats(seat_id),
    FOREIGN KEY (showid) REFERENCES Shows(show_id),
    FOREIGN KEY (bookid) REFERENCES Bookings(book_id)
);

CREATE TABLE Pricing (
    pricingid INT PRIMARY KEY,
    showid INT,
    type_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (showid) REFERENCES Shows(show_id),
    FOREIGN KEY (type_id) REFERENCES Seat_Type(type_id),
    UNIQUE (showid, type_id)
);

CREATE TABLE Languages (
    lang_id INT PRIMARY KEY,
    language VARCHAR(50)
);

CREATE TABLE Movie_Lang (
    movie_id INT,
    lang_id INT,
    PRIMARY KEY (movie_id, lang_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (lang_id) REFERENCES Languages(lang_id)
);

CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50)
);

CREATE TABLE Movie_Genre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);










updates:

CREATE TABLE Booking_Users (
    booking_id INT,
    user_id INT,
    PRIMARY KEY (booking_id, user_id),
    FOREIGN KEY (booking_id) REFERENCES Bookings(book_id),
    FOREIGN KEY (user_id) REFERENCES Users(u_id)
);



DROP TABLE Bookings ;


CREATE TABLE Bookings (
    book_id INT PRIMARY KEY,
    book_status VARCHAR(50),
    total_price DECIMAL(10,2),
    show_id INT,
    p_id INT,
    FOREIGN KEY (show_id) REFERENCES Shows(show_id),
    FOREIGN KEY (p_id) REFERENCES Payment(p_id)
);


DROP TABLE BookedSeats ;


CREATE TABLE BookedSeats (
    showid INT,
    seatid INT,
    bookid INT,
    user_id INT,
    PRIMARY KEY (showid, seatid),
    FOREIGN KEY (showid) REFERENCES Shows(show_id),
    FOREIGN KEY (seatid) REFERENCES Seats(seat_id),
    FOREIGN KEY (bookid) REFERENCES Bookings(book_id),
    FOREIGN KEY (user_id) REFERENCES Users(u_id)
);





INSERT INTO Users VALUES
(1, 'John', 'john@gmail.com'),
(2, 'Alice', 'alice@gmail.com'),
(3, 'Bob', 'bob@gmail.com');

INSERT INTO Movies VALUES
(1, 'Inception'),
(2, 'Avengers'),
(3, 'Interstellar');

INSERT INTO Theatre VALUES
(1, 'PVR', 'Bangalore'),
(2, 'INOX', 'Mumbai'),
(3, 'Cinepolis', 'Delhi');

INSERT INTO Screens VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1);

INSERT INTO Shows VALUES
(1, '2026-05-01 10:00:00', 1, 1),
(2, '2026-05-01 14:00:00', 2, 2),
(3, '2026-05-01 18:00:00', 3, 3);

INSERT INTO Seat_Type VALUES
(1, 'Regular'),
(2, 'Premium'),
(3, 'VIP');

INSERT INTO Seats VALUES
(1, 'A1', 1, 1),
(2, 'A2', 1, 1),
(3, 'B1', 2, 2);

INSERT INTO Payment VALUES
(1, 'Paid', '2026-05-01 09:50:00'),
(2, 'Paid', '2026-05-01 13:50:00'),
(3, 'Pending', '2026-05-01 17:50:00');

INSERT INTO Bookings VALUES
(1, 'Confirmed', 500, 1, 1),
(2, 'Confirmed', 600, 2, 2),
(3, 'Pending', 450, 3, 3);

INSERT INTO Booking_Users VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1);

INSERT INTO BookedSeats VALUES
(1, 1, 1, 1),
(1, 2, 1, 2),
(2, 3, 2, 2),
(3, 2, 3, 1);

INSERT INTO Pricing VALUES
(1, 1, 1, 200),
(2, 1, 2, 300),
(3, 2, 2, 400);

INSERT INTO Languages VALUES
(1, 'English'),
(2, 'Hindi'),
(3, 'Tamil');

INSERT INTO Movie_Lang VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3);

INSERT INTO Genre VALUES
(1, 'Action'),
(2, 'Sci-Fi'),
(3, 'Drama');

INSERT INTO Movie_Genre VALUES
(1, 2),
(2, 1),
(3, 3);
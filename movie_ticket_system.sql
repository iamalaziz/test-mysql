DROP DATABASE IF EXISTS movie_tickets_system;
CREATE DATABASE movie_tickets_system; 
USE movie_tickets_system;


CREATE TABLE movie (
    id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    language VARCHAR(11) NOT NULL,
    duration INT NOT NULL,
    PRIMARY KEY (id)
);

-- MOVIE MOCK DATA

INSERT INTO movie VALUES (1, 'Spiderman', 'Fantastic', 'english', '93');
INSERT INTO movie VALUES (2, 'The Dark Knight', 'Action', 'english', '152');
INSERT INTO movie VALUES (3, 'Inception', 'Thriller', 'russian', '148');
INSERT INTO movie VALUES (4, 'The Shawshank Redemption', 'Drama', 'english', '142');
INSERT INTO movie VALUES (5, 'Interstellar', 'Sci-Fi', 'korean', '169');


CREATE TABLE ticket (
    id INT NOT NULL,
    seat_number VARCHAR(4) NOT NULL,
    price DECIMAL(10, 2) not null,
    fk_movie_id INT NOT NULL,
    type ENUM('front', 'middle', 'balcony') NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY(fk_movie_id) REFERENCES movie(id)
);

-- TICKET MOCK DATA

INSERT INTO ticket VALUES (1, '23', '32', 1, 'front');
INSERT INTO ticket VALUES (2, '47', '22', 1, 'middle');
INSERT INTO ticket VALUES (3, '53', '22', 2, 'middle');
INSERT INTO ticket VALUES (4, '93', '12', 1, 'balcony');
INSERT INTO ticket VALUES (5, '104', '12', 4, 'balcony');
INSERT INTO ticket VALUES (6, '57', '22', 5, 'middle');

CREATE TABLE user (
    id INT NOT NULL,
    username VARCHAR(50) NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    PRIMARY KEY (id),
    UNIQUE (username)
);

-- USER MOCK DATA

INSERT INTO user (id, username, firstname, lastname, age, email, password, phone)
VALUES 
    (1, 'john12', 'John', 'Doe', 21, 'john12@gmail.com', '1234', '123-456-7890'),
    (2, 'jane32', 'Jane', 'Smith', 24, 'jane32@gmail.com', '1234', '987-654-3210'),
    (3, 'alice_', 'Alice', 'Johnson', 65, 'alice_here@gmail.com', '1234', '456-789-0123'),
    (4, 'bob#', 'Bob', 'Brown', 32, 'bob@gmail.com', '1234', '789-012-3456'),
    (5, 'iamemily', 'Emily', 'Davis', 17, 'iamemily@gmail.com', '1234', '012-345-6789');

CREATE TABLE schedule (
    id INT NOT NULL,
    time TIME NOT NULL,
    date DATE NOT NULL,
    seats_remaining INT CHECK (seats_remaining >= 0),
    fk_movie_id INT NOT NULL,
    fk_theater INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_movie_id) REFERENCES movie(id)
);

INSERT INTO schedule (id, time, date, seats_remaining, fk_movie_id, fk_theater)
VALUES
    (1, '10:00', '2024-04-05', 100, 1, 1),
    (2, '13:00', '2024-04-05', 120, 2, 2), 
    (3, '15:30', '2024-04-06', 80, 1, 1),  
    (4, '18:00', '2024-04-06', 90, 3, 2),  
    (5, '20:30', '2024-04-07', 110, 2, 1);

CREATE TABLE purchase (
	id INT NOT NULL,
    card_number VARCHAR(16) NOT NULL,
    card_name VARCHAR(255) NOT NULL,
    number_of_tickets INT NOT NULL,
    total_cost INT NOT NULL,
    status ENUM('completed', 'cancelled') NOT NULL,
    fk_ticket_id INT NOT NULL,
    fk_user_id INT NOT NULL,
    fk_schedule_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_ticket_id) REFERENCES ticket (id),
    FOREIGN KEY(fk_user_id) REFERENCES user (id),
    FOREIGN KEY(fk_schedule_id) REFERENCES schedule (id)
);

INSERT INTO purchase (id, card_number, card_name, number_of_tickets, total_cost, status, fk_ticket_id, fk_user_id, fk_schedule_id)
VALUES
    (1, '1234567890123456', 'John Doe', 1, 32, 'completed', 1, 1, 1), 
    (2, '2345678901234567', 'Jane Smith', 1, 22, 'completed', 2, 2, 2), 
    (3, '3456789012345678', 'Alice Johnson', 1, 22, 'completed', 3, 3, 3),
    (4, '4567890123456789', 'Bob Williams', 1, 12, 'completed', 4, 4, 4),
    (5, '5678901234567890', 'Emily Davis', 1, 12, 'completed', 5, 5, 5);

CREATE TABLE theater (
	id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO theater (id, name)
VALUES
    (1, 'Theater A'), 
    (2, 'Theater B'), 
    (3, 'Theater C'), 
    (4, 'Theater D'), 
    (5, 'Theater E'); 
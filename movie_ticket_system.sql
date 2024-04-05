DROP DATABASE IF EXISTS `movie_tickets_system`;
CREATE DATABASE `movie_tickets_system`; 
USE `movie_tickets_system`;

CREATE TABLE `ticket` (
    `ticket_id` INT(11) NOT NULL,
    `seat_number` VARCHAR(4) NOT NULL,
    `price` DECIMAL(10, 2) not null,
    -- `type` ENUM('front', 'middle', 'balcony') NOT NULL,
	PRIMARY KEY (`ticket_id`)
);

CREATE TABLE `movie` (
    `movie_id` INT(11) NOT NULL,
    `title` VARCHAR(50) NOT NULL,
    `genre` VARCHAR(255) NOT NULL,
    `language` VARCHAR(11) NOT NULL,
    `duration` INT(5) NOT NULL,
    PRIMARY KEY (`movie_id`)
);

CREATE TABLE `user` (
    `user_id` INT(11) NOT NULL,
    `username` VARCHAR(50) NOT NULL,
    `firstname` VARCHAR(50) NOT NULL,
    `lastname` VARCHAR(50) NOT NULL,
    `age` INT(2) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(20),
    PRIMARY KEY (`user_id`)
);

CREATE TABLE `schedule` (
	`schedule_id` INT(11) NOT NULL,
    `time` TIME NOT NULL,
    `date` DATE NOT NULL,
    
    
);

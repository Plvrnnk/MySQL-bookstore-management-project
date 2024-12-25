CREATE DATABASE Bookstore;
USE Bookstore;

CREATE TABLE Workers (
	worker_id INT NOT NULL PRIMARY KEY, 
    worker_name VARCHAR(30) NOT NULL,
    worker_surname VARCHAR(30) NOT NULL,
    job VARCHAR(30) NOT NULL,
    worker_phone VARCHAR(30) NOT NULL UNIQUE,
    worker_start DATE NOT NULL, 
    last_changes DATETIME NOT NULL,
    IP_adress VARCHAR(20) NOT NULL
);
INSERT INTO Workers
VALUES (1, 'Olena', 'Ivanova', 'Manager', '+380501234567', '2022-01-15', '2024-11-19 10:15:30', '192.168.1.1'),
	   (2, 'Andriy', 'Shevchenko', 'Sales', '+380671234567', '2023-03-01', '2024-11-18 16:00:45', '192.168.1.2'),
	   (3, 'Viktor', 'Petrenko', 'Accountant', '+380931234567', '2021-07-10', '2024-11-17 09:25:10', '192.168.1.3'),
	   (4, 'Nadiya', 'Koval', 'HR', '+380661234567', '2020-10-05', '2024-11-19 11:05:00', '192.168.1.4'),
	   (5, 'Oleg', 'Bondar', 'IT Specialist', '+380731234567', '2022-12-01', '2024-11-19 08:40:20', '192.168.1.5');

SELECT * FROM Workers;
-- ----------------------------------------------------------------------------------------------------
CREATE TABLE Clients (
	client_id INT NOT NULL PRIMARY KEY,
    client_name VARCHAR(30) NOT NULL,
    client_surname VARCHAR(30) NOT NULL,
    client_phone VARCHAR(30) NOT NULL UNIQUE,
    city VARCHAR(10) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    post_office VARCHAR(10) NOT NULL,
    FOREIGN KEY (worker_id) references Workers(worker_id),
    last_changes DATETIME NOT NULL,
    IP_adress VARCHAR(20) NOT NULL
);

INSERT INTO Clients 
VALUES (1, 'Iryna', 'Shevchenko', '+380501112233', 'Kyiv', '01001', 'Nova poshta', 2, '2024-11-19 10:30:00', '192.168.10.1'),
	   (2, 'Oleksandr', 'Kravchenko', '+380671234567', 'Lviv', '79000', 'Ukrposhta', 3, '2024-11-18 14:45:30', '192.168.10.2'),
	   (3, 'Oksana', 'Bondar', '+380931556677', 'Odesa', '65000', 'Meest', 1, '2024-11-19 11:00:00', '192.168.10.3'),
	   (4, 'Dmytro', 'Taran', '+380661234555', 'Dnipro', '49000', 'Nova poshta', 4, '2024-11-19 12:15:00', '192.168.10.4'),
	   (5, 'Tetiana', 'Ivanko', '+380731223344', 'Kharkiv', '61000', 'Meest', 5, '2024-11-19 08:50:00', '192.168.10.5');

SELECT * FROM Clients;
-- ----------------------------------------------------------------------------------------------------
CREATE TABLE Books (
	book_id INT NOT NULL PRIMARY KEY,
    book_name VARCHAR(30) NOT NULL,
    author VARCHAR(30) NOT NULL,
    genre VARCHAR(30) NOT NULL,
    publisher VARCHAR(30) NOT NULL,
    price DECIMAL(5,2),
    FOREIGN KEY (worker_id) references Workers(worker_id),
    last_changes DATETIME NOT NULL,
    IP_adress VARCHAR(20) NOT NULL
);

INSERT INTO Books
VALUES (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 'Scribner', 12.99, 1, '2024-11-19 14:00:00', '192.168.20.1'),
	   (2, '1984', 'George Orwell', 'Dystopian', 'Secker & Warburg', 9.99, 2, '2024-11-19 14:15:30', '192.168.20.2'),
	   (3, 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 'J.B. Lippincott & Co.', 10.50, 3, '2024-11-19 14:30:00', '192.168.20.3'),
	   (4, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 'Allen & Unwin', 14.25, 4, '2024-11-19 14:45:00', '192.168.20.4'),
	   (5, 'Pride and Prejudice', 'Jane Austen', 'Romance', 'T. Egerton', 8.75, 5, '2024-11-19 15:00:00', '192.168.20.5'),
	   (6, 'Moby-Dick', 'Herman Melville', 'Adventure', 'Harper & Brothers', 11.99, 2, '2024-11-19 15:15:00', '192.168.20.6'),
	   (7, 'War and Peace', 'Leo Tolstoy', 'Historical', 'The Russian Messenger', 20.50, 3, '2024-11-19 15:30:00', '192.168.20.7'),
	   (8, 'The Picture of Dorian Gray', 'Oscar Wilde', 'Philosophical', 'Ward, Lock & Co.', 14.75, 4, '2024-11-19 15:45:00', '192.168.20.8'),
	   (9, 'Brave New World', 'Aldous Huxley', 'Dystopian', 'Chatto & Windus', 13.00, 5, '2024-11-19 16:00:00', '192.168.20.9'),
	   (10, 'The Catcher in the Rye', 'J.D. Salinger', 'Coming-of-Age', 'Little, Brown and Company', 9.50, 1, '2024-11-19 16:15:00', '192.168.20.10'),
	   (11, 'Dracula', 'Bram Stoker', 'Horror', 'Archibald Constable and Company', 15.99, 2, '2024-11-19 16:30:00', '192.168.20.11'),
	   (12, 'Don Quixote', 'Miguel de Cervantes', 'Classic', 'Francisco de Robles', 18.25, 3, '2024-11-19 16:45:00', '192.168.20.12'),
	   (13, 'The Odyssey', 'Homer', 'Epic', 'Ancient Greece', 12.40, 4, '2024-11-19 17:00:00', '192.168.20.13'),
	   (14, 'Frankenstein', 'Mary Shelley', 'Horror', 'Lackington, Hughes, Harding, Mavor & Jones', 10.99, 5, '2024-11-19 17:15:00', '192.168.20.14'),
	   (15, 'Jane Eyre', 'Charlotte Brontë', 'Romance', 'Smith, Elder & Co.', 9.80, 1, '2024-11-19 17:30:00', '192.168.20.15');

SELECT * FROM Books;
-- ----------------------------------------------------------------------------------------------------
CREATE TABLE BookStorage (
	storage_id INT NOT NULL PRIMARY KEY,
    availability BOOL NOT NULL,
    FOREIGN KEY (book_id) references Books(book_id),
    amount DECIMAL(5,2),
    FOREIGN KEY (worker_id) references Workers(worker_id),
    last_changes DATETIME NOT NULL,
    IP_adress VARCHAR(20) NOT NULL
);

INSERT INTO BookStorage
VALUES (1, 20, TRUE, 1, 240.00, 1, '2024-11-19 19:45:00', '192.168.30.1'),
	   (2, 15, TRUE, 2, 149.85, 2, '2024-11-19 20:00:00', '192.168.30.2'),
	   (3, 0, FALSE, 3, 0.00, 3, '2024-11-19 20:15:00', '192.168.30.3'),
	   (4, 10, TRUE, 4, 142.50, 4, '2024-11-19 20:30:00', '192.168.30.4'),
	   (5, 5, TRUE, 5, 43.75, 5, '2024-11-19 20:45:00', '192.168.30.5'),
	   (6, 8, TRUE, 6, 95.92, 2, '2024-11-19 21:00:00', '192.168.30.6'),
	   (7, 12, TRUE, 7, 131.88, 3, '2024-11-19 21:15:00', '192.168.30.7'),
	   (9, 18, TRUE, 9, 234.00, 5, '2024-11-19 21:45:00', '192.168.30.9'),
	   (10, 7, TRUE, 10, 66.50, 1, '2024-11-19 22:00:00', '192.168.30.10'),
	   (11, 0, FALSE, 11, 63.96, 2, '2024-11-19 22:15:00', '192.168.30.11'),
	   (12, 9, TRUE, 12, 164.25, 3, '2024-11-19 22:30:00', '192.168.30.12'),
	   (13, 6, TRUE, 13, 74.40, 4, '2024-11-19 22:45:00', '192.168.30.13'),
	   (14, 0, FALSE, 14, 21.98, 5, '2024-11-19 23:00:00', '192.168.30.14'),
	   (15, 11, TRUE, 15, 107.80, 1, '2024-11-19 23:15:00', '192.168.30.15');


SELECT 
    storage_id,quantity,
    CASE 
        WHEN availability = 1 THEN 'TRUE' 
        ELSE 'FALSE' 
    END AS availability,
    book_id, amount, worker_id, last_changes, IP_adress FROM BookStorage;
-- ----------------------------------------------------------------------------------------------------
CREATE TABLE Payment (
	payment_id INT NOT NULL PRIMARY KEY,
    payment_status BOOL NOT NULL,
    FOREIGN KEY (storage_id) references BookStorage(storage_id),
    orderprice DECIMAL(5,2),
    FOREIGN KEY (client_id) references Clients(client_id),
	FOREIGN KEY (worker_id) references Workers(worker_id),
    last_changes DATETIME NOT NULL,
    IP_adress VARCHAR(20) NOT NULL
);

INSERT INTO Payment
VALUES (1, TRUE, 1, 120.50, 1, 1, '2024-11-19 10:30:00', '192.168.1.101'),
	   (2, FALSE, 2, 55.75, 2, 2, '2024-11-19 11:45:00', '192.168.1.102'),
	   (3, TRUE, 3, 240.00, 3, 3, '2024-11-19 12:15:00', '192.168.1.103'),
	   (4, TRUE, 4, 85.30, 4, 4, '2024-11-19 14:00:00', '192.168.1.104'),
	   (5, FALSE, 5, 19.99, 5, 5, '2024-11-19 15:25:00', '192.168.1.105');

SELECT * FROM Payment;
-- ----------------------------------------------------------------------------------------------------
CREATE TABLE Delivery (
	delivery_id INT NOT NULL PRIMARY KEY,
    FOREIGN KEY (book_id) references Books(book_id),
    FOREIGN KEY (client_id) references Clients(client_id),
    FOREIGN KEY (worker_id) references Workers(worker_id),
    FOREIGN KEY (payment_id) references Payment(payment_id),
    delivery_date DATE NOT NULL,
    delivery_status BOOL NOT NULL,
    last_changes DATETIME NOT NULL,
    IP_adress VARCHAR(20) NOT NULL
);

INSERT INTO Delivery 
VALUES (1, 1, 1, 1, 1, '2024-11-20', TRUE, '2024-11-20 10:00:00', '192.168.1.201'),
	   (2, 2, 2, 2, 2, '2024-11-21', FALSE, '2024-11-21 11:30:00', '192.168.1.202'),
	   (3, 3, 3, 3, 3, '2024-11-22', TRUE, '2024-11-22 14:15:00', '192.168.1.203'),
	   (4, 4, 4, 4, 4, '2024-11-23', TRUE, '2024-11-23 15:45:00', '192.168.1.204'),
	   (5, 5, 5, 5, 5, '2024-11-24', FALSE, '2024-11-24 16:30:00', '192.168.1.205');

SELECT delivery_id, book_id, client_id, worker_id, payment_id, delivery_date, 
	CASE 
        WHEN delivery_status = 1 THEN 'TRUE' 
        ELSE 'FALSE' 
	END AS delivery_status,
    last_changes, IP_adress FROM Delivery;

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
VALUES (1, '');

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
VALUES ();

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
VALUES ();

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
VALUES ();

SELECT * FROM BookStorage;
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
VALUES ();

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
VALUES ();

SELECT * FROM Delivery;
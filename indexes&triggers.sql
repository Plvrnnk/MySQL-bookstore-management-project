USE Bookstore;

CREATE INDEX author_index
ON Books(author);

CREATE INDEX publisher_index
ON Books(publisher);

SHOW INDEXES FROM Books;
-- ----------------------------------------------------------------------------------------
DROP VIEW Books_and_Clients;
select* from Books;

CREATE VIEW Books_and_Clients AS
SELECT a.book_id, a.book_name, a.publisher, a.price,
b.client_id, CONCAT(b.client_name, ' ', b.client_surname) AS
'client_fullname'
FROM Books as a
LEFT JOIN Clients as b
ON a.worker_id = b.worker_id;

ALTER VIEW Books_and_Clients (book_id, book, publisher, price, client_id,
client_fullname, city)
AS SELECT a.book_id, a.book_name, a.publisher, a.price,
b.client_id, CONCAT(b.client_name, ' ', b.client_surname) AS
'client_fullname', b.city
FROM Books as a
LEFT JOIN Clients as b
ON a.worker_id = b.worker_id;

SELECT * FROM Books_and_Clients
ORDER BY client_id;


CREATE TABLE Discounts (
discount DECIMAL(5,2),
book_id INT NOT NULL,
FOREIGN KEY (book_id) REFERENCES Books(book_id),
price DECIMAL(5,2) NOT NULL,
worker_id INT NOT NULL,
FOREIGN KEY (worker_id) references Workers(worker_id),
last_changes DATETIME NOT NULL,
IP_adress VARCHAR(20) NOT NULL
);

INSERT INTO Discounts
VALUES (36, 1, 12.99, 5, '2024-11-22 14:15:00', '192.168.1.203'),
(50, 2, 9.99, 4, '2024-11-23 15:45:00', '192.168.1.204'),
(15, 3, 10.50, 3, '2024-11-24 16:30:00', '192.168.1.205');

ALTER TABLE Discounts
MODIFY COLUMN discount_price DECIMAL(5,2);

UPDATE Discounts
SET discount_price = (price - (price*discount/100));

CREATE TRIGGER discount_price_beforeupdate
BEFORE UPDATE ON Discounts
FOR EACH ROW
SET NEW.discount_price = (NEW.price - (NEW.price*NEW.discount/100));

SHOW TRIGGERS;

UPDATE Discounts
SET discount = 50.00
WHERE book_id = 1;

SELECT * FROM Discounts;
SELECT * FROM Workers; 
SELECT * FROM Clients;
SELECT * FROM Books;
SELECT 
    storage_id,quantity,
    CASE 
        WHEN availability = 1 THEN 'TRUE' 
        ELSE 'FALSE' 
    END AS availability,
    book_id, amount, worker_id, last_changes, IP_adress FROM BookStorage;
SELECT payment_id, 
	CASE 
        WHEN payment_status = 1 THEN 'TRUE' 
        ELSE 'FALSE' 
    END AS payment_status,
    storage_id, orderprice, client_id, worker_id, last_changes, IP_adress FROM Payment;
SELECT delivery_id, book_id, client_id, worker_id, payment_id, delivery_date, 
	CASE 
        WHEN delivery_status = 1 THEN 'TRUE' 
        ELSE 'FALSE' 
	END AS delivery_status,
    last_changes, IP_adress FROM Delivery;
    

SELECT *
FROM Bookstorage AS a
LEFT JOIN Books AS b
ON a.book_id = b.book_id;






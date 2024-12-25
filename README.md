# MySQL-bookstore-management-project
Repository showcasing my SQL expertise through a university project focused on bookstore management.

## Overview
This repository demonstrates my SQL expertise through a university project focused on managing a bookstore database. The project includes designing, implementing, and querying a relational database to handle essential operations like inventory management, customer data, and sales tracking.

## Features
- **Database Schema**: A well-structured relational database design.
- **SQL Queries**: Complex queries for data retrieval and analysis.
- **CRUD Operations**: Implementation of Create, Read, Update, Delete functionality.
- **Reports**: Generating sales and inventory reports.

## Database Structure
The database is designed with the following key entities:

1. **Client**: Contains customer information, including name, phone, address, and linked worker.
2. **Books**: Stores details about the books available, such as name, author, genre, price, and the worker responsible for updates.
3. **Payment**: Tracks payment statuses, linked to books, clients, and workers, along with order prices.
4. **Workers (Users)**: Maintains information about bookstore employees, including their roles and schedules.
5. **Storage**: Manages inventory, linking books to their quantities and responsible workers.
6. **Delivery**: Handles delivery records, associating books, clients, payments, and delivery outcomes.

The schema is normalized and includes primary and foreign keys to maintain data integrity. Each table also includes metadata like `last_changes` and `IP_address` for tracking updates.

## Technologies Used
- **Database Management System**: MySQL
- **Tools**: MySQL Workbench

## Contributions
Feel free to fork this repository and propose improvements by submitting a pull request. 

For any questions or suggestions, please contact me via [polina.lavrynenko2005@gmail.com]

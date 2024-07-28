
-- Create the database
CREATE DATABASE alx_book_store;

-- Use the newly created database
USE alx_book_store;

-- Create the Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create the Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert data into the Authors table
INSERT INTO Authors (author_name) VALUES ('J.K. Rowling'), ('George R.R. Martin'), ('J.R.R. Tolkien');

-- Insert data into the Books table
INSERT INTO Books (title, author_id, price, publication_date) 
VALUES ('Harry Potter and the Philosopher's Stone', 1, 19.99, '1997-06-26'),
       ('A Game of Thrones', 2, 9.99, '1996-08-06'),
       ('The Hobbit', 3, 14.99, '1937-09-21');

-- Insert data into the Customers table
INSERT INTO Customers (customer_name, email, address) 
VALUES ('John Doe', 'john.doe@example.com', '123 Elm Street, Springfield'),
       ('Jane Smith', 'jane.smith@example.com', '456 Oak Street, Metropolis');

-- Insert data into the Orders table
INSERT INTO Orders (customer_id, order_date) 
VALUES (1, '2024-07-25'),
       (2, '2024-07-26');

-- Insert data into the Order_Details table
INSERT INTO Order_Details (order_id, book_id, quantity) 
VALUES (1, 1, 2),
       (1, 3, 1),
       (2, 2, 1);
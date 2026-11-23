CREATE DATABASE library_db; 

USE library_db;

CREATE TABLE branch (
    branch_id VARCHAR(10) PRIMARY KEY,
    manager_id VARCHAR(10),
    branch_address VARCHAR(30),
    contact_no VARCHAR(15)
); 

CREATE TABLE employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(30),
    position VARCHAR(30),
    salary DECIMAL(10 , 2 ),
    branch_id VARCHAR(10)
); 

ALTER TABLE employees 
ADD PRIMARY KEY (emp_id);



CREATE TABLE members (
    member_id VARCHAR(10),
    member_name VARCHAR(30),
    member_address VARCHAR(30),
    reg_date DATE
);

ALTER TABLE members 
ADD PRIMARY KEY (member_id);

DESCRIBE members;

CREATE TABLE books (
    isbn VARCHAR(30) PRIMARY KEY,
    book_title VARCHAR(30),
    category VARCHAR(15),
    rental_price DECIMAL(10 , 2 ),
    status VARCHAR(10),
    author VARCHAR(30),
    publisher VARCHAR(30)
);

DESCRIBE books; 

CREATE TABLE issued_status (
    issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(30),
    issued_book_name VARCHAR(80),
    issued_date DATE,
    issued_book_isbn VARCHAR(50),
    issued_emp_id VARCHAR(10)
);


CREATE TABLE return_status (
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(30),
    return_book_name VARCHAR(80),
    return_date DATE,
    return_book_isbn VARCHAR(50)
); 

SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM issued_status;
SELECT * FROM members;
SELECT * FROM return_status;


-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00,
-- 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books (isbn,book_title,	category,rental_price,status,author,publisher)
VALUES ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00,'yes', 'Harper Lee', 'J.B. Lippincott & Co.') 

SELECT * FROM books;

-- Task 2: Update an Existing Member's Address

UPDATE members
SET member_address ='125 Oak St'
WHERE member_id = 'C103'; 

SELECT * FROM members; 

-- Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

DELETE FROM issued_status 
WHERE issued_id = 'IS121';

SELECT * FROM issued_status; 

-- Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * FROM issued_status 
WHERE issued_emp_id = 'E101'; 

-- Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT issued_member_id,
		COUNT(*) AS member_count
FROM issued_status
GROUP BY issued_member_id
HAVING COUNT(*) > 1 ;

-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

 CREATE TABLE book_issued_cnt AS
 SELECT b.isbn, b.book_title ,
		COUNT(i.issued_id) as total_book_issued 
 FROM books b
 JOIN issued_status i
 ON b.isbn = i.issued_book_isbn
 GROUP BY  b.isbn, b.book_title ; 
 
 SELECT * FROM book_issued_cnt;
 
 
 -- Task 7. Retrieve All Books in a Specific Category:
 
 SELECT 
    *
FROM
    books
WHERE
    category = 'Mystery'; 
 
 -- Task 8: Find Total Rental Income by Category:
 
SELECT 
    b.category,
    SUM(b.rental_price) AS total_rent_income,
    COUNT(*) AS number_of_books
FROM
    issued_status ist
        JOIN
    books b ON ist.issued_book_isbn = b.isbn
GROUP BY B.category;
 
 
 -- task 9.List Members Who Registered in the Last 180 Days:
 
 SELECT * FROM members 
 WHERE reg_date >= curdate() - interval 180 DAY ;
 
 
 -- TASK 10.List Employees with Their Branch Manager's Name and their branch details:
 
SELECT e1.emp_id,
		e1.emp_name,
        e1.position,
        e1.salary,
        b.*
FROM employees e1
JOIN branch b  
ON  e1.branch_id = b.branch_id 
JOIN employees e2
ON b.manager_id = e2.emp_id; 
 
-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold:

CREATE TABLE expensive_books AS 
SELECT * FROM books
WHERE rental_price > 7.00;


-- Task 12: Retrieve the List of Books Not Yet Returned

SELECT *
FROM issued_status ist
LEFT JOIN return_status rs 
ON  ist.issued_id = rs.issued_id 
WHERE rs.return_id IS NULL;


-- END OF THE PROJECT













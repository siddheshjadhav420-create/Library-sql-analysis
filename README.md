# Library Management System – SQL Project

## Project Overview
This project focuses on analysing a Library Management System using MySQL. It explores library operations such as book management, member registration, book issuing, employee details, and book returns.

The project demonstrates practical SQL skills by solving business-related questions using structured queries.

## Tools Used
- MySQL
- MySQL Workbench

## Database Tables
The project uses six tables:

1. **branch** – Stores library branch information.
2. **employees** – Contains employee details and salary information.
3. **members** – Stores library member details and registration dates.
4. **books** – Contains book titles, authors, categories, and rental prices.
5. **issued_status** – Records book issuing transactions.
6. **return_status** – Stores book return information.

## SQL Concepts Covered
- Database and table creation
- INSERT, UPDATE, and DELETE
- SELECT and WHERE
- GROUP BY and HAVING
- Aggregate functions (COUNT, SUM)
- INNER JOIN and LEFT JOIN
- Self JOIN
- Date filtering using INTERVAL
- Common Table Expressions (CTAS – Create Table As Select)
- NULL value handling

## Business Questions Solved
Some of the questions explored in this project include:

1. Adding a new book to the library database.
2. Updating a member's address.
3. Deleting an issued book record.
4. Retrieving books issued by a specific employee.
5. Identifying members who issued more than one book.
6. Calculating the total number of times each book was issued.
7. Retrieving books from a specific category.
8. Calculating rental income by book category.
9. Identifying members registered in the last 180 days.
10. Retrieving employee and branch information.
11. Creating a table of books above a specific rental price.
12. Identifying books that have not yet been returned.

## Project File
- `library_analysis.sql` – Contains the database creation statements and SQL queries used to solve the project tasks.

## How to Run the Project
1. Install MySQL Server and MySQL Workbench.
2. Download or clone this repository.
3. Open `library_analysis.sql` in MySQL Workbench.
4. Execute the database and table creation statements.
5. Import the required library data before running the analysis queries.
6. Execute the queries to explore the project tasks and results.

## Learning Outcome
Through this project, I practised writing SQL queries to retrieve, manipulate, and analyse relational database information. It helped me strengthen my understanding of joins, aggregations, filtering, and database operations.

---

**Author:** Siddhesh Jadhav

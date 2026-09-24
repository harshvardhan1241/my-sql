--creation of the database
CREATE DATABASE app_library;
                            --creation of the tabels--
--create tabel for branch
DROP TABLE if EXISTS branch ;
CREATE TABLE branch (
branch_id VARCHAR(10) primary key,
manager_id VARCHAR(10),
branch_address VARCHAR(10),
contact_no VARCHAR(10)
)

--late changes due to error 
-- error in the branch_address  var vlues is befre is 10 now we are making it 40

ALTER TABLE branch
ALTER branch_address type varchar(40)

--error in the  contact_no also var value is geting less and so ve arew making it 20

ALTER TABLE branch
ALTER contact_no type varchar(20)

--create tabel for employees
DROP TABLE if EXISTS employees;
CREATE table employees(
    emp_id varchar(10) PRIMARY KEY,
    emp_name varchar(25),
    position varchar(25),
    salary int,
    branch_id varchar(25) --FOREIGN KEY 
)

--late changes due to error 
-- error in the salary due to not proper data type

ALTER TABLE employees
ALTER salary type float

--create tabel for books
DROP TABLE if EXISTS books;
CREATE TABLE books(
isbn varchar(20) PRIMARY KEY,
book_title varchar(75),
category varchar(10),
rental_price float,
status varchar(15),
author varchar(35),
publisher varchar(55)
)
--late changes due to error 
-- error is the category var vlue is befre is 10 now we are making it 20
ALTER TABLE books
ALTER category type varchar(20)


--create tabel for members
DROP TABLE if EXISTS members;
CREATE TABLE members(
    member_id VARCHAR(10) PRIMARY KEY,
    member_name VARCHAR(25),
    member_address VARCHAR(75),
    reg_date DATE
)

--create tabel for issued_status
DROP TABLE if EXISTS issued_status;
CREATE TABLE issued_status(
issued_id VARCHAR(10) PRIMARY KEY,
issued_member_id VARCHAR(10) --FOREIGN KEY ,
issued_book_name VARCHAR(75),
issued_date DATE,
issued_book_isbn VARCHAR(20) --FOREIGN KEY ,
issued_emp_id VARCHAR(10) --FOREIGN KEY 
)

--create tabel for return_status
DROP TABLE if EXISTS return_status;
CREATE TABLE return_status(
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(10),--fk
    return_book_name VARCHAR(75),
    return_date DATE,
    return_book_isbn VARCHAR(20) --FOREIGN KEY 
)

--FOREIGN KEYs 
        --from issued_status_tabel to another
--for member 
ALTER TABLE issued_status
ADD CONSTRAINT  fk_members
FOREIGN KEY (issued_member_id)
REFERENCES  members (member_id)

--for book
ALTER TABLE issued_status
ADD CONSTRAINT  fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES  books (isbn)

-- for who from isusee the book
ALTER TABLE issued_status
ADD CONSTRAINT  fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES  employees (emp_id)

    -- from employees tabel to track the branch of book
-- for the track of the employ
ALTER TABLE employees
ADD CONSTRAINT  fk_branch
FOREIGN KEY ( branch_id)
REFERENCES  branch (branch_id)

    --from return_status tabel to issued tabel 
--to track the isshe things
ALTER TABLE return_status
ADD CONSTRAINT  fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES  issued_status (issued_id)

/*ERROR: insert or update on table "return_status" violates foreign key constraint "fk_issued_status"
DETAIL: Key (issued_id)=(IS101) is not present in table "issued_status".
psql: error: utility failed with exit code: 1

so we delete that colum of innfo from csv file 
filnaly after 4 atempt we clear it all */

-- verifcation of data
SELECT*
FROM books

SELECT*
FROM branch

SELECT*
FROM employees

SELECT*
FROM issued_status

SELECT*
FROM members

SELECT*
FROM return_status
--all work



-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

-- Task 2: Update an Existing Member's Address


-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.


-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.


-- ### 3. CTAS (Create Table As Select)

-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt


-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:


-- Task 8: Find Total Rental Income by Category:


-- Task 9. **List Members Who Registered in the Last 180 Days**:

-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:


-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold

-- Task 12: Retrieve the List of Books Not Yet Returned

    
/*
### Advanced SQL Operations

Task 13: Identify Members with Overdue Books
Write a query to identify members who have overdue books (assume a 30-day return period). Display the member's name, book title, issue date, and days overdue.


Task 14: Update Book Status on Return
Write a query to update the status of books in the books table to "available" when they are returned (based on entries in the return_status table).



Task 15: Branch Performance Report
Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.


Task 16: CTAS: Create a Table of Active Members
Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 6 months.



Task 17: Find Employees with the Most Book Issues Processed
Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.


Task 18: Identify Members Issuing High-Risk Books
Write a query to identify members who have issued books more than twice with the status "damaged" in the books table. Display the member name, book title, and the number of times they've issued damaged books.    


Task 19: Stored Procedure
Objective: Create a stored procedure to manage the status of books in a library system.
    Description: Write a stored procedure that updates the status of a book based on its issuance or return. Specifically:
    If a book is issued, the status should change to 'no'.
    If a book is returned, the status should change to 'yes'.

Task 20: Create Table As Select (CTAS)
Objective: Create a CTAS (Create Table As Select) query to identify overdue books and calculate fines.

Description: Write a CTAS query to create a new table that lists each member and the books they have issued but not returned within 30 days. The table should include:
    The number of overdue books.
    The total fines, with each day's fine calculated at $0.50.
    The number of books issued by each member.
    The resulting table should show:
    Member ID
    Number of overdue books
    Total fines
*/


-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
INSERT INTO books (isbn,book_title,category,rental_price,status,author,publisher)
VALUES('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', '6.00', 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')

SELECT*FROM books

-- Task 2: Update an Existing Member's Address
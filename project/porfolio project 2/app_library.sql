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

--create tabel for temployees
DROP TABLE if EXISTS employees;
CREATE table employees(
    emp_id varchar(10) PRIMARY KEY,
    emp_name varchar(25),
    position varchar(25),
    salary int,
    branch_id varchar(25)
)

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
issued_id VARCHAR(10),
issued_member_id VARCHAR(10),
issued_book_name VARCHAR(75),
issued_date DATE,
issued_book_isbn VARCHAR(20),
issued_emp_id VARCHAR(10)
)
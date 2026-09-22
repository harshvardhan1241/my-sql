--creating tabel
CREATE TABLE retail_sale(
transactions_id INT,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(15),
age INT,
category VARCHAR(25),
quantiy INT,
price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT
);

--comand to run the full tabel
SELECT*
FROM
retail_sale



--count of total row
SELECT
count(*)
FROM
retail_sale

--
SELECT*
FROM
retail_sale as rs
WHERE
rs.transactions_id is NULL

-- finding the null record
SELECT*
FROM
retail_sale as rs
WHERE
rs.transactions_id is NULL
OR
rs.sale_date is NULL
OR
rs.sale_time is NULL
OR
rs.customer_id is NULL
OR
rs.gender is NULL
OR
rs.age is NULL
OR
rs.category is NULL
OR
rs.quantiy is NULL
OR
rs.price_per_unit is NULL
OR
rs.cogs is NULL
OR
rs.total_sale is NULL


-- remove the data where is value is not given mean null
--data cleaning
DELETE FROM
retail_sale as rs
WHERE
rs.transactions_id is NULL
OR
rs.sale_date is NULL
OR
rs.sale_time is NULL
OR
rs.customer_id is NULL
OR
rs.gender is NULL
OR
rs.age is NULL
OR
rs.category is NULL
OR
rs.quantiy is NULL
OR
rs.price_per_unit is NULL
OR
rs.cogs is NULL
OR
rs.total_sale is NULL

-- data exploration 

--total no of record we have
SELECT
count(*)
FROM
retail_sale

-- how many unique customer we have ?
SELECT
count(DISTINCT customer_id)
FROM
retail_sale

-- how may unique category we have?
SELECT
count(DISTINCT category)
FROM
retail_sale

    --name of that three catogory 
    SELECT
    DISTINCT category
    FROM
    retail_sale

-- Data analyst role & business key problem and solutions
USE lab_mysql;
CREATE TABLE cars (vin VARCHAR(20), manufacturer VARCHAR(20),model VARCHAR(20), year INT, color VARCHAR(20), cust_id INT);
CREATE TABLE customers (cust_id INT, name VARCHAR(100), phone VARCHAR(20), email VARCHAR(50), address VARCHAR(50),state VARCHAR(20), country VARCHAR(20), zip VARCHAR(5), staff_id INT);
CREATE TABLE salesperson (staff_id INT, name VARCHAR(20), store VARCHAR(20));
CREATE TABLE invoice (invoice_no INT, date DATE, vin VARCHAR(20), cust_id INT, staff_id INT);
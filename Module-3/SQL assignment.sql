create database project;

use project;

-- Salesman ----

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4,2)
);

-- Customer table ----

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

-- orders --

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);


-- emp ---

CREATE TABLE emp_details (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT
);

-- items --

CREATE TABLE item_mast (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(100),
    PRO_PRICE DECIMAL(10,2),
    PRO_COM INT
);

-- inserting in salesman --

INSERT INTO salesman VALUES (5001,'James Hoog','New York',0.15);
INSERT INTO salesman VALUES (5002,'Nail Knite','Paris',0.13);
INSERT INTO salesman VALUES (5005,'Pit Alex','London',0.11);
INSERT INTO salesman VALUES (5006,'Mc Lyon','Paris',0.14);
INSERT INTO salesman VALUES (5007,'Paul Adam','Rome',0.13);
INSERT INTO salesman VALUES (5003,'Lauson Hen','San Jose',0.12);

-- inserting in customer --

INSERT INTO customer VALUES (3002,'Nick Rimando','New York',100,5001);
INSERT INTO customer VALUES (3007,'Brad Davis','New York',200,5001);
INSERT INTO customer VALUES (3005,'Graham Zusi','California',200,5002);
INSERT INTO customer VALUES (3008,'Julian Green','London',300,5002);
INSERT INTO customer VALUES (3004,'Fabian Johnson','Paris',300,5006);
INSERT INTO customer VALUES (3009,'Geoff Cameron','Berlin',100,5003);
INSERT INTO customer VALUES (3003,'Jozy Altidor','Moscow',200,5007);
INSERT INTO customer VALUES (3001,'Brad Guzan','London',NULL,5005);

-- inserting in orders --

INSERT INTO orders VALUES (70001,150.5,'2012-10-05',3005,5002);
INSERT INTO orders VALUES (70009,270.65,'2012-09-10',3001,5005);
INSERT INTO orders VALUES (70002,65.26,'2012-10-05',3002,5001);
INSERT INTO orders VALUES (70004,110.5,'2012-08-17',3009,5003);
INSERT INTO orders VALUES (70007,948.5,'2012-09-10',3005,5002);
INSERT INTO orders VALUES (70005,2400.6,'2012-07-27',3007,5001);
INSERT INTO orders VALUES (70008,5760,'2012-09-10',3002,5001);
INSERT INTO orders VALUES (70010,1983.43,'2012-10-10',3004,5006);
INSERT INTO orders VALUES (70003,2480.4,'2012-10-10',3009,5003);
INSERT INTO orders VALUES (70012,250.45,'2012-06-27',3008,5002);
INSERT INTO orders VALUES (70011,75.29,'2012-08-17',3003,5007);
INSERT INTO orders VALUES (70013,3045.6,'2012-04-25',3002,5001);

-- inserting in emp --

INSERT INTO emp_details VALUES (127323,'Michale','Robbin',57);
INSERT INTO emp_details VALUES (526689,'Carlos','Snares',63);
INSERT INTO emp_details VALUES (843795,'Enric','Dosio',57);
INSERT INTO emp_details VALUES (328717,'Jhon','Snares',63);
INSERT INTO emp_details VALUES (444527,'Joseph','Dosni',47);
INSERT INTO emp_details VALUES (659831,'Zanifer','Emily',47);
INSERT INTO emp_details VALUES (847674,'Kuleswar','Sitaraman',57);
INSERT INTO emp_details VALUES (748681,'Henrey','Gabriel',47);
INSERT INTO emp_details VALUES (555935,'Alex','Manuel',57);
INSERT INTO emp_details VALUES (539569,'George','Mardy',27);
INSERT INTO emp_details VALUES (733843,'Mario','Saule',63);
INSERT INTO emp_details VALUES (631548,'Alan','Snappy',27);
INSERT INTO emp_details VALUES (839139,'Maria','Foster',57);

-- insert in item --

INSERT INTO item_mast VALUES (101,'Motherboard',3200.00,15);
INSERT INTO item_mast VALUES (102,'Keyboard',450.00,16);
INSERT INTO item_mast VALUES (103,'ZIP drive',250.00,14);
INSERT INTO item_mast VALUES (104,'Speaker',550.00,16);
INSERT INTO item_mast VALUES (105,'Monitor',5000.00,11);
INSERT INTO item_mast VALUES (106,'DVD drive',900.00,12);
INSERT INTO item_mast VALUES (107,'CD drive',800.00,12);
INSERT INTO item_mast VALUES (108,'Printer',2600.00,13);
INSERT INTO item_mast VALUES (109,'Refill cartridge',350.00,13);
INSERT INTO item_mast VALUES (110,'Mouse',250.00,12);



-- 1 write a SQL query to find customers who are either from the city 'NewYork' or who do not have a grade greater than 100. 
-- Return customer_id, cust_name, city, grade, and salesman_id.

select customer_id , cust_name, city, grade, salesman_id from customer
where city = "New york" or grade > 100;

-- 2 write a SQL query to find all the customers in ‘New York’ city who have a gradevalue above 100. Return customer_id, cust_name, city, grade, and salesman_id.

select customer_id, cust_name, city, grade, salesman_id from customer
where city = 'New York' and grade > 100 ;

-- 3 Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.

SELECT ord_no, purch_amt,
    (purch_amt / 6000) * 100 AS achieved_percentage,
    100 - ((purch_amt / 6000) * 100) AS unachieved_percentage
FROM orders
WHERE purch_amt > (6000/2);

-- 4 write a SQL query to calculate the total purchase amount of all orders. Return total purchase amount.

select sum(purch_amt) as total_purchase_amount from orders;

-- 5 write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount.

select customer_id, max(purch_amt) as max_purchase_amt from orders
group by customer_id;

-- 6 write a SQL query to calculate the average product price. Return average product price.

select avg(PRO_PRICE) as avg_prod_price from item_mast;




/* *************************************************************** 
***************************CREATING TABLES************************
**************************************************************** */
CREATE TABLE regions (
	region_id INT (11) UNSIGNED NOT NULL,
	region_name VARCHAR(25),
	PRIMARY KEY (region_id)
	);

CREATE TABLE countries (
	country_id CHAR(2) NOT NULL,
	country_name VARCHAR(40),
	region_id INT (11) UNSIGNED NOT NULL,
	PRIMARY KEY (country_id)
);


CREATE TABLE locations (
	location_id INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
	street_address VARCHAR(40),
	postal_code VARCHAR(12),
	city VARCHAR(30) NOT NULL,
	state_province VARCHAR(25),
	country_id CHAR(2) NOT NULL,
	PRIMARY KEY (location_id)
	);

CREATE TABLE departments (
	department_id INT (11) UNSIGNED NOT NULL,
	department_name VARCHAR(30) NOT NULL,
	manager_id INT (11) UNSIGNED,
	location_id INT (11) UNSIGNED,
	PRIMARY KEY (department_id)
	);

CREATE TABLE jobs (
	job_id VARCHAR(10) NOT NULL,
	job_title VARCHAR(35) NOT NULL,
	min_salary DECIMAL(8, 0) UNSIGNED,
	max_salary DECIMAL(8, 0) UNSIGNED,
	PRIMARY KEY (job_id)
	);

CREATE TABLE employees (
	employee_id INT (11) UNSIGNED NOT NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(25) NOT NULL,
	email VARCHAR(25) NOT NULL,
	phone_number VARCHAR(20),
	hire_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	salary DECIMAL(8, 2) NOT NULL,
	commission_pct DECIMAL(2, 2),
	manager_id INT (11) UNSIGNED,
	department_id INT (11) UNSIGNED,
	PRIMARY KEY (employee_id)
	);

CREATE TABLE job_history (
	employee_id INT (11) UNSIGNED NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	department_id INT (11) UNSIGNED NOT NULL
	);

ALTER TABLE job_history ADD UNIQUE INDEX (
	employee_id,
	start_date
	);


CREATE VIEW emp_details_view
AS
SELECT e.employee_id,
	e.job_id,
	e.manager_id,
	e.department_id,
	d.location_id,
	l.country_id,
	e.first_name,
	e.last_name,
	e.salary,
	e.commission_pct,
	d.department_name,
	j.job_title,
	l.city,
	l.state_province,
	c.country_name,
	r.region_name
FROM employees e,
	departments d,
	jobs j,
	locations l,
	countries c,
	regions r
WHERE e.department_id = d.department_id
	AND d.location_id = l.location_id
	AND l.country_id = c.country_id
	AND c.region_id = r.region_id
	AND j.job_id = e.job_id;


-- HRDB database questions --

use hrdb;
-- 7 write a SQL query to find those employees whose department is located at ‘Toronto’. Return first name, last name, employee ID, job ID.

select e.first_name, e.last_name , e.job_id from employees e
join departments d
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id
where city = 'Toronto';

-- 8 write a SQL query to find those employees whose salary is lower than that of employees whose job title is "MK_MAN". Exclude employees of the Jobtitle‘MK_MAN’. 
-- Return employee ID, first name, last name, job ID

SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE salary < (
    SELECT salary
    FROM employees
    WHERE job_id = 'MK_MAN'
)
AND job_id <> 'MK_MAN';


-- 9 write a SQL query to find all those employees who work in department ID80or40. Return first name, last name, department number and department name.
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id
WHERE e.department_id IN (80,40);

-- 10 write a SQL query to calculate the average salary, the number of employees receiving commissions in that department. 
-- Return department name, averagesalary and number of employees.

SELECT d.department_name, AVG(e.salary) AS avg_salary, COUNT(e.commission_pct) AS employees_with_commission FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 11 .write a SQL query to find out which employees have the same designationas theemployee whose ID is 169. Return first name, last name, department IDandjobID.

SELECT first_name, last_name, department_id, job_id FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 169)
AND employee_id <> 169;

-- 12 write a SQL query to find those employees who earn more than the averagesalary. Return employee ID, first name, last name.

SELECT employee_id, first_name, last_name
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 13.write a SQL query to find all those employees who work in the Finance department. Return department ID, name (first), job ID and department name.

SELECT e.department_id, e.first_name, e.job_id, d.department_name FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

-- 14. From the following table, write a SQL query to find the employees whoearnlessthan the employee of ID 182. Return first name, last name and 

SELECT first_name, last_name, salary FROM employees
WHERE salary < (SELECT salary FROM employees WHERE employee_id = 182);

-- 15.Create a stored procedure CountEmployeesByDept that returns the number of employees in each department

DELIMITER //

CREATE PROCEDURE CountEmployeesByDept()
BEGIN
    SELECT department_id, COUNT(*) AS total_employees
    FROM employees
    GROUP BY department_id;
END //

DELIMITER ;

-- 16.Create a stored procedure AddNewEmployee that adds a new employee tothedatabase

DELIMITER //

CREATE PROCEDURE AddNewEmployee(
    IN emp_id INT,
    IN fname VARCHAR(20),
    IN lname VARCHAR(25),
    IN email VARCHAR(25),
    IN job VARCHAR(10),
    IN sal DECIMAL(8,2),
    IN dept INT
)
BEGIN
    INSERT INTO employees(employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id)
    VALUES(emp_id, fname, lname, email, CURDATE(), job, sal, dept);
END //

DELIMITER ;

-- 17.Create a stored procedure DeleteEmployeesByDept that removes all employeesfrom a specific department

DELIMITER //

CREATE PROCEDURE DeleteEmployeesByDept(
    IN dept_id INT
)
BEGIN
    DELETE FROM employees
    WHERE department_id = dept_id;
END //

DELIMITER ;

-- 18.Create a stored procedure GetTopPaidEmployees that retrieves the highest-paidemployee in each department.

DELIMITER //

CREATE PROCEDURE GetTopPaidEmployees()
BEGIN
    SELECT department_id, employee_id, first_name, salary
    FROM employees e
    WHERE salary = (
        SELECT MAX(salary)
        FROM employees
        WHERE department_id = e.department_id
    );
END //

DELIMITER ;

-- 19.Create a stored procedure PromoteEmployee that increases an employee’s salaryand changes their job role.

DELIMITER //

CREATE PROCEDURE PromoteEmployee(
    IN emp_id INT,
    IN new_job VARCHAR(10),
    IN salary_increase DECIMAL(8,2)
)
BEGIN
    UPDATE employees
    SET salary = salary + salary_increase,
        job_id = new_job
    WHERE employee_id = emp_id;
END //

DELIMITER ;

-- 20.Create a stored procedure AssignManagerToDepartment that assigns a newmanager to all employees in a specific department

DELIMITER //

CREATE PROCEDURE AssignManagerToDepartment(
    IN dept_id INT,
    IN manager INT
)
BEGIN
    UPDATE employees
    SET manager_id = manager
    WHERE department_id = dept_id;
END //

DELIMITER ;
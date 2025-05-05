USE employee_db;
CREATE TABLE Customers(
customer_id int,
cust_name varchar(50),
city varchar(50),
grade int,
salesamount int
);

INSERT INTO Customers
Values(3002,'A','NEW YORK',100,5001),
(3007, 'B','NEW YORK',200,4001),(3005,'C','California',200,2002),(3008,'D','London',300,6002),(3004,'E','Paris',300,9000)
select * from Customers;

select COUNT(customer_id) as 'Total number of customers' from Customers;
select cust_name from Customers where salesamount=(select MIN(salesamount) from Customers);
select cust_name from Customers where salesamount=(select MAX(salesamount) from Customers);
select AVG( salesamount) as 'average' from Customers ;
select sum( salesamount) as 'Total Sales' from Customers ;


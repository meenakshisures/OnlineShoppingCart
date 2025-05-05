CREATE TABLE SALES(
orderid int primary key,
orddate DATE DEFAULT GETDATE(),
ordPrice DECIMAL(10,2),
ordQty int DEFAULT 1,
custName varchar(100) not null
);
insert into sales(orderid,orddate,ordprice,ordqty,custname) values
(1,'2020-11-22',150,2,'John'),
(2,'2020-07-10',180,2,'Tom'),
(3,'2020-06-13',400,5,'Jerry'),
(4,'2020-06-15',320,2,'John'),
(5,'2020-11-22',800,4,'Bond'),
(6,'2020-09-02',730,4,'Chaplin'),
(7,'2020-10-03',1000,2,'Mickey');
select *from sales;
select count (ordQty)AS ordercountbyjohn from sales WHERE custName='John';
select count (DISTINCT custName)AS UniqueCustomers from sales ;
select SUM(ordQty) AS TotalItemsOrdered  from sales ;
select AVG (ordQty)AS AvgItemsPerOrder from sales;
select AVG (ordQty)AS AvgOrderQty from sales where ordPrice>300;
select MIN(ordPrice) AS MINORDERPRICE from sales;
select DISTINCT custName from sales where custName LIKE '%n';
select DISTINCT custName from sales;
select custName,SUM(ordPrice) AS TotalSpent from sales GROUP BY custName;--since there are 2 JOHN  use GROUP BY
select custName from ( select custName,SUM(ordPrice) AS TotalSpent from sales GROUP BY custName) AS CustomerSpending WHERE TotalSpent>700;
select custName from sales WHERE ordQty>3;
select DISTINCT custName from sales WHERE ordPrice>600;
select *from sales ORDER BY ordPrice ASC;
select *from sales ORDER BY ordPrice DESC;








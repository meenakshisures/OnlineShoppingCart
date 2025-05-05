select*from Products;
--Aggregate Functions
--MIN aggregate function
select MIN( UnitPrice) from Products;
select MAX( UnitPrice) from Products;
select AVG( UnitPrice) as 'average' from Products ;
/*get the productid,productname,unitprice of product which have the least unit price*/
select productid,productname,unitprice from Products where unitprice=(select MIN( UnitPrice) from Products);
/*get the productid,productname,unitprice of product which have the most unit price*/
select productid,productname,unitprice from Products where unitprice=(select MAX( UnitPrice) from Products);

/*get the productid,productname,unitprice of product which have the most unit price greater than the avg unit price*/
select productid,productname,unitprice from Products where unitprice>(select AVG( UnitPrice) from Products);

--SUM aggregate function to get the total value of a column
select sum(UnitsInStock) as 'Total Stock' from Products;
--to know how many units are discontinued
select sum(UnitsInStock) as 'Total Stock' from Products where discontinued=1;
--COUNT aggregate function to get the count of items
--or the number of rows which matches the condition
--trying to count the number of products by counting the number of product ids
select COUNT(productid)from products;
select COUNT(productid) as 'discontinued products count'from products where discontinued=1;;


-- activate schema --
use northwind;
-- show all customers from customers columns --
select*from Customers;

select Customername,City,Country From Customers;

select ProductID,ProductName From Products;

select distinct country from Customers;

select count(distinct country) from customers;

select count(distinct CustomerID) from customers;

select FirstName, LastName, BirthDate from employees;

select CustomerName, Address, City from customers;

select distinct city from suppliers;

select count(distinct city) from customers;

select customername, city, country 
from customers
where country = "uk";

select*from products 
where productID = 1;

select productname, price from products
where price > 100;

select city, country, customername from customers where country != "uk";

-- customers from the city london --
select*from customers 
where city = "London";

-- customers in the usa only --
select count(*) from customers where country = "USA";

-- customer id >15-- 
select*from customers where customerid >= 15;

-- products starting with a containing a specific letter --
select*from customers
where customername like "%a";

-- starting with a specific letter --
select*from customers
where customername like "a%";

-- second letter containing specific letter --
select*from customers 
where customername like "_a%";

-- Finding where starting with specific letter and ending with specific letter --
select*from customers
where customername like "b%s";

-- nearpod excercise the Country field contains 'land'--
select*from suppliers
where country like "%Land%";

-- nearpod excercise first names have ‘n’ as the second character --
select*from employees
where firstname like "_N%";

-- finding customers in cities --
select*from customers 
where city in  ("berlin", "paris", "madrid");

-- how to find orders shipped by shippers 1-3 --
select*from Shippers
where shipperID >=1 <=3;

-- how to find customers that have placed an order --
select*from customers 
where customerid in (select customerid from orders);

-- finding products between a range --
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

-- can also use it for product names and will find them in abc order --
select * FROM Products
WHERE Productname BETWEEN "Chais" AND "Pavlova";

-- order by country --
select*from customers
order by country; 

select customername, country, city from customers
where country in ("usa") 
order by customername, city;

-- limit the amount of results shown --
select *from customers
where country in ("Usa")
order by customerid
limit 6;

-- show max price --
select max(price)
from products;

-- show min price --
select min(price)
from products;

-- show average price --
select avg(price)
from products;

-- aliasing use as to change the name of a column --
select customername as customer, customerid as id from customers; 

-- workbook day 2 task 1 --
select*from customers;

select customername, city from customers;

select*from products where price >50;

select*from customers where country in ("uk" , "usa");

select*from orders order by orderdate desc;

select*from products where price between 20 and 50; 

select*from customers where city in  ("portland", "kirkland") order by (select customername)asc;

select*from customers where city = "london" or country = "uk" order by (select customername)desc;

select*from products where categoryid between 1 and 2 order by (select productname);

-- workbook day 3 task 2 --

-- Write a SQL query to find the supplier of each product. --

select distinct suppliername, productname from suppliers
right join products 
on suppliers.supplierid = products.supplierid
order by suppliername;

-- Write a SQL query to find the category of each product --
select categoryname, productname from categories 
right join products
on categories.categoryid = products.categoryid
order by categoryname;

-- Write a SQL query to retrieve all products belonging to the Meat/Poultry category. --
select categoryname, productname from categories 
right join products
on categories.categoryid = products.categoryid
where categoryname in ("Meat/Poultry");

-- Write a SQL query to retrieve the Order ID, Order Date, Customer Name, and Employee Name for all orders --
select orderid, orderdate, customername, firstname as employeefirstname, lastname as employeelastname from orders
join customers 
on orders.customerid = customers.customerid
join employees
on orders.employeeid = employees.employeeid
order by employeefirstname;

-- or --  

select orderid, orderdate, customername, firstname as employeefirstname, lastname as employeelastname from customers 
join orders 
on customers.customerid = orders.customerid 
join employees 
on orders.employeeid = employees.employeeid; 

-- Write a SQL query to retrieve all products with their prices and the quantity ordered for each product -- 

select productname, sum(quantity), price from products  
join order_details
on products.productid = order_details.productid 
group by productname, price;

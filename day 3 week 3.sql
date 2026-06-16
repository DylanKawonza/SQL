use northwind;
-- joining orders and customer table --

select customers.customerid, orders.orderid, orderdate, customers.customername, customers.country
from Orders
inner join customers 
on orders.customerid = customers.customerid 
order by customers.Customerid;

-- suppliers and products --
select suppliername, productname 
from suppliers 
inner join products 
on suppliers.supplierid = products.supplierid
where suppliername = "G'day, mate";

select firstname, lastname, orderdate, orderid from orders
inner join employees
on orders.employeeid = employees.employeeID;

select shippername, orderdate, orderdate from orders
inner join shippers 
on orders.shipperid = shippers.shipperid
where shippername = "speedy express";

/* Write a query to display all products along with their category names.*/
select CategoryName, ProductName
from products
inner join categories
on products.CategoryID = categories.CategoryID;

/* Write a query to list all products and their quantities for each order.*/
select ProductName, Quantity
from products
inner join order_details
on products.ProductID = order_details.ProductID;

-- number of quantity in each order -- 
select*from orders 
join order_details on orders.orderid = order_details.orderid;

-- How many customer in each country?
select city, count(customerid) as numberofcustomers
from customers
group by city;

-- Write a query to list each product category and the total quantity of products sold in that category.-
select CategoryName, sum(Quantity) as totalsold

from categories as c

join products as p

on c.CategoryID = p.CategoryID

join order_details as od

on p.ProductID = od.ProductID

group by CategoryName;
 

/*Write a query to list each employee and 
the number of orders they have handled.*/
select FirstName, LastName, e.EmployeeID, count(o.orderid) as nooforders
from orders as o
join employees as e
on o.EmployeeID = e.EmployeeID
group by FirstName, LastName, e.EmployeeID;

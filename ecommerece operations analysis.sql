use ecommercesales;

create View e1 as
select 
categories.CategoryId,categories.CategoryName,categories.DescriptionText,
customers.CustomerName,customers.ContractName,customers.Address,customers.City,customers.PostalCode,customers.Country,
employees.EmployeeID,employees.LastName as employee_LastName,employees.FirstName as employee_FirstName,employees.BirthDate,employees.Photo,employees.Notes,
orders.OrderID, orders.CustomerID,orders.OrderDate, orders.ShipperID
from categories
join customers
join employees
join orders
on employees.EmployeeID = orders.EmployeeID
AND customers.CustomerID = orders.CustomerID;


Create View e2 as
Select 
ordersdetails.OrderDetailID,ordersdetails.OrderID,ordersdetails.ProductID,ordersdetails.Quantity,
products.ProductName,products.SuppliersID,products.CategoryID,products.Unit,products.Price,
shippers.ShipperID,shippers.ShipperName,shippers.Phone as shipperPhone,
suppliers.SuppliersName,suppliers.ContactName,suppliers.Address,suppliers.City,suppliers.PostalCode,suppliers.Country,suppliers.Phone as suppliersPhone 
from ordersdetails
join products
join shippers
join suppliers
on products.ProductID= ordersdetails.ProductID
AND suppliers.SupplierID= products.SuppliersID;

Create View ecommerce_sales as
select 
e1.CategoryId,e1.CategoryName,e1.DescriptionText,
e1.CustomerName,e1.ContractName,e1.Address as Customer_Address,e1.City as Customer_City,e1.PostalCode as Customer_PostalCode,e1.Country as Customer_Country,
e1.EmployeeID,e1.employee_FirstName,e1.employee_LastName,e1.BirthDate as Employee_BirthDate,e1.Notes as employee_EducationDetails,
e1.OrderID,e1.CustomerID,e1.OrderDate,e1.ShipperID,
e2.OrderDetailID,e2.ProductId,e2.Quantity,
e2.ProductName,e2.SuppliersID,e2.Unit,e2.Price,
e2.ShipperName,e2.ShipperPhone,
e2.suppliersName,e2.ContactName as suppliers_contactName,e2.Address as suppliersAddress,e2.City as SuppliersCity,e2.Postalcode as supplies_PostalCode,e2.Country as SuppliersCountry, e2.SuppliersPhone
from e1
Join e2
on e1.CategoryID = e2.CategoryID
AND e1.OrderID = e2.OrderID
AND e1.ShipperID = e2.ShipperID;






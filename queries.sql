-- Multi-Table Query Practice
SELECT CategoryName, "ProductName" FROM Product AS p
JOIN "Category" AS c
ON c.Id = p."CategoryId";
-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id AS orderNUMBER, c.CompanyName AS SHIPPEDto
FROM "Order" AS o
JOIN "Customer" AS c
ON o."CustomerId" = c."Id"
WHERE o."OrderDate" < "2012-08-09";
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName, o.Quantity FROM "Product" AS p
JOIN "OrderDetail" AS o
ON o.ProductId = p.Id
WHERE o."OrderId" = 10251
ORDER BY p."ProductName";
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT e.LastName AS EmployeeLastName, c.CompanyName AS CustomerName, o.Id AS OrderNumber
FROM "Order" AS o
JOIN Employee AS e
ON o."EmployeeId" = e."Id"
JOIN "Customer" AS c
ON o."CustomerId" = c."Id";

--STRETCH
--Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 9 records.
SELECT COUNT(ProductName) as ProductPerCategory, CategoryName from Products as p
join Categories as c
on p.CategoryID = c.CategoryID
group by c.CategoryName;
--Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT COUNT(ProductName) as TotalNrOfProducts, o.OrderID as OrderNumber from OrderDetails as o
join Products as p
on o.ProductID = p.ProductID
group by o.OrderID;
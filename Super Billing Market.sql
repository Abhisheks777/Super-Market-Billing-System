Create Database Supermarket;

use supermarket;

CREATE TABLE Customers (
    ClientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

ALTER TABLE customers RENAME Column clientID TO CustomerId;


select * from  customers;

drop  table customers;

insert into customers values
(1, 'Rajashree', 'Sahu', 'rajashree.sahu@gmail.com', '9874563215');

insert into customers values
(2, 'Ankita', 'Nair', 'Ankita.nair@gmail.com', '9874556792'),
(3, 'Aditya', 'patel', 'aditya.patel@gmail.com', '7869541235'),
(4, 'Ratan', 'Saha', 'ratan.saha@gmail.com', '8974563215'),
(5, 'Sachin', 'sahu', 'sachin.Sahu@gmail.com', '9865741258'),
(6, 'Hemant', 'patil', 'hemant.patil@yahoo.com', '8469572369'),
(7, 'Rohit', 'More', 'Rohit.more@gmail.com', '9874739182'),
(8, 'Pinky', 'sharma', 'pinky.sharma@gmail.com', '9548632175'),
(9, 'Arthar', 'yadav', 'arther.yadav@gmail.com.com', '9796158345'),
(10, 'Mahendra', 'dhoni', 'msd@Greatest.com', '9000000077');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

select * from products;

delete from customers where clientid = 1001;

insert into products values
(1001, 'Milk', 'Dairy', '40.00', '500');

insert into products values
(1002, 'juice', 'Beverage', '150.00', '500'),
(1003, 'Bread', 'Baking', '100.00', '700'),
(1004, 'Icecream', 'Frozen', '150.00', '1000'),
(1005, 'Apples', 'Fruits', '150.00', '2000'),
(1006, 'Chicken', 'Meat', '250.00', '2000'),
(1007, 'Chips', 'Snacks', '90.00', '500'),
(1008, 'Salad greens', 'Vegetables', '250.00', '800'),
(1009, 'Cheese', 'Deli', '250.00', '850'),
(1010, 'ketchup', 'Condiments', '300.00', '750');

update products
 set ProductName = 'juice' ,
    Category = 'Beverage' ,
    Price = '150'
    where ProductID = 1002;
    
    drop table products;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

select * from Categories;

INSERT INTO Categories (CategoryID, CategoryName) VALUES
(101, 'Dairy'),
(102, 'Beverage'),
(103, 'Baking'),
(104, 'Frozen'),
(105, 'Fruits'),
(106, 'Meat'),
(107, 'snacks'),
(108, 'Vegetables'),
(109, 'Deli'),
(110, 'Condiments');

drop table sales;


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    SaleDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

select * from Sales;

INSERT INTO Sales (SaleID, CustomerID, SaleDate, TotalAmount) VALUES
(201, 1, '2024-01-15', 3500.75),
(202, 2, '2024-01-16', 350.50),
(203, 3, '2024-01-17', 320.00),
(204, 4, '2024-01-18', 450.20),
(205, 5, '2024-01-19', 1750.90),
(206, 6, '2024-01-20', 380.45),
(207, 7, '2024-01-21', 506.00),
(208, 8, '2024-01-22', 690.00),
(209, 9, '2024-01-23', 2500.25),
(210, 10, '2024-01-24', 425.10);


CREATE TABLE SaleItems (
    SaleItemID INT PRIMARY KEY,
    SaleID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

select * from Saleitems;

INSERT INTO SaleItems (SaleItemID, SaleID, ProductID, Quantity, Price) VALUES
(301, 201, 1001, 5, 1750.00),  
(302, 202, 1002, 6, 3500.75), 
(303, 203, 1003, 7, 116.83),   
(304, 204, 1004, 3, 64.00),    
(305, 205, 1005, 9, 450.20),  
(306, 206, 1006, 10, 175.09), 
(307, 207, 1007, 1, 95.11),   
(308, 208, 1008, 4, 253.00),   
(309, 209, 1009, 6, 98.57),    
(310, 210, 1010, 6, 416.71); 

CREATE TABLE Discounts (
    DiscountID INT PRIMARY KEY,
    ProductID INT,
    DiscountPercentage DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

select * from Discounts;

INSERT INTO Discounts (DiscountID, ProductID, DiscountPercentage, StartDate, EndDate) VALUES
(501, 1001, 10.00, '2024-01-01', '2024-01-31'),  
(502, 1002, 15.00, '2024-02-01', '2024-02-28'),  
(503, 1003, 20.00, '2024-03-01', '2024-03-31'),  
(504, 1004, 25.00, '2024-04-01', '2024-04-30'),  
(505, 1005, 5.00,  '2024-05-01', '2024-05-31'),  
(506, 1006, 30.00, '2024-06-01', '2024-06-30'),  
(507, 1007, 12.50, '2024-07-01', '2024-07-31'),  
(508, 1008, 18.00, '2024-08-01', '2024-08-31'),  
(509, 1009, 22.00, '2024-09-01', '2024-09-30'),  
(510, 1010, 8.00, '2024-10-01', '2024-10-31');  

SELECT *
FROM Products
WHERE Price > 100;


SELECT *
FROM SaleItems
WHERE Quantity > 5 AND Price < 200;

SELECT *
FROM Products
WHERE ProductName LIKE '%Milk%';


SELECT 
    p.ProductName,
    p.Price,
    CASE 
        WHEN d.DiscountPercentage IS NOT NULL THEN p.Price * (1 - d.DiscountPercentage / 100)
        ELSE p.Price
    END AS DiscountedPrice
FROM 
    Products p
LEFT JOIN 
    Discounts d 
ON 
    p.ProductID = d.ProductID 
    AND CURRENT_DATE BETWEEN d.StartDate AND d.EndDate
LIMIT 0, 1000;



SELECT 
    p.ProductName,
    p.Price,
    d.DiscountPercentage,
    p.Price * (1 - d.DiscountPercentage / 100) AS DiscountedPrice
FROM 
    Products p
LEFT JOIN 
    Discounts d 
ON 
    p.ProductID = d.ProductID 
    AND CURRENT_DATE BETWEEN d.StartDate AND d.EndDate
WHERE 
    d.DiscountPercentage IS NOT NULL
LIMIT 0, 1000;


SELECT *
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Sales
    GROUP BY CustomerID
    HAVING SUM(TotalAmount) > 500
);

SELECT 
    p.Category,
    SUM(si.Quantity * si.Price) AS TotalSalesAmount
FROM 
    Products p
JOIN 
    SaleItems si ON p.ProductID = si.ProductID
JOIN 
    Sales s ON si.SaleID = s.SaleID
GROUP BY 
    p.Category;


SELECT 
    p.ProductName,
    SUM(si.Quantity) AS TotalQuantitySold
FROM 
    Products p
JOIN 
    SaleItems si ON p.ProductID = si.ProductID
GROUP BY 
    p.ProductName
HAVING 
    SUM(si.Quantity) > 5;
    

SELECT 
    ProductName, 
    Price
FROM 
    Products
ORDER BY 
    Price DESC
LIMIT 5;

SELECT 
    s.SaleID,
    c.Firstname,
    s.TotalAmount
FROM 
    Sales s
JOIN 
    Customers c ON s.CustomerID = c.CustomerID;
    
    SELECT 
    p.ProductID,
    p.ProductName,
    p.Price,
    d.DiscountPercentage,
    d.StartDate,
    d.EndDate
FROM 
    Products p
LEFT JOIN 
    Discounts d ON p.ProductID = d.ProductID;

SELECT 
    c.CustomerID,
    c.Firstname,
    AVG(s.TotalAmount) AS AverageSaleAmount
FROM 
    Sales s
INNER JOIN 
    Customers c ON s.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerID, c.Firstname;
    
    SELECT 
    p.ProductID,
    p.ProductName,
    p.Price
FROM 
    Products p
WHERE 
    p.ProductID IN (
        SELECT 
            si.ProductID
        FROM 
            SaleItems si
        JOIN 
            Discounts d ON si.ProductID = d.ProductID
        WHERE 
            CURRENT_DATE BETWEEN d.StartDate AND d.EndDate
    );


SELECT 
    c.FirstName,
    c.LastName,
    p.ProductName,
    si.Quantity,
    si.Price
FROM 
    Sales s
INNER JOIN 
    SaleItems si ON s.SaleID = si.SaleID
INNER JOIN 
    Products p ON si.ProductID = p.ProductID
INNER JOIN 
    Customers c ON s.CustomerID = c.CustomerID;
    
    








create database online_food_ordering_system;
show databases;
use online_food_ordering_system;
show tables;







drop table customers;







-- ************************************************************************
-- 	Write SQL statements to create all the tables with the specified columns and foreign key references.
-- ************************************************************************
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL UNIQUE,
    lastname VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number int,
    reg_date date
);

-- ************************************************************************
--	Insert Records:
--	Insert at least 10 records into each of the tables to populate the database with sample data
-- ************************************************************************
INSERT INTO Customers (firstname,lastname, email, phone_number, reg_date)
VALUES 
('john','doe',  'john@example.com', 5551234, '2024-06-20'),
('jane','smith', 'jane@example.com', '5555678', '2024-08-29'),
('chef','bob',  'bob@restaurant.com', '5559101', '2024-08-31'),
('alice','jones', 'alice@example.com', '5551212', '2024-10-10'),
('bob','brown',  'bob@example.com', '5553434', '2024-06-06'),
('charlie','wilson', 'charlie@example.com', '5555656', '2024-01-15'),
('david','martin', 'david@example.com', '5557878', '2024-05-30'),
('eve','white',  'eve@example.com', '5559090', '2024-05-03'),
('frank','black',  'frank@example.com', '5552121', '2024-03-05'),
('grace','lee', 'grace@example.com', '5554343', '2024-06-25');

select * from customers;

-- CREATE TABLE RESTAURANT

DROP TABLE RESTAURANTS;
CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY AUTO_INCREMENT,
    RestaurantName VARCHAR(100) NOT NULL,
    CuisineType VARCHAR(50),
    Address VARCHAR(255)
);


INSERT INTO Restaurants (RestaurantName, CuisineType, Address) VALUES
('Pizza Palace', 'Italian', '101 Pizza St'),
('Burger Barn', 'American', '202 Burger Ave'),
('Sushi Spot', 'Japanese', '303 Sushi Blvd'),
('Taco Town', 'Mexican', '404 Taco Rd'),
('Curry Corner', 'Indian', '505 Curry Ln'),
('Noodle Nest', 'Chinese', '606 Noodle Dr'),
('BBQ Bistro', 'American', '707 BBQ St'),
('Pasta Place', 'Italian', '808 Pasta Ave'),
('Salad Shack', 'Healthy', '909 Salad Blvd'),
('Dessert Den', 'Desserts', '1010 Dessert Rd');

SELECT * FROM RESTAURANTS;

drop table menuitems;

-- CREATE TABLE MENUITEM
CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY AUTO_INCREMENT,
    RestaurantID INT,
    ItemName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price) VALUES
(1, 'Margherita Pizza', 'Classic cheese and tomato pizza', 8.99),
(2, 'Cheeseburger', 'Juicy beef burger with cheese', 6.99),
(3, 'California Roll', 'Crab and avocado sushi roll', 7.99),
(4, 'Chicken Taco', 'Grilled chicken taco with salsa', 3.99),
(5, 'Butter Chicken', 'Creamy chicken curry', 9.99),
(6, 'Kung Pao Chicken', 'Spicy stir-fried chicken', 8.99),
(7, 'BBQ Ribs', 'Tender pork ribs with BBQ sauce', 12.99),
(8, 'Spaghetti Carbonara', 'Pasta with creamy sauce and bacon', 10.99),
(9, 'Caesar Salad', 'Fresh salad with Caesar dressing', 5.99),
(10, 'Chocolate Cake', 'Rich chocolate dessert', 4.99);
drop table orders;

-- CREATE TABLE ORDERS
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    RestaurantID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);
SELECT * FROM ORDERS;
INSERT INTO Orders (Customer_ID,RestaurantID,OrderDate , TotalAmount) VALUES
(1, 1,'2024-12-01', 25.97),
(2, 4,'2023-04-02', 13.98),
(3, 7,'2024-09-05', 17.98),
(4, 3, '2024-06-06',8.99),
(5, 6, '2024-07-11',19.98),
(6, 9,'2023-06-10', 12.99),
(7, 1 ,'2024-10-10', 10.99),
(8, 2,'2024-03-01', 15.98),
(9, 3,'2024-12-02', 9.99),
(10, 4 ,'2024-05-30', 14.98);

select * from orders;

drop table orderdetails;

-- Order Details Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    MenuItemID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);


INSERT INTO OrderDetails (OrderID, MenuItemID, Quantity, Price) VALUES
(1, 1, 2, 8.99),
(1, 2, 1, 6.99),
(2, 3, 2, 7.99),
(3, 4, 3, 3.99),
(4, 5, 1, 9.99),
(5, 6, 2, 8.99),
(6, 7, 1, 12.99),
(7, 8, 1, 10.99),
(8, 9, 2, 5.99),
(9, 10, 1, 4.99);

-- create table reviews
select * from orderdetails; 

drop table reviews;
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_id INT,
    RestaurantID INT,
    Rating INT,
    Comment TEXT,
    ReviewDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

INSERT INTO Reviews (Customer_ID, RestaurantID, Rating, Comment) VALUES
(1, 1, 5, 'Great pizza!'),
(2, 2, 4, 'Tasty burger'),
(3, 3, 5, 'Fresh sushi'),
(4, 4, 3, 'Good tacos'),
(5, 5, 5, 'Delicious curry'),
(6, 6, 4, 'Spicy noodles'),
(7, 7, 5, 'Amazing ribs'),
(8, 8, 4, 'Creamy pasta'),
(9, 9, 3, 'Healthy salad'),
(10, 10, 5, 'Yummy dessert');

show tables;
-- ************************************************************************
-- Select Records:
--	Write a query to select all menu items where the price is less than $20.
-- ************************************************************************

select * from menuitems where 
price < 20;




-- ************************************************************************
-- Where Clause (AND/OR):
--	Write a query to select all orders where the total amount is between $30 and $50 and the order date is in 2024.
-- ************************************************************************
SELECT * FROM ORDERS;
select * from orders where 
totalamount between 30 and 50
 and year(orderdate)=2024;  
 
SELECT * FROM Orders
WHERE TotalAmount BETWEEN 10 AND 50
  AND YEAR(OrderDate) = 2024;
  
-- ************************************************************************  
  -- 	LIKE Operator:
--	Write a query to select all restaurants where the cuisine type contains 'Italian'.
-- ************************************************************************
select * from restaurants where
cuisinetype like 'italian';

-- ************************************************************************
-- 	CASE Statement:
--	Write a query to select item names and calculate a discounted price if the original price is greater than $15.
-- ************************************************************************
SELECT itemName,price AS OriginalPrice,
    CASE 
        WHEN price > 15 THEN price * 0.9 -- Applying a 10% discount
        ELSE price
    END AS DiscountedPrice
FROM MenuItems;



SELECT itemName,price AS OriginalPrice,
    CASE 
        WHEN price > 10 THEN price * 0.9 -- Applying a 10% discount
        ELSE price
    END AS DiscountedPrice
FROM MenuItems;

-- ************************************************************************
-- Subquery:
--	Write a query to find all customers who have placed orders totaling more than $10.
-- ************************************************************************
-- ********* Using Join ************
select * from customers;
select * from orders;
SELECT c.customer_id, c.firstname
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.firstname
HAVING SUM(o.Totalamount) > 10;

select * from orders;
-- ************ Using Subquery ***********

SELECT customer_id,firstname ,lastname
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING SUM(TotalAmount) > 10
);

-- ************************************************************************
-- Group By:
--	Write a query to get the total number of orders placed at each restaurant.
-- ************************************************************************
select * from restaurants;
select * from orders;

SELECT r.restaurantID, r.RestaurantName, COUNT(o.orderID) AS total_orders
FROM Restaurants r
LEFT JOIN Orders o ON r.restaurantID = o.restaurantID
GROUP BY r.restaurantID , r.RestaurantName;

-- ************************************************************************
-- Having Clause:
--	Write a query to get the total amount of orders for each restaurant, including only those with totals greater than $15.
-- ************************************************************************
SELECT r.restaurantID, r.RestaurantName, SUM(o.TotalAmount) AS total_amount
FROM Restaurants r JOIN Orders o 
ON r.restaurantID = o.restaurantID
GROUP BY r.restaurantID, r.RestaurantName
HAVING SUM(o.TotalAmount) > 15;



-- ************************************************************************
-- Limit:
--	Write a query to select the top 5 highest-rated restaurants.
-- ************************************************************************
select * from restaurants;
select * from reviews;

SELECT r.restaurantID, r.RestaurantName, w.rating
FROM Restaurants r join reviews w
ORDER BY w.Rating DESC
LIMIT 5;

-- ************************************************************************
-- Inner Join:
select * from Orders;
select * from customers;
--	Write a query to join orders with customers to get a list of all orders with customer names, order dates, and total amounts.
-- ************************************************************************
SELECT o.orderID, c.firstname  AS customer_name, o.OrderDate, o.TotalAmount
FROM Orders o JOIN Customers c 
ON o.customer_ID = c.customer_ID;



-- ************************************************************************
-- 	Outer Join:
--	Write a query to get a list of all menu items and any associated order details, including items that might not have been ordered.
-- ************************************************************************
select * from menuitems;
select * from Orderdetails;
SELECT mi.MenuitemID, mi.Itemname , od.orderID, od.quantity
FROM MenuItems mi LEFT JOIN OrderDetails od ON mi.MenuitemID = od.MenuItemID;





-- ************************************************************************
-- Join with Aggregation:
--	Write a query to get the total number of menu items available in each restaurant.
-- ************************************************************************
select * from Restaurants;
select * from menuitems;

SELECT r.restaurantID, r.RestaurantName AS Restaurant_Name, COUNT(mi.MenuitemID) AS total_items
FROM Restaurants r JOIN MenuItems mi
 ON r.restaurantID = mi.restaurantID
GROUP BY r.restaurantID, r.Restaurantname;

-- ************************************************************************
-- Subquery with Join:
--	Write a query to find all restaurants that have a rating of more than 4.0 from at least 1 different customers.
-- ************************************************************************
SELECT restaurantID
FROM reviews
WHERE rating > 4.0
GROUP BY restaurantID
HAVING COUNT(DISTINCT customer_id) >= 1;
SELECT r.restaurantID
FROM reviews r
JOIN (
    SELECT restaurantID
    FROM reviews
    WHERE rating > 4.0
    GROUP BY restaurantID
    HAVING COUNT(DISTINCT customer_id) >= 1
) sub ON r.restaurantID = sub.restaurantID
GROUP BY r.restaurantID;

select * from reviews;

-- ************************************************************************
-- Advanced Join:
--	Write a query to list item names, restaurant names, quantities, and item prices for all ordered items.
-- ************************************************************************
select * from Menuitems;
select * from orderdetails;
select * from restaurants;

SELECT mi.ItemName AS item_name, r.RestaurantName AS restaurant_name, od.quantity, mi.price
FROM OrderDetails od JOIN MenuItems mi 
ON od.MenuItemID = mi.MenuItemID
JOIN Restaurants r ON mi.restaurantID = r.restaurantID;




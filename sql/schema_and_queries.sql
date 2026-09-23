show databases;
-- drop database ecom;
create database ecom;
use ecom;
-- USER
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Mail VARCHAR(100),
    Phone VARCHAR(15)
);

-- USER INFO
CREATE TABLE UserInfo (
    UserID INT,
    HouseNo VARCHAR(20),
    Street VARCHAR(100),
    Locality VARCHAR(100),
    Building VARCHAR(100),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- PRODUCT INFO
CREATE TABLE ProductInfo (
    ProductInfoID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Specifications TEXT,
    Images TEXT
);

-- PLATFORM
CREATE TABLE Platform (
    PlatformID INT PRIMARY KEY,
    Name VARCHAR(100),
    URL VARCHAR(255)
);

-- BRAND
CREATE TABLE Brand (
    BrandID INT PRIMARY KEY,
    BrandName VARCHAR(100),
    PlatformID INT,
    FOREIGN KEY (PlatformID) REFERENCES Platform(PlatformID)
);

-- CATEGORY
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100),
    Description TEXT
);

-- PRODUCT
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductInfoID INT,
    CategoryID INT,
    BrandID INT,
    FOREIGN KEY (ProductInfoID) REFERENCES ProductInfo(ProductInfoID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID)
);

-- CART
CREATE TABLE Cart (
    CartID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- REVIEW
CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- WAREHOUSE
CREATE TABLE Warehouse (
    WarehouseID INT PRIMARY KEY,
    Location VARCHAR(100),
    Capacity INT
);

-- SHIPMENT
CREATE TABLE Shipment (
    ShipmentID INT PRIMARY KEY,
    ShippingCompany VARCHAR(100),
    EstimatedDelivery DATE,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

-- ORDER
CREATE TABLE `Order` (
    OrderID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    PlatformID INT,
    ShipmentID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (PlatformID) REFERENCES Platform(PlatformID),
    FOREIGN KEY (ShipmentID) REFERENCES Shipment(ShipmentID)
);

-- PAYMENT
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    Method VARCHAR(50),
    Amount DECIMAL(10, 2),
    Date DATE,
    UserID INT,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- SUPPLIER
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    Mail VARCHAR(100)
);

-- SUPPLIER INFO
CREATE TABLE SupplierInfo (
    SupplierID INT,
    ShopNo VARCHAR(20),
    Street VARCHAR(100),
    Locality VARCHAR(100),
    Building VARCHAR(100),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- SELLER
CREATE TABLE Seller (
    SellerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    Mail VARCHAR(100)
);

-- SELLER INFO
CREATE TABLE SellerInfo (
    SellerID INT,
    ShopNo VARCHAR(20),
    Street VARCHAR(100),
    Locality VARCHAR(100),
    Building VARCHAR(100),
    FOREIGN KEY (SellerID) REFERENCES Seller(SellerID)
);

-- RELATION: PRODUCT_SUPPLIER (M:N)
CREATE TABLE Product_Supplier (
    ProductID INT,
    SupplierID INT,
    PRIMARY KEY (ProductID, SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- RELATION: SELLER_PRODUCT (M:N)
CREATE TABLE Seller_Product (
    SellerID INT,
    ProductID INT,
    PRIMARY KEY (SellerID, ProductID),
    FOREIGN KEY (SellerID) REFERENCES Seller(SellerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- USER
INSERT INTO User VALUES 
(1, 'Alice Johnson', 25, 'alice@example.com', '9999911111'),
(2, 'Bob Smith', 30, 'bob@example.com', '9999922222'),
(3, 'Charlie Davis', 28, 'charlie@example.com', '9999933333'),
(4, 'Diana Patel', 35, 'diana@example.com', '9999944444'),
(5, 'Ethan Brown', 40, 'ethan@example.com', '9999955555'),
(6, 'Fiona Lee', 27, 'fiona@example.com', '9999966666'),
(7, 'George Kim', 22, 'george@example.com', '9999977777'),
(8, 'Hannah Scott', 33, 'hannah@example.com', '9999988888');

-- USER INFO
INSERT INTO UserInfo VALUES 
(1, '101', 'Maple Street', 'Greenfield', 'Green Heights'),
(2, '202', 'Oak Avenue', 'Downtown', 'Sky Tower'),
(3, '303', 'Pine Road', 'Uptown', 'Hill View'),
(4, '404', 'Cedar Lane', 'Westside', 'Sunshine Apartments'),
(5, '505', 'Elm Street', 'Eastside', 'River View'),
(6, '606', 'Birch Lane', 'North Town', 'Garden Court'),
(7, '707', 'Ash Street', 'Southside', 'Metro Plaza'),
(8, '808', 'Willow Avenue', 'Central Park', 'Elite Residency');

-- PLATFORM
INSERT INTO Platform VALUES 
(1, 'Amazon', 'https://amazon.in'),
(2, 'Flipkart', 'https://flipkart.com'),
(3, 'Snapdeal', 'https://snapdeal.com');

-- BRAND
INSERT INTO Brand VALUES 
(1, 'Samsung', 1),
(2, 'Apple', 2),
(3, 'OnePlus', 1),
(4, 'HP', 3),
(5, 'Dell', 2),
(6, 'Sony', 1);

-- CATEGORY
INSERT INTO Category VALUES 
(1, 'Smartphones', 'Mobile phones with advanced features'),
(2, 'Laptops', 'Portable personal computers'),
(3, 'Headphones', 'Audio listening devices'),
(4, 'Accessories', 'Electronic add-ons'),
(5, 'Tablets', 'Touchscreen portable devices');

-- PRODUCT INFO
INSERT INTO ProductInfo VALUES 
(1, 'Samsung Galaxy S21', 'Android smartphone', '8GB RAM, 128GB Storage', 'img_s21.jpg'),
(2, 'iPhone 14', 'iOS smartphone', '128GB, A15 Bionic', 'img_iphone14.jpg'),
(3, 'OnePlus 10', 'Android smartphone', '12GB RAM, 256GB Storage', 'img_op10.jpg'),
(4, 'MacBook Air', 'Apple laptop', 'M2 Chip, 512GB SSD', 'img_mac.jpg'),
(5, 'HP Pavilion', 'HP laptop', 'i5, 16GB RAM, 1TB SSD', 'img_hp.jpg'),
(6, 'Sony WH-1000XM4', 'Headphones', 'Bluetooth, Noise Cancelling', 'img_sony.jpg'),
(7, 'Dell Inspiron', 'Dell laptop', 'i7, 512GB SSD', 'img_dell.jpg'),
(8, 'iPad Air', 'Apple tablet', '64GB, WiFi', 'img_ipad.jpg');

-- PRODUCT
INSERT INTO Product VALUES 
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 1, 3),
(4, 4, 2, 2),
(5, 5, 2, 4),
(6, 6, 3, 6),
(7, 7, 2, 5),
(8, 8, 5, 2);

-- SUPPLIER
INSERT INTO Supplier VALUES 
(1, 'TechSupply', '8888811111', 'supply@tech.com'),
(2, 'GadgetWorld', '8888822222', 'gadget@world.com'),
(3, 'DigitalHub', '8888833333', 'hub@digital.com');

-- SUPPLIER INFO
INSERT INTO SupplierInfo VALUES 
(1, 'S1', 'Electronics Street', 'Chandni Chowk', 'Galaxy Plaza'),
(2, 'S2', 'Gadget Road', 'Koramangala', 'Tech Tower'),
(3, 'S3', 'Digital Street', 'CP', 'Infinity Mall');

-- SELLER
INSERT INTO Seller VALUES 
(1, 'QuickSell', '7777711111', 'qsell@example.com'),
(2, 'TopDealz', '7777722222', 'topdealz@example.com'),
(3, 'MegaStore', '7777733333', 'mega@store.com');

-- SELLER INFO
INSERT INTO SellerInfo VALUES 
(1, 'A1', 'Market Street', 'South City', 'Bazaar Mall'),
(2, 'B2', 'Trade Avenue', 'North Block', 'Trade Plaza'),
(3, 'C3', 'Central Street', 'West Market', 'Mega Complex');

-- PRODUCT_SUPPLIER
INSERT INTO Product_Supplier VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 1),
(8, 2);

-- SELLER_PRODUCT
INSERT INTO Seller_Product VALUES 
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(1, 5),
(3, 6),
(3, 7),
(3, 8);

-- WAREHOUSE
INSERT INTO Warehouse VALUES 
(1, 'Delhi', 500),
(2, 'Mumbai', 1000),
(3, 'Bangalore', 800);

-- SHIPMENT
INSERT INTO Shipment VALUES 
(1, 'BlueDart', '2025-04-15', 1),
(2, 'Delhivery', '2025-04-17', 2),
(3, 'Ecom Express', '2025-04-18', 2),
(4, 'DTDC', '2025-04-19', 3);


-- ORDER
INSERT INTO `Order` VALUES 
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 1, 3),
(4, 4, 4, 2, 2),
(5, 5, 5, 3, 4),
(6, 6, 6, 1, 1),
(7, 7, 7, 2, 2),
(8, 8, 8, 3, 3);

-- PAYMENT
INSERT INTO Payment VALUES 
(1, 1, 'UPI', 69999.00, '2025-04-10', 1),
(2, 2, 'Credit Card', 79999.00, '2025-04-10', 2),
(3, 3, 'Debit Card', 54999.00, '2025-04-10', 3),
(4, 4, 'Net Banking', 119999.00, '2025-04-10', 4),
(5, 5, 'UPI', 69999.00, '2025-04-10', 5),
(6, 6, 'Cash on Delivery', 4999.00, '2025-04-10', 6),
(7, 7, 'Credit Card', 39999.00, '2025-04-10', 7),
(8, 8, 'UPI', 25999.00, '2025-04-10', 8);

-- CART
INSERT INTO Cart VALUES 
(1, 1, 3),
(2, 2, 2),
(3, 3, 5),
(4, 4, 4),
(5, 5, 1),
(6, 6, 8),
(7, 7, 7),
(8, 8, 6);

-- REVIEW
INSERT INTO Review VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8);

show tables;


-- TOP 3 Expensive order
SELECT 
    o.OrderID, u.Name AS UserName, pi.Name AS ProductName, p.Amount
FROM 
    `Order` o
JOIN 
    User u ON o.UserID = u.UserID
JOIN 
    Product pr ON o.ProductID = pr.ProductID
JOIN 
    ProductInfo pi ON pr.ProductInfoID = pi.ProductInfoID
JOIN 
    Payment p ON o.OrderID = p.OrderID
ORDER BY 
    p.Amount DESC
LIMIT 3;

-- Sellers selling products in ‘Laptops’ category
SELECT DISTINCT 
    s.Name AS SellerName, pi.Name AS ProductName, c.CategoryName
FROM 
    Seller s
JOIN 
    Seller_Product sp ON s.SellerID = sp.SellerID
JOIN 
    Product p ON sp.ProductID = p.ProductID
JOIN 
    Category c ON p.CategoryID = c.CategoryID
JOIN 
    ProductInfo pi ON p.ProductInfoID = pi.ProductInfoID
WHERE 
    c.CategoryName = 'Laptops';

-- Total revenue generated by each platform
SELECT 
    pl.Name AS PlatformName, SUM(pay.Amount) AS TotalRevenue
FROM 
    `Order` o
JOIN 
    Platform pl ON o.PlatformID = pl.PlatformID
JOIN 
    Payment pay ON o.OrderID = pay.OrderID
GROUP BY 
    pl.PlatformID;

-- Most active users (by number of orders)
SELECT 
    u.Name AS UserName, COUNT(o.OrderID) AS TotalOrders
FROM 
    User u
JOIN 
    `Order` o ON u.UserID = o.UserID
GROUP BY 
    u.UserID
ORDER BY 
    TotalOrders DESC;

-- Suppliers supplying to most number of unique products
SELECT 
    s.Name AS SupplierName, COUNT(DISTINCT ps.ProductID) AS ProductsSupplied
FROM 
    Supplier s
JOIN 
    Product_Supplier ps ON s.SupplierID = ps.SupplierID
GROUP BY 
    s.SupplierID
ORDER BY 
    ProductsSupplied DESC;

-- Warehouses with pending shipments and their capacities
SELECT 
    w.Location, w.Capacity, COUNT(s.ShipmentID) AS PendingShipments
FROM 
    Warehouse w
JOIN 
    Shipment s ON w.WarehouseID = s.WarehouseID
GROUP BY 
    w.WarehouseID;

-- Users who purchased and reviewed the same product
SELECT 
    u.Name AS UserName, pi.Name AS ProductName
FROM 
    User u
JOIN 
    `Order` o ON u.UserID = o.UserID
JOIN 
    Review r ON u.UserID = r.UserID AND o.ProductID = r.ProductID
JOIN 
    Product p ON r.ProductID = p.ProductID
JOIN 
    ProductInfo pi ON p.ProductInfoID = pi.ProductInfoID;

-- Average product price by category
SELECT 
    c.CategoryName, ROUND(AVG(pay.Amount), 2) AS AvgPrice
FROM 
    `Order` o
JOIN 
    Payment pay ON o.OrderID = pay.OrderID
JOIN 
    Product p ON o.ProductID = p.ProductID
JOIN 
    Category c ON p.CategoryID = c.CategoryID
GROUP BY 
    c.CategoryID;
    
-- User Category
select u.userid, u.name, u.mail, u.phone, c.categoryid, c.categoryname
from `order` o
join user u on o.userid = u.userid
join product p on o.productid = p.productid
join category c on p.categoryid = c.categoryid;

SELECT * FROM User;
SELECT * FROM UserInfo;
SELECT * FROM ProductInfo;
SELECT * FROM Platform;
SELECT * FROM Brand;
SELECT * FROM Category;
SELECT * FROM Product;
SELECT * FROM Cart;
SELECT * FROM Review;
SELECT * FROM Warehouse;
SELECT * FROM Shipment;
SELECT * FROM `Order`;
SELECT * FROM Payment;
SELECT * FROM Supplier;
SELECT * FROM SupplierInfo;
SELECT * FROM Seller;
SELECT * FROM SellerInfo;
SELECT * FROM Product_Supplier;
SELECT * FROM Seller_Product;

select pi.name as ProductName,pi.Description,pi.Specifications,count(o.OrderID) as totalorders,s.name as suppliername,s.phone as supplierphone,
sel.name as sellername,sel.phone as sellerphone
from `order` o
join product p on o.productid=p.productid
join productinfo pi on p.productinfoid=pi.productinfoid
join product_supplier ps on p.productid = ps.productID
join supplier s on ps.supplierid = s.supplierid
join seller_product sp on p.productid = sp.productid
join seller sel on sp.sellerid = sel.sellerid
where o.productid in (select productid from `order` group by productid having count(orderid)=(select max(order_count) from (select count(orderid) as order_count from `order` group by productid) as sub)) group by pi.name, s.name,sel.name, pi.description, pi.specifications, s.phone, sel.phone;

select pi.productinfoid, pi.name as productname, pi.description, pi.specifications, pi.images,s.shipmentid as sid, s.estimateddelivery as shipmentdate
from shipment s
join `order` o on s.shipmentid = o.shipmentid
join product p on o.productid= p.productid
join productinfo pi on p.productinfoid = pi.productinfoid
where s.estimateddelivery between '2025-04-15' and '2025-04-18';









































































-- Drop tables if they exist to start fresh
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS InventoryManager;
DROP TABLE IF EXISTS DeliveryManager;

-- Create Admin table
CREATE TABLE Admin (
    Admin_ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Password VARCHAR(50)
);

-- Create InventoryManager table
CREATE TABLE InventoryManager (
    M_ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Password VARCHAR(50)
);

-- Create DeliveryManager table
CREATE TABLE DeliveryManager (
    D_ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Password VARCHAR(50)
);

-- Create Product table
CREATE TABLE Product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_path VARCHAR(255),
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    price DECIMAL(10,2) NOT NULL
);

-- Create Customer table
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100),
    Password VARCHAR(50)
);


-- Sample Inserts for Product table
INSERT INTO Product (image_path, product_name, category, stock, price)
VALUES
    ('/productImages/4.jpg', 'Fresh Milk', 'Dairy', 100, 1.99),
    ('/productImages/5.jpg', 'Brown Bread', 'Bakery', 50, 1.29),
    ('/productImages/6.jpg', 'Chicken Breast', 'Meat', 30, 3.99),
    ('/productImages/7.jpg', 'Broccoli', 'Vegetables', 75, 0.99),
    ('/productImages/8.jpg', 'Basmati Rice', 'Grains', 40, 12.49);

-- Sample Inserts for Admin table
INSERT INTO Admin (Username, First_Name, Last_Name, Phone, Email, Password)
VALUES
    ('SuperAdmin', 'John', 'Doe', '+94701112222', 'john.doe@example.com', 'admin@123'),
    ('adminJane', 'Jane', 'Smith', '+94701113333', 'jane.smith@example.com', 'pass1234'),
    ('adminSam', 'Sam', 'Brown', '+94701114444', 'sam.brown@example.com', 'secure123'),
    ('adminLily', 'Lily', 'Taylor', '+94701115555', 'lily.taylor@example.com', 'admin2025'),
    ('adminMax', 'Max', 'Davis', '+94701116666', 'max.davis@example.com', 'password1');

-- Sample Inserts for InventoryManager table
INSERT INTO InventoryManager (Username, First_Name, Last_Name, Phone, Email, Password)
VALUES
    ('SuperManager', 'Alex', 'Miller', '+94702223333', 'alex.miller@example.com', 'inv@2025'),
    ('managerEva', 'Eva', 'Wilson', '+94702224444', 'eva.wilson@example.com', 'invManager1'),
    ('managerJake', 'Jake', 'Anderson', '+94702225555', 'jake.anderson@example.com', 'inventory!99'),
    ('managerMia', 'Mia', 'Thomas', '+94702226666', 'mia.thomas@example.com', 'manager$12'),
    ('managerZoe', 'Zoe', 'Martin', '+94702227777', 'zoe.martin@example.com', 'inventory#44');

-- Sample Inserts for DeliveryManager table
INSERT INTO DeliveryManager (Username, First_Name, Last_Name, Phone, Email, Password)
VALUES
    ('SuperDelivery', 'Adam', 'White', '+94703334444', 'adam.white@example.com', 'del@driver'),
    ('deliveryChloe', 'Chloe', 'King', '+94703335555', 'chloe.king@example.com', 'deliver123'),
    ('deliveryNick', 'Nick', 'Scott', '+94703336666', 'nick.scott@example.com', 'fast$move'),
    ('deliverySophia', 'Sophia', 'Green', '+94703337777', 'sophia.green@example.com', 'onTime#45'),
    ('deliveryLiam', 'Liam', 'Clark', '+94703338888', 'liam.clark@example.com', 'routeDriver');

-- Insert sample values
INSERT INTO Customer (customer_id, username, first_name, last_name, phone, email, password)
VALUES
(1, 'john_doe', 'John', 'Doe', '1234567890', 'john.doe@example.com', 'securePass123'),
(2, 'jane_smith', 'Jane', 'Smith', '0987654321', 'jane.smith@example.com', 'password987'),
(3, 'alice_williams', 'Alice', 'Williams', '5678901234', 'alice.williams@example.com', 'aliceSecure1'),
(4, 'mike_jones', 'Mike', 'Jones', '6789012345', 'mike.jones@example.com', 'mikePass1234'),
(5, 'emma_brown', 'Emma', 'Brown', '7890123456', 'emma.brown@example.com', 'emmaCode567');

    
-- Select all data from Admin table
SELECT * FROM Admin;

-- Select all data from InventoryManager table
SELECT * FROM InventoryManager;

-- Select all data from DeliveryManager table
SELECT * FROM DeliveryManager;

-- Select all data from Product table
SELECT * FROM Product;

-- Select all data from Customer table
SELECT * FROM Customer;
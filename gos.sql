CREATE DATABASE gos;
Use gos;

CREATE TABLE Admin(
    Admin_ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Password VARCHAR(50)
);

CREATE TABLE InventoryManager(
    M_ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Password VARCHAR(50)
);

CREATE TABLE DeliveryManager(
    D_ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Password VARCHAR(50)
);

-- Create Product table with the specified columns
CREATE TABLE Product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_path VARCHAR(255),
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    price DECIMAL(10,2) NOT NULL
);

-- Insert sample product data
INSERT INTO Product (image_path, product_name, category, stock, price)
VALUES
    ('/productImages/1.jpg', 'MacBook Pro', 'Electronics', 50, 1299.99),
    ('/productImages/2.jpg', 'iPhone 15', 'Electronics', 9, 899.99),
    ('/productImages/3.jpg', 'Cotton T-Shirt', 'Clothing', 200, 19.99);

-- Verify the data
SELECT * FROM admin;


INSERT INTO  DeliveryManager (D_ID, Username, First_Name, Last_Name, Phone, Email, Password)
VALUES
    (0, "Admin1", "Osanda", "Madugalle", "+94705531088", "osandamadugalle@gmail.com", "admin123"),
    (0, "Test1", "Saman", "Silva", "+94705555555", "saman@gmail.com", "test@123");

SELECT * FROM admin;
SELECT * FROM InventoryManager;
SELECT * FROM DeliveryManager;


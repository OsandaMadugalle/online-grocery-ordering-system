-- Drop tables if they exist
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS InventoryManager;
DROP TABLE IF EXISTS DeliveryManager;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS DeliveryPerson;

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

-- Create DeliveryPerson table
CREATE TABLE DeliveryPerson (
    DP_ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Password VARCHAR(50)
);

-- Sample Product Inserts (Sri Lankan products)
INSERT INTO Product (image_path, product_name, category, stock, price)
VALUES
    ('images/productImages/AnchorKiri1L.png', 'Anchor Kiri 1L', 'Dairy', 120, 520.00),
    ('images/productImages/CoconutRotiPack.jpeg', 'Coconut Roti Pack', 'Bakery', 60, 150.00),
    ('images/productImages/KelawallaFish.jpg', 'Kelawalla Fish', 'Meat', 25, 1100.00),
    ('images/productImages/AmbulBanana.jpeg', 'Ambul Banana', 'Fruits', 80, 90.00),
    ('images/productImages/NaduRice.jpeg', 'Nadu Rice 5kg', 'Grains', 50, 750.00);

-- Sample Admin Inserts
INSERT INTO Admin (Username, First_Name, Last_Name, Phone, Email, Password)
VALUES
    ('adminNimal', 'Nimal', 'Perera', '0712345678', 'nimal.perera@slexample.com', 'admin@2025'),
    ('adminKumari', 'Kumari', 'Fernando', '0711234567', 'kumari.fernando@slexample.com', 'securePass1'),
    ('adminSanjeewa', 'Sanjeewa', 'Jayasinghe', '0719876543', 'sanjeewa.jaya@slexample.com', 'sanj@admin'),
    ('adminNadeesha', 'Nadeesha', 'Silva', '0716789999', 'nadeesha.silva@slexample.com', 'nadee2025'),
    ('adminRuwan', 'Ruwan', 'De Silva', '0714442211', 'ruwan.desilva@slexample.com', 'pass4321');

-- Inventory Managers
INSERT INTO InventoryManager (Username, First_Name, Last_Name, Phone, Email, Password)
VALUES
    ('invRuwan', 'Ruwan', 'Rajapaksha', '0720001111', 'ruwan.rajapaksha@slexample.com', 'inv@sl2025'),
    ('invThilini', 'Thilini', 'Dias', '0720002222', 'thilini.dias@slexample.com', 'invmanager'),
    ('invAjith', 'Ajith', 'Weerasinghe', '0720003333', 'ajith.weera@slexample.com', 'storeSecure'),
    ('invChamari', 'Chamari', 'Gunasekara', '0720004444', 'chamari.guna@slexample.com', 'stockM@2025'),
    ('invRoshan', 'Roshan', 'Senanayake', '0720005555', 'roshan.sena@slexample.com', 'roshanMGR');

-- Delivery Managers
INSERT INTO DeliveryManager (Username, First_Name, Last_Name, Phone, Email, Password)
VALUES
    ('delKamal', 'Kamal', 'Rathnayake', '0730001111', 'kamal.rathna@slexample.com', 'deliver@sl'),
    ('delNadeeka', 'Nadeeka', 'Perera', '0730002222', 'nadeeka.perera@slexample.com', 'fastMove'),
    ('delAruna', 'Aruna', 'Wijesinghe', '0730003333', 'aruna.wije@slexample.com', 'routePlan123'),
    ('delIshara', 'Ishara', 'Lakmal', '0730004444', 'ishara.lakmal@slexample.com', 'onTime@45'),
    ('delRashmi', 'Rashmi', 'Jayalath', '0730005555', 'rashmi.jaya@slexample.com', 'rashDel');

-- Delivery Persons
INSERT INTO DeliveryPerson (Username, First_name, Last_name, Phone, Email, Password)
VALUES
    ('dpDilan', 'Dilan', 'Kumara', '0740001111', 'dilan.kumara@slexample.com', 'dilan123'),
    ('dpNisansala', 'Nisansala', 'Wijeratne', '0740002222', 'nisansala.wije@slexample.com', 'nisan@dp'),
    ('dpHarsha', 'Harsha', 'Madushanka', '0740003333', 'harsha.madu@slexample.com', 'passHarsha'),
    ('dpJanani', 'Janani', 'Wickramasinghe', '0740004444', 'janani.wick@slexample.com', 'janaPass1'),
    ('dpLakshan', 'Lakshan', 'Ranasinghe', '0740005555', 'lakshan.rana@slexample.com', 'secureLak');

-- Sample Sri Lankan Customers
INSERT INTO Customer (customer_id, username, first_name, last_name, phone, email, password)
VALUES
(1, 'nuwan_k', 'Nuwan', 'Kumara', '0771234567', 'nuwan.k@example.lk', 'nuwan@123'),
(2, 'sachini_f', 'Sachini', 'Fernando', '0779876543', 'sachini.f@example.lk', 'sachi@pass'),
(3, 'hiruni_w', 'Hiruni', 'Wijeratne', '0713456789', 'hiruni.w@example.lk', 'hiruSecure'),
(4, 'kamal_j', 'Kamal', 'Jayawardena', '0782345678', 'kamal.j@example.lk', 'kamalpass'),
(5, 'dilani_p', 'Dilani', 'Perera', '0754567890', 'dilani.p@example.lk', 'dilani!12');

-- Select all records from Admin table
SELECT * FROM Admin;

-- Select all records from InventoryManager table
SELECT * FROM InventoryManager;

-- Select all records from DeliveryManager table
SELECT * FROM DeliveryManager;

-- Select all records from Product table
SELECT * FROM Product;

-- Select all records from Customer table
SELECT * FROM Customer;

-- Select all records from DeliveryPerson table
SELECT * FROM DeliveryPerson;

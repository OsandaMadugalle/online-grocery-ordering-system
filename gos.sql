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

INSERT INTO  InventoryManager (M_ID, Username, First_Name, Last_Name, Phone, Email, Password)
VALUES
    (0, "Admin", "Osanda", "Madugalle", "+94705531088", "osandamadugalle@gmail.com", "admin123"),
    (0, "Test", "Saman", "Silva", "+94705555555", "saman@gmail.com", "test@123");

SELECT * FROM admin;
SELECT * FROM InventoryManager;

CREATE TABLE InventoryManager(
    M_ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Password VARCHAR(50)
);
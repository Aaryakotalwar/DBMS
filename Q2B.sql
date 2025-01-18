CREATE DATABASE FoodDeliverySystem;
USE FoodDeliverySystem;

CREATE TABLE Customer (
    Cust_Id INT PRIMARY KEY AUTO_INCREMENT,  
    FName VARCHAR(50) NOT NULL,              -- Customer's first name
    LName VARCHAR(50),                       -- Customer's last name
    Cust_Cont VARCHAR(15),                   -- Contact number
    Cust_Mail VARCHAR(100),                  -- Email
    Cust_add VARCHAR(255)                    -- Address
);

CREATE TABLE Restaurant (
    Rest_Id INT PRIMARY KEY AUTO_INCREMENT,
    Rest_Name VARCHAR(100) NOT NULL,
    Rest_Cont VARCHAR(15),
    Rest_Address VARCHAR(255),
    Rest_Rating FLOAT
);
CREATE TABLE Orders (
    O_ID INT PRIMARY KEY AUTO_INCREMENT,
    Cust_Id INT NOT NULL,
    Rest_Id INT NOT NULL,
    FOREIGN KEY (Cust_Id) REFERENCES Customer(Cust_Id),
    FOREIGN KEY (Rest_Id) REFERENCES Restaurant(Rest_Id)
);
CREATE TABLE Order_Item (
    O_ID INT NOT NULL,
    Item_Id INT NOT NULL,
    Item_Name VARCHAR(100) NOT NULL,
    Item_Price DECIMAL(10, 2),
    PRIMARY KEY (O_ID, Item_Id),
    FOREIGN KEY (O_ID) REFERENCES Orders(O_ID)
);
CREATE TABLE Payment (
    Pay_Id INT PRIMARY KEY AUTO_INCREMENT,
    O_ID INT NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    Pay_Method VARCHAR(50),
    FOREIGN KEY (O_ID) REFERENCES Orders(O_ID)
);
CREATE TABLE Delivery_Person (
    DP_Id INT PRIMARY KEY AUTO_INCREMENT,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50),
    DP_Cont VARCHAR(15)
);

CREATE TABLE Delivery (
    O_ID INT NOT NULL,
    DP_Id INT NOT NULL,
    PRIMARY KEY (O_ID, DP_Id),
    FOREIGN KEY (O_ID) REFERENCES Orders(O_ID),
    FOREIGN KEY (DP_Id) REFERENCES Delivery_Person(DP_Id)
);

INSERT INTO Customer (FName, LName, Cust_Cont, Cust_Mail, Cust_add)
VALUES 
('Ravi', 'Kumar', '9876543210', 'ravi.kumar@example.com', 'MG Road, Bengaluru'),
('Priya', 'Sharma', '8765432109', 'priya.sharma@example.com', 'Connaught Place, Delhi'),
('Amit', 'Patel', '9123456789', 'amit.patel@example.com', 'Satellite Road, Ahmedabad'),
('Neha', 'Verma', '9898765432', 'neha.verma@example.com', 'Park Street, Kolkata');

INSERT INTO Restaurant (Rest_Name, Rest_Cont, Rest_Address, Rest_Rating)
VALUES 
('Tandoori Treats', '7896541230', 'Indiranagar, Bengaluru', 4.6),
('Biryani House', '7890123456', 'Karol Bagh, Delhi', 4.8),
('Gujarati Thali', '8765432101', 'Ellis Bridge, Ahmedabad', 4.5),
('Bengali Sweets', '9012345678', 'Salt Lake, Kolkata', 4.7);

INSERT INTO Orders (Cust_Id, Rest_Id)
VALUES 
(1, 1),  -- Ravi placed an order at Tandoori Treats
(2, 2),  -- Priya placed an order at Biryani House
(3, 3),  -- Amit placed an order at Gujarati Thali
(4, 4);  -- Neha placed an order at Bengali Sweets

INSERT INTO Order_Item (O_ID, Item_Id, Item_Name, Item_Price)
VALUES 
(1, 1, 'Paneer Tikka', 250.00),
(1, 2, 'Butter Naan', 40.00),
(2, 1, 'Hyderabadi Biryani', 300.00),
(2, 2, 'Raita', 50.00),
(3, 1, 'Dal Baati', 180.00),
(3, 2, 'Chaas', 30.00),
(4, 1, 'Rosogolla', 120.00),
(4, 2, 'Fish Curry', 350.00);

INSERT INTO Payment (O_ID, Total_Amount, Pay_Method)
VALUES 
(1, 290.00, 'UPI'),           -- Total for Ravi's order
(2, 350.00, 'Credit Card'),   -- Total for Priya's order
(3, 210.00, 'Cash'),          -- Total for Amit's order
(4, 470.00, 'Debit Card');    -- Total for Neha's order

INSERT INTO Delivery_Person (FName, LName, DP_Cont)
VALUES 
('Rajesh', 'Mishra', '7896543210'),
('Sunita', 'Gupta', '9123456780'),
('Anil', 'Yadav', '9012345678'),
('Meera', 'Joshi', '8765432190');

INSERT INTO Delivery (O_ID, DP_Id)
VALUES 
(1, 1),  -- Rajesh delivered Ravi's order
(2, 2),  -- Sunita delivered Priya's order
(3, 3),  -- Anil delivered Amit's order
(4, 4);  -- Meera delivered Neha's order

SELECT * FROM Customer;
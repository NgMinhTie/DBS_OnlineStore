DROP SCHEMA IF EXISTS cellphone;
CREATE SCHEMA cellphone;
USE cellphone;

CREATE TABLE Customer (
    AccountID VARCHAR(15) PRIMARY KEY,
    CusPoint INT,
    FName VARCHAR(50),
    MName VARCHAR(50),
    LName VARCHAR(50),
    DOB DATE,
    Gender ENUM('Male', 'Female'),
    Address TEXT
);

CREATE TABLE CusNumPhone (
    AccountID VARCHAR(15),
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (AccountID, PhoneNumber),
    FOREIGN KEY (AccountID) REFERENCES Customer(AccountID)
);

CREATE TABLE Voucher (
    AccountID VARCHAR(15),
    expiredDate DATE,
    discountValue DECIMAL(10, 2),
    FOREIGN KEY (AccountID) REFERENCES Customer(AccountID)
);

CREATE TABLE Branch (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(255),
    DiscountType VARCHAR(50)
);

CREATE TABLE Manager (
    Manager_ID VARCHAR(15) PRIMARY KEY,
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(ID)
);

CREATE TABLE Employee (
    EMP_ID VARCHAR(15) PRIMARY KEY,
    LName VARCHAR(50),
    FName VARCHAR(50),
    EMP_Date DATE,
    Month INT,
    Year INT,
    EMP_Address TEXT,
    Gender ENUM('Male', 'Female'),
    ManagerID VARCHAR(15),
    FOREIGN KEY (ManagerID) REFERENCES Manager(Manager_ID)
);

CREATE TABLE Stafff (
    StaffID VARCHAR(15) PRIMARY KEY,
    FOREIGN KEY (StaffID) REFERENCES Employee(EMP_ID)
);

CREATE TABLE Bill (
    BillID VARCHAR(15) PRIMARY KEY,
    Cus_AccountID VARCHAR(15),
    PaymentMethod_ID INT,
    StaffID VARCHAR(15),
    D_Num INT,
    Month INT,
    Year INT,
    Hour INT,
    Minute INT,
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (Cus_AccountID) REFERENCES Customer(AccountID),
    FOREIGN KEY (StaffID) REFERENCES Stafff(StaffID)
);

CREATE TABLE DeviceType (
    DeviceID VARCHAR(15) PRIMARY KEY,
    DeviceName VARCHAR(100)
);

CREATE TABLE Contain (
    BillID VARCHAR(15),
    deviceType VARCHAR(15),
    deviceNumber INT,
    PRIMARY KEY (BillID, deviceType),
    FOREIGN KEY (BillID) REFERENCES Bill(BillID),
    FOREIGN KEY (deviceType) REFERENCES DeviceType(DeviceID)
);



CREATE TABLE Device (
    DeviceType VARCHAR(15) PRIMARY KEY,
    Status ENUM('Active', 'Inactive'),
    DevicePrice DECIMAL(10, 2),
    FOREIGN KEY (DeviceType) REFERENCES DeviceType(DeviceID)
);

CREATE TABLE Updated (
    BillID VARCHAR(15),
    NoteID INT,
    SellQuantity INT,
    DeviceStatus ENUM('New', 'Used', 'Defective'),
    FOREIGN KEY (BillID) REFERENCES Bill(BillID)
);

CREATE TABLE ReturnExchangeStock (
    ID INT PRIMARY KEY,
    ExpiredDate DATE,
    BillID VARCHAR(15),
    BranchID INT,
    FOREIGN KEY (BillID) REFERENCES Bill(BillID),
    FOREIGN KEY (BranchID) REFERENCES Branch(ID)
);

CREATE TABLE PhoneNumber (
    PhoneNumber VARCHAR(15) PRIMARY KEY,
    EmployeeID VARCHAR(15),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EMP_ID)
);

CREATE TABLE GoodDeliveryNote (
    ID INT PRIMARY KEY,
    Description TEXT,
    DeliveryDate DATE,
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(ID)
);

CREATE TABLE GoodReceiveNote (
    ID INT PRIMARY KEY,
    Description TEXT,
    ReceiveDate DATE,
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(ID)
);

CREATE TABLE Workfor (
    EMP_ID VARCHAR(15),
    BranchID INT,
    WorkingDuration INT,
    PRIMARY KEY (EMP_ID, BranchID),
    FOREIGN KEY (EMP_ID) REFERENCES Employee(EMP_ID),
    FOREIGN KEY (BranchID) REFERENCES Branch(ID)
);

CREATE TABLE Is_Haven (
    DeviceType VARCHAR(15),
    BranchID INT,
    ResidualQuantity INT,
    PRIMARY KEY (DeviceType, BranchID),
    FOREIGN KEY (DeviceType) REFERENCES DeviceType(DeviceID),
    FOREIGN KEY (BranchID) REFERENCES Branch(ID)
);

CREATE TABLE SupplyStore (
    SupplyID INT PRIMARY KEY,
    BranchID INT,
    Location VARCHAR(255),
    Name VARCHAR(100),
    FOREIGN KEY (BranchID) REFERENCES Branch(ID)
);

CREATE TABLE DiscountProgram (
    Type INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(255),
    DeviceType VARCHAR(15),
    FOREIGN KEY (DeviceType) REFERENCES DeviceType(DeviceID)
);

INSERT INTO Customer (AccountID, CusPoint, FName, MName, LName, DOB, Gender, Address)
VALUES
('CP123456789', 100, 'John', 'Michael', 'Doe', '1985-02-15', 'Male', '123 Maple Street, Cityville'),
('SV987654321', 200, 'Jane', 'Elizabeth', 'Smith', '1990-05-20', 'Female', '456 Oak Avenue, Townsville'),
('GO123098456', 150, 'George', 'Edward', 'Johnson', '1987-08-30', 'Male', '789 Pine Road, Suburbia'),
('DM456789123', 250, 'Diana', 'Rose', 'Williams', '1992-11-25', 'Female', '321 Birch Lane, Rivertown'),
('CP678901234', 300, 'Chris', 'James', 'Brown', '1980-03-17', 'Male', '654 Cedar Boulevard, Hilltown'),
('SV345678901', 120, 'Sarah', 'Anne', 'Davis', '1995-07-10', 'Female', '987 Maple Drive, Brookside'),
('GO890123456', 180, 'Gary', 'Leonard', 'Miller', '1988-01-05', 'Male', '132 Elm Street, Lakeview'),
('DM234567890', 220, 'Donna', 'Marie', 'Moore', '1986-04-22', 'Female', '765 Pine Hill, Springfield'),
('CP567890123', 160, 'Catherine', 'Louise', 'Taylor', '1994-09-14', 'Female', '321 Walnut Way, Greenfield'),
('SV123456789', 90, 'Samuel', 'David', 'Anderson', '1993-06-18', 'Male', '654 Spruce Street, Fairview'),
('GO678901234', 110, 'Gregory', 'Philip', 'Thomas', '1982-12-30', 'Male', '876 Willow Lane, Meadowbrook'),
('DM345678901', 130, 'Deborah', 'Grace', 'Jackson', '1991-03-25', 'Female', '543 Oak Street, Woodlands'),
('CP234567890', 140, 'Charles', 'Arthur', 'White', '1989-10-02', 'Male', '234 Maple Avenue, Coastline'),
('SV890123456', 170, 'Sophia', 'Helen', 'Harris', '1996-04-12', 'Female', '789 Cedar Road, Crestwood'),
('GO456789123', 200, 'Gina', 'Marie', 'Scott', '1984-09-28', 'Female', '654 Elm Road, Hilltop'),
('DM678901234', 250, 'Dennis', 'Paul', 'King', '1981-11-14', 'Male', '456 Birch Boulevard, Valleyview'),
('CP345678901', 220, 'Carlos', 'Ernesto', 'Martinez', '1997-05-04', 'Male', '123 Oak Circle, Westport'),
('SV567890123', 130, 'Samantha', 'Joyce', 'Evans', '1993-02-16', 'Female', '321 Pine Street, Eastbrook'),
('GO234567890', 90, 'Grant', 'Isaac', 'Green', '1989-08-21', 'Male', '432 Birch Drive, Riverdale'),
('DM890123456', 210, 'Danielle', 'Rosemary', 'Adams', '1991-12-10', 'Female', '876 Maple Road, Hillview'),
('CP789012345', 230, 'Peter', 'Jack', 'Clark', '1986-05-22', 'Male', '654 Elm Avenue, Greenhill'),
('SV678901234', 140, 'Victoria', 'Grace', 'Baker', '1983-07-07', 'Female', '321 Oak Street, Pinehill'),
('GO123456789', 160, 'Brian', 'Lee', 'Nelson', '1990-03-12', 'Male', '987 Maple Street, Seaside'),
('DM567890123', 180, 'Daniel', 'Andrew', 'Carter', '1995-11-05', 'Male', '654 Pine Lane, Ridgefield'),
('CP234567891', 250, 'Patricia', 'Marie', 'Roberts', '1988-01-23', 'Female', '432 Cedar Avenue, Lakeside'),
('SV123098456', 300, 'Samuel', 'Victor', 'Lopez', '1992-06-28', 'Male', '876 Birch Road, Stonehill'),
('GO789012345', 220, 'Gillian', 'Beatrice', 'Morris', '1996-09-19', 'Female', '321 Oak Boulevard, Forestview'),
('DM890123457', 250, 'Douglas', 'Arthur', 'Evans', '1984-12-11', 'Male', '765 Pine Street, Briarwood'),
('CP345678900', 200, 'Clara', 'Jane', 'Parker', '1987-04-09', 'Female', '987 Elm Avenue, Brookfield'),
('SV567890124', 170, 'Sophie', 'Louise', 'Gonzalez', '1993-10-15', 'Female', '654 Maple Lane, Rosewood'),
('GO234567891', 180, 'Oliver', 'Henry', 'Morris', '1995-08-29', 'Male', '321 Cedar Drive, Clearview');

INSERT INTO Branch (ID, Name, Location, DiscountType) VALUES
(1, 'Branch1', '123 Main Street, Springfield', 'Student Discount'),
(2, 'Branch2', '456 Elm Street, Springfield', 'Senior Discount'),
(3, 'Branch3', '789 Oak Street, Springfield', 'Membership Discount'),
(4, 'Branch4', '101 Maple Avenue, Springfield', 'Holiday Discount'),
(5, 'Branch5', '202 Birch Road, Springfield', 'No Discount'),
(6, 'Branch6', '303 Pine Lane, Springfield', 'Seasonal Discount'),
(7, 'Branch7', '404 Cedar Drive, Springfield', 'Student Discount'),
(8, 'Branch8', '505 Willow Boulevard, Springfield', 'Flash Sale Discount'),
(9, 'Branch9', '606 Redwood Street, Springfield', 'Senior Discount'),
(10, 'Branch10', '707 Spruce Avenue, Springfield', 'Family Discount'),
(11, 'Branch11', '808 Poplar Lane, Springfield', 'Student Discount'),
(12, 'Branch12', '909 Fir Street, Springfield', 'Holiday Discount'),
(13, 'Branch13', '1010 Aspen Way, Springfield', 'Membership Discount'),
(14, 'Branch14', '1111 Alder Road, Springfield', 'No Discount'),
(15, 'Branch15', '1212 Sycamore Drive, Springfield', 'Seasonal Discount'),
(16, 'Branch16', '1313 Cypress Street, Springfield', 'Senior Discount'),
(17, 'Branch17', '1414 Hickory Lane, Springfield', 'Family Discount'),
(18, 'Branch18', '1515 Juniper Boulevard, Springfield', 'Flash Sale Discount'),
(19, 'Branch19', '1616 Magnolia Avenue, Springfield', 'Holiday Discount'),
(20, 'Branch20', '1717 Palm Road, Springfield', 'Student Discount'),
(21, 'Branch21', '1818 Olive Street, Springfield', 'Senior Discount'),
(22, 'Branch22', '1919 Walnut Avenue, Springfield', 'Membership Discount'),
(23, 'Branch23', '2020 Chestnut Lane, Springfield', 'Seasonal Discount'),
(24, 'Branch24', '2121 Beech Road, Springfield', 'Family Discount'),
(25, 'Branch25', '2222 Cherry Boulevard, Springfield', 'Flash Sale Discount'),
(26, 'Branch26', '2323 Dogwood Avenue, Springfield', 'Holiday Discount'),
(27, 'Branch27', '2424 Elmwood Drive, Springfield', 'No Discount'),
(28, 'Branch28', '2525 Pinecone Road, Springfield', 'Student Discount'),
(29, 'Branch29', '2626 Sequoia Street, Springfield', 'Seasonal Discount'),
(30, 'Branch30', '2727 Willow Way, Springfield', 'Family Discount');



INSERT INTO CusNumPhone (AccountID, PhoneNumber) 
VALUES
('CP123456789', '0123456789'),
('SV987654321', '0234567890'),
('GO123098456', '0345678901'),
('DM456789123', '0456789012'),
('CP678901234', '0567890123'),
('SV345678901', '0678901234'),
('GO890123456', '0789012345'),
('DM234567890', '0890123456'),
('CP567890123', '0901234567'),
('SV123456789', '0912345678'),
('GO678901234', '0123456789'),
('DM345678901', '0134567890'),
('CP234567890', '0245678901'),
('SV890123456', '0356789012'),
('GO456789123', '0467890123'),
('DM678901234', '0578901234'),
('CP345678901', '0689012345'),
('SV567890123', '0790123456'),
('GO234567890', '0801234567'),
('DM890123456', '0912345678'),
('CP789012345', '0723456789'),
('SV678901234', '0534567890'),
('GO123456789', '0645678901'),
('DM567890123', '0356789012'),
('CP234567891', '0267890123'),
('SV123098456', '0178901234'),
('GO789012345', '0989012345'),
('DM890123457', '0790123456'),
('CP345678900', '0801234567'),
('SV567890124', '0912345678'),
('GO234567891', '0323456789');



INSERT INTO DeviceType (DeviceID, DeviceName) VALUES
('OL123456789', 'Apple iPhone 15 Pro'),
('NE987654321', 'Samsung Galaxy Tab S9'),
('OL456789123', 'Dell XPS 13 Laptop'),
('NE234567891', 'Apple iMac 24-inch'),
('OL345678912', 'Apple Watch Series 8'),
('NE567891234', 'Amazon Kindle Paperwhite'),
('OL678912345', 'Sony PlayStation 5'),
('NE789123456', 'Samsung 55-inch QLED TV'),
('OL891234567', 'Bose SoundLink Revolve+ Bluetooth Speaker'),
('NE912345678', 'Sony WH-1000XM5 Noise Cancelling Headphones'),
('OL102938475', 'Google Pixel 7'),
('NE564738291', 'Microsoft Surface Pro 9'),
('OL192837465', 'Lenovo ThinkPad X1 Carbon'),
('NE837465192', 'HP Spectre x360'),
('OL384756291', 'OnePlus 11 5G'),
('NE182736495', 'Huawei MateBook 16'),
('OL647382910', 'Apple iPad Pro 12.9-inch'),
('NE293847561', 'Bose QuietComfort 45 Headphones'),
('OL918273645', 'LG OLED C1 TV'),
('NE123654789', 'Sony Xperia 1 IV'),
('OL321456789', 'Razer Blade 15 Laptop'),
('NE987321654', 'Oculus Quest 2 VR'),
('OL765432198', 'Samsung Galaxy Z Flip 5'),
('NE564738219', 'Xiaomi Mi 11 Ultra'),
('OL234987612', 'Asus ROG Strix Laptop'),
('NE547892136', 'Amazon Echo Show 10'),
('OL982134765', 'Nintendo Switch OLED'),
('NE847362915', 'Google Nest Audio'),
('OL134765982', 'Samsung Galaxy Buds Pro'),
('NE298374651', 'Fujitsu Lifebook U939X');
INSERT INTO Device (DeviceType, Status, DevicePrice) VALUES
  
('OL123456789', 'Active', 299.99),
('NE987654321', 'Inactive', 199.49),
('OL456789123', 'Active', 399.99),
('NE234567891', 'Active', 249.99),
('OL345678912', 'Inactive', 149.99),
('NE567891234', 'Active', 89.99),
('OL678912345', 'Inactive', 499.95),
('NE789123456', 'Active', 350.49),
('OL891234567', 'Inactive', 129.99),
('NE912345678', 'Active', 599.99),
('OL102938475', 'Active', 899.99),
('NE564738291', 'Inactive', 749.99),
('OL192837465', 'Active', 999.49),
('NE837465192', 'Active', 450.99),
('OL384756291', 'Inactive', 319.49),
('NE182736495', 'Active', 199.99),
('OL647382910', 'Inactive', 259.99),
('NE293847561', 'Active', 300.00),
('OL918273645', 'Inactive', 399.99),
('NE123654789', 'Active', 700.00),
('OL321456789', 'Active', 800.00),
('NE987321654', 'Inactive', 299.99),
('OL765432198', 'Active', 150.00),
('NE564738219', 'Inactive', 50.00),
('OL234987612', 'Active', 120.00),
('NE547892136', 'Inactive', 450.00),
('OL982134765', 'Active', 99.99),
('NE847362915', 'Inactive', 650.00),
('OL134765982', 'Active', 499.00),
('NE298374651', 'Inactive', 899.00);


INSERT INTO Manager (Manager_ID, BranchID)
VALUES
('MN12345', 1),
('MN23456', 2),
('MN34567', 3),
('MN45678', 4),
('MN56789', 5),
('MN67890', 6),
('MN78901', 7),
('MN89012', 8),
('MN90123', 9),
('MN01234', 10),
('MN54321', 11),
('MN65432', 12),
('MN76543', 13),
('MN87654', 14),
('MN98765', 15),
('MN09876', 16),
('MN10987', 17),
('MN21098', 18),
('MN32109', 19),
('MN43210', 20),
('MN54322', 21),
('MN65433', 22),
('MN76544', 23),
('MN87655', 24),
('MN98766', 25),
('MN09877', 26),
('MN10988', 27),
('MN21099', 28),
('MN32110', 29),
('MN43211', 30);
INSERT INTO Employee (EMP_ID, LName, FName, EMP_Date, Month, Year, EMP_Address, Gender, ManagerID)
VALUES
('MN12345', 'Smith', 'John', '2023-01-10', 1, 2023, '1234 Elm St', 'Male', NULL),
('MN23456', 'Doe', 'Jane', '2022-11-05', 11, 2022, '5678 Oak St', 'Female', NULL),
('MN34567', 'Johnson', 'Michael', '2022-09-14', 9, 2022, '2345 Pine St', 'Male', NULL),
('MN45678', 'Williams', 'Sarah', '2021-08-20', 8, 2021, '9876 Maple St', 'Female', NULL),
('MN56789', 'Brown', 'David', '2023-02-11', 2, 2023, '1357 Birch St', 'Male', NULL),
('MN67890', 'Jones', 'Emily', '2022-06-01', 6, 2022, '2468 Cedar St', 'Female', NULL),
('MN78901', 'Miller', 'Robert', '2021-12-22', 12, 2021, '3690 Redwood St', 'Male', NULL),
('MN89012', 'Davis', 'Linda', '2020-10-16', 10, 2020, '4812 Walnut St', 'Female', NULL),
('MN90123', 'Garcia', 'James', '2023-03-25', 3, 2023, '5729 Ash St', 'Male', NULL),
('MN01234', 'Martinez', 'Patricia', '2022-04-14', 4, 2022, '6137 Maple St', 'Female', NULL),
('MN54321', 'Rodriguez', 'John', '2021-05-30', 5, 2021, '1453 Birch St', 'Male', NULL),
('MN65432', 'Hernandez', 'Mia', '2020-12-08', 12, 2020, '2849 Pine St', 'Female', NULL),
('MN76543', 'Lopez', 'Liam', '2021-03-23', 3, 2021, '3695 Cedar St', 'Male', NULL),
('MN87654', 'Gonzalez', 'Sophia', '2022-10-04', 10, 2022, '4956 Redwood St', 'Female', NULL),
('MN98765', 'Perez', 'Ethan', '2023-07-10', 7, 2023, '5472 Oak St', 'Male', NULL),
('MN09876', 'Wilson', 'Ava', '2021-09-15', 9, 2021, '6337 Walnut St', 'Female', NULL),
('MN10987', 'Anderson', 'Isabella', '2022-05-13', 5, 2022, '7245 Ash St', 'Female', NULL),
('MN21098', 'Thomas', 'Mason', '2020-11-07', 11, 2020, '8034 Birch St', 'Male', NULL),
('MN32109', 'Taylor', 'Lucas', '2021-02-19', 2, 2021, '9145 Maple St', 'Male', NULL),
('MN43210', 'Moore', 'Harper', '2022-07-30', 7, 2022, '1043 Pine St', 'Female', NULL),
('MN54322', 'Jackson', 'Benjamin', '2021-04-02', 4, 2021, '2156 Oak St', 'Male', NULL),
('MN65433', 'White', 'Charlotte', '2023-05-20', 5, 2023, '3267 Cedar St', 'Female', NULL),
('MN76544', 'Lee', 'Amelia', '2022-01-18', 1, 2022, '4378 Redwood St', 'Female', NULL),
('MN87655', 'Walker', 'Elijah', '2021-06-12', 6, 2021, '5489 Walnut St', 'Male', NULL),
('MN98766', 'Young', 'Oliver', '2020-08-25', 8, 2020, '6590 Ash St', 'Male', NULL),
('MN09877', 'Allen', 'Isabella', '2021-01-08', 1, 2021, '7612 Birch St', 'Female', NULL),
('MN10988', 'Sanchez', 'Harvey', '2022-12-14', 12, 2022, '8723 Pine St', 'Male', NULL),
('MN21099', 'King', 'Eleanor', '2023-06-22', 6, 2023, '9834 Maple St', 'Female', NULL),
('MN32110', 'Scott', 'Henry', '2020-09-16', 9, 2020, '1075 Oak St', 'Male', NULL),
('MN43211', 'Green', 'Grace', '2021-07-03', 7, 2021, '2186 Cedar St', 'Female', NULL),

('ST10001', 'Smith', 'John', '2023-01-01', 1, 2023, '1234 Elm St', 'Male', 'MN12345'),
('ST10002', 'Johnson', 'Emily', '2023-02-02', 2, 2023, '2345 Oak St', 'Female', 'MN12345'),
('ST10003', 'Williams', 'Michael', '2023-03-03', 3, 2023, '3456 Pine St', 'Male', 'MN12345'),
('ST10004', 'Brown', 'Sarah', '2023-04-04', 4, 2023, '4567 Maple St', 'Female', 'MN12345'),
('ST10005', 'Taylor', 'David', '2023-05-05', 5, 2023, '5678 Cedar St', 'Male', 'MN12345'),

-- Assigning manager ID 'MN23456' (6 times)
('ST10006', 'Davis', 'Olivia', '2023-06-06', 6, 2023, '6789 Birch St', 'Female', 'MN23456'),
('ST10007', 'Miller', 'Liam', '2023-07-07', 7, 2023, '7890 Redwood St', 'Male', 'MN23456'),
('ST10008', 'Wilson', 'Sophia', '2023-08-08', 8, 2023, '8901 Walnut St', 'Female', 'MN23456'),
('ST10009', 'Moore', 'Jackson', '2023-09-09', 9, 2023, '9012 Pine St', 'Male', 'MN23456'),
('ST10010', 'Taylor', 'Amelia', '2023-10-10', 10, 2023, '1234 Ash St', 'Female', 'MN23456'),
('ST10011', 'Adams', 'Noah', '2023-11-11', 11, 2023, '2345 Cedar St', 'Male', 'MN23456'),

-- Assigning manager ID 'MN34567' (6 times)
('ST10012', 'White', 'Zoe', '2023-12-12', 12, 2023, '3456 Maple St', 'Female', 'MN34567'),
('ST10013', 'Clark', 'Mason', '2023-01-13', 1, 2023, '4567 Birch St', 'Male', 'MN34567'),
('ST10014', 'Harris', 'Benjamin', '2023-02-14', 2, 2023, '5678 Pine St', 'Male', 'MN34567'),
('ST10015', 'Walker', 'Isabella', '2023-03-15', 3, 2023, '6789 Oak St', 'Female', 'MN34567'),
('ST10016', 'Allen', 'Lucas', '2023-04-16', 4, 2023, '7890 Cedar St', 'Male', 'MN34567'),
('ST10017', 'Scott', 'Ava', '2023-05-17', 5, 2023, '8901 Maple St', 'Female', 'MN34567'),

-- Assigning manager ID 'MN45678' (6 times)
('ST10018', 'King', 'Oliver', '2023-06-18', 6, 2023, '9012 Redwood St', 'Male', 'MN45678'),
('ST10019', 'Hernandez', 'Amelia', '2023-07-19', 7, 2023, '1234 Pine St', 'Female', 'MN45678'),
('ST10020', 'Martinez', 'Ethan', '2023-08-20', 8, 2023, '2345 Oak St', 'Male', 'MN45678'),
('ST10021', 'Garcia', 'Sophia', '2023-09-21', 9, 2023, '3456 Birch St', 'Female', 'MN45678'),
('ST10022', 'Taylor', 'Harper', '2023-10-22', 10, 2023, '4567 Redwood St', 'Male', 'MN45678'),
('ST100023', 'Lopez', 'Benjamin', '2023-11-23', 11, 2023, '5678 Pine St', 'Female', 'MN45678'),

-- Assigning manager ID 'MN56789' (5 times)
('ST10024', 'Moore', 'Ethan', '2023-12-24', 12, 2023, '6789 Maple St', 'Male', 'MN56789'),
('ST10025', 'Miller', 'Olivia', '2023-01-25', 1, 2023, '7890 Birch St', 'Female', 'MN56789'),
('ST10026', 'Davis', 'Isabella', '2023-02-26', 2, 2023, '8901 Oak St', 'Male', 'MN56789'),
('ST10027', 'Martinez', 'Ava', '2023-03-27', 3, 2023, '9012 Cedar St', 'Female', 'MN56789'),
('ST10028', 'Wilson', 'Jack', '2023-04-28', 4, 2023, '1234 Pine St', 'Male', 'MN56789'),

-- Assigning manager ID 'MN67890' (5 times)
('ST10029', 'Garcia', 'Mason', '2023-05-29', 5, 2023, '2345 Oak St', 'Male', 'MN67890'),
('ST10030', 'Wilson', 'Charlotte', '2023-06-30', 6, 2023, '3456 Birch St', 'Female', 'MN67890'),
('ST10031', 'Moore', 'Lucas', '2023-07-01', 7, 2023, '4567 Pine St', 'Male', 'MN67890'),
('ST10032', 'Taylor', 'Ethan', '2023-08-02', 8, 2023, '5678 Oak St', 'Female', 'MN67890'),
('ST10033', 'Lopez', 'Ava', '2023-09-03', 9, 2023, '6789 Cedar St', 'Male', 'MN67890'),

-- Assigning manager ID 'MN78901' (5 times)
('ST10037', 'Lopez', 'David', '2023-01-07', 1, 2023, '1234 Ash St', 'Male', 'MN78901'),
('ST10038', 'Roberts', 'Isabella', '2023-02-08', 2, 2023, '2345 Birch St', 'Female', 'MN78901'),
('ST10039', 'Moore', 'Harper', '2023-03-09', 3, 2023, '3456 Maple St', 'Male', 'MN78901'),
('ST10040', 'Taylor', 'Ava', '2023-04-10', 4, 2023, '4567 Redwood St', 'Female', 'MN78901'),
('ST10041', 'Wilson', 'Zoe', '2023-05-11', 5, 2023, '5678 Oak St', 'Male', 'MN78901'),

-- Assigning manager ID 'MN89012' (5 times)
('ST10042', 'Martin', 'Sophia', '2023-06-12', 6, 2023, '6789 Birch St', 'Female', 'MN89012'),
('ST10043', 'Brown', 'Lucas', '2023-07-13', 7, 2023, '7890 Pine St', 'Male', 'MN89012'),
('ST10044', 'Jones', 'Isabella', '2023-08-14', 8, 2023, '8901 Cedar St', 'Female', 'MN89012'),
('ST10045', 'Davis', 'Zoe', '2023-09-15', 9, 2023, '9012 Oak St', 'Male', 'MN89012'),
('ST10046', 'Miller', 'Amelia', '2023-10-16', 10, 2023, '1234 Birch St', 'Female', 'MN89012'),

('ST10047', 'Adams', 'Mason', '2023-11-17', 11, 2023, '2345 Maple St', 'Male', 'MN90123'),
('ST10048', 'Wilson', 'David', '2023-12-18', 12, 2023, '3456 Pine St', 'Female', 'MN90123'),
('ST10049', 'Brown', 'Liam', '2023-01-19', 1, 2023, '4567 Birch St', 'Male', 'MN90123'),
('ST10050', 'Martinez', 'Sophia', '2023-02-20', 2, 2023, '5678 Oak St', 'Female', 'MN90123'),
('ST10051', 'Taylor', 'Lucas', '2023-03-21', 3, 2023, '6789 Redwood St', 'Male', 'MN90123'),

-- Assigning manager ID 'MN01234' (6 times)
('ST10052', 'Davis', 'Olivia', '2023-04-22', 4, 2023, '7890 Cedar St', 'Female', 'MN01234'),
('ST10053', 'King', 'Isabella', '2023-05-23', 5, 2023, '8901 Pine St', 'Male', 'MN01234'),
('ST10054', 'Lopez', 'Benjamin', '2023-06-24', 6, 2023, '9012 Birch St', 'Female', 'MN01234'),
('ST10055', 'Martin', 'Ava', '2023-07-25', 7, 2023, '1234 Oak St', 'Male', 'MN01234'),
('ST10056', 'Roberts', 'Harper', '2023-08-26', 8, 2023, '2345 Cedar St', 'Female', 'MN01234'),
('ST10057', 'Garcia', 'James', '2023-09-27', 9, 2023, '3456 Maple St', 'Male', 'MN01234'),

-- Assigning manager ID 'MN54321' (5 times)
('ST10058', 'Perez', 'Isabella', '2023-10-28', 10, 2023, '4567 Redwood St', 'Male', 'MN54321'),
('ST10059', 'Jones', 'Lucas', '2023-11-29', 11, 2023, '5678 Oak St', 'Female', 'MN54321'),
('ST10060', 'Adams', 'Zoe', '2023-12-30', 12, 2023, '6789 Birch St', 'Male', 'MN54321'),
('ST10061', 'Miller', 'Amelia', '2023-01-31', 1, 2023, '7890 Pine St', 'Female', 'MN54321'),
('ST10062', 'Moore', 'Sophia', '2023-02-01', 2, 2023, '8901 Cedar St', 'Male', 'MN54321'),

-- Assigning manager ID 'MN65432' (6 times)
('ST10063', 'Young', 'Isabella', '2023-03-02', 3, 2023, '9012 Redwood St', 'Female', 'MN65432'),
('ST10064', 'Lopez', 'David', '2023-04-03', 4, 2023, '1234 Maple St', 'Male', 'MN65432'),
('ST10065', 'Taylor', 'Olivia', '2023-05-04', 5, 2023, '2345 Oak St', 'Female', 'MN65432'),
('ST10066', 'Brown', 'Liam', '2023-06-05', 6, 2023, '3456 Cedar St', 'Male', 'MN65432'),
('ST10067', 'Wilson', 'Benjamin', '2023-07-06', 7, 2023, '4567 Birch St', 'Female', 'MN65432'),
('ST10068', 'Martinez', 'Grace', '2023-08-07', 8, 2023, '5678 Pine St', 'Male', 'MN65432'),

-- Assigning manager ID 'MN76543' (6 times)
('ST10069', 'Anderson', 'Oliver', '2023-09-08', 9, 2023, '6789 Cedar St', 'Female', 'MN76543'),
('ST10070', 'Garcia', 'Mason', '2023-10-09', 10, 2023, '7890 Redwood St', 'Male', 'MN76543'),
('ST10071', 'Hernandez', 'Amelia', '2023-11-10', 11, 2023, '8901 Birch St', 'Female', 'MN76543'),
('ST10072', 'Davis', 'Harper', '2023-12-11', 12, 2023, '9012 Oak St', 'Male', 'MN76543'),
('ST10073', 'Lopez', 'James', '2023-01-12', 1, 2023, '1234 Cedar St', 'Female', 'MN76543'),
('ST10074', 'Moore', 'Benjamin', '2023-02-13', 2, 2023, '2345 Pine St', 'Male', 'MN76543'),

-- Assigning manager ID 'MN87654' (6 times)
('ST10075', 'Perez', 'Ava', '2023-03-14', 3, 2023, '3456 Redwood St', 'Female', 'MN87654'),
('ST10076', 'Taylor', 'Ethan', '2023-04-15', 4, 2023, '4567 Pine St', 'Male', 'MN87654'),
('ST10077', 'Roberts', 'Isabella', '2023-05-16', 5, 2023, '5678 Oak St', 'Female', 'MN87654'),
('ST00078', 'Martinez', 'Olivia', '2023-06-17', 6, 2023, '6789 Birch St', 'Male', 'MN87654'),
('ST10079', 'Johnson', 'David', '2023-07-18', 7, 2023, '7890 Cedar St', 'Female', 'MN87654'),
('ST10080', 'Wilson', 'Sophia', '2023-08-19', 8, 2023, '8901 Maple St', 'Male', 'MN87654'),

-- Assigning manager ID 'MN98765' (6 times)
('ST10081', 'Lopez', 'Amelia', '2023-09-20', 9, 2023, '9012 Redwood St', 'Female', 'MN98765'),
('ST10082', 'Taylor', 'James', '2023-10-21', 10, 2023, '1234 Oak St', 'Male', 'MN98765'),
('ST10083', 'Moore', 'Benjamin', '2023-11-22', 11, 2023, '2345 Cedar St', 'Female', 'MN98765'),
('ST10084', 'Garcia', 'Ava', '2023-12-23', 12, 2023, '3456 Maple St', 'Male', 'MN98765'),
('ST10085', 'Walker', 'Sophia', '2023-01-24', 1, 2023, '4567 Birch St', 'Female', 'MN98765'),
('ST10086', 'Adams', 'Mason', '2023-02-25', 2, 2023, '5678 Pine St', 'Male', 'MN98765'),

-- Assigning manager ID 'MN09876' (5 times)
('ST10087', 'Young', 'Olivia', '2023-03-26', 3, 2023, '6789 Oak St', 'Female', 'MN09876'),
('ST10088', 'Taylor', 'Lucas', '2023-04-27', 4, 2023, '7890 Birch St', 'Male', 'MN09876'),
('ST10089', 'Jones', 'Isabella', '2023-05-28', 5, 2023, '8901 Maple St', 'Female', 'MN09876'),
('ST10090', 'Martin', 'Sophia', '2023-06-29', 6, 2023, '9012 Redwood St', 'Male', 'MN09876'),
('ST10091', 'Garcia', 'Benjamin', '2023-07-30', 7, 2023, '1234 Pine St', 'Female', 'MN09876'),

-- Assigning manager ID 'MN10987' (6 times)
('ST10092', 'Walker', 'James', '2023-08-31', 8, 2023, '2345 Cedar St', 'Male', 'MN10987'),
('ST10093', 'Roberts', 'Amelia', '2023-09-01', 9, 2023, '3456 Birch St', 'Female', 'MN10987'),
('ST10094', 'Davis', 'David', '2023-10-02', 10, 2023, '4567 Maple St', 'Male', 'MN10987'),
('ST10095', 'Miller', 'Olivia', '2023-11-03', 11, 2023, '5678 Redwood St', 'Female', 'MN10987'),
('ST10096', 'Hernandez', 'Zoe', '2023-12-04', 12, 2023, '6789 Oak St', 'Male', 'MN10987'),
('ST10097', 'Jones', 'Liam', '2023-01-05', 1, 2023, '7890 Cedar St', 'Female', 'MN10987'),

-- Assigning manager ID 'MN21098' (5 times)
('ST10098', 'Martin', 'Isabella', '2023-02-06', 2, 2023, '8901 Redwood St', 'Male', 'MN21098'),
('ST10099', 'Moore', 'David', '2023-03-07', 3, 2023, '9012 Pine St', 'Female', 'MN21098'),
('ST10100', 'Garcia', 'Sophia', '2023-04-08', 4, 2023, '1234 Oak St', 'Male', 'MN21098'),
('ST10101', 'Roberts', 'Benjamin', '2023-05-09', 5, 2023, '2345 Birch St', 'Female', 'MN21098'),
('ST10102', 'Walker', 'Ava', '2023-06-10', 6, 2023, '3456 Maple St', 'Male', 'MN21098'),

-- Assigning manager ID 'MN32109' (6 times)
('ST10103', 'Lopez', 'Harper', '2023-07-11', 7, 2023, '4567 Pine St', 'Female', 'MN32109'),
('ST10104', 'Davis', 'Zoe', '2023-08-12', 8, 2023, '5678 Cedar St', 'Male', 'MN32109'),
('ST10105', 'Wilson', 'Ava', '2023-09-13', 9, 2023, '6789 Birch St', 'Female', 'MN32109');
-- ('ST10106', 'Garcia', 'Sophia', '2023-10-14', 10, 2023, '7890 Oak St', 'Male', 'MN32109'),
-- ('ST10107', 'Miller', 'Liam', '2023-11-15', 11, 2023, '8901 Redwood St', 'Female', 'MN32109'),
-- ('ST10108', 'Jones', 'Benjamin', '2023-12-16', 12, 2023, '9012 Maple St', 'Male', 'MN32109'),

-- -- Assigning manager ID 'MN43210' (5 times)
-- ('ST10109', 'Taylor', 'Lucas', '2024-01-17', 1, 2024, '1234 Cedar St', 'Female', 'MN43210'),
-- ('ST10110', 'Roberts', 'James', '2024-02-18', 2, 2024, '2345 Redwood St', 'Male', 'MN43210'),
-- ('ST10111', 'Garcia', 'Sophia', '2024-03-19', 3, 2024, '3456 Birch St', 'Female', 'MN43210'),
-- ('ST10112', 'Adams', 'Olivia', '2024-04-20', 4, 2024, '4567 Oak St', 'Male', 'MN43210'),
-- ('ST10113', 'Walker', 'Liam', '2024-05-21', 5, 2024, '5678 Maple St', 'Female', 'MN43210');

INSERT INTO Stafff (StaffID)
VALUES
('ST10001'),
('ST10002'),
('ST10003'),
('ST10004'),
('ST10005'),
('ST10006'),
('ST10007'),
('ST10008'),
('ST10009'),
('ST10010'),
('ST10011'),
('ST10012'),
('ST10013'),
('ST10014'),
('ST10015'),
('ST10016'),
('ST10017'),
('ST10018'),
('ST10019'),
('ST10020'),
('ST10021'),
('ST10022'),
('ST10023'),
('ST10024'),
('ST10025'),
('ST10026'),
('ST10027'),
('ST10028'),
('ST10029'),
('ST10030'),
('ST10031'),
('ST10032'),
('ST10033'),
('ST10034'),
('ST10035'),
('ST10036'),
('ST10037'),
('ST10038'),
('ST10039'),
('ST10040'),
('ST10041'),
('ST10042'),
('ST10043'),
('ST10044'),
('ST10045'),
('ST10046'),
('ST10047'),
('ST10048'),
('ST10049'),
('ST10050'),
('ST10051'),
('ST10052'),
('ST10053'),
('ST10054'),
('ST10055'),
('ST10056'),
('ST10057'),
('ST10058'),
('ST10059'),
('ST10060'),
('ST10061'),
('ST10062'),
('ST10063'),
('ST10064'),
('ST10065'),
('ST10066'),
('ST10067'),
('ST10068'),
('ST10069'),
('ST10070'),
('ST10071'),
('ST10072'),
('ST10073'),
('ST10074'),
('ST10075'),
('ST10076'),
('ST10077'),
('ST10078'),
('ST10079'),
('ST10080'),
('ST10081'),
('ST10082'),
('ST10083'),
('ST10084'),
('ST10085'),
('ST10086'),
('ST10087'),
('ST10088'),
('ST10089'),
('ST10090'),
('ST10091'),
('ST10092'),
('ST10093'),
('ST10094'),
('ST10095'),
('ST10096'),
('ST10097'),
('ST10098'),
('ST10099'),
('ST10100'),
('ST10101'),
('ST10102'),
('ST10103'),
('ST10104'),
('ST10105');

INSERT INTO PhoneNumber (PhoneNumber, EmployeeID) VALUES
('0123456789', 'MN12345'),
('0234567890', 'MN23456'),
('0345678901', 'MN34567'),
('0456789012', 'MN45678'),
('0567890123', 'MN56789'),
('0678901234', 'MN67890'),
('0789012345', 'MN78901'),
('0890123456', 'MN89012'),
('0901234567', 'MN90123'),
('0102345678', 'MN01234'),
('0543210987', 'MN54321'),
('0654321098', 'MN65432'),
('0765432109', 'MN76543'),
('0876543210', 'MN87654'),
('0987654321', 'MN98765'),
('0098765432', 'MN09876'),
('0110987654', 'MN10987'),
('0121098765', 'MN21098'),
('0132109876', 'MN32109'),
('0143210987', 'MN43210'),
('0154321098', 'MN54322'),
('0165432109', 'MN65433'),
('0176543210', 'MN76544'),
('0187654321', 'MN87655'),
('0198765432', 'MN98766'),
('0209876543', 'MN09877'),
('0210987654', 'MN10988'),
('0221098765', 'MN21099'),
('0232109876', 'MN32110'),
('0243210987', 'MN43211'),
('0310012345', 'ST10001'),
('0320012345', 'ST10002'),
('0330012345', 'ST10003'),
('0340012345', 'ST10004'),
('0350012345', 'ST10005'),
('0360012345', 'ST10006'),
('0370012345', 'ST10007'),
('0380012345', 'ST10008'),
('0390012345', 'ST10009'),
('0400012345', 'ST10010'),
('0410012345', 'ST10011'),
('0420012345', 'ST10012'),
('0430012345', 'ST10013'),
('0440012345', 'ST10014'),
('0450012345', 'ST10015'),
('0460012345', 'ST10016'),
('0470012345', 'ST10017'),
('0480012345', 'ST10018'),
('0490012345', 'ST10019'),
('0500012345', 'ST10020'),
('0510012345', 'ST10021'),
('0520012345', 'ST10022'),
('0530012345', 'ST10023'),
('0540012345', 'ST10024'),
('0550012345', 'ST10025'),
('0560012345', 'ST10026'),
('0570012345', 'ST10027'),
('0580012345', 'ST10028'),
('0590012345', 'ST10029'),
('0600012345', 'ST10030'),
('0610012345', 'ST10031'),
('0620012345', 'ST10032'),
('0630012345', 'ST10033'),
('0640012345', 'ST10034'),
('0650012345', 'ST10035'),
('0660012345', 'ST10036'),
('0670012345', 'ST10037'),
('0680012345', 'ST10038'),
('0690012345', 'ST10039'),
('0700012345', 'ST10040'),
('0710012345', 'ST10041'),
('0720012345', 'ST10042'),
('0730012345', 'ST10043'),
('0740012345', 'ST10044'),
('0750012345', 'ST10045'),
('0760012345', 'ST10046'),
('0770012345', 'ST10047'),
('0780012345', 'ST10048'),
('0790012345', 'ST10049'),
('0800012345', 'ST10050'),
('0810012345', 'ST10051'),
('0820012345', 'ST10052'),
('0830012345', 'ST10053'),
('0840012345', 'ST10054'),
('0850012345', 'ST10055'),
('0860012345', 'ST10056');
INSERT INTO Bill (BillID, Cus_AccountID, PaymentMethod_ID, StaffID, D_Num, Month, Year, Hour, Minute, TotalPrice)
VALUES
  ('CP123456789456', 'CP123456789', 1, 'ST10001', 101, 12, 2024, 14, 30, 150.75),
  ('CV987654321873', 'CV987654321', 2, 'ST10002', 102, 12, 2024, 16, 45, 80.50),
  ('GO123098456271', 'GO123098456', 1, 'ST10003', 103, 12, 2024, 10, 15, 200.00),
  ('DM456789123985', 'DM456789123', 3, 'ST10004', 104, 12, 2024, 11, 00, 120.25),
  ('CP678901234682', 'CP678901234', 2, 'ST10005', 105, 12, 2024, 18, 30, 75.90),
  ('CV345678901943', 'CV345678901', 3, 'ST10006', 106, 12, 2024, 20, 00, 300.00),
  ('GO890123456251', 'GO890123456', 1, 'ST10007', 107, 12, 2024, 9, 15, 180.40),
  ('DM234567890118', 'DM234567890', 2, 'ST10008', 108, 12, 2024, 17, 30, 95.60),
  ('CP567890123639', 'CP567890123', 1, 'ST10009', 109, 12, 2024, 12, 45, 250.00),
  ('CV123456789561', 'CV123456789', 3, 'ST10010', 110, 12, 2024, 13, 00, 150.75),
  ('GO678901234402', 'GO678901234', 1, 'ST10011', 111, 12, 2024, 14, 00, 310.00),
  ('DM345678901184', 'DM345678901', 2, 'ST10012', 112, 12, 2024, 15, 45, 120.50),
  ('CP234567890963', 'CP234567890', 3, 'ST10013', 113, 12, 2024, 16, 30, 95.75),
  ('CV890123456551', 'CV890123456', 1, 'ST10014', 114, 12, 2024, 10, 00, 180.60),
  ('GO456789123700', 'GO456789123', 2, 'ST10015', 115, 12, 2024, 11, 30, 205.90),
  ('DM678901234846', 'DM678901234', 3, 'ST10016', 116, 12, 2024, 12, 00, 150.20),
  ('CP345678901573', 'CP345678901', 1, 'ST10017', 117, 12, 2024, 13, 30, 275.00),
  ('CV567890123408', 'CV567890123', 2, 'ST10018', 118, 12, 2024, 14, 15, 125.40),
  ('GO234567890217', 'GO234567890', 3, 'ST10019', 119, 12, 2024, 15, 00, 135.60),
  ('DM890123456312', 'DM890123456', 1, 'ST10020', 120, 12, 2024, 16, 30, 220.80);

INSERT INTO Contain (BillID, deviceType, deviceNumber) VALUES 
('CP123456789456', 'OL123456789', 1),
('CP123456789456', 'NE987654321', 2),
('SV987654321873', 'OL456789123', 3),
('SV987654321873', 'NE234567891', 4),
('GO123098456271', 'OL345678912', 5),
('GO123098456271', 'NE567891234', 6),
('DM456789123985', 'OL678912345', 7),
('DM456789123985', 'NE789123456', 8),
('CP678901234682', 'OL891234567', 9),
('CP678901234682', 'NE912345678', 10),
('SV345678901943', 'OL102938475', 11),
('SV345678901943', 'NE564738291', 12),
('GO890123456251', 'OL192837465', 13),
('GO890123456251', 'NE837465192', 14),
('DM234567890118', 'OL384756291', 15),
('DM234567890118', 'NE182736495', 16),
('CP567890123639', 'OL647382910', 17),
('CP567890123639', 'NE293847561', 18),
('SV123456789561', 'OL918273645', 19),
('SV123456789561', 'NE123654789', 20),
('GO678901234402', 'OL321456789', 21),
('GO678901234402', 'NE987321654', 22),
('DM345678901184', 'OL765432198', 23),
('DM345678901184', 'NE564738219', 24),
('CP234567890963', 'OL234987612', 25),
('CP234567890963', 'NE547892136', 26),
('SV890123456551', 'OL982134765', 27),
('SV890123456551', 'NE847362915', 28),
('GO456789123700', 'OL134765982', 29),
('GO456789123700', 'NE298374651', 30),
('DM678901234846', 'OL123456789', 31),
('DM678901234846', 'NE987654321', 32),
('CP345678901573', 'OL456789123', 33),
('CP345678901573', 'NE234567891', 34),
('SV567890123408', 'OL345678912', 35),
('SV567890123408', 'NE567891234', 36),
('GO234567890217', 'OL678912345', 37),
('GO234567890217', 'NE789123456', 38),
('DM890123456312', 'OL891234567', 39),
('DM890123456312', 'NE912345678', 40);
INSERT INTO GoodDeliveryNote (ID, Description, DeliveryDate, BranchID) VALUES
(1, 'Delivery of goods to client A', '2024-12-01', 1),
(2, 'Delivery of office supplies', '2024-12-02', 2),
(3, 'Delivery of electronic components', '2024-12-03', 3),
(4, 'Shipment of raw materials', '2024-12-04', 4),
(5, 'Delivery of furniture', '2024-12-05', 5),
(6, 'Delivery of laboratory equipment', '2024-12-06', 6),
(7, 'Goods delivered for project B', '2024-12-07', 7),
(8, 'Delivery of uniforms to retail outlet', '2024-12-08', 8),
(9, 'Delivery of machinery', '2024-12-09', 9),
(10, 'Goods shipped to warehouse Z', '2024-12-10', 10),
(11, 'Transport of industrial goods', '2024-12-11', 11),
(12, 'Delivery of packaged food', '2024-12-12', 12),
(13, 'Delivery of construction materials', '2024-12-13', 13),
(14, 'Delivery of customer order #12345', '2024-12-14', 14),
(15, 'Shipment of office equipment', '2024-12-15', 15),
(16, 'Delivery of wholesale goods', '2024-12-16', 16),
(17, 'Transport of chemicals', '2024-12-17', 17),
(18, 'Delivery of imported goods', '2024-12-18', 18),
(19, 'Bulk delivery of books', '2024-12-19', 19),
(20, 'Shipment of electronics to client X', '2024-12-20', 20),
(21, 'Transport of home appliances', '2024-12-21', 21),
(22, 'Delivery of construction equipment', '2024-12-22', 22),
(23, 'Shipment of medical supplies', '2024-12-23', 23),
(24, 'Delivery of spare parts', '2024-12-24', 24),
(25, 'Delivery of promotional items', '2024-12-25', 25),
(26, 'Delivery of pet supplies', '2024-12-26', 26),
(27, 'Goods shipped to retail outlets', '2024-12-27', 27),
(28, 'Transport of books and magazines', '2024-12-28', 28),
(29, 'Delivery of agricultural products', '2024-12-29', 29),
(30, 'Delivery of cleaning materials', '2024-12-30', 30);

INSERT INTO GoodReceiveNote (ID, Description, ReceiveDate, BranchID) VALUES
(1, 'Goods received from supplier A', '2024-12-01', 1),
(2, 'Received office supplies from vendor', '2024-12-02', 2),
(3, 'Received components for assembly', '2024-12-03', 3),
(4, 'Received shipment of raw materials', '2024-12-04', 4),
(5, 'Received new furniture stock', '2024-12-05', 5),
(6, 'Received laboratory equipment', '2024-12-06', 6),
(7, 'Received goods for project B', '2024-12-07', 7),
(8, 'Received uniforms from supplier', '2024-12-08', 8),
(9, 'Received machinery for production', '2024-12-09', 9),
(10, 'Received bulk shipment at warehouse Z', '2024-12-10', 10),
(11, 'Received industrial materials from overseas', '2024-12-11', 11),
(12, 'Received packaged food items', '2024-12-12', 12),
(13, 'Received construction materials for project', '2024-12-13', 13),
(14, 'Received customer order #12345', '2024-12-14', 14),
(15, 'Received new office equipment', '2024-12-15', 15),
(16, 'Received wholesale goods from distributor', '2024-12-16', 16),
(17, 'Received chemicals from supplier', '2024-12-17', 17),
(18, 'Received imported goods from overseas', '2024-12-18', 18),
(19, 'Received books for retail', '2024-12-19', 19),
(20, 'Received electronics from vendor X', '2024-12-20', 20),
(21, 'Received home appliances for retail', '2024-12-21', 21),
(22, 'Received construction equipment for site', '2024-12-22', 22),
(23, 'Received medical supplies for hospital', '2024-12-23', 23),
(24, 'Received spare parts for maintenance', '2024-12-24', 24),
(25, 'Received promotional items for sale', '2024-12-25', 25),
(26, 'Received pet supplies for store', '2024-12-26', 26),
(27, 'Received goods for retail sale', '2024-12-27', 27),
(28, 'Received books and magazines for sale', '2024-12-28', 28),
(29, 'Received agricultural products for farm', '2024-12-29', 29),
(30, 'Received cleaning materials for stock', '2024-12-30', 30);




-- trigger
use cellphone;

DELIMITER $$

CREATE TRIGGER BeforeBillInsert
BEFORE INSERT ON Bill
FOR EACH ROW
BEGIN
    DECLARE customer_exists INT;

    -- Check if the customer exists
    SELECT COUNT(*)
    INTO customer_exists
    FROM Customer
    WHERE AccountID = NEW.Cus_AccountID;

    -- If the customer does not exist, raise an error
    IF customer_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot create a bill for a non-existent customer';
    END IF;
END$$

DELIMITER ;

-- ----------------------------------------

DELIMITER $$

CREATE TRIGGER BeforeReturnExchangeInsert
BEFORE INSERT ON ReturnExchangeStock
FOR EACH ROW
BEGIN
    DECLARE bill_branch_id INT;
    DECLARE staff_branch_id INT;

    -- Get the branch where the bill was created
    SELECT BranchID INTO bill_branch_id
    FROM Bill
    JOIN Stafff ON Bill.StaffID = Stafff.StaffID
    JOIN Workfor ON Stafff.StaffID = Workfor.EMP_ID
    WHERE Bill.BillID = NEW.BillID;

    -- Get the branch of the staff processing the return
    SELECT BranchID INTO staff_branch_id
    FROM Workfor
    WHERE EMP_ID = NEW.BranchID;

    -- Validate that both branches match
    IF bill_branch_id IS NULL OR staff_branch_id IS NULL OR bill_branch_id != staff_branch_id THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot process return or exchange. Bill and return must be handled by staff from the same branch.';
    END IF;
END$$

DELIMITER ;


-- Indexes for Bill and Staff relationships
CREATE INDEX idx_bill_staff ON Bill(StaffID);
CREATE INDEX idx_staff_branch ON Workfor(BranchID, EMP_ID);

-- Index for Branch in ReturnExchangeStock
CREATE INDEX idx_res_branch ON ReturnExchangeStock(BranchID);

DELIMITER $$

CREATE TRIGGER staff_count_check BEFORE INSERT ON Workfor
FOR EACH ROW
BEGIN
    DECLARE staff_count INT;
    SELECT COUNT(*) INTO staff_count FROM Workfor WHERE BranchID = NEW.BranchID;
    IF staff_count >= 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Branch cannot have more than 10 staff members';
    ELSEIF staff_count < 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Branch must have at least 5 staff members';
    END IF;
END$$

DELIMITER ;
use cellphone;

DELIMITER $$

CREATE FUNCTION CalculateTotalDiscount(
    p_AccountID INT
) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_discount DECIMAL(10,2);

    SELECT 
        IFNULL(SUM(discountValue), 0)
    INTO 
        total_discount
    FROM 
        Voucher
    WHERE 
        AccountID = p_AccountID
        AND expiredDate >= CURDATE();

    RETURN total_discount;
END$$

DELIMITER ;


DELIMITER $$

CREATE FUNCTION ValidatePhoneNumber(
    p_PhoneNumber VARCHAR(15)
) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE valid BOOLEAN DEFAULT FALSE;

    IF p_PhoneNumber REGEXP '^0[0-9]{8}$' THEN
        SET valid = TRUE;
    END IF;

    RETURN valid;
END$$

DELIMITER ;
use cellphone;

DELIMITER $$

CREATE PROCEDURE AddNewCustomer(
    IN p_AccountID INT,
    IN p_CusPoint INT,
    IN p_FName VARCHAR(50),
    IN p_MName VARCHAR(50),
    IN p_LName VARCHAR(50),
    IN p_DOB DATE,
    IN p_Gender ENUM('Male', 'Female'),
    IN p_Address TEXT,
    IN p_PhoneNumber VARCHAR(15)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    IF EXISTS (SELECT 1 FROM Customer WHERE AccountID = p_AccountID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'AccountID already exists.';
    END IF;


    INSERT INTO Customer (AccountID, CusPoint, FName, MName, LName, DOB, Gender, Address)
    VALUES (p_AccountID, p_CusPoint, p_FName, p_MName, p_LName, p_DOB, p_Gender, p_Address);
    
    INSERT INTO CusNumPhone (AccountID, PhoneNumber)
    VALUES (p_AccountID, p_PhoneNumber);

    COMMIT;
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE UpdateCustomerPoints(
    IN p_AccountID INT,
    IN p_NewPoints INT
)
BEGIN
    UPDATE Customer
    SET CusPoint = p_NewPoints
    WHERE AccountID = p_AccountID;
    
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE DeleteCustomer(
    IN p_PhoneNumber VARCHAR(15)
)
BEGIN
    DECLARE v_AccountID INT;
    DECLARE customer_exists INT;

    SELECT AccountID INTO v_AccountID
    FROM CusNumPhone
    WHERE PhoneNumber = p_PhoneNumber;

    IF v_AccountID IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer not exist.';
    END IF;

    SELECT COUNT(*) INTO customer_exists
    FROM Customer
    WHERE AccountID = v_AccountID;

    IF customer_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer not exist.';
    ELSE
        DELETE FROM CusNumPhone WHERE AccountID = v_AccountID;
        
        DELETE FROM Voucher WHERE AccountID = v_AccountID;

        DELETE FROM Customer WHERE AccountID = v_AccountID;
    END IF;
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE GetCustomerDetails(
    IN p_AccountID INT
)
BEGIN
    SELECT 
        AccountID, CusPoint, FName, MName, LName, DOB, Gender, Address
    FROM 
        Customer
    WHERE 
        AccountID = p_AccountID;
    SELECT 
        PhoneNumber
    FROM 
        CusNumPhone
    WHERE 
        AccountID = p_AccountID;

    SELECT 
        expiredDate, discountValue
    FROM 
        Voucher
    WHERE 
        AccountID = p_AccountID;
END$$

DELIMITER ;

-- CALL GetCustomerDetails(1)

DELIMITER $$

CREATE PROCEDURE GetBranchSalesReport(
    IN p_BranchID INT,
    IN p_StartMonth INT,
    IN p_StartYear INT,
    IN p_EndMonth INT,
    IN p_EndYear INT
)
BEGIN
    SELECT 
        b.ID AS BranchID,
        b.Name AS BranchName,
        COUNT(bill.BillID) AS TotalBills,
        SUM(bill.TotalPrice) AS TotalSales
    FROM 
        Branch b
    LEFT JOIN 
        Bill bill ON b.ID = (SELECT BranchID FROM Workfor wf WHERE wf.EMP_ID = bill.StaffID LIMIT 1)
    WHERE 
        b.ID = p_BranchID
        AND (
            (bill.Month > p_StartMonth AND bill.Year >= p_StartYear) OR
            (bill.Month < p_EndMonth AND bill.Year <= p_EndYear)
        )
    GROUP BY 
        b.ID, b.Name
    HAVING 
        COUNT(bill.BillID) > 0
    ORDER BY 
        TotalSales DESC;
END$$bill

DELIMITER ;
-- CALL GetBranchSalesReport(1, 1, 2024, 12, 2024); report show total sales+bills, tu 1/2024 -> 12/2024

DELIMITER $$



CALL GetCustomerDetails (2);
CALL GetBranchSalesReport(1,10, 2002, 1, 2003);

SELECT * FROM bill;

SELECT * FROM employee;
SELECT * FROM stafff;

DROP SCHEMA IF EXISTS cellphone;
CREATE SCHEMA cellphone;
USE cellphone;

CREATE TABLE Customer (
    AccountID INT PRIMARY KEY,
    CusPoint INT,
    FName VARCHAR(50),
    MName VARCHAR(50),
    LName VARCHAR(50),
    DOB DATE,
    Gender ENUM('Male', 'Female'),
    Address TEXT
);

CREATE TABLE CusNumPhone (
    AccountID INT,
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (AccountID, PhoneNumber),
    FOREIGN KEY (AccountID) REFERENCES Customer(AccountID)
);

CREATE TABLE Voucher (
    AccountID INT,
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
    Manager_ID INT PRIMARY KEY,
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(ID)
);

CREATE TABLE Employee (
    EMP_ID INT PRIMARY KEY,
    LName VARCHAR(50),
    FName VARCHAR(50),
    EMP_Date DATE,
    Month INT,
    Year INT,
    EMP_Address TEXT,
    Gender ENUM('Male', 'Female'),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Manager(Manager_ID)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FOREIGN KEY (StaffID) REFERENCES Employee(EMP_ID)
);

CREATE TABLE Bill (
    BillID INT PRIMARY KEY,
    Cus_AccountID INT,
    PaymentMethod_ID INT,
    StaffID INT,
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
    DeviceID INT PRIMARY KEY,
    DeviceName VARCHAR(100)
);

CREATE TABLE Contain (
    BillID INT,
    deviceType INT,
    deviceNumber INT,
    PRIMARY KEY (BillID, deviceType),
    FOREIGN KEY (BillID) REFERENCES Bill(BillID),
    FOREIGN KEY (deviceType) REFERENCES DeviceType(DeviceID)
);



CREATE TABLE Device (
    DeviceType INT PRIMARY KEY,
    Status ENUM('Active', 'Inactive'),
    DevicePrice DECIMAL(10, 2),
    FOREIGN KEY (DeviceType) REFERENCES DeviceType(DeviceID)
);

CREATE TABLE Updated (
    BillID INT,
    NoteID INT,
    SellQuantity INT,
    DeviceStatus ENUM('New', 'Used', 'Defective'),
    FOREIGN KEY (BillID) REFERENCES Bill(BillID)
);

CREATE TABLE ReturnExchangeStock (
    ID INT PRIMARY KEY,
    ExpiredDate DATE,
    BillID INT,
    BranchID INT,
    FOREIGN KEY (BillID) REFERENCES Bill(BillID),
    FOREIGN KEY (BranchID) REFERENCES Branch(ID)
);

CREATE TABLE PhoneNumber (
    PhoneNumber VARCHAR(15) PRIMARY KEY,
    EmployeeID INT,
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
    EMP_ID INT,
    BranchID INT,
    WorkingDuration INT,
    PRIMARY KEY (EMP_ID, BranchID),
    FOREIGN KEY (EMP_ID) REFERENCES Employee(EMP_ID),
    FOREIGN KEY (BranchID) REFERENCES Branch(ID)
);

CREATE TABLE Is_Haven (
    DeviceType INT,
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
    DeviceType INT,
    FOREIGN KEY (DeviceType) REFERENCES DeviceType(DeviceID)
);


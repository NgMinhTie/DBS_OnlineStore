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

CREATE TABLE Stafff (
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

INSERT INTO Customer (AccountID, CusPoint, FName, MName, LName, DOB, Gender, Address)
VALUES
    -- (1, 120, 'John', 'A.', 'Doe', '1985-01-15', 'Male', '123 Main Street'),
    (2, 450, 'Jane', 'B.', 'Smith', '1992-03-12', 'Female', '456 Oak Drive'),
    (3, 300, 'Michael', 'C.', 'Brown', '1987-07-20', 'Male', '789 Pine Ave'),
    (4, 520, 'Emily', 'D.', 'Davis', '1990-10-10', 'Female', '101 Maple Blvd'),
    (5, 100, 'Chris', 'E.', 'Wilson', '1982-12-05', 'Male', '11 Elm St'),
    (6, 250, 'Sarah', 'F.', 'Taylor', '1989-08-14', 'Female', '22 Birch Lane'),
    (7, 350, 'David', 'G.', 'Anderson', '1983-04-22', 'Male', '33 Cedar Ct'),
    (8, 400, 'Sophia', 'H.', 'Thomas', '1995-11-03', 'Female', '44 Walnut Rd'),
    (9, 180, 'Daniel', 'I.', 'Harris', '1988-06-18', 'Male', '55 Chestnut Ave'),
    (10, 290, 'Olivia', 'J.', 'Martinez', '1991-02-28', 'Female', '66 Willow Way'),
    (11, 220, 'Matthew', 'K.', 'Clark', '1984-09-09', 'Male', '77 Spruce Path'),
    (12, 510, 'Emma', 'L.', 'Lewis', '1993-05-05', 'Female', '88 Ash Dr'),
    (13, 600, 'Joshua', 'M.', 'Walker', '1986-03-31', 'Male', '99 Hickory St'),
    (14, 430, 'Mia', 'N.', 'Hall', '1981-07-15', 'Female', '100 Fir Cir'),
    (15, 300, 'Anthony', 'O.', 'Allen', '1990-12-25', 'Male', '120 Cypress Ln'),
    (16, 470, 'Isabella', 'P.', 'Young', '1994-09-14', 'Female', '130 Cherry Ave'),
    (17, 620, 'Andrew', 'Q.', 'King', '1987-11-11', 'Male', '140 Redwood Dr'),
    (18, 210, 'Amelia', 'R.', 'Wright', '1983-10-22', 'Female', '150 Poplar Ct'),
    (19, 330, 'James', 'S.', 'Lopez', '1991-01-07', 'Male', '160 Sycamore Rd'),
    (20, 540, 'Charlotte', 'T.', 'Green', '1992-08-17', 'Female', '170 Beech Blvd'),
    (21, 120, 'Benjamin', 'U.', 'Scott', '1985-06-30', 'Male', '180 Juniper Ln'),
    (22, 480, 'Ava', 'V.', 'Adams', '1989-12-02', 'Female', '190 Magnolia Way'),
    (23, 390, 'Elijah', 'W.', 'Baker', '1993-11-29', 'Male', '200 Laurel Cir'),
    (24, 250, 'Ella', 'X.', 'Gonzalez', '1990-05-25', 'Female', '210 Dogwood Ave'),
    (25, 350, 'Alexander', 'Y.', 'Nelson', '1988-03-08', 'Male', '220 Maplewood Dr'),
    (26, 410, 'Grace', 'Z.', 'Perez', '1986-07-02', 'Female', '230 Pinewood Ln'),
    (27, 580, 'Henry', 'A.', 'Roberts', '1991-04-14', 'Male', '240 Evergreen St'),
    (28, 200, 'Lily', 'B.', 'Turner', '1985-02-06', 'Female', '250 Forest Rd'),
    (29, 340, 'Jackson', 'C.', 'Phillips', '1987-01-23', 'Male', '260 Glenwood Ave'),
    (30, 520, 'Hannah', 'D.', 'Campbell', '1994-09-12', 'Female', '270 Meadow Ln');

INSERT INTO CUSNUMPHONE (
    AccountID,
    PhoneNumber
) VALUES (
    2,
    "0123456789"
);
/*
	BILL_ID: 3: status, 6: unique, 3: Num Bill
*/

INSERT INTO EMPLOYEE(EMP_ID, LNAME, FNAME, EMP_DATE, MONTH, YEAR, EMP_Address, Gender, ManagerID)
VALUES(01234, "JASON", "SMITH", 21, 12, 2001, "98 Hilton Road, Massachuset, Cambridge City", 'Male', 02123);
/*
	EMP_ID: 01 -> Staff, 02 --> Manager
*/
INSERT INTO Stafff(StafffID)
VALUES(01234);

INSERT INTO Branch(ID, Name, Location, DiscountType)
VALUES(1, "Universe", "55 Smess", "None");

INSERT INTO Voucher (
    AccountID,
    expiredDate,
    discountValue
) VALUES (
    2,
    "2019-01-20",
    20
);

INSERT INTO BILL(
    BILLID,
    CUS_ACCOUNTID,
    PAYMENTMETHOD_ID,
    STAFFID,
    D_NUM,
    MONTH,
    YEAR,
    HOUR,
    MINUTE,
    TOTALPRICE
) VALUES(
    1, 
    2,
    123,
    01234, 
    30,
    12,
    2002,
    3,
    12,
    1224
);
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
END$$

DELIMITER ;
-- CALL GetBranchSalesReport(1, 1, 2024, 12, 2024); report show total sales+bills, tu 1/2024 -> 12/2024

DELIMITER $$



CALL GetCustomerDetails (2);
CALL GetBranchSalesReport(1,12, 2002, 1, 2003);




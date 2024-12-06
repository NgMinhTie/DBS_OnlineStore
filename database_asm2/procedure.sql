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








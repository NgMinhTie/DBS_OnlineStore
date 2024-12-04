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
    INSERT INTO Customer(AccountID, CusPoint, FName, MName, LName, DOB, Gender, Address)
    VALUES (p_AccountID, p_CusPoint, p_FName, p_MName, p_LName, p_DOB, p_Gender, p_Address);
    
    INSERT INTO CusNumPhone(AccountID, PhoneNumber)
    VALUES (p_AccountID, p_PhoneNumber);
    
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




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

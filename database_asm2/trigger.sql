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

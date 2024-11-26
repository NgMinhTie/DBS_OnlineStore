use cellphone;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM ReturnExchangeStock;
DELETE FROM Bill;
DELETE FROM Stafff;
DELETE FROM Workfor;
DELETE FROM Employee;
DELETE FROM Manager;
DELETE FROM Branch;
DELETE FROM Customer;

-- ----------test 1--------------
INSERT INTO Customer (AccountID, CusPoint, FName, MName, LName, DOB, Gender, Address)
VALUES (1, 100, 'John', 'A.', 'Doe', '1990-01-01', 'Male', '123 Elm Street');

INSERT INTO Bill (BillID, Cus_AccountID, PaymentMethod_ID, StaffID, D_Num, Month, Year, Hour, Minute, TotalPrice)
VALUES (1, 1, 101, NULL, 1, 11, 2024, 10, 30, 250.00);

-- ----------test 2: non exist bill--------------
INSERT INTO Bill (BillID, Cus_AccountID, PaymentMethod_ID, StaffID, D_Num, Month, Year, Hour, Minute, TotalPrice)
VALUES (2, 999, 101, NULL, 1, 11, 2024, 11, 45, 500.00);


-- ----------test 3: fail--------------------------
INSERT INTO Branch (ID, Name, Location, DiscountType)
VALUES (1, 'Downtown Branch', '123 Central Ave', 'Seasonal');
INSERT INTO Manager (Manager_ID, BranchID)
VALUES (1, 1);
INSERT INTO Employee (EMP_ID, LName, FName, EMP_Date, Month, Year, EMP_Address, Gender, ManagerID)
VALUES (1, 'Smith', 'Jane', '2023-06-01', 6, 2023, '456 Oak Street', 'Female', 1);
INSERT INTO Workfor (EMP_ID, BranchID, WorkingDuration)
VALUES (1, 1, 12);
INSERT INTO Stafff (StaffID)
VALUES (1);
INSERT INTO Bill (BillID, Cus_AccountID, PaymentMethod_ID, StaffID, D_Num, Month, Year, Hour, Minute, TotalPrice)
VALUES (1, 1, 101, 1, 1, 11, 2024, 14, 15, 300.00);
INSERT INTO ReturnExchangeStock (ID, ExpiredDate, BillID, BranchID)
VALUES (2, '2024-12-31', 1, 1);

-- ------------------test 4--------------------
-- ================================================
-- Test Case 1: Insert a bill for an existing customer
-- ================================================
INSERT INTO Customer (AccountID, CusPoint, FName, MName, LName, DOB, Gender, Address)
VALUES (1, 100, 'John', 'A.', 'Doe', '1990-01-01', 'Male', '123 Elm Street');

INSERT INTO Bill (BillID, Cus_AccountID, PaymentMethod_ID, StaffID, D_Num, Month, Year, Hour, Minute, TotalPrice)
VALUES (1, 1, 101, NULL, 1, 11, 2024, 10, 30, 250.00);

-- Expected Result: Success

-- ================================================
-- Test Case 2: Insert a bill for a non-existent customer
-- ================================================
INSERT INTO Bill (BillID, Cus_AccountID, PaymentMethod_ID, StaffID, D_Num, Month, Year, Hour, Minute, TotalPrice)
VALUES (2, 999, 101, NULL, 1, 11, 2024, 11, 45, 500.00);

-- Expected Result: Error - Cannot create a bill for a non-existent customer

-- ================================================
-- Test Case 3: Insert a valid return/exchange stock record
-- ================================================
INSERT INTO Branch (ID, Name, Location, DiscountType)
VALUES (1, 'Downtown Branch', '123 Central Ave', 'Seasonal');

INSERT INTO Manager (Manager_ID, BranchID)
VALUES (1, 1);

INSERT INTO Employee (EMP_ID, LName, FName, EMP_Date, Month, Year, EMP_Address, Gender, ManagerID)
VALUES (1, 'Smith', 'Jane', '2023-06-01', 6, 2023, '456 Oak Street', 'Female', 1);

INSERT INTO Workfor (EMP_ID, BranchID, WorkingDuration)
VALUES (1, 1, 12);

INSERT INTO Stafff (StaffID)
VALUES (1);

INSERT INTO Bill (BillID, Cus_AccountID, PaymentMethod_ID, StaffID, D_Num, Month, Year, Hour, Minute, TotalPrice)
VALUES (3, 1, 101, 1, 1, 11, 2024, 14, 15, 300.00);

INSERT INTO ReturnExchangeStock (ID, ExpiredDate, BillID, BranchID)
VALUES (1, '2024-12-31', 3, 1);

-- Expected Result: Success

-- ================================================
-- Test Case 4: Insert return/exchange with mismatched branches
-- ================================================
INSERT INTO Branch (ID, Name, Location, DiscountType)
VALUES (2, 'Uptown Branch', '456 High St', 'Clearance');

INSERT INTO ReturnExchangeStock (ID, ExpiredDate, BillID, BranchID)
VALUES (2, '2024-12-31', 3, 2);


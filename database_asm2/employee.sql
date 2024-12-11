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
('MN43211', 'Green', 'Grace', '2021-07-03', 7, 2021, '2186 Cedar St', 'Female', NULL);

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
('ST10001', 'Smith', 'John', '2023-01-01', 1, 2023, '1234 Elm St', 'Male', 'MN12345'),
('ST10002', 'Johnson', 'Emily', '2023-02-02', 2, 2023, '2345 Oak St', 'Female', 'MN12345'),
('ST10003', 'Williams', 'Michael', '2023-03-03', 3, 2023, '3456 Pine St', 'Male', 'MN12345'),
('ST10004', 'Brown', 'Sarah', '2023-04-04', 4, 2023, '4567 Maple St', 'Female', 'MN12345'),
('ST10005', 'Taylor', 'David', '2023-05-05', 5, 2023, '5678 Cedar St', 'Male', 'MN12345'),
('ST10006', 'Davis', 'Olivia', '2023-06-06', 6, 2023, '6789 Birch St', 'Female', 'MN12345'),

-- Assigning manager ID 'MN23456' (6 times)
('ST10007', 'Miller', 'Liam', '2023-07-07', 7, 2023, '7890 Redwood St', 'Male', 'MN23456'),
('ST10008', 'Wilson', 'Sophia', '2023-08-08', 8, 2023, '8901 Walnut St', 'Female', 'MN23456'),
('ST10009', 'Moore', 'Jackson', '2023-09-09', 9, 2023, '9012 Pine St', 'Male', 'MN23456'),
('ST10010', 'Taylor', 'Amelia', '2023-10-10', 10, 2023, '1234 Ash St', 'Female', 'MN23456'),
('ST10011', 'Adams', 'Noah', '2023-11-11', 11, 2023, '2345 Cedar St', 'Male', 'MN23456'),
('ST10012', 'Carter', 'Grace', '2023-12-12', 12, 2023, '3456 Birch St', 'Female', 'MN23456'),

-- Assigning manager ID 'MN34567' (6 times)
('ST10013', 'White', 'Zoe', '2023-01-13', 1, 2023, '4567 Maple St', 'Female', 'MN34567'),
('ST10014', 'Clark', 'Mason', '2023-02-14', 2, 2023, '5678 Birch St', 'Male', 'MN34567'),
('ST10015', 'Harris', 'Benjamin', '2023-03-15', 3, 2023, '6789 Pine St', 'Male', 'MN34567'),
('ST10016', 'Walker', 'Isabella', '2023-04-16', 4, 2023, '7890 Oak St', 'Female', 'MN34567'),
('ST10017', 'Allen', 'Lucas', '2023-05-17', 5, 2023, '8901 Cedar St', 'Male', 'MN34567'),
('ST10018', 'Scott', 'Ava', '2023-06-18', 6, 2023, '9012 Maple St', 'Female', 'MN34567'),

-- Assigning manager ID 'MN45678' (6 times)
('ST10019', 'King', 'Oliver', '2023-07-19', 7, 2023, '1234 Pine St', 'Male', 'MN45678'),
('ST10020', 'Hernandez', 'Amelia', '2023-08-20', 8, 2023, '2345 Oak St', 'Female', 'MN45678'),
('ST10021', 'Martinez', 'Ethan', '2023-09-21', 9, 2023, '3456 Birch St', 'Male', 'MN45678'),
('ST10022', 'Garcia', 'Sophia', '2023-10-22', 10, 2023, '4567 Redwood St', 'Female', 'MN45678'),
('ST10023', 'Lopez', 'Benjamin', '2023-11-23', 11, 2023, '5678 Pine St', 'Female', 'MN45678'),
('ST10024', 'Young', 'James', '2023-12-24', 12, 2023, '6789 Cedar St', 'Male', 'MN45678'),

-- Assigning manager ID 'MN56789' (6 times)
('ST10025', 'Moore', 'Ethan', '2023-01-25', 1, 2023, '7890 Maple St', 'Male', 'MN56789'),
('ST10026', 'Miller', 'Olivia', '2023-02-26', 2, 2023, '8901 Birch St', 'Female', 'MN56789'),
('ST10027', 'Davis', 'Isabella', '2023-03-27', 3, 2023, '9012 Oak St', 'Male', 'MN56789'),
('ST10028', 'Martinez', 'Ava', '2023-04-28', 4, 2023, '1234 Pine St', 'Female', 'MN56789'),
('ST10029', 'Wilson', 'Jack', '2023-05-29', 5, 2023, '2345 Maple St', 'Male', 'MN56789'),
('ST10030', 'Taylor', 'Emily', '2023-06-30', 6, 2023, '3456 Cedar St', 'Female', 'MN56789'),

-- Assigning manager ID 'MN67890' (6 times)
('ST10031', 'Garcia', 'Mason', '2023-07-01', 7, 2023, '4567 Redwood St', 'Male', 'MN67890'),
('ST10032', 'Wilson', 'Charlotte', '2023-08-02', 8, 2023, '5678 Pine St', 'Female', 'MN67890'),
('ST10033', 'Moore', 'Lucas', '2023-09-03', 9, 2023, '6789 Oak St', 'Male', 'MN67890'),
('ST10034', 'Taylor', 'Ethan', '2023-10-04', 10, 2023, '7890 Cedar St', 'Female', 'MN67890'),
('ST10035', 'Lopez', 'Ava', '2023-11-05', 11, 2023, '8901 Redwood St', 'Male', 'MN67890'),
('ST10036', 'Davis', 'Sophia', '2023-12-06', 12, 2023, '9012 Pine St', 'Female', 'MN67890'),

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
('ST10105', 'Wilson', 'Ava', '2023-09-13', 9, 2023, '6789 Birch St', 'Female', 'MN32109'),
('ST10106', 'Garcia', 'Sophia', '2023-10-14', 10, 2023, '7890 Oak St', 'Male', 'MN32109'),
('ST10107', 'Miller', 'Liam', '2023-11-15', 11, 2023, '8901 Redwood St', 'Female', 'MN32109'),
('ST10108', 'Jones', 'Benjamin', '2023-12-16', 12, 2023, '9012 Maple St', 'Male', 'MN32109'),

-- Assigning manager ID 'MN43210' (5 times)
('ST10109', 'Taylor', 'Lucas', '2024-01-17', 1, 2024, '1234 Cedar St', 'Female', 'MN43210'),
('ST10110', 'Roberts', 'James', '2024-02-18', 2, 2024, '2345 Redwood St', 'Male', 'MN43210'),
('ST10111', 'Garcia', 'Sophia', '2024-03-19', 3, 2024, '3456 Birch St', 'Female', 'MN43210'),
('ST10112', 'Adams', 'Olivia', '2024-04-20', 4, 2024, '4567 Oak St', 'Male', 'MN43210'),
('ST10113', 'Walker', 'Liam', '2024-05-21', 5, 2024, '5678 Maple St', 'Female', 'MN43210');

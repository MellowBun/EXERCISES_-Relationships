USE master;

--DROP DATABASE IF EXISTS dcouch;
--go

--CREATE DATABASE DCouch;
--go

USE Dcouch;

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Store;
go

CREATE TABLE Store (
	StoreID INT IDENTITY(1,1) PRIMARY KEY,
	StoreNum INT UNIQUE NOT NULL,
	StoreAddress NVARCHAR(MAX) NOT NULL,
	StoreState VARCHAR(2) DEFAULT 'WA',
	OpenTime TIME NOT NULL,
	CloseTime TIME NOT NULL
);
go

CREATE TABLE Employee (
	EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName NVARCHAR(255) NOT NULL,
	LastName NVARCHAR(225) NOT NULL,
	ManagerID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
	StoreID INT NOT NULL FOREIGN KEY REFERENCES Store(StoreID),
)
go

INSERT INTO Store (
	StoreNum,
	StoreAddress,
	StoreState,
	OpenTime,
	CloseTime
) VALUES (
	4022,
	'123 Someplace LN',
	'OR',
	'06:00:00.0000',
	'23:00:00.0000'
),
(
	2528,
	'456 Someotherplace LN',
	'OR',
	'00:00:00.0000',
	'23:59:59.0000'
);

INSERT INTO Employee (FirstName, LastName, ManagerID, StoreID)
VALUES
	('Devan', 'Couch', NULL, 1),
	('Sarah', 'Couch', 1, 1),
	('Ashton', 'Couch', 2, 2);

UPDATE Employee
SET storeID = 2
WHERE StoreID = 1;

DELETE FROM Store
WHERE StoreID = 1;

UPDATE Employee
SET ManagerID = NULL
WHERE ManagerID IN (1, 2)

UPDATE Employee
SET ManagerID = 3
WHERE EmployeeID = 2;

DELETE FROM Employee
WHERE EmployeeID = 1;

UPDATE Store
SET StoreState = NULL;

INSERT INTO Store (StoreNum, StoreAddress, StoreState, OpenTime, CloseTime)
VALUES
(4022, 'Moved here lane', NULL, '00:00:00', '23:59:59')

SELECT * FROM Store;
SELECT * FROM Employee;
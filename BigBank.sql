Create database BigBank;
go

USE BigBank;

GO

CREATE TABLE customer
(
CustomerId INT PRIMARY KEY IDENTITY(1,1),
CreateDate datetime NOT NULL,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Address1 varchar(100) NOT NULL,
Address2 varchar(100),
City varchar(40) NOT NULL,
[State] varchar(40) NOT NULL,
Zip varchar(20) NOT NULL,
)
CREATE TABLE account
(
AccountId INT PRIMARY KEY IDENTITY(1,1),
CustomerId int FOREIGN KEY REFERENCES customer(CustomerId) NOT NULL, 
CreatedDate datetime NOT NULL,
AccountNumber int NOT NULL,
Balance int NOT NULL,
)
CREATE TABLE [transaction]
(
TransactionId INT PRIMARY KEY IDENTITY(1,1),
AccountId int FOREIGN KEY REFERENCES account(AccountId) NOT NULL, 
TransactionDate datetime NOT NULL,
Amount decimal NOT NULL,
)
CREATE TABLE [statement]
(
StatementId INT PRIMARY KEY IDENTITY(1,1),
AccountId int FOREIGN KEY REFERENCES account(AccountId) NOT NULL,
StartDate datetime NOT NULL,
EndDate datetime NOT NULL, 
)

go

SET IDENTITY_INSERT account ON;

INSERT INTO account
(AccountId, CustomerId, CreatedDate, AccountNumber, Balance)
VALUES (1, 1, '2013-06-09', '1000', 937.67);

INSERT INTO account
(AccountId, CustomerId, CreatedDate, AccountNumber, Balance)
VALUES (2, 1, '2013-07-28', '1001', 5000);

INSERT INTO account
(AccountId, CustomerId, CreatedDate, AccountNumber, Balance)
VALUES (3, 2, '2014-02-01', '1002', 1197465.05);
SET IDENTITY_INSERT account OFF;


INSERT INTO [transaction]
(AccountId, TransactionDate, Amount)
VALUES (1, '2013-06-09', 1000);

INSERT INTO [transaction]
(AccountId, TransactionDate, Amount)
VALUES (1, '2013-06-10', -55.34);

INSERT INTO [transaction]
(AccountId, TransactionDate, Amount)
VALUES (1, '2013-07-22', -6.99);

INSERT INTO [transaction]
(AccountId, TransactionDate, Amount)
VALUES (2, '2013-07-28', 1000);

INSERT INTO [transaction]
(AccountId, TransactionDate, Amount)
VALUES (2, '2013-08-28', 1000);

INSERT INTO [transaction]
(AccountId, TransactionDate, Amount)
VALUES (2, '2013-09-28', 1000);

INSERT INTO [transaction]
(AccountId, TransactionDate, Amount)
VALUES (2, '2013-09-28', 1000);

INSERT INTO [transaction]
(AccountId, TransactionDate, Amount)
VALUES (2, '2013-10-28', 1000);

INSERT INTO [transaction]
(AccountId, TransactionDate, Amount)
VALUES (3, '2014-02-01', 1200000);

INSERT INTO [transaction]
(AccountId, TransactionDate, Amount)
VALUES (3, '2014-02-10', -2534.95);

INSERT INTO [statement]
(AccountId, StartDate, EndDate)
VALUES (1, '2013-06-09', '2013-06-30');

INSERT INTO [statement]
(AccountId, StartDate, EndDate)
VALUES (1, '2013-07-01', '2013-07-31');

INSERT INTO [statement]
(AccountId, StartDate, EndDate)
VALUES (2, '2013-07-28', '2013-07-31');

INSERT INTO [statement]
(AccountId, StartDate, EndDate)
VALUES (2, '2013-08-01', '2013-08-31');

INSERT INTO [statement]
(AccountId, StartDate, EndDate)
VALUES (2, '2013-09-01', '2013-09-30');

INSERT INTO [statement]
(AccountId, StartDate, EndDate)
VALUES (2, '2013-10-01', '2013-10-31');

INSERT INTO [statement]
(AccountId, StartDate, EndDate)
VALUES (3, '2014-02-01', '2014-02-28');

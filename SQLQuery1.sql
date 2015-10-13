USE BigBank;
GO
--Show all Customers
SELECT * from customer;

--Show all Customers with a balance greater than 50,000
 SELECT * FROM customer 
 WHERE 

(SELECT SUM(Balance) FROM account WHERE account.CustomerId=customer.CustomerId) > 50000;

 SELECT * FROM [transaction] WHERE
 AccountId=(SELECT AccountId from account WHERE AccountNumber='1001') 

 AND
 (TransactionDate >= 
 
(SELECT StartDate FROM [statement] 
 WHERE [statement].AccountId=(SELECT AccountId from account WHERE AccountNumber='1001') 
 AND StartDate='2010-01-01'))

 AND 
 (TransactionDate <=
(SELECT EndDate FROM [statement] 
 WHERE [statement].AccountId=(SELECT AccountId from account WHERE AccountNumber='1001') 
 AND StartDate='2010-01-01'))
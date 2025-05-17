create table Customers (
    CustomerID int primary key,
    FullName Varchar(100),
    Email Varchar(100),
    Phone varchar(15),
    City varchar(50)
);

create table Accounts (
    AccountID int primary key,
    CustomerID int,
    AccountType varchar(20),
    Balance decimal(10,2) check (balance >= 0),
    Foreign key(CustomerID) References Customers(CustomerID)
);

create table Transactions (
    TransactionID int primary key,
    AccountID int,
    Amount  decimal(10, 2),
    TransactionType varchar(10) check(TransactionType IN ('Credit', 'Debit')),
    TransactionDate  Date,
    Foreign key(AccountID) References Accounts(AccountID)
);
INSERT INTO Customers VALUES
(1, 'Sravani Malli', 'sravani@gmail.com', '9876543210', 'Hyderabad'),
(2, 'Ravi Kumar', 'ravi.k@gmail.com', '9876500011', 'Chennai'),
(3, 'Ayesha Shaik', 'ayesha.shaik@gmail.com', '9876543333', 'Bangalore'),
(4, 'John Paul', 'john.paul@gmail.com', '9876567890', 'Mumbai'),
(5, 'Divya Reddy', 'divya.r@gmail.com', '9876546666', 'Delhi');

INSERT INTO Accounts VALUES
(101, 1, 'Savings', 15000),
(102, 1, 'Current', 20000),
(103, 2, 'Savings', 18000),
(104, 3, 'Current', 25000),
(105, 4, 'Savings', 9000),
(106, 4, 'Current', 12000),
(107, 5, 'Savings', 16000);

INSERT INTO Transactions VALUES
(1001, 101, 1000, 'Credit', '2024-05-01'),
(1002, 101, 500, 'Debit', '2024-05-02'),
(1003, 102, 15000, 'Credit', '2024-05-03'),
(1004, 102, 4000, 'Debit', '2024-05-04'),
(1005, 103, 12000, 'Credit', '2024-05-02'),
(1006, 103, 2000, 'Debit', '2024-05-06'),
(1007, 104, 5000, 'Credit', '2024-05-05'),
(1008, 104, 1500, 'Debit', '2024-05-07'),
(1009, 105, 8000, 'Credit', '2024-05-08'),
(1010, 105, 700, 'Debit', '2024-05-09'),
(1011, 106, 13000, 'Credit', '2024-05-10'),
(1012, 106, 2000, 'Debit', '2024-05-11'),
(1013, 107, 14000, 'Credit', '2024-05-01'),
(1014, 107, 1200, 'Debit', '2024-05-02'),
(1015, 101, 7000, 'Credit', '2024-05-03'),
(1016, 101, 3000, 'Debit', '2024-05-04'),
(1017, 102, 20000, 'Credit', '2024-05-05'),
(1018, 103, 500, 'Debit', '2024-05-06'),
(1019, 104, 10000, 'Credit', '2024-05-07'),
(1020, 105, 300, 'Debit', '2024-05-08');

select * from Customers c;

select c.CustomerID, c.FullName, sum(a.balance) AS TotalBalance
from Customers c
join Accounts a ON c.CustomerID = a.CustomerID
group by c.CustomerID, c.FullName;

select * from Transactions 
where amount > 10000 and TransactionDate between '2024-05-01' and '2024-05-31';

SELECT c.FullName
FROM Customers c
LEFT JOIN Accounts a ON c.CustomerID = a.CustomerID
LEFT JOIN Transactions t ON a.AccountID = t.AccountID
WHERE t.TransactionID IS NULL;

create index idx_AccountID on Transactions(AccountID);
create index idx_TransactionDate on Transactions(TransactionDate);

select * from Transactions;
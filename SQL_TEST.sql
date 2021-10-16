create database LilFresh
go
use LilFresh
go

-- create

create table MsCustomer(
	CustomerId char(5) primary key check(CustomerId like 'CU[0-9][0-9][0-9]'),
	CustomerName varchar(30) not null,
	CustomerEmail varchar(50) not null,
	CustomerGender varchar(10) not null,
	CustomerAddress varchar(100) not null
)

create table MsStaff(
	StaffId char(5) primary key check(StaffId like 'ST[0-9][0-9][0-9]'),
	StaffName varchar(30) not null,
	StaffEmail varchar(50) not null,
	StaffGender varchar(10) not null,
	StaffAddress varchar(100) not null,
	StaffSalary bigint not null
)

create table MsFruit(
	FruitId char(5) primary key check(FruitId like 'FR[0-9][0-9][0-9]'),
	FruitName varchar(30) not null,
	FruitPrice bigint not null
)

create table TrTransactionHeader(
	TransactionId char(5) primary key check(TransactionId like 'TR[0-9][0-9][0-9]'),
	CustomerId char(5) foreign key references MsCustomer(CustomerId) on update cascade on delete cascade,
	StaffId char(5) foreign key references MsStaff(StaffId) on update cascade on delete cascade,
	TransactionDate date not null
)

create table TrTransactionDetail(
	TransactionId char(5) foreign key references TrTransactionHeader(TransactionId) on update cascade on delete cascade,
	FruitId char(5) foreign key references MsFruit(FruitId) on update cascade on delete cascade,
	Quantity int not null,
	primary key (TransactionId, FruitId)
)

go

-- insert

insert into MsCustomer values ('CU001', 'Benedictus Danielle', 'bdanielle@gmail.com', 'Male', 'Orchid Street No. 001')
insert into MsCustomer values ('CU002', 'Audrey Chen', 'achen@gmail.com', 'Female', 'Jasmine Street No. 002')
insert into MsCustomer values ('CU003', 'Eliora Dharmajayanti', 'edharmajayanti@gmail.com', 'Female', 'Lily Street No. 003')
insert into MsCustomer values ('CU004', 'Wahyu Saputra Mai', 'wsmai@gmail.com', 'Male', 'Rose Street No. 004')
insert into MsCustomer values ('CU005', 'Devinca Limto', 'dlimto@gmail.com', 'Female', 'Tulip Street No. 005')
insert into MsCustomer values ('CU006', 'Reiven Candra Hamid', 'rchamid@gmail.com', 'Male', 'Chrysanthemum Street No. 006')
insert into MsCustomer values ('CU007', 'Nicky Hendrik Sen', 'nhsen@gmail.com', 'Male', 'Sunflower Street No. 007')

insert into MsStaff values ('ST001', 'Anto Santoso', 'asantoso@gmail.com', 'Male', 'Lemon Street No. 101', 4000000)
insert into MsStaff values ('ST002', 'Budi Wijaya', 'bwijaya@gmail.com', 'Male', 'Mango Street No. 102', 4100000)
insert into MsStaff values ('ST003', 'Cici Suryani', 'csuryani@gmail.com', 'Female', 'Apple Street No. 103', 3000000)
insert into MsStaff values ('ST004', 'Danu Saputra', 'dsaputra@gmail.com', 'Male', 'Orange Street No. 104', 5000000)
insert into MsStaff values ('ST005', 'Eva Maria', 'emaria@gmail.com', 'Female', 'Melon Street No. 105', 2500000)
insert into MsStaff values ('ST006', 'Fransisco Luis', 'fluis@gmail.com', 'Male', 'Durian Street No. 106', 3500000)
insert into MsStaff values ('ST007', 'Gilbert Tanoto', 'gtanoto@gmail.com', 'Male', 'Strawberry Street No. 107', 4500000)

insert into MsFruit values ('FR001', 'Orange', 8000)
insert into MsFruit values ('FR002', 'Apple', 9000)
insert into MsFruit values ('FR003', 'Lemon', 7000)
insert into MsFruit values ('FR004', 'Melon', 8500)
insert into MsFruit values ('FR005', 'Durian', 11000)
insert into MsFruit values ('FR006', 'Starfruit', 9000)
insert into MsFruit values ('FR007', 'Strawberry', 9000)
insert into MsFruit values ('FR008', 'Blueberry', 9000)
insert into MsFruit values ('FR009', 'Pear', 13000)
insert into MsFruit values ('FR010', 'Mango', 10000)
insert into MsFruit values ('FR011', 'Grape', 12000)
insert into MsFruit values ('FR012', 'Cherry', 11000)
insert into MsFruit values ('FR013', 'Banana', 10000)
insert into MsFruit values ('FR014', 'Avocado', 9000)
insert into MsFruit values ('FR015', 'Guava', 9500)
insert into MsFruit values ('FR016', 'Lychee', 7000)
insert into MsFruit values ('FR017', 'Kiwifruit', 9000)
insert into MsFruit values ('FR018', 'Papaya', 7500)
insert into MsFruit values ('FR019', 'Pineapple', 9500)
insert into MsFruit values ('FR020', 'Raspberry', 10000)
insert into MsFruit values ('FR021', 'Watermelon', 6000)

insert into TrTransactionHeader values ('TR001', 'CU001', 'ST005', '2020-01-01')
insert into TrTransactionHeader values ('TR002', 'CU004', 'ST006', '2020-01-05')
insert into TrTransactionHeader values ('TR003', 'CU002', 'ST007', '2020-01-09')
insert into TrTransactionHeader values ('TR004', 'CU005', 'ST004', '2020-01-03')
insert into TrTransactionHeader values ('TR005', 'CU007', 'ST003', '2020-01-09')
insert into TrTransactionHeader values ('TR006', 'CU006', 'ST005', '2020-01-06')
insert into TrTransactionHeader values ('TR007', 'CU003', 'ST002', '2020-01-03')
insert into TrTransactionHeader values ('TR008', 'CU004', 'ST001', '2020-01-07')
insert into TrTransactionHeader values ('TR009', 'CU002', 'ST002', '2020-01-22')
insert into TrTransactionHeader values ('TR010', 'CU005', 'ST003', '2020-01-21')
insert into TrTransactionHeader values ('TR011', 'CU006', 'ST006', '2020-01-16')
insert into TrTransactionHeader values ('TR012', 'CU004', 'ST005', '2020-01-18')
insert into TrTransactionHeader values ('TR013', 'CU007', 'ST004', '2020-01-19')
insert into TrTransactionHeader values ('TR014', 'CU002', 'ST007', '2020-01-14')
insert into TrTransactionHeader values ('TR015', 'CU003', 'ST003', '2020-01-26')
insert into TrTransactionHeader values ('TR016', 'CU004', 'ST004', '2020-01-23')
insert into TrTransactionHeader values ('TR017', 'CU001', 'ST002', '2020-01-25')
insert into TrTransactionHeader values ('TR018', 'CU005', 'ST005', '2020-01-26')
insert into TrTransactionHeader values ('TR019', 'CU004', 'ST001', '2020-01-02')
insert into TrTransactionHeader values ('TR020', 'CU006', 'ST002', '2020-01-07')

insert into TrTransactionDetail values ('TR014', 'FR006', 16)
insert into TrTransactionDetail values ('TR020', 'FR005', 23)
insert into TrTransactionDetail values ('TR003', 'FR004', 25)
insert into TrTransactionDetail values ('TR010', 'FR009', 17)
insert into TrTransactionDetail values ('TR005', 'FR012', 28)
insert into TrTransactionDetail values ('TR011', 'FR010', 23)
insert into TrTransactionDetail values ('TR006', 'FR014', 14)
insert into TrTransactionDetail values ('TR008', 'FR011', 12)
insert into TrTransactionDetail values ('TR014', 'FR016', 15)
insert into TrTransactionDetail values ('TR003', 'FR012', 16)
insert into TrTransactionDetail values ('TR015', 'FR017', 10)
insert into TrTransactionDetail values ('TR009', 'FR018', 25)
insert into TrTransactionDetail values ('TR002', 'FR002', 23)
insert into TrTransactionDetail values ('TR004', 'FR003', 27)
insert into TrTransactionDetail values ('TR012', 'FR013', 18)
insert into TrTransactionDetail values ('TR001', 'FR020', 15)
insert into TrTransactionDetail values ('TR004', 'FR021', 13)
insert into TrTransactionDetail values ('TR007', 'FR016', 25)
insert into TrTransactionDetail values ('TR002', 'FR007', 13)
insert into TrTransactionDetail values ('TR016', 'FR015', 26)
insert into TrTransactionDetail values ('TR013', 'FR010', 18)
insert into TrTransactionDetail values ('TR010', 'FR018', 22)
insert into TrTransactionDetail values ('TR017', 'FR017', 5)
insert into TrTransactionDetail values ('TR017', 'FR002', 34)
insert into TrTransactionDetail values ('TR015', 'FR008', 7)
insert into TrTransactionDetail values ('TR009', 'FR001', 9)
insert into TrTransactionDetail values ('TR011', 'FR020', 12)
insert into TrTransactionDetail values ('TR003', 'FR015', 13)
insert into TrTransactionDetail values ('TR019', 'FR019', 15)
insert into TrTransactionDetail values ('TR018', 'FR021', 12)
insert into TrTransactionDetail values ('TR007', 'FR009', 23)
insert into TrTransactionDetail values ('TR018', 'FR011', 15)
insert into TrTransactionDetail values ('TR012', 'FR010', 6)
insert into TrTransactionDetail values ('TR005', 'FR013', 7)
insert into TrTransactionDetail values ('TR001', 'FR001', 8)
insert into TrTransactionDetail values ('TR013', 'FR005', 3)
insert into TrTransactionDetail values ('TR019', 'FR003', 1)
insert into TrTransactionDetail values ('TR008', 'FR005', 14)
insert into TrTransactionDetail values ('TR020', 'FR001', 16)
insert into TrTransactionDetail values ('TR016', 'FR019', 8)
insert into TrTransactionDetail values ('TR014', 'FR005', 7)
insert into TrTransactionDetail values ('TR015', 'FR006', 9)
insert into TrTransactionDetail values ('TR001', 'FR007', 6)
insert into TrTransactionDetail values ('TR004', 'FR016', 4)
insert into TrTransactionDetail values ('TR006', 'FR004', 3)
insert into TrTransactionDetail values ('TR007', 'FR007', 4)
insert into TrTransactionDetail values ('TR016', 'FR014', 2)
insert into TrTransactionDetail values ('TR010', 'FR008', 15)
insert into TrTransactionDetail values ('TR017', 'FR009', 16)
insert into TrTransactionDetail values ('TR017', 'FR010', 4)
insert into TrTransactionDetail values ('TR011', 'FR016', 7)
insert into TrTransactionDetail values ('TR009', 'FR010', 9)
insert into TrTransactionDetail values ('TR009', 'FR017', 14)
insert into TrTransactionDetail values ('TR016', 'FR021', 2)


--[1]
/*
1.	Display CustomerName, CustomerEmail, and CustomerAddress for 
every customer whose name consist of 3 words.
(like)
*/
SELECT      CustomerName,
            CustomerEmail,
            CustomerAddress
FROM        MsCustomer
WHERE       CustomerName LIKE '% % %'

--[2]
/*
2. Display CustomerName and TransactionDate for every 
transaction that occurs in 'Tuesday'.
(join, datename, weekday)
*/
SELECT      CustomerName,
            TransactionDate
FROM        MsCustomer c
            JOIN TrTransactionHeader th ON c.CustomerId = th.CustomerId
WHERE       DATENAME(WEEKDAY, TransactionDate) = 'Tuesday'

--[3]
/*
3.	Display CustomerId, CustomerName, and 
TotalPurchase (obtained from total transaction 
of each customer ended with ' transaction(s)') 
for every customer whose ID is an odd number.
(count, join, cast, right, group by)
*/
SELECT      c.CustomerId,
            CustomerName,
            [TotalPurchase] = CAST(COUNT(th.TransactionId) AS VARCHAR) + ' transaction(s)'
FROM        MsCustomer c
            JOIN TrTransactionHeader th ON c.CustomerId = th.CustomerId

    
WHERE       RIGHT(c.CustomerId, 1) % 2 = 1
GROUP BY    c.CustomerId,
            CustomerName

--[4]
/*

*/
SELECT      c.CustomerId,
            [CustomerName] = LEFT(CustomerName, CHARINDEX(' ', CustomerName)),
            [StaffName] = LEFT(StaffName, CHARINDEX(' ', StaffName)),
            [TotalFruitPurchased] = SUM(Quantity),
            [TotalTransaction] = COUNT(th.TransactionId)
FROM        MsCustomer c
            JOIN TrTransactionHeader th ON c.CustomerId = th.CustomerId
            JOIN MsStaff ms ON th.StaffId = ms.StaffId
            JOIN    TrTransactionDetail ttd ON th.TransactionId = ttd.TransactionId
WHERE       StaffGender = 'Male' AND
            CustomerGender = 'Female'
GROUP BY    c.CustomerId, CustomerName, StaffName
UNION
SELECT      c.CustomerId,
            [CustomerName] = LEFT(CustomerName, CHARINDEX(' ', CustomerName)),
            [StaffName] = LEFT(StaffName, CHARINDEX(' ', StaffName)),
            [TotalFruitPurchased] = SUM(Quantity),
            [TotalTransaction] = COUNT(th.TransactionId)
FROM        MsCustomer c
            JOIN TrTransactionHeader th ON c.CustomerId = th.CustomerId
            JOIN MsStaff ms ON th.StaffId = ms.StaffId
            JOIN    TrTransactionDetail ttd ON th.TransactionId = ttd.TransactionId
WHERE       StaffGender = 'Female' AND
            CustomerGender = 'Male'
GROUP BY    c.CustomerId, CustomerName, StaffName

--[5]
/*
5.	Display TransactionId, FruitName, FruitPrice 
(obtained from FruitPrice starts with 'Rp. ' and ends with ',-'), 
TransactionDate (obtained from TransactionDate with format 'dd mon yyyy') 
for every transaction which quantity is more than 25 and occurs after the 
10th day of the month.
(in, day, convert)

*/
SELECT      th.TransactionId,
            FruitName,
            FruitPrice = CONCAT('Rp. ',FruitPrice,',-'),
            TransactionDate = CONVERT(VARCHAR, TransactionDate, 106)
FROM        TrTransactionHeader th,
            MsFruit mf,
            TrTransactionDetail td
WHERE       th.TransactionId = td.TransactionId AND
            td.FruitId = mf.FruitId AND
            td.Quantity > 25 AND
            DAY(TransactionDate) > 10

--[6]
/*
6.	Display StaffName, StaffEmail (obtained from StaffEmail 
and replace '@gmail.com' with '@lilfur.com'), StaffGender 
(obtained from the first letter of StaffGender), and 
StaffSalary (obtained from StaffSalary starts with 'Rp. ') 
for every staff whose salary less than or equals to the average 
of all staff's salary.
(replace, left, cast, alias subquery, avg)
*/

SELECT  StaffName,
        StaffEmail,
        StaffGender,
        StaffSalary
FROM    (SELECT StaffName,
                [StaffEmail] = REPLACE(StaffEmail, '@gmail.com', '@lifur.com'),
                [StaffGender] = LEFT(StaffGender, 1),
                [StaffAvg] = AVG(StaffSalary),
                [StaffSalary] = 'Rp. ' + CAST(StaffSalary AS VARCHAR)
         FROM    MsStaff
         GROUP BY  StaffName, StaffEmail, StaffGender, StaffSalary) AS ST
WHERE    StaffSalary <= StaffAvg

--atau

SELECT  StaffName,
        StaffEmail = REPLACE(StaffEmail, '@gmail.com', '@lifur.com'),
        StaffGender = LEFT(StaffGender, 1),
        StaffSalary
FROM    MsStaff


--[7]
/*
7.	Create a view named 'WeekendTransaction' to show 
CustomerName and TransactionDate (obtained from TransactionDate 
with format 'dd/mm/yyyy') for each transaction that occurs in Sunday.
(create view, datename, weekday, convert)
*/
SELECT      CustomerName,
            TransactionDate = CONVERT(VARCHAR, TransactionDate, 103)
FROM        TrTransactionHeader th,
            MsCustomer c
WHERE       c.CustomerId = th.CustomerId AND
            DATENAME(WEEKDAY, TransactionDate) = 'Sunday'

--[8]
/*
8.	Create a view named TransactionReport to show TransactionId, 
TransactionDate (obtained from TransactionDate with format 'Mon dd, yyyy'), 
TransactionDay (obtained from TransactionDate's weekday name), 
and TotalProfit (obtained from the sum of all the profits in each day, 
starts with 'Rp. ').
(convert, datename, weekday, sum)
*/
SELECT      th.TransactionId,
            TransactionDate = CONVERT(VARCHAR, TransactionDate, 107),
            [TransactionDay] = DATENAME(WEEKDAY,TransactionDate),
            [TotalProfit] = 'Rp. ' + CAST(SUM(FruitPrice*td.Quantity) AS varchar)
FROM        TrTransactionHeader th,
            MsCustomer c,
            MsFruit mf,
            TrTransactionDetail td
WHERE       c.CustomerId = th.CustomerId AND
            th.TransactionId = td.TransactionId AND
            td.FruitId = mf.FruitId
GROUP BY    th.TransactionId,
            TransactionDate

--[9]
/*
9.	Add a column named FruitCategory on MsFruit table 
with varchar(20) data type then add a constraint named 
FruitValidation to check the FruitCategory must be either 
'Small Fruit' or 'Big Fruit'.
(alter table, add, add constraint)
*/
ALTER TABLE     MsFruit
ADD             FruitCategory VARCHAR(20);

ALTER TABLE     MsFruit
ADD CONSTRAINT  FruitValidation 
                CHECK(FruitCategory LIKE 'Small Fruit' AND 
                FruitCategory LIKE 'Big Fruit')

--[10]
/*
10.	Update StaffEmail to 'lilfruit@gmail.com' 
from MsStaff table for every staff who served a 
transaction at Jan 01, 2020 and served a male customer.
(update)
*/
UPDATE      MsStaff
SET         StaffEmail = 'lilfruit@gmail.com'
FROM        MsStaff ms
            JOIN TrTransactionHeader th ON ms.StaffID = th.StaffId
            JOIN MsCustomer c
ON          th.CustomerId = c.CustomerId
WHERE       TransactionDate = '2020-01-01' AND
            CustomerGender LIKE 'Male'      


            
        
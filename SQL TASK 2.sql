create database FinancialDB;
use FinancialDB; 
create table customers(
Customer_id int primary key,
Customer_name varchar(20) not null,
Email varchar(40),
Phone int
);
select*from customers;

create table accounts(
account_id int primary key,
customer_id int,
account_type varchar(40) not null,
balance int,
foreign key(Customer_id)
references customers(Customer_id)
);
select * from accounts;
create table transactions(
transaction_id int,
account_id int,
transaction_date date,
transaction_type varchar(40),
amount int not null,
foreign key (account_id)
references accounts(account_id)
);

alter table Customers add address varchar(40);
select * from Customers;
create table temporary_table (
temporary_id int
);
drop table temporary_table;
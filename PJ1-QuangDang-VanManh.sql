drop database if exists PJ1;

create database PJ1;

use PJ1;

create table Cashiers(
	cashier_id int auto_increment primary key,
    cashier_name varchar(100) not null,
    user_name varchar(100) not null unique,
    user_pass varchar(100) not null,
    telephone varchar(100),
    role int not null default 1
);
drop table Cashiers;

create user if not exists 'vtca'@'localhost' identified by 'vtcacademy';
grant all on PJ1.* to 'vtca'@'localhost';

insert into Cashiers(cashier_name, user_name, user_pass) values
				-- dang123 --
	('QuangDang', 'QuangDang', 'cfeb30b061a4b669fa3a4e9ecd6f3abe');
    
select * from Cashiers;
select * from Cashiers where user_name='QuangDang' and user_pass='cfeb30b061a4b669fa3a4e9ecd6f3abe';

create table Customers(
	customer_id int auto_increment primary key,
    customer_name varchar(100) not null,
    address varchar(100),
    telephone varchar(100) unique
);

create table Invoices(
	invoice_no int auto_increment primary key,
    invoice_status int not null,
    invoice_date datetime not null
); 

create table Items(
	item_id int auto_increment primary key,
    item_name varchar(100) not null,
    manufactory varchar(100) not null,
    item_weight varchar(100),
    item_price varchar(100)
);

create table Category(
	category_id int auto_increment primary key,
    category_name varchar(100)
);

create table InvoiceDetails(
	invoice_no int not null,
	constraint Invoice foreign key(invoice_no)
    references Invoice(invoice_no),
    item_id int not null,
    constraint Items foreign key(item_id)
    references Items(item_id),
    unit_price int not null,
    quanity int not null,
    total int not null
    
);

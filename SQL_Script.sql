create table dhilzer.zipcodes (
  zip number(5) primary key,
  city  varchar2(30),
  State varchar2(20));
  
  CREATE PUBLIC SYNONYM zipcodes
FOR dhilzer.zipcodes;

create table dhilzer.employees (
  eno  varchar2(10) primary key,
  ename  varchar2(30),
  zip  number(5) references zipcodes,
  hire_date date);
  
  CREATE PUBLIC SYNONYM employees
FOR dhilzer.employees;

create table dhilzer.books (
  bno  number(5) primary key,
  bname  varchar2(30),
  qoh  number(5) not null,
  price  dec(6,2) not null);
  
  CREATE PUBLIC SYNONYM books
FOR dhilzer.books;

create table dhilzer.customers (
  cno   number(5) primary key,
  cname  varchar2(30),
  street varchar2(30),
  zip  number(5)  references zipcodes,
  phone  char(12));
  
  CREATE PUBLIC SYNONYM customers
FOR dhilzer.customers;

create table dhilzer.orders (
  ono  number(5)  primary key,
  cno  number(5)  references customers,
  eno  varchar2(10)  references employees,
  received date,
  shipped date
);

CREATE PUBLIC SYNONYM orders
FOR dhilzer.orders;

create table dhilzer.odetails (
  ono  number(5)  references orders,
  bno  number(5)  references books,
  quantity number(10) not null,
  primary key (ono, bno));
  
  CREATE PUBLIC SYNONYM odetails
FOR dhilzer.odetails;

insert into zipcodes values (98225, 'Bellingham', 'WA'); 
insert into zipcodes values (95388, 'Winton', 'CA'); 
insert into zipcodes values (44242, 'Stow', 'OH'); 
insert into zipcodes values (61536, 'Hanna city', 'IL'); 
insert into zipcodes values (01254, 'Richmond', 'MA'); 
insert into zipcodes values (95124, 'San Jose', 'CA'); 
insert into zipcodes values (95382, 'Turlock', 'MA'); 
insert into zipcodes values (95380, 'Turlock', 'CA');

insert into employees values ('P0239400', 'Jones Hoffer',98225, '12-DEC-00'); 
insert into employees values ('P0239401', 'Jeffrey Prescott',95388, '01-JAN-06'); 
insert into employees values ('P0239402', 'Fred NcFaddeb',95124, '01-SEP-08');


insert into books values (10506, 'Accounting 101',200, 129.99); 
insert into books values (10507, 'Management 101',159, 109.99); 
insert into books values (10508, 'Fraud Cases',190, 179.99); 
insert into books values (10509, 'CPA Review',65, 299.99); 
insert into books values (10601, 'Peachtree for Dummies',322, 49.99); 
insert into books values (10701, 'Financial Accounting',129, 164.99); 
insert into books values (10800, 'Managerial Accounting',155, 114.99); 
insert into books values (10900, 'Cost Accounting',122, 119.99); 
insert into books values (10901, 'Intermediate Accounting',123, 164.99); 
insert into books values (10902, 'XBRL in Nutshell',124, 109.99);

insert into customers values (23511, 'Michelle Kuan', '123 Main St.',98225, '360-636-5555'); 
insert into customers values (23512, 'George Myer', '237 Ash Ave.',95124, '312-678-5555'); 
insert into customers values (23513, 'Richard Gold', '111 Inwood St.',95124, '312-883-7337'); 
insert into customers values (23514, 'Robert Smith', '54 Gate Dr.',95388, '206-832-1221'); 
insert into customers values (23515, 'Christopher David', '777 Loto St.',98225, '360-458-9878'); 
insert into customers values (23516, 'Adam Beethoven', '234 Park Rd..',95380, '209-546-7299'); 
insert into customers values (23517, 'Lidwig Bach', '5790 Walnut St.',95382, '209-638-2712');

insert into orders values (1020, 23511, 'P0239400', '02-OCT-13', '04-NOV-15'); 
insert into orders values (1021, 23511, 'P0239400', '15-AUG-14', '04-APR-14'); 
insert into orders values (1022, 23512, 'P0239401', '20-MAR-14', '04-NOV-15'); 
insert into orders (ONO, CNO, ENO, RECEIVED) values (1023, 23513, 'P0239402', '22-SEP-12'); 
insert into orders (ONO, CNO, ENO, RECEIVED) values (1024, 23511, 'P0239400', '18-DEC-13');

insert into odetails values (1020, 10506,1); insert into odetails values (1020, 10507,2); 
insert into odetails values (1020, 10508,2); insert into odetails values (1020, 10509,3); 
insert into odetails values (1021, 10601,4); insert into odetails values (1022, 10601,1); 
insert into odetails values (1022, 10701,2); insert into odetails values (1023, 10800,4); 
insert into odetails values (1023, 10900,1); insert into odetails values (1024, 10900,7);
-- Study Case 5

create table Car(
	CarId int identity(1,1) primary key,

);

create table Customer(
	CustomerId int identity(1,1) primary key,

);

create table WarrantyRegistration(
	CarId int primary key,

);

create table WarrantyClaim(
	ClaimId int identity(1,1) primary key,

);
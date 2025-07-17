-- Study Case 5

create table Customer(
	CustomerId int identity(1,1) primary key,
	CustomerName varchar(50) not null,
	Email varchar(50),
	PhoneNumber varchar(20),
	CustomerAddress text,
);

create table Car(
	VIN int primary key,
	CarType varchar(50) not null,
	CustomerId int,
	foreign key (CustomerId) references Customer(CustomerId)
);

create table WarrantyRegistration(
	WarrantyId int primary key,
	VIN int UNIQUE not null,
	PurchaseDate date not null,
	WarrantyPeriodDays int not null,
	foreign key (VIN) references Car(VIN)

);

create table WarrantyClaim(
	CLaimId int primary key,
	WarrantyId int,
	IssueReported text not null,
	RepairDate date not null,
	ServiceCenter varchar(50) not null,
	RepairCost float not null,
	CostCovered float not null,
	ClaimStatus varchar(10) not null,
	foreign key (WarrantyId) references WarrantyRegistration(WarrantyId)
);
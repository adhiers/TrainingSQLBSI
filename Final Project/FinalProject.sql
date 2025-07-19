--create database FinalProject
--use FinalProject;

create table Customer(
	CustomerId varchar(20) primary key,
	CustomerName varchar(50) not null,
	Email varchar(50),
	PhoneNumber varchar(20),
	IdCardNumber varchar(20),
);

create table Dealer(
	DealerId varchar(20) primary key,
	DealerName varchar(50) not null,
	DealerAddress varchar(50) not null,
	City varchar(50) not null,
	Province varchar(50) not null,
	TaxRate int not null
);

create table Car(
	CarId varchar(20) primary key,
	VIN varchar(30) unique not null,
	ModelType varchar(20) not null,
	FuelType varchar(30) not null,
	BasePrice float not null,
);

create table SalesPerson(
	SalesPersonId varchar(20) primary key,
	SalesName varchar(50) not null,
	DealerId varchar(20),
	BirthDate date not null,
	HireDate date not null,
	Email varchar(50) not null,
	PhoneNumber varchar(50) not null,
	foreign key (DealerId) references Dealer(DealerId)
);

create table DealerCarList(
	DealerCarId varchar(20) primary key,
	CarId varchar(20),
	DealerId varchar(20),
	DealerCarPrice float not null,
	foreign key (CarId) references Car(CarId),
	foreign key (DealerId) references Dealer(DealerId)
)

create table ConsultHistory(
	ConsultId varchar(20) primary key,
	CustomerId varchar(20) not null,
	SalesPersonId varchar(20) not null,
	Budget float not null,
	ConsultDate date not null,
	Note text,
	foreign key (CustomerId) references Customer(CustomerId),
	foreign key (SalesPersonId) references SalesPerson(SalesPersonId),
);

create table TestDriveNego(
	TDNId varchar(20) primary key,
	ConsultId varchar(20),
	DealerCarId varchar(20) not null,
	DealerId varchar(20) not null,
	CustomerId varchar(20) not null,
	SalesPersonId varchar(20) not null,
	Note text,
	TDNDate date not null,
	foreign key (CustomerId) references Customer(CustomerId),
	foreign key (DealerId) references Dealer(DealerId),
	foreign key (SalesPersonId) references SalesPerson(SalesPersonId),
	foreign key (DealerCarId) references DealerCarList(DealerCarId)
);

create table LetterOfIntent(
	LOIId varchar(20) primary key,
	NegoPrice float not null,
	DealerCarId varchar(20),
	Discount float,
	BookingFee float,
	PaymentMethod varchar(20),
	foreign key (DealerCarId) references DealerCarList(DealerCarId)
);

create table Credit(
	CreditId varchar(20) primary key,
	CustomerId varchar(20) not null,
	NominalKredit float not null,
	StartDate date not null,
	EndDate date not null,
	Bunga float not null,
	MonthlyPayment float not null,
	StatusCredit varchar(10) not null,
	foreign key (CustomerId) references Customer(CustomerId),
);

create table Agreement(
	AgreementId varchar(20) primary key,
	CustomerId varchar(20) not null,
	SalesPersonId varchar(20) not null,
	CreditId varchar(20) unique,
	DealerCarId varchar(20) not null,
 	LOIId varchar(20) unique not null,
	MethodPayment varchar(10) not null,
	AgreementDate date not null,
	foreign key (CustomerId) references Customer(CustomerId),
	foreign key (CreditId) references Credit(CreditId),
	foreign key (LOIId) references LetterOfIntent(LOIId),
	foreign key (SalesPersonId) references SalesPerson(SalesPersonId),
	foreign key (DealerCarId) references DealerCarList(DealerCarId),
);

create table PaymentHistory(
	PaymentId varchar(20) primary key,
	AgreementId varchar(20) not null,
	Nominal float not null,
	PaymentLeft float,
	PaymentDate date not null,
	foreign key (AgreementId) references Agreement(AgreementId)
);

create table OtherBenefit(
	AgreementId varchar(20) primary key,
	Benefit text,
	foreign key (AgreementId) references Agreement(AgreementId)
);

create table Warranty(
	WarrantyId varchar(20) primary key,
	AgreementId varchar(20) unique,
	WarrantyPeriodDays int not null,
	foreign key (AgreementId) references Agreement(AgreementId)
);

create table WarrantyClaim(
	ClaimId varchar(20) primary key,
	WarrantyId varchar(20) not null,
	ServiceCenter varchar(50) not null,
	ServiceDate date not null,
	ServiceCost float not null,
	Note text not null,
	foreign key (WarrantyId) references Warranty(WarrantyId)
)

--drop table Warranty;
--drop table WarrantyClaim;
--drop table OtherBenefit;
--drop table PaymentHistory;
--drop table Credit;
--drop table Agreement;
--drop table LetterOfIntent;
--drop table TestDriveNego;
--drop table ConsultHistory;
--drop table DealerCarList;
--drop table SalesPerson;
--drop table Car;
--drop table Dealer;
--drop table Customer;
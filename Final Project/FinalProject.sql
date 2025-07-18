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
	Province varchar(50) not null
);

create table Car(
	CarId varchar(20) primary key,
	CarType varchar(50) not null,
	VIN varchar(30) unique not null,
	FuelType varchar(30) not null,
	DealerId varchar(20) not null,
	BasePrice float not null,
	foreign key (DealerId) references Dealer(DealerId)
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

create table ConsultHistory(
	ConsultId varchar(20) primary key,
	CustomerId varchar(20) not null,
	DealerId varchar(20) not null,
	SalesPersonId varchar(20) not null,
	CarId varchar(20) not null,
	Budget float not null,
	ConsultDate date not null,
	Note text,
	foreign key (CustomerId) references Customer(CustomerId),
	foreign key (DealerId) references Dealer(DealerId),
	foreign key (SalesPersonId) references SalesPerson(SalesPersonId),
	foreign key (CarId) references Car(CarId)
);

create table TestDriveNego(
	TDNId varchar(20) primary key,
	ConsultId varchar(20),
	CarId varchar(20) not null,
	DealerId varchar(20) not null,
	CustomerId varchar(20) not null,
	SalesPersonId varchar(20) not null,
	Note text,
	TDNDate date not null
	foreign key (CustomerId) references Customer(CustomerId),
	foreign key (DealerId) references Dealer(DealerId),
	foreign key (SalesPersonId) references SalesPerson(SalesPersonId),
	foreign key (CarId) references Car(CarId)
);

create table LOI(
	LOIId varchar(20) primary key,
	NegoPrice float not null,
	Discount float,
	BookingFee float,
);

create table Agreement(
	AgreementId varchar(20) primary key,
	CustomerId varchar(20) not null,
	SalesPersonId varchar(20) not null,
	CarId varchar(20) not null,
 	LOIId varchar(20) unique not null,
	MethodPayment varchar(10) not null,
	AgreementDate date not null,
	foreign key (CustomerId) references Customer(CustomerId),
	foreign key (LOIId) references LOI(LOIId),
	foreign key (SalesPersonId) references SalesPerson(SalesPersonId),
	foreign key (CarId) references Car(CarId),
);

create table Credit(
	CreditId varchar(20) primary key,
	AgreementId varchar(20) not null,
	CustomerId varchar(20) not null,
	NominalKredit float not null,
	StartDate date not null,
	EndDate date not null,
	Bunga float not null,
	CicilanPerbulan float not null,
	StatusCredit varchar(10) not null,
	foreign key (CustomerId) references Customer(CustomerId),
	foreign key (AgreementId) references Agreement(AgreementId)
);

create table PaymentHistory(
	PaymentId varchar(20) primary key,
	CreditId varchar(20),
	AgreementId varchar(20) not null,
	Nominal float not null,
	PaymentLeft float,
	PaymentDate date not null,
	foreign key (CreditId) references Credit(CreditId),
	foreign key (AgreementId) references Agreement(AgreementId)
);

create table OtherBenefit(
	PaymentId varchar(20) primary key,
	Benefit text,
	foreign key (PaymentId) references PaymentHistory(PaymentId)
);

create table Warranty(
	WarrantyId varchar(20) primary key,
	CarId varchar(20) unique,
	WarrantyPeriodDays int not null,
	Note text,
	foreign key (CarId) references Car(CarId)
);

drop table Warranty;
drop table OtherBenefit;
drop table PaymentHistory;
drop table Credit;
drop table Agreement;
drop table LOI;
drop table TestDriveNego;
drop table ConsultHistory;
drop table SalesPerson;
drop table Car;
drop table Dealer;
drop table Customer;
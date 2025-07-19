create database FinalProject
use FinalProject;

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
);


-- Customer
INSERT INTO Customer VALUES ('CUST001', 'Ahmad Nugraha', 'ahmad.nugraha@mail.com', '081234567890', 'ID1234567890');
INSERT INTO Customer VALUES ('CUST002', 'Budi Santoso', 'budi.s@mail.com', '081298765432', 'ID0987654321');
INSERT INTO Customer VALUES ('CUST003', 'Citra Dewi', 'citra.dewi@mail.com', NULL, NULL);
INSERT INTO Customer VALUES ('CUST004', 'Dedi Pratama', 'dedi.pratama@mail.com', '081345678912', 'ID5566778899');
INSERT INTO Customer VALUES ('CUST005', 'Eka Wulandari', 'eka.wulandari@mail.com', '082145679001', 'ID6677889900');

-- Dealer
INSERT INTO Dealer VALUES ('DLR001', 'Auto Prima', 'Jl. Sudirman No.1', 'Jakarta', 'DKI Jakarta', 10);
INSERT INTO Dealer VALUES ('DLR002', 'Mega Mobil', 'Jl. Gatot Subroto No.12', 'Bandung', 'Jawa Barat', 12);
INSERT INTO Dealer VALUES ('DLR003', 'Surya Motor', 'Jl. Ahmad Yani No.5', 'Surabaya', 'Jawa Timur', 8);
INSERT INTO Dealer VALUES ('DLR004', 'Cahaya Mobil', 'Jl. Malioboro No.3', 'Yogyakarta', 'DI Yogyakarta', 11);
INSERT INTO Dealer VALUES ('DLR005', 'Bintang Auto', 'Jl. Diponegoro No.10', 'Medan', 'Sumatera Utara', 9);

-- Car
INSERT INTO Car VALUES ('CAR001', 'VIN001ABC', 'Xpander', 'Bensin', 350000000);
INSERT INTO Car VALUES ('CAR002', 'VIN002DEF', 'Pajero Sport', 'Diesel', 400000000);
INSERT INTO Car VALUES ('CAR003', 'VIN003GHI', 'L100', 'Listrik', 300000000);
INSERT INTO Car VALUES ('CAR004', 'VIN004JKL', 'Outlander PHEV', 'Hybrid', 370000000);
INSERT INTO Car VALUES ('CAR005', 'VIN005MNO', 'Triton', 'Diesel', 330000000);

-- SalesPerson
INSERT INTO SalesPerson VALUES ('SLS001', 'Rina Sari', 'DLR001', '1990-05-01', '2020-01-10', 'rina.sari@dealer.com', '081234111111');
INSERT INTO SalesPerson VALUES ('SLS002', 'Andi Wijaya', 'DLR002', '1988-03-15', '2018-07-12', 'andi.wijaya@dealer.com', '081234222222');
INSERT INTO SalesPerson VALUES ('SLS003', 'Linda Mayasari', 'DLR003', '1992-08-20', '2019-05-21', 'linda.m@dealer.com', '081234333333');
INSERT INTO SalesPerson VALUES ('SLS004', 'Teguh Setiawan', 'DLR004', '1985-11-30', '2017-02-01', 'teguh.s@dealer.com', '081234444444');
INSERT INTO SalesPerson VALUES ('SLS005', 'Sari Puspita', 'DLR005', '1993-07-10', '2021-09-18', 'sari.p@dealer.com', '081234555555');

-- DealerCarList
INSERT INTO DealerCarList VALUES ('DCL001', 'CAR001', 'DLR001', 360000000);
INSERT INTO DealerCarList VALUES ('DCL002', 'CAR002', 'DLR002', 405000000);
INSERT INTO DealerCarList VALUES ('DCL003', 'CAR003', 'DLR003', 315000000);
INSERT INTO DealerCarList VALUES ('DCL004', 'CAR004', 'DLR004', 365000000);
INSERT INTO DealerCarList VALUES ('DCL005', 'CAR005', 'DLR005', 335000000);

-- ConsultHistory
INSERT INTO ConsultHistory VALUES ('CONS001', 'CUST001', 'SLS001', 380000000, '2024-06-01', 'Ingin mobil untuk keluarga');
INSERT INTO ConsultHistory VALUES ('CONS002', 'CUST002', 'SLS002', 410000000, '2024-06-03', 'Ingin mobil untuk perjalanan jauh');
INSERT INTO ConsultHistory VALUES ('CONS003', 'CUST003', 'SLS003', 320000000, '2024-06-05', 'Tertarik untuk mencoba mobil listrik');
INSERT INTO ConsultHistory VALUES ('CONS004', 'CUST004', 'SLS004', 360000000, '2024-06-07', 'Mobil hybrid untuk penggunaan dalam kota');
INSERT INTO ConsultHistory VALUES ('CONS005', 'CUST005', 'SLS005', 350000000, '2024-06-10', 'Ingin mobil besar');

-- TestDriveNego
INSERT INTO TestDriveNego VALUES ('TDN001', 'CONS001', 'DCL001', 'DLR001', 'CUST001', 'SLS001', 'Test drive berjalan lancar', '2024-06-02');
INSERT INTO TestDriveNego VALUES ('TDN002', 'CONS002', 'DCL002', 'DLR002', 'CUST002', 'SLS002', 'Butuh waktu untuk pertimbangan', '2024-06-04');
INSERT INTO TestDriveNego VALUES ('TDN003', 'CONS003', 'DCL003', 'DLR003', 'CUST003', 'SLS003', 'Butuh waktu untuk pertimbangan', '2024-06-06');
INSERT INTO TestDriveNego VALUES ('TDN004', 'CONS004', 'DCL004', 'DLR004', 'CUST004', 'SLS004', 'Tertarik dan lanjut ke LOI', '2024-06-08');
INSERT INTO TestDriveNego VALUES ('TDN005', 'CONS005', 'DCL005', 'DLR005', 'CUST005', 'SLS005', 'Test drive berjalan lancar', '2024-06-11');

-- LetterOfIntent
INSERT INTO LetterOfIntent VALUES ('LOI001', 360000000, 'DCL001', 5000000, 10000000, 'Credit');
INSERT INTO LetterOfIntent VALUES ('LOI002', 405000000, 'DCL002', 15000000, 15000000, 'Cash');
INSERT INTO LetterOfIntent VALUES ('LOI004', 365000000, 'DCL004', 5000000, 20000000, 'Cash');
INSERT INTO LetterOfIntent VALUES ('LOI005', 330000000, 'DCL005', 10000000, 5000000, 'Credit');

-- Credit
INSERT INTO Credit VALUES ('CRD001', 'CUST001', 350000000, '2024-07-01', '2026-07-01', 4.5, 15000000, 'Aktif');
INSERT INTO Credit VALUES ('CRD002', 'CUST005', 320000000, '2024-07-10', '2026-07-10', 4.3, 14000000, 'Aktif');

-- Agreement
INSERT INTO Agreement VALUES ('AG001', 'CUST001', 'SLS001', 'CRD001', 'DCL001', 'LOI001', 'Credit', '2024-07-02');
INSERT INTO Agreement VALUES ('AG002', 'CUST002', 'SLS002', NULL, 'DCL002', 'LOI002', 'Cash', '2024-07-04');
INSERT INTO Agreement VALUES ('AG003', 'CUST004', 'SLS004', NULL, 'DCL004', 'LOI004', 'Cash', '2024-07-08');
INSERT INTO Agreement VALUES ('AG004', 'CUST005', 'SLS005', 'CRD002', 'DCL005', 'LOI005', 'Credit', '2024-07-11');

-- PaymentHistory
INSERT INTO PaymentHistory VALUES ('PAY001', 'AG001', 10000000, 340000000, '2024-07-03');
INSERT INTO PaymentHistory VALUES ('PAY002', 'AG002', 420000000, 0, '2024-07-05');
INSERT INTO PaymentHistory VALUES ('PAY004', 'AG004', 370000000, 0, '2024-07-09');
INSERT INTO PaymentHistory VALUES ('PAY005', 'AG005', 10000000, 310000000, '2024-07-12');

-- OtherBenefit
INSERT INTO OtherBenefit VALUES ('AG001', 'Extended warranty menjadi 2 tahun');
INSERT INTO OtherBenefit VALUES ('AG002', 'Cashback Rp5 juta');
INSERT INTO OtherBenefit VALUES ('AG004', 'Free upgrade velg');
INSERT INTO OtherBenefit VALUES ('AG005', 'Extended warranty menjadi 2 tahun');

-- Warranty
INSERT INTO Warranty VALUES ('WRT001', 'AG001', 730);
INSERT INTO Warranty VALUES ('WRT002', 'AG002', 365);
INSERT INTO Warranty VALUES ('WRT004', 'AG004', 365);
INSERT INTO Warranty VALUES ('WRT005', 'AG005', 730);

-- WarrantyClaim
INSERT INTO WarrantyClaim VALUES ('CLM001', 'WRT001', 'Bengkel Resmi Jakarta', '2025-01-15', 1500000, 'Ganti kampas rem depan');
INSERT INTO WarrantyClaim VALUES ('CLM003', 'WRT004', 'Semarang Motor Service', '2025-03-05', 500000, 'Cek sistem audio');


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


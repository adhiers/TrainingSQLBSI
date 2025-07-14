-- select db
use master
go

use TrainingDB
go

--create db
create database Demo01
go

create database Demo02
go
create database Demo03
go

-- delete db
drop database Demo01
go

drop database if exists Demo01
go

------ sys.databases
select name from sys.databases

if not exists(select name from sys.databases where name='Demo01')
begin
	create database Demo01;
end

-- go ;

-----------------------------
use TrainingDB
go

create table Customer(
-- nama-kolom tipe-data attribute
	Id int identity(1,1) primary key, -- (1,1) start 1 increment 1
	Name varchar(50) not null,
	Email varchar(30)
)
go

use Exercise1
go

-- study case 1
create table Plant(
-- nama-kolom tipe-data attribute
	PlantId int identity(1,1) primary key, -- (1,1) start 1 increment 1
	PlantName varchar(50) not null,
	City varchar(20) not null,
	Country varchar(20) not null,
	Continent varchar(10) not null,
	TotalArea int not null,
	YearStartOperation varchar(4) not null,
)
go

-- study case 2
create table CarModel(
-- nama-kolom tipe-data attribute
	ModelId int identity(1,1) primary key, -- (1,1) start 1 increment 1
	ModelName varchar(30) not null,
	ModelType varchar(10) not null,
	ModelCategory varchar(10) not null,
	EngineCapacity int not null,
	FuelType varchar(10) not null,
	LaunchYear varchar(4) not null
)
go

-- study case 3
create table ProductionPlan(
-- nama-kolom tipe-data attribute
	ProductionId int identity(1,1) primary key, -- (1,1) start 1 increment 1
	PlanName varchar(30) not null,
	ProductionMonth varchar(10) not null,
	ProductionYear varchar(4) not null,
	TargetUnit int not null,
	Notes varchar(60) not null
)
go

-- study case 4
create table Dealer(
-- nama-kolom tipe-data attribute
	DealerId int identity(1,1) primary key, -- (1,1) start 1 increment 1
	DealerName varchar(30) not null,
	DealerCity varchar(20) not null,
	DealerProvince varchar(20) not null,
	PhoneNumber varchar(20) not null,
	YearStartOperation varchar(4) not null
)
go

-- study case 5
create table CarSale(
-- nama-kolom tipe-data attribute
	SaleId int identity(1,1) primary key, -- (1,1) start 1 increment 1
	BuyerName varchar(30) not null,
	DateSale date not null,
	SalePrice float not null,
	MethodSale varchar(10) not null,
)
go

-- study case 6
create table MaintenanceLog(
-- nama-kolom tipe-data attribute
	CustomerId int identity(1,1) primary key, -- (1,1) start 1 increment 1
	CustomerName varchar(30) not null,
	CarModel varchar(20) not null,
	ServiceDate Date not null,
	ServiceType varchar(30) not null,
	ServiceCenter varchar(30) not null
)
go

-- study case 7
create table PartInventory(
-- nama-kolom tipe-data attribute
	PartId int identity(1,1) primary key, -- (1,1) start 1 increment 1
	PartName varchar(30) not null,
	PartNumber varchar(10) not null,
	PartCategory varchar(20) not null,
	Stock int not null,
	UnitPrice float not null,
	PartActive BIT not null
)
go

-- study case 8
create table CustomerFeedback(
-- nama-kolom tipe-data attribute
	CustomerId int identity(1,1) primary key, -- (1,1) start 1 increment 1
	CustomerName varchar(30) not null,
	CarModel varchar(10) not null,
	FeedbackDate date not null,
	Rating varchar(1) not null,
	Comments Varchar(50) not null
)
go
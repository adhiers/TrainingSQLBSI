-- Section 4

create table RentalBranch(
	BranchId int identity(1,1) primary key,
	EmployeeId int,
	BranchName varchar(50) not null,
	City varchar(50) not null,
	Province varchar(50) not null,
);

create table Vehicle(
	VehicleId int identity(1,1) primary key,
	VehicleName varchar(50) not null,
	VehicleType varchar(50) not null,
	VehicleStatus varchar(50) not null,
	RentalHistory varchar(50) not null,
	Mileage varchar(50) not null,
	BranchId int,
	foreign key (BranchId) references RentalBranch(BranchId),

);

create table Employee(
	EmployeeId int identity(1,1) primary key,
	EmployeeName varchar(50) not null,
	BirthDate date not null,
	HireDate date not null,
	Email varchar(50) not null,
	PhoneNumber varchar(50) not null,
	BranchId int,
	foreign key (BranchId) references RentalBranch(BranchId)

);

create table Customer(
	CustomerId int identity(1,1) primary key,
	CustomerName varchar(50) not null,
	Email varchar(50) not null,
	PhoneNumber varchar(50) not null,
);

create table RentalContract(
	ContractId int identity(1,1) primary key,
	StartDate date not null,
	EndDate date not null,
	TotalDays int not null,
	DailyRate float not null,
	CustomerId int,
	VehicleId int,
	EmployeeId int,
	foreign key (VehicleId) references Vehicle(VehicleId),
	foreign key (EmployeeId) references Employee(EmployeeId),
	foreign key (CustomerId) references Customer(CustomerId)
);
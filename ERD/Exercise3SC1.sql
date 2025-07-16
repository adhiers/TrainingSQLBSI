-- Study Case 1

create table CarModel (
    ModelId int identity(1,1) primary key,
	ModelName varchar(30) not null,
	ModelType varchar(10) not null,
    BuildDate datetime not null,
    FuelType float not null
)

create table PrototypeVehicle(
    PrototypeId int identity(1,1) primary key,
    PrototypeName varchar(50) not null,
    ModelId int not null,
    FOREIGN KEY (ModelId) REFERENCES CarModel(ModelId)
)

create table TestEngineer(
    EngineerId int identity(1,1) primary key,
    EngineerName varchar(50) not null,
    Email varchar(50) not null,
    PhoneNumber varchar(20) not null,
    HireDate datetime not null,
    BirthDate date not null
)

create table TestLocation(
    LocationId int identity(1,1) primary key,
    LocationName varchar(50) not null,
    City varchar(50),
    Province varchar(50),
    TotalArea float not null,
)

create table VehicleTest(
    TestId int identity(1,1) primary key,
    LocationId int not null,
    EngineerId int not null,
    PrototypeId int not null,
    TestDate datetime not null,
    TestType varchar(30) not null,
    TestResult text not null,
    foreign key (LocationId) references TestLocation(LocationId),
    foreign key (EngineerId) references TestEngineer(EngineerId),
    foreign key (PrototypeId) references PrototypeVehicle(PrototypeId)
)
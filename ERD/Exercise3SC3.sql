-- Study Case 3

create table PartCategory(
    CategoryId int identity(1,1) primary key,
    CategoryName varchar(50) not null,
)

create table Part(
    PartId int identity(1,1) primary key,
    CategoryId int,
    PartName varchar(50) not null,
    foreign key (CategoryId) references PartCategory(CategoryId)
)

create table Supplier(
    SupplierId int identity(1,1) primary key,
    SupplierName varchar(50) not null
)

create table SupplierPartOffer(
    SupplierId int,
    PartId int,
    UnitPrice float not null,
    LeadTimeDays int not null,
    Rating smallint not null,
    primary key (SupplierId, PartId),
    foreign key (SupplierId) references Supplier(SupplierId),
    foreign key (PartId) references Part(PartId)
)
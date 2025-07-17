-- Study Case 6

create table CarModel(
	ModelId int identity(1,1) primary key,
	ModelType varchar(50) not null,
	FuelType varchar(50) not null,
);

create table Dealer(
	DealerId int identity(1,1) primary key,
	DealerName varchar(50) not null,
	HireDate date not null,
	BirthDate date not null,
);

create table PromotionCampaign(
	CampaignId int identity(1,1) primary key,
	ModelId int,
	DealerId int,
	BenefitId int,
	StartDate date not null,
	EndDate date not null,
	DiscPercent smallint,
	MarketingRegion varchar(50) not null
	foreign key (ModelId) references CarModel(ModelId),
	foreign key (DealerId) references Dealer(DealerId),
);

create table CustomerBenefit(
	BenefitId int primary key,
	CampaignId int,
	Benefit text not null,
	foreign key (CampaignId) references PromotionCampaign(CampaignId)
);


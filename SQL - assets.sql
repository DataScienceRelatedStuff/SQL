DROP DATABASE db_assets;
CREATE DATABASE db_assets;

USE db_assets;

CREATE TABLE IF NOT EXISTS
db_assets.TypeProviders (
	TypeProviders varchar(15) not null,
    Comments text,
    Validtill date,
    DateStamp date
    );

/*
ALTER TABLE db_assets.TypeProviders
	ADD PRIMARY KEY (TypeProviders);
*/

CREATE UNIQUE INDEX TypeProviders_index
ON db_assets.TypeProviders ( TypeProviders, Validtill);

SHOW INDEXES FROM db_assets.TypeProviders;


CREATE TABLE IF NOT EXISTS
db_assets.TypeProducts (
	TypeProducts varchar(15) not null,
    Comments text,
    Validtill date,
    DateStamp date
    );

ALTER TABLE db_assets.TypeProducts
	ADD PRIMARY KEY (TypeProducts);


CREATE TABLE IF NOT EXISTS
db_assets.TypeAccounts(
    TypeAccounts varchar(15) not null,
	Comments text,
    Validtill date,
    DateStamp date
    );

ALTER TABLE db_assets.TypeAccounts
	ADD PRIMARY KEY (TypeAccounts);


CREATE TABLE IF NOT EXISTS
db_assets.Providers(
	Providers varchar(20) not null,
    TypeProviders varchar(15),
    Addresses text,
    BICCodes varchar(15),
    Comments text,
    Validtill date,
    DateStamp date,
    FOREIGN KEY(TypeProviders) REFERENCES TypeProviders(TypeProviders)
    );
    
ALTER TABLE db_assets.Providers
	ADD PRIMARY KEY (Providers);

   
CREATE TABLE IF NOT EXISTS
db_assets.Accounts(
	Accounts varchar(20) not null,
    TypeAccounts varchar(20) not null,
    Providers varchar(20) not null,
    NameAccounts varchar(20) not null,
    Properties varchar(20) not null,
    Currencies varchar(5) not null,
    Comments text,
    Validtill date,
    DateStamp date,
    FOREIGN KEY(TypeAccounts) REFERENCES TypeAccounts(TypeAccounts)
    );

ALTER TABLE db_assets.Accounts
	ADD PRIMARY KEY (Accounts);


CREATE TABLE IF NOT EXISTS
db_assets.Loans(
	Loans varchar(20) not null,
    Providers varchar(20) not null,
    Comments text,
    Validtill date,
    DateStamp date,
    FOREIGN KEY(Providers) REFERENCES Providers(Providers)
    );

ALTER TABLE db_assets.Loans
	ADD PRIMARY KEY (Loans);


CREATE TABLE IF NOT EXISTS
db_assets.Estates(
    Estates varchar(20) not null,
	TypeProducts varchar(20) not null,
	Addresses text,
	EstateStartDates date,
    EstateEndDates date,
    Comments text,
    Validtill date,
    DateStamp date,
    FOREIGN KEY(TypeProducts) REFERENCES TypeProducts(TypeProducts)
    );

ALTER TABLE db_assets.Estates
	ADD PRIMARY KEY (Estates);


CREATE TABLE IF NOT EXISTS
db_assets.HousingUnits(
	HousingUnits varchar(20) not null,
    Estates varchar(20) not null,
	Addresses text,
	EstateStartDates date,
    EstateEndDates date,
    Comments text,
    Validtill date,
    DateStamp date,
    FOREIGN KEY(Estates) REFERENCES Estates(Estates)
    );

ALTER TABLE db_assets.HousingUnits
	ADD PRIMARY KEY (HousingUnits);


CREATE TABLE IF NOT EXISTS
db_assets.Meters(
	HousingUnits varchar(20) not null,
    Meters varchar(20) not null,
    MetersStartDates date,
    MetersEndDates date,
    Location varchar(25) not null,
	Providers varchar(20) not null,
	Comments text,
    Validtill date,
    DateStamp date,
    FOREIGN KEY(Providers) REFERENCES Providers(Providers)
    );

ALTER TABLE db_assets.Meters
	ADD PRIMARY KEY (HousingUnits, Meters, MetersStartDates);


CREATE TABLE IF NOT EXISTS
db_assets.MeterReadings(
	Meters varchar(20) not null,
    MetersReadingKeys varchar(20) not null,
    MetersReadingDates date,
    MetersReadings decimal(7,2) not null,
	Comments text,
    Validtill date,
    DateStamp date
    /*,
    FOREIGN KEY(Meters) REFERENCES Meters(Meters)*/
    );

ALTER TABLE db_assets.MeterReadings
	ADD PRIMARY KEY (Meters, MetersReadingDates);


CREATE TABLE IF NOT EXISTS
db_assets.AssetReadings(
	Assets varchar(20) not null,
    AssetsReadingKeys varchar(20) not null,
    AssetsReadingDates date,
    AssetsReadings decimal(7,2) not null,
    Comments text,
    Validtill date,
    DateStamp date
    /*,
    FOREIGN KEY(Meters) REFERENCES Meters(Meters)*/
    );

ALTER TABLE db_assets.Assetreadings
	ADD PRIMARY KEY (Assets, ProjectsReadingDates);


/*DESCRIBE TABLES*/
DESCRIBE db_assets.TypeProviders;
DESCRIBE db_assets.TypeProducts;
DESCRIBE db_assets.TypeAccounts;
DESCRIBE db_assets.Providers;
DESCRIBE db_assets.Accounts;
DESCRIBE db_assets.Loans;
DESCRIBE db_assets.Estates;
DESCRIBE db_assets.HousingUnits;
DESCRIBE db_assets.Meters;
DESCRIBE db_assets.MeterReadings;
DESCRIBE db_assets.Assetreadings;
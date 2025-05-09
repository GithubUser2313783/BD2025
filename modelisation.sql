--LAB 8

USE master; 

DROP DATABASE IF EXISTS Lab8;

CREATE DATABASE Lab8;

USE Lab8;

GO

DROP TABLE IF EXISTS tblFrais;
DROP TABLE IF EXISTS tblVendeur;


CREATE TABLE tblVendeur(
	IDVendeur tinyint PRIMARY KEY NOT NULL,
	NomVendeur nvarchar(30) NOT NULL,
	Adresse nvarchar(50),
	Salaire int,
	DateEmbauche date
);

SELECT * FROM tblVendeur;

CREATE TABLE tblFrais(
	IDFrais tinyint PRIMARY KEY NOT NULL,
	Mois nvarchar(6) NOT NULL,
	Endroit nvarchar(30),
	Debut date,
	Fin date,
	IDVendeur tinyint FOREIGN KEY REFERENCES tblVendeur(IDVendeur) 
);


DROP TABLE IF EXISTS tblJobListings;
DROP TABLE IF EXISTS tblCompagnie;

CREATE TABLE tblCompagnie(
	NoEmployeur tinyint PRIMARY KEY NOT NULL,
	Compagnie nvarchar(30),
	Adresse nvarchar(50),
	CodePostal nvarchar(15),
	Ville nvarchar(30),
	Province nvarchar(30),
	Telephone nvarchar(15)
);


CREATE TABLE tblJobListings(
	NoListing tinyint PRIMARY KEY NOT NULL,
	DescriptionPoste nvarchar(30),
	Domaine nvarchar(30),
	SalaireAnnuel money,
	Preference nvarchar(15),
	NoPoste tinyint,
	NoEmployeur tinyint FOREIGN KEY REFERENCES tblCompagnie(NoEmployeur)
);


DROP TABLE IF EXISTS tblSales;
DROP TABLE IF EXISTS tblPaintings;

CREATE TABLE tblPaintings(
	PaintingID tinyint PRIMARY KEY NOT NULL,
	Nom nvarchar(30),
	ArtistID tinyint FOREIGN KEY REFERENCES tblArtists(ArtistID),
	Prix money
);

CREATE TABLE tblSales(
	SaleID tinyint PRIMARY KEY NOT NULL,
	SaleDate date,
	PaintingID tinyint FOREIGN KEY REFERENCES tblPaintings(PaintingID),
	ArtistID tinyint FOREIGN KEY REFERENCES tblArtists(ArtistID),
	CollecteurID tinyint FOREIGN KEY REFERENCES tblCollecteur(CollecteurID),
	SalePrix money
);

DROP TABLE IF EXISTS tblArtists;
DROP TABLE IF EXISTS tblCollecteur;

CREATE TABLE tblCollecteur(
	CollecteurID tinyint PRIMARY KEY NOT NULL,
	Prenom nvarchar(15),
	Nom nvarchar(15)
);

CREATE TABLE tblArtists(
	ArtistID tinyint PRIMARY KEY NOT NULL,
	Prenom nvarchar(15),
	Nom nvarchar(15)
);
-- ==============================================================================
-- Description du cours : Introduction au bases de donn�es
-- Code du cours : 420-212-MV
-- Laboratoire 5
-- Les commandes DDL

-- Objectif : 
-- Ce Laboratoire vise � acqu�rir les comp�tences suivantes
-- ========================================================
-- Les commandes DDL
-- Les commandes DML

-- Cr�ation d'une base de donn�es
-- la commande CREATE DATABASE nomBase
-- S�lection de la base nouvellement cr��e.
-- La commande USE nomBase

USE master;

-- Suppression de la base de donn�es
-- La commande DROP DATATBASE nomBase

DROP DATABASE IF EXISTS Lab5;


-- Requ�te 1
-- �crire un script qui cr�e la base de donn�es Lab5
-- Le nom de la base de donn�es est : Lab5

CREATE DATABASE lab5;

-- Votre code ici
--Contexte master

SELECT DB_NAME() Context;

USE lab5;
SELECT DB_NAME() Context;

-- V�rification de l'existence de la base de donn�es


-- Cr�ation de la base de donn�es


-- Commit en cas d'ex�cution multiple (GO)


-- V�rification du contexte par d�faut


-- Utilisation du contexte NomBaseDonnee

-- V�rification du contexte par d�faut


-- Cr�ation de table par code
-- La commade CREATE nomObjet
-- Cr�ation de la table collection
-- 
-- Cr�er la table collection avec les specs suivantes : 
-- No de la cllection, cl� primaire, valeur unique auto
-- Type de la collection : chaine de caract�re de longueur 15
-- Nom de la collection : chaine de longueur 20, non null
-- Quantit� : entier non nul
-- Date de cr�ation : date du jour

DROP TABLE IF EXISTS tblCollection;
CREATE TABLE tblCollection(
	NoCollection UNIQUEIDENTIFIER PRIMARY KEY NOT NULL DEFAULT NEWID(),
	CollectionType nvarchar(15),
	CollectionName nvarchar(20) NOT NULL,
	CollectionPrice int NOT NULL,
	CollectionDate date DEFAULT GETDATE()
);


-- V�rification de l'existence de la table collection
-- Suppression de la table si elle existe
-- La commande DROP nomObjet



-- V�rification de la cr�ation de la table


-- Modification de la structure de la table collection
-- La commande ALTER

ALTER TABLE tblCollection
	ADD CollectionNotes nvarchar(255);

EXEC sp_help tblCollection;


 -------------------------------------------
 -- Modification de la structure d'une table
 -- en supprimant une colonne
 -- ALTER Table
 -- La commande DROP NomColonne
 --------------------------------------------

 -- V�rification de la structure de la table apr�s modification

ALTER TABLE tblCollection
	DROP Column IF EXISTS CollectionNotes;



---------------------------------------------

ALTER TABLE tblCollection
	ADD CollectionNotes nvarchar(255),
		CollectionAssurance bit NOT NULL;
		EXEC sp_help tblCollection;

 -------------------------------------------
 -- Supprimer une table
 -- DROP TABLE nomTable
 -------------------------------------------
 
 DROP TABLE IF EXISTS tblCollection;

  --------------------------------------------------
 --- Creation de table � partir des donn�es
 --- d'une autre table provenant d'une autre base de donn�es
 -- Installer la base de donn�es xtreme
 --------------------------------------------------------------------
 --- Copier les donn�es d'une table vers une autre

-------------------------------------------------------------------
-- V�rification de l'existence d'un objet dans la 
-- base de donn�es syst�me
-------------------------------------------------------------------
 --Si l'objet table n'existe pas, on le cr��e
 --IF OBJECT_ID('ObjectName') IS NULL

 -- Si l'objet tblClient existe (IS NOT NULL), on le supprime
 -- pour le cr�er de nouveau
 
IF OBJECT_ID('tblClient') IS NOT NULL
	BEGIN
		DROP TABLE tblClient
		PRINT 'TABLE GO BYE BYE NOW'
	END
ELSE PRINT ' TABLE NO EXIST ' 


 -- Cr�ation de la table tblClients
 -- --------------------------------------------------------------------

 SELECT * 
 INTO tblClient
 FROM [xtremefr].[dbo].[Clients];

-- V�rification de tblClient

SELECT *
FROM tblClient;

-----------------------------------------------------------------------

--Cr�er la table tblClientCanada avec les donn�es.

IF OBJECT_ID('tblClientCanada') IS NOT NULL
	BEGIN
		DROP TABLE tblClientCanada
		PRINT 'TABLE GO BYE BYE NOW'
	END
ELSE PRINT ' TABLE NO EXIST ' 

 SELECT * 
 INTO tblClientCanada
 FROM (
	SELECT *
	FROM [xtremefr].[dbo].[Clients]
	WHERE [Pays] = 'Canada'
 ) temp

-----------------------------------------------------------------------

SELECT *
FROM tblClientCanada


-----------------------------------------------------------------------

IF OBJECT_ID('tblEmployee') IS NOT NULL
	BEGIN
		DROP TABLE tblClientEmployee
		PRINT 'TABLE GO BYE BYE NOW'
	END
ELSE PRINT ' TABLE NO EXIST ' 

 SELECT TOP 0 *
 INTO tblEmployee
 FROM [xtremefr].[dbo].Employ�s;
 
SELECT *
FROM tblEmployee
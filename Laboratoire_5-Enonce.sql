-- ==============================================================================
-- Description du cours : Introduction au bases de données
-- Code du cours : 420-212-MV
-- Laboratoire 5
-- Les commandes DDL

-- Objectif : 
-- Ce Laboratoire vise à acquérir les compétences suivantes
-- ========================================================
-- Les commandes DDL
-- Les commandes DML

-- Création d'une base de données
-- la commande CREATE DATABASE nomBase
-- Sélection de la base nouvellement créée.
-- La commande USE nomBase

USE master;

-- Suppression de la base de données
-- La commande DROP DATATBASE nomBase

DROP DATABASE IF EXISTS Lab5;


-- Requête 1
-- Écrire un script qui crée la base de données Lab5
-- Le nom de la base de données est : Lab5

CREATE DATABASE lab5;

-- Votre code ici
--Contexte master

SELECT DB_NAME() Context;

USE lab5;
SELECT DB_NAME() Context;

-- Vérification de l'existence de la base de données


-- Création de la base de données


-- Commit en cas d'exécution multiple (GO)


-- Vérification du contexte par défaut


-- Utilisation du contexte NomBaseDonnee

-- Vérification du contexte par défaut


-- Création de table par code
-- La commade CREATE nomObjet
-- Création de la table collection
-- 
-- Créer la table collection avec les specs suivantes : 
-- No de la cllection, clé primaire, valeur unique auto
-- Type de la collection : chaine de caractère de longueur 15
-- Nom de la collection : chaine de longueur 20, non null
-- Quantité : entier non nul
-- Date de création : date du jour

DROP TABLE IF EXISTS tblCollection;
CREATE TABLE tblCollection(
	NoCollection UNIQUEIDENTIFIER PRIMARY KEY NOT NULL DEFAULT NEWID(),
	CollectionType nvarchar(15),
	CollectionName nvarchar(20) NOT NULL,
	CollectionPrice int NOT NULL,
	CollectionDate date DEFAULT GETDATE()
);


-- Vérification de l'existence de la table collection
-- Suppression de la table si elle existe
-- La commande DROP nomObjet



-- Vérification de la création de la table


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

 -- Vérification de la structure de la table après modification

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
 --- Creation de table à partir des données
 --- d'une autre table provenant d'une autre base de données
 -- Installer la base de données xtreme
 --------------------------------------------------------------------
 --- Copier les données d'une table vers une autre

-------------------------------------------------------------------
-- Vérification de l'existence d'un objet dans la 
-- base de données système
-------------------------------------------------------------------
 --Si l'objet table n'existe pas, on le créée
 --IF OBJECT_ID('ObjectName') IS NULL

 -- Si l'objet tblClient existe (IS NOT NULL), on le supprime
 -- pour le créer de nouveau
 
IF OBJECT_ID('tblClient') IS NOT NULL
	BEGIN
		DROP TABLE tblClient
		PRINT 'TABLE GO BYE BYE NOW'
	END
ELSE PRINT ' TABLE NO EXIST ' 


 -- Création de la table tblClients
 -- --------------------------------------------------------------------

 SELECT * 
 INTO tblClient
 FROM [xtremefr].[dbo].[Clients];

-- Vérification de tblClient

SELECT *
FROM tblClient;

-----------------------------------------------------------------------

--Créer la table tblClientCanada avec les données.

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
 FROM [xtremefr].[dbo].Employés;
 
SELECT *
FROM tblEmployee
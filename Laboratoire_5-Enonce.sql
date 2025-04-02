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

ALTER DATABASE Lab5 SET SINGLE_USER WITH ROLLBACK IMMEDIATE --;

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

-----------------------------------------------------------------------



-- SHUTDOWN WITH NOWAIT; -- Redémarrage de l'instance

-- Objectif : 
-- Ce Laboratoire vise à acquérir les compétences suivantes
-- ========================================================
-- Les commandes DDL
-- Les commandes DML

-- Création d'une base de données
-- la commande CREATE DATABASE nomBase
-- Sélection de la base nouvellement créée.
-- La commande USE nomBase


-----------------------------------------------------------------------
-- Suite Lab5
-- Table FournisseurProduits

DROP TABLE IF EXISTS tblFournisseursProduits;

SELECT *
INTO tblFournisseursProduits
FROM (
		SELECT F.*,
			   P.[Nom du produit]
		FROM [xtremefr].[dbo].Fournisseurs F,
		[xtremefr].[dbo].[Produits] P
		WHERE F.[ID fournisseur] = P.[ID fournisseur]
		
	 ) temp;





 
 -- Vérifier la création de la table avec les données
 
  -- ********************************************************************
 -- Copie entière de la structure d'une table. La table sans les données
 -- Créer la table tblEmployes qui contient la structure de la table 
 -- Employees de la base de données xtremefr

 -- Verifier l'existence de la table tblEmployes
  
 -- version 1 avec TOP 0

 DROP TABLE IF EXISTS tblEmployes;

 
 -- Verifier l'existence de la table tblEmployes
 
 SELECT TOP 0 *
 INTO tblEmployes
 FROM [xtremefr].[dbo].Employés;

 SELECT * FROM tblEmployes;


 -- version 2 avec une condition fausse

 DROP TABLE IF EXISTS tblEmployes;
 
 SELECT *
 INTO tblEmployes
 FROM [xtremefr].[dbo].Employés
 WHERE 1 = 2;

 SELECT * FROM tblEmployes;



 -- Vérification de la création de la table tblEmployes


 -- Copie paritelle de la structure d'une table. La table sans les données
 -- Créer la table tblEmployes qui contient la structure de la table 
 -- Employees de la base de données xtremefr



 -- Verifier l'existence de la table tblEmployes
 
 DROP TABLE IF EXISTS tblEmployes;
 
 SELECT *
 INTO tblEmployes
 FROM (
		SELECT A.[ID employé] IDEmploye,
			   A.[ID supérieur],
			   A.[Nom],
			   A.[Prénom],
			   A.[Date de naissance],
			   A.[Date d'embauche],
			   A.[Salaire],
			   YEAR(A.[Date de naissance]) AnneeNaissance,
			   YEAR(A.[Date de naissance]) AnneeEmbauche
		FROM [xtremefr].[dbo].Employés A
	  ) temp;

 SELECT * FROM tblEmployes;
 
 
-- Creation de la table tblDepartement
-- Vérification de l'existence de la table tblDepartement avant création

DROP TABLE IF EXISTS tblDepartment;

-- Création de la table tblDepartement ayant la structure suivante :
-- ID Dept , entier, clé primaire, non nul, auto incrementé
-- ID departement, identificateur unique, non nul, nouvel identifiant
-- Nom du département, chaine longueur 30, not nul, unique

CREATE TABLE tblDepartment(
	IDDept int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	IDDepartment UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	NomDepartement nvarchar(30) NOT NULL UNIQUE
);

EXEC sp_help tblDepartment;

--Lorsque qu'on crée une table à partir d'une table existante, les keys et index ne sont pas copiés.


-- Modification de la structure de la table tblEmployes
-- Ajout d'une clé primaire à la table

ALTER TABLE tblEmployes
	ADD CONSTRAINT PK_IDEmp PRIMARY KEY(IDEmploye);

EXEC sp_help tblEmployes;

-- Ajout de la colonne IDDept à la table employes (tblEmployes)
-- Specs : entier, non nul

ALTER TABLE tblEmployes
	ADD IDDept INT NOT NULL;


EXEC sp_help tblEmployes;

-- Ajout d'une clé étrangère à la table employés

ALTER TABLE tblEmployes
	ADD CONSTRAINT FK_IDDept FOREIGN KEY(IDDept) REFERENCES tblDepartment(IDDept);

EXEC sp_help tblEmployes;

-- Vérifier la création des clés

-- ALTER TABLE tblEmployes
	

-- Suppression d'une clé primaire de la table tblEmployes


-- Ajout d'une clé (primaire) composée Nom, prenom
-- Un clé composée est une clé primaire composée de plusieurs colonnes

-- Vérifier la création des clés


-- Supprimer la clé composée


-- Recréer la clé primaire
-- Supprimer la clé primaire si elle existe


-- Vérifier la création des clés


-- Modifier la structure d'une table par code
-- Changer le type d'une colonne
-- ATTENTION, ce n'est pas toujours possible après qu'on ait entré des données.
-- Changer le type des colonnes DateNaissance et DateEmbauche (DateTime) en Date
-- Changer le type de la colonne Salaire (money) en entier (int)

-- Colonne Salaire : Money vers int

-- Colonne DateEmbauche : DateTime vers Date

-- Colonne DateNaissance : DateTime vers Date

-- Vérifier le changement de type


-- Changer la longueur d'une colonne
-- ATTENTION, il y a un risque de troncature à diminuer la longueur d'une colonne

-- PosteOccupe : nvarchar(30) --> nvarchar(50)


-- Changer le nom d'une colonne
-- Exemple : faute de frappe ou nom non significatif
-- Renommer Salaire en SalaireAnnuel


-- Ajout de données dans la table Departement
-- On ajoute 4 départements : Informatique, Ressources humaines, Finances, Marketing


-- Ajout de données dans la table employés
-- Règle d'insertion de données dans la colonne IDDept
-- L'employé appartient au département 1 quand son salaire est inférieur ou égal à 30.000 $
-- L'employé appartient au département 2 quand son salaire est compris entre à 30.001 $ et 49.999 $
-- L'employé appartient au département 3 quand son salaire est compris entre à 50.000 $ et 69.999 $
-- L'employé appartient au département 4 quand son salaire est compris entre à 70.000 $ et 99.999 $


-- Vérifier le contenu de la table tblEmployes


-- Écrire une requete qui affiche les employés ainsi que le nom de leurs départements


GO

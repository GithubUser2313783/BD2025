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

ALTER DATABASE Lab5 SET SINGLE_USER WITH ROLLBACK IMMEDIATE --;

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

-----------------------------------------------------------------------



-- SHUTDOWN WITH NOWAIT; -- Red�marrage de l'instance

-- Objectif : 
-- Ce Laboratoire vise � acqu�rir les comp�tences suivantes
-- ========================================================
-- Les commandes DDL
-- Les commandes DML

-- Cr�ation d'une base de donn�es
-- la commande CREATE DATABASE nomBase
-- S�lection de la base nouvellement cr��e.
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





 
 -- V�rifier la cr�ation de la table avec les donn�es
 
  -- ********************************************************************
 -- Copie enti�re de la structure d'une table. La table sans les donn�es
 -- Cr�er la table tblEmployes qui contient la structure de la table 
 -- Employees de la base de donn�es xtremefr

 -- Verifier l'existence de la table tblEmployes
  
 -- version 1 avec TOP 0

 DROP TABLE IF EXISTS tblEmployes;

 
 -- Verifier l'existence de la table tblEmployes
 
 SELECT TOP 0 *
 INTO tblEmployes
 FROM [xtremefr].[dbo].Employ�s;

 SELECT * FROM tblEmployes;


 -- version 2 avec une condition fausse

 DROP TABLE IF EXISTS tblEmployes;
 
 SELECT *
 INTO tblEmployes
 FROM [xtremefr].[dbo].Employ�s
 WHERE 1 = 2;

 SELECT * FROM tblEmployes;



 -- V�rification de la cr�ation de la table tblEmployes


 -- Copie paritelle de la structure d'une table. La table sans les donn�es
 -- Cr�er la table tblEmployes qui contient la structure de la table 
 -- Employees de la base de donn�es xtremefr



 -- Verifier l'existence de la table tblEmployes
 
 DROP TABLE IF EXISTS tblEmployes;
 
 SELECT *
 INTO tblEmployes
 FROM (
		SELECT A.[ID employ�] IDEmploye,
			   A.[ID sup�rieur],
			   A.[Nom],
			   A.[Pr�nom],
			   A.[Date de naissance],
			   A.[Date d'embauche],
			   A.[Salaire],
			   YEAR(A.[Date de naissance]) AnneeNaissance,
			   YEAR(A.[Date de naissance]) AnneeEmbauche
		FROM [xtremefr].[dbo].Employ�s A
	  ) temp;

 SELECT * FROM tblEmployes;
 
 
-- Creation de la table tblDepartement
-- V�rification de l'existence de la table tblDepartement avant cr�ation

DROP TABLE IF EXISTS tblDepartment;

-- Cr�ation de la table tblDepartement ayant la structure suivante :
-- ID Dept , entier, cl� primaire, non nul, auto increment�
-- ID departement, identificateur unique, non nul, nouvel identifiant
-- Nom du d�partement, chaine longueur 30, not nul, unique

CREATE TABLE tblDepartment(
	IDDept int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	IDDepartment UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	NomDepartement nvarchar(30) NOT NULL UNIQUE
);

EXEC sp_help tblDepartment;

--Lorsque qu'on cr�e une table � partir d'une table existante, les keys et index ne sont pas copi�s.


-- Modification de la structure de la table tblEmployes
-- Ajout d'une cl� primaire � la table

ALTER TABLE tblEmployes
	ADD CONSTRAINT PK_IDEmp PRIMARY KEY(IDEmploye);

EXEC sp_help tblEmployes;

-- Ajout de la colonne IDDept � la table employes (tblEmployes)
-- Specs : entier, non nul

ALTER TABLE tblEmployes
	ADD IDDept INT NOT NULL;


EXEC sp_help tblEmployes;

-- Ajout d'une cl� �trang�re � la table employ�s

ALTER TABLE tblEmployes
	ADD CONSTRAINT FK_IDDept FOREIGN KEY(IDDept) REFERENCES tblDepartment(IDDept);

EXEC sp_help tblEmployes;

-- V�rifier la cr�ation des cl�s

-- ALTER TABLE tblEmployes
	

-- Suppression d'une cl� primaire de la table tblEmployes


-- Ajout d'une cl� (primaire) compos�e Nom, prenom
-- Un cl� compos�e est une cl� primaire compos�e de plusieurs colonnes

-- V�rifier la cr�ation des cl�s


-- Supprimer la cl� compos�e


-- Recr�er la cl� primaire
-- Supprimer la cl� primaire si elle existe


-- V�rifier la cr�ation des cl�s


-- Modifier la structure d'une table par code
-- Changer le type d'une colonne
-- ATTENTION, ce n'est pas toujours possible apr�s qu'on ait entr� des donn�es.
-- Changer le type des colonnes DateNaissance et DateEmbauche (DateTime) en Date
-- Changer le type de la colonne Salaire (money) en entier (int)

-- Colonne Salaire : Money vers int

-- Colonne DateEmbauche : DateTime vers Date

-- Colonne DateNaissance : DateTime vers Date

-- V�rifier le changement de type


-- Changer la longueur d'une colonne
-- ATTENTION, il y a un risque de troncature � diminuer la longueur d'une colonne

-- PosteOccupe : nvarchar(30) --> nvarchar(50)


-- Changer le nom d'une colonne
-- Exemple : faute de frappe ou nom non significatif
-- Renommer Salaire en SalaireAnnuel


-- Ajout de donn�es dans la table Departement
-- On ajoute 4 d�partements : Informatique, Ressources humaines, Finances, Marketing


-- Ajout de donn�es dans la table employ�s
-- R�gle d'insertion de donn�es dans la colonne IDDept
-- L'employ� appartient au d�partement 1 quand son salaire est inf�rieur ou �gal � 30.000 $
-- L'employ� appartient au d�partement 2 quand son salaire est compris entre � 30.001 $ et 49.999 $
-- L'employ� appartient au d�partement 3 quand son salaire est compris entre � 50.000 $ et 69.999 $
-- L'employ� appartient au d�partement 4 quand son salaire est compris entre � 70.000 $ et 99.999 $


-- V�rifier le contenu de la table tblEmployes


-- �crire une requete qui affiche les employ�s ainsi que le nom de leurs d�partements


GO

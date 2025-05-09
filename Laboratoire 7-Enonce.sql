-- ==============================================================================
-- Description du cours : Introduction au bases de donn�es
-- Code du cours : 420-212-MV
-- Laboratoire 7
-- Calcul de boni des employ�s de la compagnie Pages bleues
-- ==============================================================================


-- Objectif : 
-- **********
-- Ce Laboratoire vise � r�soudre un probl�me d'entreprise
-- en utilisant les notions de base de donn�es vues en cours
-- ========================================================

-- Base de donn�es � utiliser : Bonis

USE Bonis;
GO

-- ******************************************************************************************
-- �crire une requ�te affiche les donn�es des employ�s suivantes
-- ******************************************************************************************
-- No employ�
-- Le nom de l'employ�
-- Le pr�nom de l'employ�
-- Le num�ro du poste de l'employ�
-- La description du poste de l'employ�
-- Le d�partement de l'employ�
-- Le taux horaire
-- Le nombre de semaine travaill�es
-- Le salaire annuel
SELECT [tblEmployes].No,
	   Nom,
	   D�partement,
	   Nb_sem,
	   [tblEmployesPostes].No_Poste,
	   Cat�gorie,
	   Fonction,
	   Grade,
	   Taux_horaire,
	   Salaire_annuel
FROM [dbo].[tblEmployes]
JOIN [dbo].tblEmployesPostes ON [tblEmployes].No = [tblEmployesPostes].No
JOIN [dbo].[tblPostes] ON [tblEmployesPostes].No_Poste = [tblPostes].No_Poste


--Creation d'une vue employee

DROP VIEW IF EXISTS vEmployesSyndicated;
GO
CREATE VIEW vEmployesSyndicated AS
	SELECT [tblEmployes].No,
	   Nom,
	   D�partement,
	   Nb_sem,
	   [tblEmployesPostes].No_Poste,
	   Cat�gorie,
	   Fonction,
	   Grade,
	   Taux_horaire,
	   Salaire_annuel,
	   Ventes
FROM [dbo].[tblEmployes]
JOIN [dbo].tblEmployesPostes ON [tblEmployes].No = [tblEmployesPostes].No
JOIN [dbo].[tblPostes] ON [tblEmployesPostes].No_Poste = [tblPostes].No_Poste
JOIN [dbo].[tblEmployeVentes] ON [tblEmployes].No = [tblEmployeVentes].No

GO
	


-- Cr�er une table temporaire qui contient les employe�s syndiqu�s

DROP TABLE IF EXISTS tempEmpSyndicated;
SELECT *
INTO tempEmpSyndicated
FROM vEmployesSyndicated
WHERE Cat�gorie = 'S';

GO

-- V�rifier la cr�ation de la nouvelle table

SELECT * FROM vEmployesSyndicated;


-- Modifier la structure de la table tempEmpSyndiques en ajoutant les colonnes suivantes :
-- Le montant des gains 
-- Le pourcentage de la commission
-- Le montant de la commission

ALTER TABLE tempEmpSyndicated
	DROP COLUMN IF EXISTS MontantGain;

ALTER TABLE tempEmpSyndicated
	DROP COLUMN IF EXISTS PercentageCommission;

ALTER TABLE tempEmpSyndicated
	DROP COLUMN IF EXISTS MontantCommission;

ALTER TABLE tempEmpSyndicated
	ADD MontantGain money,
		PercentageCommission int,
		MontantCommission money;

GO


-- V�rifier et afficher la nouvelle structure

EXEC sp_help tempEmpSyndicated;

-- **************************************
-- Traitement des employ�s syndiqu�s
-- *************************************
-- Calculer la commission que les employ�s syndiqu�s recevront
-- On affichera :
-- Toutes les colonnes de la table tempEmpSyndiques
-- Le montant des ventes r�alis�es
-- Le pourcentage de la commission
-- Le montant des gains
-- Le montant de la commission
 
 -- Effectuer la mise � jour du montant des gains
 -- Quelle est l'expression qui permet de calculer le montant des gains ?
 -- Taux horaire * Nb Heures par sem * Nb de sem

 UPDATE tempEmpSyndicated
 SET MontantGain = CAST([Taux_horaire] AS money) * CAST([Nb_sem] AS money) * 37.5

 -- V�rifier la mise � jour

 SELECT * FROM tempEmpSyndicated;

 -- Effectuer la mise � jour du pourcentrage de la commission

 UPDATE tempEmpSyndicated
 SET PercentageCommission = (
							 CASE
								WHEN Ventes = 0 THEN 0
								WHEN Ventes <= 2500 THEN 1
								WHEN Ventes <= 5000 THEN 2
								WHEN Ventes <= 10000 THEN 5
								WHEN Ventes <= 15000 THEN 8
								WHEN Ventes <= 25000 THEN 10
								WHEN Ventes <= 50000 THEN 12
								WHEN Ventes <= 100000 THEN 15
								WHEN Ventes <= 200000 THEN 18
								WHEN Ventes <= 300000 THEN 20
							 ELSE 25
							 END
							 )

-- V�rifier la mise � jour du pourcentage de la commission

SELECT * FROM tempEmpSyndicated

 -- Efectuer la mise � jour du montant de la commission

 UPDATE tempEmpSyndicated
 SET MontantCommission = MontantGain * PercentageCommission / 100

-- V�rifier la mise � jour du montant de la commission

SELECT * FROM tempEmpSyndicated;

-- Creation d'une vue

DROP VIEW IF EXISTS vEmployesNonSyndicated;
GO
CREATE VIEW vEmployesNonSyndicated AS
	SELECT [tblEmployes].No,
		   Nom,
		   Pr�nom,
		   D�partement,
		   Nb_sem,
		   [tblEmployesPostes].No_Poste,
		   Cat�gorie,
		   Fonction,
		   Grade,
		   Taux_horaire,
		   Salaire_annuel
FROM [dbo].[tblEmployes]
JOIN [dbo].[tblEmployesPostes] ON [tblEmployes].No = [tblEmployesPostes].No
JOIN [dbo].[tblPostes] ON [tblEmployesPostes].No_Poste = [tblPostes].No_Poste

GO

-- Cr�er une table qui contient les employ�s non syndiqu�s

DROP TABLE IF EXISTS tempEmpNonSyndicated;
SELECT *
INTO tempEmpNonSyndicated
FROM vEmployesNonSyndicated
WHERE Cat�gorie = 'N';

GO

-- V�rifier la cr�ation de la nouvelle table

SELECT * FROM tempEmpNonSyndicated;

-- Modifier la structure de la table temEmpNonSyndiques en ajoutant les colonnes suivantes :
-- Le montant des gains 
-- Le pourcentage du boni
-- Le montant du boni

ALTER TABLE tempEmpNonSyndicated
	DROP COLUMN IF EXISTS MontantGain;

ALTER TABLE tempEmpNonSyndicated
	DROP COLUMN IF EXISTS PercentageBoni;

ALTER TABLE tempEmpNonSyndicated
	DROP COLUMN IF EXISTS MontantBoni;

ALTER TABLE tempEmpNonSyndicated
	ADD MontantGain money,
		PercentageBoni int,
		MontantBoni money;

GO

-- V�rifier et afficher la nouvelle structure

EXEC sp_help tempEmpNonSyndicated

-- *********************************************
-- *** Traitement des employ�s non syndiqu�s ***
-- *********************************************
-- Calculer le boni que les employ�s non syndiqu�s recevront
-- On affichera :
-- Toutes les colonnes de la table tempEmpNonSyndiques
-- Le montant des gains
-- Le pourcentage du boni
-- Le montant du boni
 
 -- Effectuer la mise � jour du montant des gains
 -- Quelle est l'expression qui permet de calculer le montant des gains ?
 -- Taux horaire * Nb Heures par sem * Nb de sem

UPDATE tempEmpNonSyndicated
SET MontantGain = CAST([Taux_horaire] AS money) * CAST([Nb_sem] AS money) * 37.5

 -- V�rifier la mise � jour

SELECT * FROM tempEmpSyndicated;

-- Effectuer la mise � jour du pourcentage du boni

 UPDATE tempEmpNonSyndicated
 SET PercentageBoni = (
							 CASE
								WHEN Grade = 'MP1' THEN 5
								WHEN Grade = 'MP2' THEN 10
								WHEN Grade = 'MP3' THEN 15
								WHEN Grade = 'MP4' THEN 30
								WHEN Grade = 'MP5' THEN 40
								WHEN Grade = 'MP6' THEN 100
							 ELSE 0
							 END
							 )

-- V�rifier la mise � jour

SELECT * FROM tempEmpNonSyndicated;

 -- Efectuer la mise � jour du montant du boni

 UPDATE tempEmpNonSyndicated
 SET MontantBoni = MontantGain * PercentageBoni / 100

-- V�rifier la mise � jour du montant du boni

SELECT * FROM tempEmpNonSyndicated;

-- ***************  Cr�ation de la table des paiements (tblEmpPaiement)

DROP TABLE IF EXISTS tblEmpPaiement;

CREATE TABLE tblEmpPaiement
	(
	  NoEmploye int PRIMARY KEY not null,
	  NomEmploye nvarchar(30),
	  PrenomEmploye nvarchar(30),
	  GradeEmploye nvarchar(3),
	  Gains money,
	  PercentageBoni decimal(5, 2),
	  MontantBoni money
	 )

--Ajout des montant des employ�s syndiqu�s

INSERT INTO tblEmpPaiement
SELECT
	[No],
	[Nom],
	[Prenom],
	[Grade],
	[MontantGain]


--Ajout des montants des employ�s non syndiqu�s


-- V�rification de la table des paiements



-- Nettoyage de l'environnement
-- Suppression des tables temporaires



-- ************************  FIN de PROGRAMME *************************


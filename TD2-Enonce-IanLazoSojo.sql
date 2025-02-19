-- ==============================================================================
-- Description du cours : Introduction au bases de donn�es
-- Code du cours : 420-212-MV
-- Travaux dirig�s 2
-- Les requ�tes SELECTION

-- Objectif : 
-- Ce travail dirig� est une introduction � la commande SELECT du langage SQL
-- ==============================================================================
-- ---------
-- Requ�te 1
-- Ecrire une requ�te affiche la liste des employ�s de la base de donn�es HRDB
-- On affichera toutes les colonnes et toutes lignes de la table
-- Base de donn�es : HRDB
-- Table : employees
-- V�rifier la structure de la table "employees"

-- Votre code ici

SELECT * 
FROM [dbo].[employees]

-- ---------
-- Requ�te 2
-- Ecrire une requ�te affiche la liste des employ� de la base de donn�es HRDB
-- Formatage du code SQL
-- Les commentaires
-- Base de donn�es : HRDB
-- Table : employees
-- V�rifier la structure de la table "employees"
-- On affichera les colonnes suivantes : 
-- employee_id
-- last_name
-- fisrt_name
-- email
-- salary

-- Votre code ici

SELECT 
	[employee_id],
	[last_name],
	[first_name],
	[email],
	[salary]
FROM [dbo].[employees]

-- ---------
-- Requ�te 3
-- Modifier la requ�te pr�c�dente afin d'utiliser des noms de colonnes plus conviviaux
-- Utilisation des ALIAS
-- Les alias avec les [] 
-- Les alias avec le mot r�serv� AS
--
-- Votre code ici

SELECT 
	[employee_id] AS NoEmploye,
	[last_name] AS NomDeFamille,
	[first_name] AS Prenom,
	[email] AS Courriel,
	[salary] AS Salaire
FROM [dbo].[employees]


-- ---------
-- Requ�te 4
-- �crire une requ�te pr�sente les r�sultats dans un certain ordre.
-- Tri des r�sultats
-- �crire une requ�te qui affiche la liste des employ�s tri�e
-- par ordre alphab�tique croissant du nom de famille.
-- On affichera les m�mes colonnes que la requ�te pr�c�dente.

-- Votre code ici

SELECT 
	[employee_id] AS NoEmploye,
	[last_name] AS NomDeFamille,
	[first_name] AS Prenom,
	[email] AS Courriel,
	[salary] AS Salaire
FROM [dbo].[employees]
ORDER BY [last_name]


-- ----------
-- Requ�te 5
-- �crire une requete qui affiche la liste des emplois.
-- Table  : jobs
-- On affichera toutes les colonnes de la table

-- Votre code ici

SELECT *
FROM [dbo].[jobs]


-- ----------
-- Requ�te 6
-- Modifier la requete pr�c�dente pour afficher les jobs en 
-- changeant le lib�ll� des entete de colonne.
-- Afficher : 
-- NoPoste au lieu de job_id
-- TitrePoste au lieu de job_title
-- Salaire minimum au lieu de min_salary
-- Salaire maximum au lieu de max_salary

-- Votre code ici

SELECT 
	[job_id] AS NoPoste,
	[job_title] AS TitrePoste,
	[min_salary] AS "Salaire Minimum",
	[max_salary] AS "Salaire Maximum"
FROM [dbo].[jobs]

-- ----------
-- Requ�te 7
-- �crire une requete qui affiche la liste des postes tri�e
-- en ordre croissant du titre du poste.

-- Votre code ici

SELECT 
	[job_id] AS NoPoste,
	[job_title] AS TitrePoste,
	[min_salary] AS "Salaire Minimum",
	[max_salary] AS "Salaire Maximum"
FROM [dbo].[jobs]
ORDER BY TitrePoste

-- ----------
-- Requ�te 7
-- �crire une requete qui affiche la liste des postes tri�e
-- en ordre d�croissant du salaire minimum.

-- Votre code ici

SELECT 
	[job_id] AS NoPoste,
	[job_title] AS TitrePoste,
	[min_salary] AS "Salaire Minimum",
	[max_salary] AS "Salaire Maximum"
FROM [dbo].[jobs]
ORDER BY [Salaire Minimum] DESC

SELECT 
	[job_id] AS NoPoste,
	[job_title] AS TitrePoste,
	[min_salary] AS "Salaire Minimum",
	[max_salary] AS "Salaire Maximum"
FROM [dbo].[jobs]
ORDER BY TitrePoste

SELECT
	[dbo].[jobs].job_id,
	[dbo].[employees].first_name,
	[dbo].[employees].last_name,
	[dbo].[jobs].job_title
FROM [dbo].[jobs]
JOIN [dbo].[employees] on [dbo].[jobs].job_id=[dbo].[employees].job_id
ORDER BY [dbo].[jobs].job_title

SELECT 
	[employee_id] AS NoEmploye,
	[last_name] AS NomDeFamille,
	[first_name] AS Prenom,
	[email] AS Courriel,
	[salary] AS Salaire
FROM [dbo].[employees]
WHERE[salary] BETWEEN 5000 AND 10000
ORDER BY [salary] DESC

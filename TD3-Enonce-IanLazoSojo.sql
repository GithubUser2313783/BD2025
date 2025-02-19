-- ==================================================================================
-- Description du cours : Introduction au bases de données
-- Code du cours : 420-212-MV
-- Travaux dirigés 3
-- Les requêtes SELECTION avec la clause WHERE

-- Objectif : 
-- Ce travail dirigé portera sur la clause WHERE de la commande SELECT du langage SQL
-- ==================================================================================
-- ---------
-- Requête 1
-- Critère sur les colonnes de type numérique
-- Les opérateurs arithmétiques :  =, <, <=, >, >=, <> , BETWEEN, OR, AND
-- Ecrire une requête affiche la liste des employés dont le salaire est égal à 7000
-- On affichera toutes les colonnes:
-- Le nom de l'employé
-- Le prénom de l'employé
-- Le salaire
-- Le courriel
-- Base de données : HRDB
-- Table : employees
-- Vérifier la structure de la table "employees"

SELECT *
FROM [dbo].[employees]
WHERE [salary] = 7000

-- ---------
-- Requête 2
-- Modifier la requête précédente pour afficher la liste des employés dont le salaire est supérieur ou égal à 4500
-- On affichera les mêmes données
-- La liste sera triée par le salaire

SELECT *
FROM [dbo].[employees]
WHERE [salary] >= 4500


-- ---------
-- Requête 3
-- Modifier la requête précédente pour afficher la liste des employés dont le salaire est compris entre 8000 and 13000
-- On affichera les mêmes données
-- La liste sera triée par le salaire
--

SELECT *
FROM [dbo].[employees]
WHERE [salary] BETWEEN 8000 AND 13000


-- ---------
-- Requête 4
-- Modifier la requête précédente pour afficher la liste des employés dont le salaire est inférieur à 8000 et supérieur 10000
-- On affichera les mêmes données
-- La liste sera triée par le salaire

SELECT *
FROM [dbo].[employees]
WHERE [salary] < 8000 AND [salary] > 10000


-- ----------
-- Requête 5
-- Modifier la requête précédente pour afficher la liste des employés dont le salaire est différent de 4500
-- On affichera les mêmes données
-- La liste sera triée par le salaire

SELECT *
FROM [dbo].[employees]
WHERE [salary] <> 4500


-- ----------
-- Requête 6
-- Critère sur les colonnes chaine de caractères
-- Écrire une requête qui affiche l'employé Taylor
-- On affichera les colonnes suivantes. Changer le nom des colonnes par leur traduction en francais
--- Le nom de l'employé
--- Le prénom de l'employé
--- téléphone
--- Le courriel

SELECT [last_name] AS Nom,
	   [first_name] AS Prenom, 
	   [phone_number] AS Telephone,
	   [email] AS Courriel
FROM [dbo].[employees]
WHERE [last_name] = 'Taylor'



-- ----------
-- Requête 7
-- Modifier la requête précédente en affichant la liste des employés dont le nom commence par H
-- Opérateur LIKE and caractère générique %

SELECT [last_name] AS Nom,
	   [first_name] AS Prenom, 
	   [phone_number] AS Telephone,
	   [email] AS Courriel
FROM [dbo].[employees]
WHERE [last_name] LIKE 'H%'



-- ----------
-- Requête 8
-- Modifier la requête précédente en affichant la liste des employés dont le téléphone commence par '515'
-- Opérateur LIKE and caractère générique %
-- La liste sera triée par le numéro de téléphone

SELECT [last_name] AS Nom,
	   [first_name] AS Prenom, 
	   [phone_number] AS Telephone,
	   [email] AS Courriel
FROM [dbo].[employees]
WHERE [phone_number] LIKE '515%'

-- ----------
-- Requête 9
-- Modifier la requête 7 en affichant la liste des employés dont le nom sont compris entre la lettre C et P
-- Opérateur LIKE and caractère générique %
-- 

SELECT [last_name] AS Nom,
	   [first_name] AS Prenom, 
	   [phone_number] AS Telephone,
	   [email] AS Courriel
FROM [dbo].[employees]
WHERE [last_name] BETWEEN 'C%' AND 'P%' 
ORDER BY Nom



-- ----------
-- Requête 10
-- Modifier la requête précédente en affichant la liste des employés dont le nom sont compris entre la lettre C et P
-- Opérateur LIKE and caractère générique %
-- 

SELECT [last_name] AS Nom,
	   [first_name] AS Prenom, 
	   [phone_number] AS Telephone,
	   [email] AS Courriel
FROM [dbo].[employees]
WHERE [last_name] BETWEEN 'C%' AND 'P%' 
ORDER BY Nom



-- ----------
-- Requête 11
-- Modifier la requête précédente en affichant la liste des employés dont le nom est fay, higgins, khoo, himuro 
-- Opérateur IN 
-- 

SELECT [last_name] AS Nom,
	   [first_name] AS Prenom, 
	   [phone_number] AS Telephone,
	   [email] AS Courriel
FROM [dbo].[employees]
WHERE [last_name] IN ('Fay', 'Higgins', 'Khoo', 'Himuro')



-- ----------
-- Requête 12
-- Écrire une requête qui affiche la liste des employés embauchés après le 1er janvier 1990
-- La liste sera triée par la date d'embauche
-- On affichera 
--- Le nom
--- Le prenom
--- Le email
--- La date de d'embauche
-- 


SELECT [last_name] AS Nom,
	   [first_name] AS Prenom, 
	   [phone_number] AS Telephone,
	   [hire_date] AS DateEmbauche
FROM [dbo].[employees]
WHERE [hire_date] < '01-01-1990'



-- ----------
-- Requête 13
-- Écrire une requête qui affiche la liste des employés embauchés entre le 10 septembre 1995 et le 1 janvier 1998
-- La liste sera triée par la date d'embauche
-- On affichera 
--- Le nom
--- Le prenom
--- Le email
--- La date de d'embauche
-- 

SELECT [last_name] AS Nom,
	   [first_name] AS Prenom, 
	   [phone_number] AS Telephone,
	   [hire_date] AS DateEmbauche
FROM [dbo].[employees]
WHERE [hire_date] BETWEEN '10-09-1995' AND '01-01-1998'

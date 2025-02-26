-- ==============================================================================
-- Description du cours : Introduction au bases de données
-- Code du cours : 420-212-MV
-- Laboratoire 2
-- Les requêtes SELECTION

-- Objectif : 
-- Ce Laboratoire vise à acquérir les compétences suivantes
-- ========================================================
-- Les champs virtuels (calculés)
-- La clause GROUP BY et les fonctions de regroupement
-- La fonction COUNT
-- La fonction SUM
-- La fonction AVG
-- La fonction MAX
-- La fonction MIN

-- Base de données à utiliser : HRDB
-- ---------
-- Création d'un champ calculé ou virtuel
-- Ecrire une requête calcule et affiche le salaire hebdomadaire des employés
-- Table : employees
-- On affichera les colonnes suivantes :
-- Le numéro de l'employé
-- Le nom de l'employé
-- Le prénom de l'employé
-- Le salaire annuel
-- Le salaire hebdomadaire

SELECT [employee_id],
	   [last_name],
	   [first_name],
	   [last_name] + ', ' + [first_name] FullName,
	   [salary],
	   [salary] / 53 WeeklySalary
FROM [dbo].[employees]


-- ---------
-- Requête 2
-- On veut calculer la paie des employés avex les paramètres suivants :
-- Le pourcentage des déductions salariales est de 18%
-- Ecrire une requête calcule et affiche le salaire net, le montant des déductions salariales des employés à partir du salaire annuel.


SELECT [employee_id],
	   [last_name],
	   [first_name],
	   [salary],
	   [salary] * 0.18 DeductionSalary,
	   [salary] - [salary] * 0.18 Result
FROM [dbo].[employees]


-- ---------
-- Requête 3 - (A ne pas faire - Voir fonctions date plus tard)
-- Modifier la requête précédente afin de calculer l'ancienneté des employés à partir de la date d'embauche

--
-- Votre code ici


-- ---------
-- Requête 4
-- Écrire une requête qui crée le nom complet des employés en concaténant le nom et le prénom

SELECT [employee_id],
	   [last_name],
	   [first_name],
	   [last_name] + ', ' + [first_name] FullName
FROM [dbo].[employees]

-- ----------
-- Requête 5
-- Écrire une requete qui compte le nombre d'employés dans la compagnie
-- On affichera uniquement l'effectif de l'entreprise

SELECT 
	 COUNT(*) AS EmployeeTotal
FROM [dbo].[employees]





-- Requête 6
-- Écrire une requete qui compte le nombre de manager dans la compagnie
-- On affichera uniquement le nombre de manager

SELECT 
	COUNT(DISTINCT[manager_id]) AS Managers
FROM [dbo].[employees]

-- La clause DISTINCT permet de supprimer des doublons dans un SELECT.

-- Requête 7
-- Écrire une requete qui affiche la liste des employés qui sont des managers.
-- On affichera uniquement l'ID du manager

SELECT 
	DISTINCT[manager_id]
FROM [dbo].[employees]



-- ----------
-- Requête 8
-- Écrire une requête qui affiche le nombre d'employés sous chaque manager
-- On affichera :
-- L'ID du manager
-- Le nombre d'empoyés.

SELECT 
	[manager_id],
	COUNT(DISTINCT[employee_id])
FROM [dbo].[employees]
GROUP BY [manager_id]

-- ----------
-- Requête 9
-- Écrire une requete qui affiche les stats suivantes : 
-- Le salaire moyen
-- Le salaire le plus élevé
-- Le salaire le plus bas
-- la masse salariale de toute la compagnie


SELECT 
	AVG([salary]) AS AverageSalary,
	MAX([salary]) AS MaxSalary,
	MIN([salary]) AS MinSalary,
	SUM([salary]) AS TotalCompanySalary
FROM [dbo].[employees]



-- ----------
-- Requête 10
-- Écrire une requete qui calcul;e et affiche la masse salariale par manager
-- On affichera :
-- L'ID du manager
-- Le nombre d'employés sous chaque manager
-- La masse salariale  des employés sous chaque manager
-- Votre code ici

SELECT 
	[manager_id],
	COUNT(DISTINCT[employee_id]),
	SUM([salary])
FROM [dbo].[employees]
GROUP BY [manager_id]



-- Requête 11
-- Écrire une requete qui calcule et affiche la masse salariale par département
-- L'ID du département
-- Le nombre d'employés dans chaque département
-- La masse salariale  des employés dans chaque département

SELECT 
	[department_id],
	COUNT(DISTINCT[employee_id]),
	SUM([salary])
FROM [dbo].[employees]
GROUP BY [department_id]



-- Requête 12
-- Écrire une requete qui calcule et affiche la masse salariale par poste
-- L'ID du poste
-- Le nombre d'employés dans chaque poste
-- La masse salariale  des employés dans chaque poste

SELECT 
	[job_id],
	COUNT(DISTINCT[employee_id]),
	SUM([salary])
FROM [dbo].[employees]
GROUP BY [job_id]


-- Dans les fonctions d'agrégation, COUNT presque toujours avec la clé primaire.
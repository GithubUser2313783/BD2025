-- ==============================================================================
-- Description du cours : Introduction au bases de donn�es
-- Code du cours : 420-212-MV
-- Laboratoire 2
-- Les requ�tes SELECTION

-- Objectif : 
-- Ce Laboratoire vise � acqu�rir les comp�tences suivantes
-- ========================================================
-- Les champs virtuels (calcul�s)
-- La clause GROUP BY et les fonctions de regroupement
-- La fonction COUNT
-- La fonction SUM
-- La fonction AVG
-- La fonction MAX
-- La fonction MIN

-- Base de donn�es � utiliser : HRDB
-- ---------
-- Cr�ation d'un champ calcul� ou virtuel
-- Ecrire une requ�te calcule et affiche le salaire hebdomadaire des employ�s
-- Table : employees
-- On affichera les colonnes suivantes :
-- Le num�ro de l'employ�
-- Le nom de l'employ�
-- Le pr�nom de l'employ�
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
-- Requ�te 2
-- On veut calculer la paie des employ�s avex les param�tres suivants :
-- Le pourcentage des d�ductions salariales est de 18%
-- Ecrire une requ�te calcule et affiche le salaire net, le montant des d�ductions salariales des employ�s � partir du salaire annuel.


SELECT [employee_id],
	   [last_name],
	   [first_name],
	   [salary],
	   [salary] * 0.18 DeductionSalary,
	   [salary] - [salary] * 0.18 Result
FROM [dbo].[employees]


-- ---------
-- Requ�te 3 - (A ne pas faire - Voir fonctions date plus tard)
-- Modifier la requ�te pr�c�dente afin de calculer l'anciennet� des employ�s � partir de la date d'embauche

--
-- Votre code ici


-- ---------
-- Requ�te 4
-- �crire une requ�te qui cr�e le nom complet des employ�s en concat�nant le nom et le pr�nom

SELECT [employee_id],
	   [last_name],
	   [first_name],
	   [last_name] + ', ' + [first_name] FullName
FROM [dbo].[employees]

-- ----------
-- Requ�te 5
-- �crire une requete qui compte le nombre d'employ�s dans la compagnie
-- On affichera uniquement l'effectif de l'entreprise

SELECT 
	 COUNT(*) AS EmployeeTotal
FROM [dbo].[employees]





-- Requ�te 6
-- �crire une requete qui compte le nombre de manager dans la compagnie
-- On affichera uniquement le nombre de manager

SELECT 
	COUNT(DISTINCT[manager_id]) AS Managers
FROM [dbo].[employees]

-- La clause DISTINCT permet de supprimer des doublons dans un SELECT.

-- Requ�te 7
-- �crire une requete qui affiche la liste des employ�s qui sont des managers.
-- On affichera uniquement l'ID du manager

SELECT 
	DISTINCT[manager_id]
FROM [dbo].[employees]



-- ----------
-- Requ�te 8
-- �crire une requ�te qui affiche le nombre d'employ�s sous chaque manager
-- On affichera :
-- L'ID du manager
-- Le nombre d'empoy�s.

SELECT 
	[manager_id],
	COUNT(DISTINCT[employee_id])
FROM [dbo].[employees]
GROUP BY [manager_id]

-- ----------
-- Requ�te 9
-- �crire une requete qui affiche les stats suivantes : 
-- Le salaire moyen
-- Le salaire le plus �lev�
-- Le salaire le plus bas
-- la masse salariale de toute la compagnie


SELECT 
	AVG([salary]) AS AverageSalary,
	MAX([salary]) AS MaxSalary,
	MIN([salary]) AS MinSalary,
	SUM([salary]) AS TotalCompanySalary
FROM [dbo].[employees]



-- ----------
-- Requ�te 10
-- �crire une requete qui calcul;e et affiche la masse salariale par manager
-- On affichera :
-- L'ID du manager
-- Le nombre d'employ�s sous chaque manager
-- La masse salariale  des employ�s sous chaque manager
-- Votre code ici

SELECT 
	[manager_id],
	COUNT(DISTINCT[employee_id]),
	SUM([salary])
FROM [dbo].[employees]
GROUP BY [manager_id]



-- Requ�te 11
-- �crire une requete qui calcule et affiche la masse salariale par d�partement
-- L'ID du d�partement
-- Le nombre d'employ�s dans chaque d�partement
-- La masse salariale  des employ�s dans chaque d�partement

SELECT 
	[department_id],
	COUNT(DISTINCT[employee_id]),
	SUM([salary])
FROM [dbo].[employees]
GROUP BY [department_id]



-- Requ�te 12
-- �crire une requete qui calcule et affiche la masse salariale par poste
-- L'ID du poste
-- Le nombre d'employ�s dans chaque poste
-- La masse salariale  des employ�s dans chaque poste

SELECT 
	[job_id],
	COUNT(DISTINCT[employee_id]),
	SUM([salary])
FROM [dbo].[employees]
GROUP BY [job_id]


-- Dans les fonctions d'agr�gation, COUNT presque toujours avec la cl� primaire.
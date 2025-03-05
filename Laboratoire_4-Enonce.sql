-- ==============================================================================
-- Description du cours : Introduction au bases de données
-- Code du cours : 420-212-MV
-- Laboratoire 4
-- La clause HAVING et les fonctions

-- Objectif : 
-- Ce Laboratoire vise à acquérir les compétences suivantes
-- ========================================================
-- Les conditions sur les groupes : la clause HAVING
-- Les fonctions :
-- -- de chaines de caractères 
-- -- de date
-- -- Numériques
-- -- de conversion
-- -- de formatage

-- Base de données à utiliser : xtremefr
-- ----------------------------------

--  
-- Les fonctions de manipulation de chaines de caractères
-- La concaténation : CONCAT
-- L'extraction de sous chaine à gauche d'une chaine : LEFT
-- L'extraction de sous chaine à droite d'une chaine : RIGHT
-- Longueur d'une chaine : LEN
-- Posotion d'un caractère dans une chaine : CHARINDEX
-- L'extraction d'une sous chaine : SUBSTRING
--
-- Requête 1
-- Écrire une requete qui affiche la liste des employés en concaténant le nom et le prénom 
-- des employés séparés par une virgule et un espace. 
-- On affichera :
-- Le mom
-- Le prénom
-- Le nom complet

--SELECT [Nom],
--	   [Prénom],
--	   [Nom] + ', ' + [Prénom] NomComplet
--FROM [dbo].[Employés]

SELECT [Nom],
	   [Prénom],
	   CONCAT([Nom], ', ', [Prénom]) NomComplet
FROM[dbo].[Employés]


-- ---------
-- Requête 2
-- Écrire une requête qui affiche les trois premiers caractères du numéro de sécurité sociale
-- ainsi que les 4 derniers caractères du numéro de sécurité sociale
-- On affichera les mêmes colonnes que la requete précédente plus:
-- Le code sécu (qui représente les premiers caractères ,du numéro de sécurité sociale
-- le code secteur

SELECT [Nom],
	   [Prénom],
	   CONCAT([Nom], ', ', [Prénom]) NomComplet,
	   [Numéro de sécurité sociale],
	   LEFT([Numéro de sécurité sociale], 3) CodeSecu,
	   RIGHT([Numéro de sécurité sociale], 3) CodeSecteur
FROM[dbo].[Employés]


-- ---------
-- Requête 3 
-- Écrire une requête qui affiche la longueur du numéro de téléphone de l'employé
-- On affichera les mêmes colonnes que la requête précédente plus:
-- Le telphone
-- la longueur du numéro de téléphone

SELECT [Nom],
	   [Prénom],
	   CONCAT([Nom], ', ', [Prénom]) NomComplet,
	   [Numéro de sécurité sociale],
	   LEFT([Numéro de sécurité sociale], 3) CodeSecu,
	   RIGHT([Numéro de sécurité sociale], 3) CodeSecteur,
	   [Téléphone personnel],
	   LEN([Téléphone personnel]) LongueurNbDeTelefon
FROM[dbo].[Employés]


-- --------- 
-- Requête 4
-- Utilisation de la fonction CHARINDEX()
-- Écrire une requete qui affiche la position du caractère @ dans la colonne courriel du client
-- On affichera :
-- Le nom du client
-- Le nom complet du contact
-- Le téléphone
-- Le courriel
-- La position du caractère @

SELECT [Nom du client],
	   CONCAT([Nom du contact], ', ', [Prénom du contact]) NomComplet,
	   [Téléphone],
	   [Adresse électronique],
	   CHARINDEX('@', [Adresse électronique]) AS PositionCaractere,
	   LEFT([Adresse électronique], CHARINDEX('@', [Adresse électronique]) -1) UserName
FROM [dbo].[Clients]

-- ----------
-- Requête 5
-- Modifier la requête précédente en rajoutant le nom de domaine du client
-- c'est a dire la partie après @ dans le courriel.
-- On affichera en plus des colonnes précédentes :
-- Le nom de domaine

SELECT [Nom du client],
	   CONCAT([Nom du contact], ', ', [Prénom du contact]) NomComplet,
	   [Téléphone],
	   [Adresse électronique],
	   CHARINDEX('@', [Adresse électronique]) AS PositionCaractere,
	   RIGHT([Adresse électronique], LEN([Adresse électronique]) - CHARINDEX('@', [Adresse électronique])) DomainName
FROM [dbo].[Clients]


-- ----------
-- Requête 6
-- Modifier la requête précédente en rajoutant le nom de domaine du client
-- en utilisant la fonction SUBSTRING(chaine, position, longueur)
-- c'est a dire la partie après @ dans le courriel.
-- On affichera en plus des colonnes précédentes :
-- Le nom de domaine 2

SELECT [Nom du client],
	   CONCAT([Nom du contact], ', ', [Prénom du contact]) NomComplet,
	   [Téléphone],
	   [Adresse électronique],
	   CHARINDEX('@', [Adresse électronique]) AS PositionCaractere,
	   RIGHT([Adresse électronique], LEN([Adresse électronique]) - CHARINDEX('@', [Adresse électronique])) DomainName,
	   SUBSTRING([Adresse électronique],  CHARINDEX('@', [Adresse électronique]) + 1 , LEN([Adresse électronique]) - CHARINDEX('@', [Adresse électronique])) DomainName2
FROM [dbo].[Clients]


-- ----------
-- Requête 7
-- Conversion en majuscule UPPER et minuscule LOWER
-- Créer l'adresse courriel des employés de la compagnie xtreme
-- sous la forme initialPrenom.nom@xtreme.com
-- tout en minuscule

SELECT [Nom],
	   UPPER([Nom]) MajNom,
	   [Prénom] MinPrenom,
	   LOWER([Nom]) MinNom,
	   CONCAT([Nom], ', ', [Prénom]) NomComplet,
	   [Téléphone personnel],
	   LOWER(CONCAT(LEFT([Nom], 1), [Prénom], '.', [Nom], '@xtreme.com'))
FROM [dbo].[Employés]


-- ----------
-- Requête 8
-- Manipulation de dates
-- Fonctions de type Date/Heure
-- Utilisation des parties d'une date dans les calculs sur les dates
-- La fonction GETDATE() retourne la date du système
-- La fonction DATEPART(intervalle, date) retourne une partie de la date passée en parametre
-- La fonction FORMAT() formate une date (pas seulement les dates) en fonction des paramètres fournis
-- La fiocntion DATEADD() effectue une opération sur les dates en ajoutant une valeur à une partie de date
-- La foinction DATEDIFF() effectue une opération sur les dates en soustrayant deux dates
------------------------------------------------------------------------------------------

SELECT
	   GETDATE() DateJour,
	   YEAR(GETDATE()) Annee,
	   MONTH(GETDATE()) Mois,
	   DAY(GETDATE()) Jour,
	   DATENAME(MONTH, GETDATE()) MonthName,
	   DATENAME(QUARTER, GETDATE()) Trimester,
	   DATENAME(WEEKDAY, GETDATE()) DayOfTheWeek,
	   DATEPART(YEAR, GETDATE()) CurrentYear,
	   DATEPART(MONTH, GETDATE()) CurrentMonth,
	   DATEPART(DAY, GETDATE()) CurrentDay,
	   DATEDIFF(YEAR, '2003-01-01', GETDATE()) AgeYearGap,
	   DATEDIFF(Month, '2003-01-01', GETDATE()) AgeMonthGap,
	   DATEADD(DAY, 30, GETDATE()),
	   DATEADD(YEAR, 3, GETDATE())


-- ----------
-- Requête 9
-- Fonctions de conversion
-- CAST et CONVERT
-- Ces fonctions convertissent un type de données en un autre
-- ATTENTION, l'utilisation des opérateurs arithmétiques ' - ' et ' + ' avec les
-- fonctions CAST et CONVERT




-- ----------
-- Requête 10
-- Créer une requête qui calcule et affiche les informations suivantes : 
-- Calculer l'age de l'employé
-- Calculer l'ancienneté de l'employé
-- Calculer le salaire hebdomadaire des employés
-- Calculer l'indicatif régional du téléphone sachant que ce sont les 3 premiers caractères du téléphone
-- On affichera :
-- -- Le nom complet sous la forme Prénom, Nom
-- -- Le poste occupé
-- -- La date de naissance
-- -- L'age
-- -- La date d'embauche
-- -- L'ancienneté
-- -- Le salaire
-- -- Le salaire hebdomandaire avec 2 décimales
-- -- Le téléphone
-- -- Le code régional
-- -- Le numéro de sécu
-- La liste sera triée du plus ancien au plus nouveau

-- Votre code ici


-- --------
-- Conditions sur les regroupements. La clause HAVING
-- Requête 11
-- 
-- Écrire une requête qui affiche les classes de produits avec un prix moyen de produit supérieur à 100$.
-- On affichera : 
-- -- La classe du produit
-- -- Le prix moyen conseillé
--
-- Démarche :
-- -- Écrire la requête avec aggrégat en premier
-- -- Écrire la condition sur l'aggrégat ensuite.

SELECT [Classe du produit],
	   AVG([Prix conseillé]) PrixMoyen
FROM [dbo].[Produits]
GROUP BY [Classe du produit]
HAVING AVG([Prix conseillé]) > 100




-- -----------
-- Requête 12
--
-- Afficher les classes  de produits avec plus de 45 produits dans chaque classe.
-- On affichera la classe du produit et le nombre de produits dans chaque classe
--
-- Démarche :
-- -- Écrire la requête avec aggrégat en premier
-- -- Écrire la condition sur l'aggrégat ensuite.

-- Votre code ici



-- -------------
-- Requete 13 
--
-- Écrire une requête qui affiche les employés ayant traité plus de 350 commandes.
-- On affichera 
-- -- l'ID de l'employé, 
-- -- son nom ainsi que 
-- -- le nombre de commandes traitées
--
-- Démarche :
-- -- Écrire la requête avec aggrégat en premier
-- -- Écrire la condition sur l'aggrégat ensuite.

-- Ajouter une condition pour les employés qui relèvent du supérieur 2

-- Votre code ici


-- -------------------
-- Requête 14 
--
-- Écrire une requête qui affiche la liste des clients ayant passé plus de 3 commandes.
-- On affichera le nopm du client et le total de ses commandes
--
-- Démarche :
-- -- Écrire la requête avec aggrégat en premier
-- -- Écrire la condition sur l'aggrégat ensuite.

-- Votre code ici



-- Requête 15
--
-- Afficher les clients ayant dépensé plus de 5000$ au total.
-- On affichera : 
-- -- le nom du client
-- -- le total de ses commandes
--
-- Démarche :
-- -- Écrire la requête avec aggrégat en premier
-- -- Écrire la condition sur l'aggrégat ensuite.

-- Votre code ici

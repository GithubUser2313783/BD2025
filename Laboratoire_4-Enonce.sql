-- ==============================================================================
-- Description du cours : Introduction au bases de donn�es
-- Code du cours : 420-212-MV
-- Laboratoire 4
-- La clause HAVING et les fonctions

-- Objectif : 
-- Ce Laboratoire vise � acqu�rir les comp�tences suivantes
-- ========================================================
-- Les conditions sur les groupes : la clause HAVING
-- Les fonctions :
-- -- de chaines de caract�res 
-- -- de date
-- -- Num�riques
-- -- de conversion
-- -- de formatage

-- Base de donn�es � utiliser : xtremefr
-- ----------------------------------

--  
-- Les fonctions de manipulation de chaines de caract�res
-- La concat�nation : CONCAT
-- L'extraction de sous chaine � gauche d'une chaine : LEFT
-- L'extraction de sous chaine � droite d'une chaine : RIGHT
-- Longueur d'une chaine : LEN
-- Posotion d'un caract�re dans une chaine : CHARINDEX
-- L'extraction d'une sous chaine : SUBSTRING
--
-- Requ�te 1
-- �crire une requete qui affiche la liste des employ�s en concat�nant le nom et le pr�nom 
-- des employ�s s�par�s par une virgule et un espace. 
-- On affichera :
-- Le mom
-- Le pr�nom
-- Le nom complet

--SELECT [Nom],
--	   [Pr�nom],
--	   [Nom] + ', ' + [Pr�nom] NomComplet
--FROM [dbo].[Employ�s]

SELECT [Nom],
	   [Pr�nom],
	   CONCAT([Nom], ', ', [Pr�nom]) NomComplet
FROM[dbo].[Employ�s]


-- ---------
-- Requ�te 2
-- �crire une requ�te qui affiche les trois premiers caract�res du num�ro de s�curit� sociale
-- ainsi que les 4 derniers caract�res du num�ro de s�curit� sociale
-- On affichera les m�mes colonnes que la requete pr�c�dente plus:
-- Le code s�cu (qui repr�sente les premiers caract�res ,du num�ro de s�curit� sociale
-- le code secteur

SELECT [Nom],
	   [Pr�nom],
	   CONCAT([Nom], ', ', [Pr�nom]) NomComplet,
	   [Num�ro de s�curit� sociale],
	   LEFT([Num�ro de s�curit� sociale], 3) CodeSecu,
	   RIGHT([Num�ro de s�curit� sociale], 3) CodeSecteur
FROM[dbo].[Employ�s]


-- ---------
-- Requ�te 3 
-- �crire une requ�te qui affiche la longueur du num�ro de t�l�phone de l'employ�
-- On affichera les m�mes colonnes que la requ�te pr�c�dente plus:
-- Le telphone
-- la longueur du num�ro de t�l�phone

SELECT [Nom],
	   [Pr�nom],
	   CONCAT([Nom], ', ', [Pr�nom]) NomComplet,
	   [Num�ro de s�curit� sociale],
	   LEFT([Num�ro de s�curit� sociale], 3) CodeSecu,
	   RIGHT([Num�ro de s�curit� sociale], 3) CodeSecteur,
	   [T�l�phone personnel],
	   LEN([T�l�phone personnel]) LongueurNbDeTelefon
FROM[dbo].[Employ�s]


-- --------- 
-- Requ�te 4
-- Utilisation de la fonction CHARINDEX()
-- �crire une requete qui affiche la position du caract�re @ dans la colonne courriel du client
-- On affichera :
-- Le nom du client
-- Le nom complet du contact
-- Le t�l�phone
-- Le courriel
-- La position du caract�re @

SELECT [Nom du client],
	   CONCAT([Nom du contact], ', ', [Pr�nom du contact]) NomComplet,
	   [T�l�phone],
	   [Adresse �lectronique],
	   CHARINDEX('@', [Adresse �lectronique]) AS PositionCaractere,
	   LEFT([Adresse �lectronique], CHARINDEX('@', [Adresse �lectronique]) -1) UserName
FROM [dbo].[Clients]

-- ----------
-- Requ�te 5
-- Modifier la requ�te pr�c�dente en rajoutant le nom de domaine du client
-- c'est a dire la partie apr�s @ dans le courriel.
-- On affichera en plus des colonnes pr�c�dentes :
-- Le nom de domaine

SELECT [Nom du client],
	   CONCAT([Nom du contact], ', ', [Pr�nom du contact]) NomComplet,
	   [T�l�phone],
	   [Adresse �lectronique],
	   CHARINDEX('@', [Adresse �lectronique]) AS PositionCaractere,
	   RIGHT([Adresse �lectronique], LEN([Adresse �lectronique]) - CHARINDEX('@', [Adresse �lectronique])) DomainName
FROM [dbo].[Clients]


-- ----------
-- Requ�te 6
-- Modifier la requ�te pr�c�dente en rajoutant le nom de domaine du client
-- en utilisant la fonction SUBSTRING(chaine, position, longueur)
-- c'est a dire la partie apr�s @ dans le courriel.
-- On affichera en plus des colonnes pr�c�dentes :
-- Le nom de domaine 2

SELECT [Nom du client],
	   CONCAT([Nom du contact], ', ', [Pr�nom du contact]) NomComplet,
	   [T�l�phone],
	   [Adresse �lectronique],
	   CHARINDEX('@', [Adresse �lectronique]) AS PositionCaractere,
	   RIGHT([Adresse �lectronique], LEN([Adresse �lectronique]) - CHARINDEX('@', [Adresse �lectronique])) DomainName,
	   SUBSTRING([Adresse �lectronique],  CHARINDEX('@', [Adresse �lectronique]) + 1 , LEN([Adresse �lectronique]) - CHARINDEX('@', [Adresse �lectronique])) DomainName2
FROM [dbo].[Clients]


-- ----------
-- Requ�te 7
-- Conversion en majuscule UPPER et minuscule LOWER
-- Cr�er l'adresse courriel des employ�s de la compagnie xtreme
-- sous la forme initialPrenom.nom@xtreme.com
-- tout en minuscule

SELECT [Nom],
	   UPPER([Nom]) MajNom,
	   [Pr�nom] MinPrenom,
	   LOWER([Nom]) MinNom,
	   CONCAT([Nom], ', ', [Pr�nom]) NomComplet,
	   [T�l�phone personnel],
	   LOWER(CONCAT(LEFT([Nom], 1), [Pr�nom], '.', [Nom], '@xtreme.com'))
FROM [dbo].[Employ�s]


-- ----------
-- Requ�te 8
-- Manipulation de dates
-- Fonctions de type Date/Heure
-- Utilisation des parties d'une date dans les calculs sur les dates
-- La fonction GETDATE() retourne la date du syst�me
-- La fonction DATEPART(intervalle, date) retourne une partie de la date pass�e en parametre
-- La fonction FORMAT() formate une date (pas seulement les dates) en fonction des param�tres fournis
-- La fiocntion DATEADD() effectue une op�ration sur les dates en ajoutant une valeur � une partie de date
-- La foinction DATEDIFF() effectue une op�ration sur les dates en soustrayant deux dates
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
-- Requ�te 9
-- Fonctions de conversion
-- CAST et CONVERT
-- Ces fonctions convertissent un type de donn�es en un autre
-- ATTENTION, l'utilisation des op�rateurs arithm�tiques ' - ' et ' + ' avec les
-- fonctions CAST et CONVERT




-- ----------
-- Requ�te 10
-- Cr�er une requ�te qui calcule et affiche les informations suivantes : 
-- Calculer l'age de l'employ�
-- Calculer l'anciennet� de l'employ�
-- Calculer le salaire hebdomadaire des employ�s
-- Calculer l'indicatif r�gional du t�l�phone sachant que ce sont les 3 premiers caract�res du t�l�phone
-- On affichera :
-- -- Le nom complet sous la forme Pr�nom, Nom
-- -- Le poste occup�
-- -- La date de naissance
-- -- L'age
-- -- La date d'embauche
-- -- L'anciennet�
-- -- Le salaire
-- -- Le salaire hebdomandaire avec 2 d�cimales
-- -- Le t�l�phone
-- -- Le code r�gional
-- -- Le num�ro de s�cu
-- La liste sera tri�e du plus ancien au plus nouveau

-- Votre code ici


-- --------
-- Conditions sur les regroupements. La clause HAVING
-- Requ�te 11
-- 
-- �crire une requ�te qui affiche les classes de produits avec un prix moyen de produit sup�rieur � 100$.
-- On affichera : 
-- -- La classe du produit
-- -- Le prix moyen conseill�
--
-- D�marche :
-- -- �crire la requ�te avec aggr�gat en premier
-- -- �crire la condition sur l'aggr�gat ensuite.

SELECT [Classe du produit],
	   AVG([Prix conseill�]) PrixMoyen
FROM [dbo].[Produits]
GROUP BY [Classe du produit]
HAVING AVG([Prix conseill�]) > 100




-- -----------
-- Requ�te 12
--
-- Afficher les classes  de produits avec plus de 45 produits dans chaque classe.
-- On affichera la classe du produit et le nombre de produits dans chaque classe
--
-- D�marche :
-- -- �crire la requ�te avec aggr�gat en premier
-- -- �crire la condition sur l'aggr�gat ensuite.

-- Votre code ici



-- -------------
-- Requete 13 
--
-- �crire une requ�te qui affiche les employ�s ayant trait� plus de 350 commandes.
-- On affichera 
-- -- l'ID de l'employ�, 
-- -- son nom ainsi que 
-- -- le nombre de commandes trait�es
--
-- D�marche :
-- -- �crire la requ�te avec aggr�gat en premier
-- -- �crire la condition sur l'aggr�gat ensuite.

-- Ajouter une condition pour les employ�s qui rel�vent du sup�rieur 2

-- Votre code ici


-- -------------------
-- Requ�te 14 
--
-- �crire une requ�te qui affiche la liste des clients ayant pass� plus de 3 commandes.
-- On affichera le nopm du client et le total de ses commandes
--
-- D�marche :
-- -- �crire la requ�te avec aggr�gat en premier
-- -- �crire la condition sur l'aggr�gat ensuite.

-- Votre code ici



-- Requ�te 15
--
-- Afficher les clients ayant d�pens� plus de 5000$ au total.
-- On affichera : 
-- -- le nom du client
-- -- le total de ses commandes
--
-- D�marche :
-- -- �crire la requ�te avec aggr�gat en premier
-- -- �crire la condition sur l'aggr�gat ensuite.

-- Votre code ici

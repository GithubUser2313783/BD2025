-- ---------------------------------------------------------
-- Collège Marie Victorin
-- Introduction aux bases de données
-- Travaux dirigés 4
-- ---------------------------------------------------------

-- Série I
-- Base de données : xtremefr

-- Toute la série d’exercices utilisera la base de données xtremefr.

-- Requête 1
-- Table : Employés
-- Créez une requête qui affiche la liste des employés pour lesquels le « Poste occupé » est « représentant »
-- Les colonnes à afficher sont :
-- •	Nom
-- •	Prénom
-- •	Poste occupé
-- •	Date d’embauche
-- •	Téléphone personnel
-- •	Poste

SELECT [Nom],
	   [Prénom],
	   [Poste occupé] AS Représentant,
	   [Date d'embauche],
	   [Téléphone personnel],
	   [Poste]
FROM [dbo].[Employés]


-- Requête 2
-- Table : Employés
-- Créez une requête qui affiche les employés dont la « date d’embauche » est comprise entre le 01-01-1998 et le 31-12-1998
-- Les colonnes à afficher sont : 
-- •	Nom
-- •	Prénom
-- •	Poste occupé
-- •	Date d’embauche
-- •	Téléphone personnel

SELECT [Nom],
	   [Prénom],
	   [Poste occupé] AS Représentant,
	   [Date d'embauche],
	   [Téléphone personnel]
FROM [dbo].[Employés]
WHERE [Date d'embauche] BETWEEN '1998-01-01' AND '1998-12-31'

 
-- Requête 3
-- Table : Employés
-- Créez une requête qui affiche les employés dont le « Téléphone personnel » commence par 206555.
-- Les colonnes à afficher sont : 
-- •	Nom
-- •	Prénom
-- •	Poste occupé
-- •	Téléphone personnel

SELECT [Nom],
	   [Prénom],
	   [Poste occupé] AS représentant,
	   [Téléphone personnel]
FROM [dbo].[Employés]
WHERE [Téléphone personnel] LIKE '206555%'


-- Requête 4
-- Table : Employés
-- Créez une requête qui affiche la liste des employés dont la « Date de naissance » est  supérieure au 01-01-1979 et dont la « Date d’embauche » est supérieure à 01-01-1997.
-- Les colonnes à afficher sont : 
-- •	Nom
-- •	Prénom
-- •	Poste occupé
-- •	Date d’embauche
-- •	Date naissance

SELECT [Nom],
	   [Prénom],
	   [Poste occupé] AS représentant,
	   [Date d'embauche],
	   [Date de naissance]
FROM [dbo].[Employés]
WHERE [Date de naissance] > '1979-01-01' AND [Date d'embauche] > '1997-01-01'


-- Requête 5
-- Table : Employés
-- Créez une requête qui affiche la liste des employés dont le « Poste occupé » est « directeur commercial » et dont la « date d’embauche » est comprise entre 01-01-1998 et 31-12-1998.
-- Les colonnes à afficher sont : 
-- •	Nom
-- •	Prénom
-- •	Poste occupé
-- •	Date d’embauche

SELECT [Nom],
	   [Prénom],
	   [Poste occupé] AS 'Directeur Commercial',
	   [Date d'embauche]
FROM [dbo].[Employés]
WHERE [Date d'embauche] BETWEEN '1998-01-01' AND '1998-12-31'

 
-- Requête 6
-- Table : Employés
-- Créez une requête qui affiche la liste des employés dont la personne à contacter en cas d’urgence est l’épouse. 
-- Les colonnes à afficher sont : 
-- •	Nom
-- •	Prénom
-- •	Poste occupé
-- •	En cas d'urgence - Lien de parenté

SELECT [Nom],
	   [Prénom],
	   [Poste occupé] AS représentant,
	   [En cas d'urgence - Lien de parenté]
FROM [dbo].[Employés]
WHERE [En cas d'urgence - Lien de parenté] IN ('Epouse')


-- Requête 7
-- Table : Clients
-- Créer une requête qui affiche la liste des clients dont le « Poste occupé » du contact est dans les ventes.
-- Les colonnes à afficher sont :
-- •	Nom du client
-- •	Nom du contact
-- •	Prénom du contact
-- •	Poste occupé

SELECT [Nom du client],
	   [Nom du contact],
	   [Prénom du contact],
	   [Poste occupé]
FROM [dbo].[Clients]
WHERE [Poste occupé] LIKE '%vente%'

-- Requête 8
-- Table : Clients
-- Créez une requête qui affiche la liste des clients dont le « Pays » est « France », « Italie » et « Canada »
-- Les colonnes à afficher sont :
-- •	Nom du client
-- •	Nom du contact
-- •	Prénom du contact
-- •	Pays

SELECT [Nom du client],
	   [Nom du contact],
	   [Prénom du contact],
	   [Pays]
FROM [dbo].[Clients]
WHERE [Pays] IN ('France', 'Italie', 'Canada')


-- Requête 9
-- Table : Clients
-- Créez une requête qui affiche la liste des clients dont le « Pays » est « France » et la « Région » est « Nord Pas de Calais » ou « Pays » est « Etats-Unis » et « Ville » est « Kingston »
-- Les colonnes à afficher sont :
-- •	Nom du client
-- •	Nom du contact
-- •	Prénom du contact
-- •	Pays
-- •	Région
-- •	Ville

SELECT [Nom du client],
	   [Nom du contact],
	   [Prénom du contact],
	   [Pays],
	   [Région],
	   [Ville]
FROM [dbo].[Clients]
WHERE [Pays] IN ('France') AND [Région] IN ('Nord Pas-de-Calais') OR [Pays] IN ('Etats-Unis d''Amérique') AND [Ville] IN ('Kingston')


-- Requête 10
-- Table : Clients
-- Créez une requête qui affiche la liste des clients dont on ne connaît pas le « Code postal ». 
-- Les colonnes à afficher sont :
-- •	Nom du client
-- •	Nom du contact
-- •	Prénom du contact
-- •	Pays
-- •	Code postal

SELECT [Nom du client],
	   [Nom du contact],
	   [Prénom du contact],
	   [Pays],
	   [Code postal]
FROM [dbo].[Clients]
WHERE [Code postal] IS NULL


-- Requête 11
-- Table : Clients
-- Créez une requête qui affiche la liste des clients de France, Allemagne, du Italie et dont les « ventes de l’année dernière » sont comprises entre 10 000 et 60 000
-- Les colonnes à afficher sont :
-- •	Nom du client
-- •	Nom du contact
-- •	Prénom du contact
-- •	Pays
-- •	Code postal

SELECT [Nom du client],
	   [Nom du contact],
	   [Prénom du contact],
	   [Pays],
	   [Ventes de l'année dernière]
FROM [dbo].[Clients]
WHERE [Pays] IN ('France', 'Allemagne', 'Italie') AND [Ventes de l'année dernière] BETWEEN 10000 AND 60000
 
-- Requête 12
-- Table : Détails des commandes
-- Créez une requête qui affiche la liste des commandes des clients 1002, 1012 et 1831.
-- Trier la liste par numéro de commande.
-- Les colonnes à afficher sont :
-- •	ID Commande
-- •	ID produit
-- •	Prix unitaire
-- •	Quantité

SELECT *
FROM [dbo].[Détails des commandes]
WHERE [ID commande] IN ('1002', '1012', '1831')


-- Requête 13
-- Table : Détails des commandes
-- Créez une requête qui affiche le Prix total de chaque ligne de commande de chaque commande. Le Prix total est un champ virtuel qui n’existe pas dans la table.
-- Les colonnes à afficher sont :
-- •	ID Commande
-- •	Prix unitaire
-- •	Quantité
-- •	Prix Total

SELECT 
	 [ID commande],
	 [Prix unitaire],
	 [Quantité],
	 [Prix unitaire] * [Quantité] PrixTotal
FROM [dbo].[Détails des commandes]
WHERE [ID commande] IN ('1002', '1012', '1831')

-- Dans un modèle relationnelle, le nombre de jointures est inférieure d'une unité au nombre de tables.
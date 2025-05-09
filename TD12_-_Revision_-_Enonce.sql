-- ---------------------------------------------------------
-- Collège Marie Victorin
-- Introduction aux bases de données
-- Révision
-- ---------------------------------------------------------

-- Série I :  les conditions (Clause WHERE)
-- Base de données : xtremefr

---- Créez une requête qui affiche les employés nés les dix derneirs jours du mois
-- Les colonnes à afficher sont : 
-- •	Nom
-- •	Prénom
-- •	Poste occupé
-- •	Date de naissance
-- •	Téléphone personnel

SELECT [Nom],
	   [Prénom],
	   [Poste Occupé],
	   [Date de naissance],
	   [Téléphone personnel]
FROM [dbo].[Employés]
WHERE DAY([Date de naissance]) BETWEEN 20 AND 31


---- Créez une requête qui affiche les employés embauché le premier mois de l'année.
-- Les colonnes à afficher sont : 
-- •	Nom
-- •	Prénom
-- •	Poste occupé
-- •	Date d'embauche
-- •	Téléphone personnel

SELECT [Nom],
	   [Prénom],
	   [Poste Occupé],
	   [Date d'embauche],
	   [Téléphone personnel]
FROM [dbo].[Employés]
WHERE MONTH([Date d'embauche]) LIKE 1

---- Créez une requête qui affiche les employés qui sont des directeurs
-- Les colonnes à afficher sont : 
-- •	Nom
-- •	Prénom
-- •	Poste occupé
-- •	Téléphone personnel

SELECT [Nom],
	   [Prénom],
	   [Poste Occupé],
	   [Téléphone personnel]
FROM [dbo].[Employés]
WHERE [Poste occupé] LIKE 'Directeur%'


---- Créez une requête qui affiche la liste des représentants ainsi que leur age et leur ancienneté
-- Les colonnes à afficher sont : 
-- •	Nom
-- •	Prénom
-- •	Poste occupé
-- •	Téléphone personnel
-- •	Age
-- •	Ancienneté

SELECT [Nom],
	   [Prénom],
	   [Poste Occupé],
	   [Téléphone personnel],
	   DATEDIFF(YEAR, [Date de naissance], GETDATE()) Age,
	   DATEDIFF(YEAR, [Date d'embauche], GETDATE()) Ancienneté
FROM [dbo].[Employés]

---- Créez une requête qui affiche la liste des employés qui ont pour contact en cas d'urgence le père ou la mère
-- Les colonnes à afficher sont : 
-- •	Nom
-- •	Prénom
-- •	Poste occupé
-- •	Téléphone personnel
-- •	Lien de parenté

SELECT [Nom],
	   [Prénom],
	   [Poste Occupé],
	   [Téléphone personnel],
	   [En cas d'urgence - Lien de parenté]
FROM [dbo].[Employés]
WHERE [En cas d'urgence - Lien de parenté] IN ('Père', 'Mère')

---- Créez une requête qui affiche la liste des employés qui relèvent de l'employé qui n'a pas de supérieur hiérarchique.
-- Les colonnes à afficher sont : 
-- •	Nom
-- •	Prénom
-- •	Poste occupé
-- •	Supérieur hiérarchique

SELECT [Nom],
	   [Prénom],
	   [Poste Occupé],
	   [Supérieur hiérarchique]
FROM [dbo].[Employés]
WHERE [Supérieur hiérarchique] IS NULL

-- ------------------------------------------------------------------------------------------------------------------------
-- Sderie II

-- Afficher la liste des clients ayant acheté des produits valant plus de 500$
-- On affichera :
-- Le nom du client
-- La catégorie
-- Le nom du produit
-- Le prix unitaire
-- La quantité
-- La date de la commande
-- La liste sera triée par le nom du client et le nom du produit.

-- Votre code ici

SELECT [Nom du client],
	   [Nom du type de produit],
	   [Nom du produit],
	   [Prix unitaire],
	   [Quantité],
	   [Date de commande]
FROM [dbo].[Clients]
JOIN [dbo].[Commandes] ON [dbo].[Commandes].[ID client] = [dbo].[Clients].[ID client]
JOIN [dbo].[Détails des commandes] ON [dbo].[Détails des commandes].[ID commande] = [dbo].[Commandes].[ID commande]
JOIN [dbo].[Produits] ON [dbo].[Produits].[ID produit] = [dbo].[Détails des commandes].[ID produit]
JOIN [dbo].[Types de produit] ON [dbo].[Types de produit].[ID type de produit] = [dbo].[Produits].[ID type de produit]
WHERE [Prix unitaire] * [Quantité] > 500
ORDER BY [Nom du client], [Nom du produit]



-- -----------------------------------------------------------------
-- Créer une vue qui contient les données de la requête précédente
-- -----------------------------------------------------------------
-- Votre code ici


-- -------------------------------------------------------------------------------------------------------------------------------
-- Maintenant, on veut savoir combien de fois chaque client a acheté le même produit ainsi que la quantité totale et coût total de ce produit
-- On affichera :
-- Le nom du client
-- Le nom du produit
-- Le nombre de fois que le produit a été acheté
-- La quantité totale achetée
-- Le montant total acheté

-- Votre code ici


-- --------------------------------------------------------------------------
-- Créer la table tblStatsClients contenant les données calculées plus haut

-- Votre code ici


-- ---------------------------------------------------
-- Afficher la liste des 10 meilleurs clients

-- Votre code ici


-- --------------------------------------------------------
-- Afficher la liste des 10 produits les plus profitables

-- Votre code ici

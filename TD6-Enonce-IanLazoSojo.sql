-- ---------------------------------------------------------
-- Collège Marie Victorin
-- Introduction aux bases de données
-- Travaux dirigés 6
-- Les requêtes multitables
-- ---------------------------------------------------------

-- Base de données : Xtreme

-- En utilisant la base de données Xtreme créer les requêtes qui correspondent aux énoncés suivants.

-- Requête 1
-- Écrire une requête qui affiche la liste des clients non nord-américains, propriétaires et qui ont acheté l’année dernière pour moins de 50 000 eur. 
-- La liste sera triée en ordre croissant par pays et en ordre décroissant du montant d’achat.
-- On affichera : 
-- le nom du client
-- le poste occupé par le contact chez le client
-- les ventes de l’année dernière
-- l’adresse courriel
-- le téléphone
-- Pays

SELECT [Nom du client],
	   [Poste occupé],
	   [Ventes de l'année dernière],
	   [Adresse électronique],
	   [Téléphone],
	   [Pays]
FROM [dbo].[Clients]
WHERE [Poste occupé] LIKE 'Propriétaire' AND [Pays] NOT IN ('Etats-Unis d''Amérique', 'Canada')


-- ---------
-- Requête 2
-- Écrire une requête qui afficher la liste des employés qui habitent en France ainsi que ceux qui habitent à London au Royaume uni.
-- On affichera : 
-- le nom, 
-- Le prénom
-- le poste occupé 
-- la ville et le pays de résidence

SELECT [Nom du contact],
	   [Prénom du contact],
	   [Poste occupé],
	   [Ville],
	   [Pays]
FROM [dbo].[Clients]
WHERE [Pays] IN ('France') OR [Ville] IN ('London')



-- ---------
-- Requête 3
-- Écrire une requête qui affiche les produits dont les seuils d’approvisionnement sont de 50 et 100.
-- On affichera 
-- le nom du produit
-- le fournisseur 
-- le seuil d’approvisionnement.

SELECT [Nom du produit],
	   [Nom du fournisseur],
	   [Seuil de réapprovisionnement]
FROM [dbo].[Produits]
JOIN [dbo].[Fournisseurs] ON [dbo].[Produits].[ID fournisseur] = [dbo].[Fournisseurs].[ID fournisseur]
JOIN [dbo].[Achats] ON [dbo].[Produits].[ID produit] = [dbo].[Achats].[ID produit]


-- ---------
-- Requête 4
-- Écrire une requête qui affiche les commandes dont le montant est supérieur à 2500. 
-- La liste affichera le montant des commandes les élevés en premier
-- On affichera : 
-- le nom des produits commandés
-- le client qui les a commandés 
-- le représentant qui l’a servi.

SELECT [Nom du produit]
FROM [dbo].[Produits]


-- ---------
-- Requête 5
-- Écrire une requête qui affiche le total des ventes par types de produits 
-- La liste sera triée par le type le plus vendu en terme de revenus
-- On affichera : 
-- le nom du type du produit
-- les ventes réalisées.

SELECT [Nom du type de produit],
	   [Unités en commande]
FROM [dbo].[Types de produit]
JOIN[dbo].[Produits] ON [dbo].[Types de produit].[ID type de produit] = [dbo].[Produits].[ID type de produit]
JOIN [dbo].[Achats] ON [dbo].[Produits].[ID produit] = [dbo].[Achats].[ID produit]
ORDER BY [Unités en commande] DESC

-- ---------
-- Requête 6
-- Écrire une requête qui affiche les 10 produits ayant été le moins vendus en terme de quantité.
-- On affichera : 
-- le nom du produit
-- le nombre total d’unités vendues.

SELECT [Nom du produit],
	   [Unités en commande]
FROM [dbo].[Types de produit]
JOIN [dbo].[Produits] ON [dbo].[Types de produit].[ID type de produit] = [dbo].[Produits].[ID type de produit]
JOIN [dbo].[Achats] ON [dbo].[Produits].[ID produit] = [dbo].[Achats].[ID produit]
ORDER BY [Unités en commande] DESC


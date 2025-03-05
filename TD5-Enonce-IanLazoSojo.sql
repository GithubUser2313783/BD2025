-- ---------------------------------------------------------
-- Collège Marie Victorin
-- Introduction aux bases de données
-- Travaux dirigés 5
-- ---------------------------------------------------------

-- Base de données : Xtreme

-- En utilisant la base de données Xtreme créer les requêtes qui correspondent aux énoncés suivants.

-- Requête 1
-- Table : Commandes
-- Écrire une requête qui affiche les commandes en retard.
-- Une commande est considérée en retard lorsqu’elle a été expédiée après la date convenue (Date de besoin dans notre cas). Ce champ virtuel nous dit de combien de jours la commande est en retard.
-- On affichera les colonnes suivantes
-- * L'ID commande
-- * La date d'expédition
-- * La date de besoin
-- * Le montant de la commande
-- * Le numéro de commande
-- * Le nombre de jours de retard

SELECT
	[ID commande],
	[Date d'expédition],
	[Date de besoin],
	[Montant commande],
	[Numéro de commande],
	DATEDIFF(day, [Date d'expédition], [Date de besoin]) AS JoursRetard
FROM [dbo].[Commandes]



-- Requête 2
-- Table : Commandes
-- Écrire une requête qui affiche les commandes dont la date d’expédition est inférieure à la date de besoin mais qui n’ont pas encore été expédiée.
-- On affichera les colonnes suivanates :
-- •	L’ID Commande
-- •	Montant de la commande
-- •	Date de besoin
-- •	Date d’expédition
-- •	Commande expédiée

SELECT
	[ID commande],
	[Montant commande],
	[Date d'expédition],
	[Date de besoin],
	[Numéro de commande],
	[Commande expédiée]
FROM [dbo].[Commandes]
WHERE [Date d'expédition] < [Date de besoin] AND [Commande expédiée] < 1


-- Requête 3
-- Table : Commandes
-- Écrire une requête qui affiche les commandes qui ne sont pas en retard et pour lesquelles aucun paiement n’a encore été reçu.
-- On affichera les colonnes suivanates :
-- •	L’ID Commande
-- •	Montant de la commande
-- •	Date de besoin
-- •	Date d’expédition

SELECT
	[ID commande],
	[Montant commande],
	[Date de besoin],
	[Date d'expédition],
	[Paiement reçu]
FROM [dbo].[Commandes]
WHERE [Date de besoin] > [Date d'expédition]  AND [Paiement reçu] = 0




-- Requête 4
-- Table : Commandes
-- Écrire une requête qui affiche le nombre et le montant total des commandes de chaque client. Pour faire cette requête, utilisez l’[ID Commande] et non [Numéro de commande]
-- L'Affichage devra montrer les clients dont le montant total des commandes en premier.
-- On affichera les colonnes suivanates :
-- •	L’ID du client
-- •	Le nombre de commandes
-- •	Le total des ses commandes

SELECT
	SUM([Montant commande]) TotalDesCommandes,
	[ID client],
	COUNT(DISTINCT[ID commande]) NbrDeCommandes
FROM [dbo].[Commandes]
GROUP BY [ID client]




-- Requête 4-bis
-- Table : Commandes
-- Modifier la requête précédente en affichant le nombre de commandes et le montant total des commandes traité par chaque employé
-- On affichera les colonnes suivanates :
-- •	l'ID de l'employé
-- •	Le nombre de commandes
-- •	Le chiffre d'affaires réalisé

SELECT
	[ID employé],
	COUNT(DISTINCT[ID commande]) NbrDeCommandes,
	SUM([Montant commande]) TotalDesCommandes
FROM [dbo].[Commandes]
GROUP BY [ID employé]


-- Requête 5
-- Table : Clients
-- Écrire une requête qui affecte une remise de 5% aux clients dont les commandes de l’année dernière sont supérieures ou égales à 100 000.
-- On affichera les colonnes suivanates :
-- •	Le nom du client
-- •	Les ventes de l'année dernière
-- *	Le pourcentage de la remise
-- •	Le montant de la remise

SELECT
	[Nom du client],
	[Ventes de l'année dernière],
	[Ventes de l'année dernière] * 0.05 Remise,
	[Ventes de l'année dernière] - [Ventes de l'année dernière] * 0.05 MontantDeRemise
FROM [dbo].[Clients]
WHERE [Ventes de l'année dernière] <= 100000




-- Requête 6
-- Table : Achats
-- Écrire une requête qui affiche les produits qui ne sont pas en commande.
-- On affichera les colonnes suivantes :
-- •	ID Produit
-- •	Unités en commande
-- •	Unités en stock
-- •	Seuil de réapprovisonnement
-- •	Numéro de commande

SELECT 
	[ID produit],
	[Unités en commande],
	[Unités en stock],
	[Seuil de réapprovisionnement],
	[Numéro de commande]
FROM [dbo].[Achats]
WHERE [Numéro de commande] IS NULL


-- Requête 7
-- Table : Achats
-- Écrire une requête qui affiche les produits qui doivent être réapprovisionnés et la nouvelle quantité en stock après le réapprovisionnement

-- Précisions
-- ==========
-- Unités en commande : C’est la quantité du produit commandée auprès des fournisseurs par l'entreprise
-- Unités en stock : C’est la quantité du produit restant en stock
-- Seuil de réappro : C’est seuil à partir duquel on doit réapprovisionner le produit
-- On affichera les colonnes suivanates :
-- •	ID Produit
-- •	Unités en stock
-- •	Seuil de réapprovisionnement
-- •	Unités en commande
-- •	Nouveau stock

SELECT 
	[ID produit],
	[Unités en stock],
	[Seuil de réapprovisionnement],
	[Unités en commande],
	[Unités en stock] + [Unités en commande] NouveauStock
FROM [dbo].[Achats]
WHERE [Seuil de réapprovisionnement] > [Unités en stock]




-- Requête 8
-- Table  : ici vous devez déterminer la table qui contient les informations pour écrire la requête.
-- Écrite une requête qui affiche le nombre de commandes en retard livrées par chaque transporteur.
-- La liste sera triée par Transporteur
-- On affichera les colonnes suivanates :
-- •	Le nom du transporteur
-- •	Nombre de commandes
-- •	La Moyenne des commandes

SELECT
	[Transporteur],
	[ID commande],
	[Montant commande]
	[Date de besoin],
	[Date d'expédition]
FROM [dbo].[Commandes]
WHERE [Date de besoin] < [Date d'expédition]



-- Requête 9
-- Table  : ici vous devez déterminer la table qui contient les informations pour écrire la requête
-- Écrire une requête qui affiche les commandes n’ayant pas de numéro de commande, (pas l’ID Commande) et qui doivent être réapprovisionnés.
-- On affichera les colonnes suivantes :
-- •	ID du Produit
-- •	Unités en commande
-- •	Unités en stock
-- •	Numéro de commande
-- •	Le seuil de réapprovisionnement
-- •	

SELECT 
	[ID produit],
	[Unités en commande],
	[Unités en stock],
	[Seuil de réapprovisionnement],
	[Numéro de commande]
FROM [dbo].[Achats]
WHERE [Seuil de réapprovisionnement] > [Unités en stock] AND [Numéro de commande] IS NULL



-- Requête 10
-- Table  : ici vous devez déterminer la table qui contient les informations pour écrire la requête
-- Écrire une requête qui affiche le nombre et la moyenne des ventes réalisées par chaque employé.
-- On affichera les colonnes suivantes :
-- •	Le numéro de l’employé
-- •	Le nombre de ventes
-- •	La moyenne des ventes

SELECT
	DISTINCT[ID employé],
	COUNT(DISTINCT[ID commande]) NombreDeVentes,
	AVG([Montant commande]) MoyenneDesVentes
FROM [dbo].[Commandes]
GROUP BY [ID employé]

-- Requête 11
-- Créez une requête qui affiche les statistiques de commandes pour les produits valant plus de 100$.
-- La liste affichera les statistiques des plus grosses commandes en premier.
-- On affichera les colonnes suivanates :
-- •	Le nombre de produits par commande
-- •	Quantité commandée par commande
-- •	Le montant total de chaque commande

SELECT [ID commande],
	   COUNT([ID commande]) NombreDeProduits,
	   SUM([Quantité]) QuantitéCommandé,
	   SUM([Quantité] * [Prix unitaire]) MontantTotal
FROM [dbo].[Détails des commandes]
WHERE [Prix unitaire] > 100
GROUP BY [ID commande]

 

-- Requête 12
-- Modifiez la requête précédente pour afficher les 10 produits les plus rentables.

SELECT [ID commande],
	   COUNT([ID commande]) NombreDeProduits,
	   SUM([Quantité]) QuantitéCommandé,
	   SUM([Quantité] * [Prix unitaire]) MontantTotal
FROM [dbo].[Détails des commandes]
WHERE [Prix unitaire] > 100
GROUP BY [ID commande] 


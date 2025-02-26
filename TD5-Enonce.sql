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

-- Votre code ici



-- Requête 2
-- Table : Commandes
-- Écrire une requête qui affiche les commandes dont la date d’expédition est inférieure à la date de besoin mais qui n’ont pas encore été expédiée.
-- On affichera les colonnes suivanates :
-- •	L’ID Commande
-- •	Montant de la commande
-- •	Date de besoin
-- •	Date d’expédition
-- •	Commande expédiée

-- Votre code ici



-- Requête 3
-- Table : Commandes
-- Écrire une requête qui affiche les commandes qui ne sont pas en retard et pour lesquelles aucun paiement n’a encore été reçu.
-- On affichera les colonnes suivanates :
-- •	L’ID Commande
-- •	Montant de la commande
-- •	Date de besoin
-- •	Date d’expédition

-- Votre code ici



-- Requête 4
-- Table : Commandes
-- Écrire une requête qui affiche le nombre et le montant total des commandes de chaque client. Pour faire cette requête, utilisez l’[ID Commande] et non [Numéro de commande]
-- L'Affichage devra montrer les clients dont le montant total des commandes en premier.
-- On affichera les colonnes suivanates :
-- •	L’ID du client
-- •	Le nombre de commandes
-- •	Le total des ses commandes

-- Votre code ici



-- Requête 4-bis
-- Table : Commandes
-- Modifier la requête précédente en affichant le nombre de commandes et le montant total des commandes traité par chaque employé
-- On affichera les colonnes suivanates :
-- •	l'ID de l'employé
-- •	Le nombre de commandes
-- •	Le chiffre d'affaires réalisé

-- Votre code ici



-- Requête 5
-- Table : Clients
-- Écrire une requête qui affecte une remise de 5% aux clients dont les commandes de l’année dernière sont supérieures ou égales à 100 000.
-- On affichera les colonnes suivanates :
-- •	Le nom du client
-- •	Les ventes de l'année dernière
-- *	Le pourcentage de la remise
-- •	Le montant de la remise

-- Votre code ici



-- Requête 6
-- Table : Achats
-- Écrire une requête qui affiche les produits qui ne sont pas en commande.
-- On affichera les colonnes suivantes :
-- •	ID Produit
-- •	Unités en commande
-- •	Unités en stock
-- •	Seuil de réapprovisonnement
-- •	Numéro de commande

-- Votre code ici



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

-- Votre code ici



-- Requête 8
-- Table  : ici vous devez déterminer la table qui contient les informations pour écrire la requête.
-- Écrite une requête qui affiche le nombre de commandes en retard livrées par chaque transporteur.
-- La liste sera triée par Transporteur
-- On affichera les colonnes suivanates :
-- •	Le nom du transporteur
-- •	Nombre de commandes
-- •	La Moyenne des commandes

-- Votre code ici



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

-- Votre code ici



-- Requête 10
-- Table  : ici vous devez déterminer la table qui contient les informations pour écrire la requête
-- Écrire une requête qui affiche le nombre et la moyenne des ventes réalisées par chaque employé.
-- On affichera les colonnes suivantes :
-- •	Le numéro de l’employé
-- •	Le nombre de ventes
-- •	La moyenne des ventes

-- Votre code ici



-- Requête 11
-- Créez une requête qui affiche les statistiques de commandes pour les produits valant plus de 100$.
-- La liste affichera les statistiques des plus grosses commandes en premier.
-- On affichera les colonnes suivanates :
-- •	Le nombre de produits par commande
-- •	Quantité commandée par commande
-- •	Le montant total de chaque commande

-- Votre code ici

 

-- Requête 12
-- Modifiez la requête précédente pour afficher les 10 produits les plus rentables.
-- 


-- Votre code ici



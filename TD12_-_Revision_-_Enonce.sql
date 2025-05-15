-- ---------------------------------------------------------
-- Coll�ge Marie Victorin
-- Introduction aux bases de donn�es
-- R�vision
-- ---------------------------------------------------------

-- S�rie I :  les conditions (Clause WHERE)
-- Base de donn�es : xtremefr

---- Cr�ez une requ�te qui affiche les employ�s n�s les dix derneirs jours du mois
-- Les colonnes � afficher sont : 
-- �	Nom
-- �	Pr�nom
-- �	Poste occup�
-- �	Date de naissance
-- �	T�l�phone personnel

SELECT [Nom],
	   [Pr�nom],
	   [Poste Occup�],
	   [Date de naissance],
	   [T�l�phone personnel]
FROM [dbo].[Employ�s]
WHERE DAY([Date de naissance]) BETWEEN 20 AND 31


---- Cr�ez une requ�te qui affiche les employ�s embauch� le premier mois de l'ann�e.
-- Les colonnes � afficher sont : 
-- �	Nom
-- �	Pr�nom
-- �	Poste occup�
-- �	Date d'embauche
-- �	T�l�phone personnel

SELECT [Nom],
	   [Pr�nom],
	   [Poste Occup�],
	   [Date d'embauche],
	   [T�l�phone personnel]
FROM [dbo].[Employ�s]
WHERE MONTH([Date d'embauche]) LIKE 1

---- Cr�ez une requ�te qui affiche les employ�s qui sont des directeurs
-- Les colonnes � afficher sont : 
-- �	Nom
-- �	Pr�nom
-- �	Poste occup�
-- �	T�l�phone personnel

SELECT [Nom],
	   [Pr�nom],
	   [Poste Occup�],
	   [T�l�phone personnel]
FROM [dbo].[Employ�s]
WHERE [Poste occup�] LIKE 'Directeur%'


---- Cr�ez une requ�te qui affiche la liste des repr�sentants ainsi que leur age et leur anciennet�
-- Les colonnes � afficher sont : 
-- �	Nom
-- �	Pr�nom
-- �	Poste occup�
-- �	T�l�phone personnel
-- �	Age
-- �	Anciennet�

SELECT [Nom],
	   [Pr�nom],
	   [Poste Occup�],
	   [T�l�phone personnel],
	   DATEDIFF(YEAR, [Date de naissance], GETDATE()) Age,
	   DATEDIFF(YEAR, [Date d'embauche], GETDATE()) Anciennet�
FROM [dbo].[Employ�s]

---- Cr�ez une requ�te qui affiche la liste des employ�s qui ont pour contact en cas d'urgence le p�re ou la m�re
-- Les colonnes � afficher sont : 
-- �	Nom
-- �	Pr�nom
-- �	Poste occup�
-- �	T�l�phone personnel
-- �	Lien de parent�

SELECT [Nom],
	   [Pr�nom],
	   [Poste Occup�],
	   [T�l�phone personnel],
	   [En cas d'urgence - Lien de parent�]
FROM [dbo].[Employ�s]
WHERE [En cas d'urgence - Lien de parent�] IN ('P�re', 'M�re')

---- Cr�ez une requ�te qui affiche la liste des employ�s qui rel�vent de l'employ� qui n'a pas de sup�rieur hi�rarchique.
-- Les colonnes � afficher sont : 
-- �	Nom
-- �	Pr�nom
-- �	Poste occup�
-- �	Sup�rieur hi�rarchique

SELECT [Nom],
	   [Pr�nom],
	   [Poste Occup�],
	   [Sup�rieur hi�rarchique]
FROM [dbo].[Employ�s]
WHERE [Sup�rieur hi�rarchique] IS NULL

-- ------------------------------------------------------------------------------------------------------------------------
-- Sderie II

-- Afficher la liste des clients ayant achet� des produits valant plus de 500$
-- On affichera :
-- Le nom du client
-- La cat�gorie
-- Le nom du produit
-- Le prix unitaire
-- La quantit�
-- La date de la commande
-- La liste sera tri�e par le nom du client et le nom du produit.

-- Votre code ici

SELECT [Nom du client],
	   [Nom du type de produit],
	   [Nom du produit],
	   [Prix unitaire],
	   [Quantit�],
	   [Date de commande]
FROM [dbo].[Clients]
JOIN [dbo].[Commandes] ON [dbo].[Commandes].[ID client] = [dbo].[Clients].[ID client]
JOIN [dbo].[D�tails des commandes] ON [dbo].[D�tails des commandes].[ID commande] = [dbo].[Commandes].[ID commande]
JOIN [dbo].[Produits] ON [dbo].[Produits].[ID produit] = [dbo].[D�tails des commandes].[ID produit]
JOIN [dbo].[Types de produit] ON [dbo].[Types de produit].[ID type de produit] = [dbo].[Produits].[ID type de produit]
WHERE [Prix unitaire] * [Quantit�] > 500
ORDER BY [Nom du client], [Nom du produit]



-- -----------------------------------------------------------------
-- Cr�er une vue qui contient les donn�es de la requ�te pr�c�dente
-- -----------------------------------------------------------------
-- Votre code ici


-- -------------------------------------------------------------------------------------------------------------------------------
-- Maintenant, on veut savoir combien de fois chaque client a achet� le m�me produit ainsi que la quantit� totale et co�t total de ce produit
-- On affichera :
-- Le nom du client
-- Le nom du produit
-- Le nombre de fois que le produit a �t� achet�
-- La quantit� totale achet�e
-- Le montant total achet�

-- Votre code ici


-- --------------------------------------------------------------------------
-- Cr�er la table tblStatsClients contenant les donn�es calcul�es plus haut

-- Votre code ici


-- ---------------------------------------------------
-- Afficher la liste des 10 meilleurs clients

-- Votre code ici


-- --------------------------------------------------------
-- Afficher la liste des 10 produits les plus profitables

-- Votre code ici

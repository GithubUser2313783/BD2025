-- ==============================================================================
-- Description du cours : Introduction au bases de donn�es
-- Code du cours : 420-212-MV
-- Laboratoire 5
-- Les commandes DDL

 ALTER DATABASE Lab5 SET SINGLE_USER WITH ROLLBACK IMMEDIATE --;

-- SHUTDOWN WITH NOWAIT; -- Red�marrage de l'instance

-- Objectif : 
-- Ce Laboratoire vise � acqu�rir les comp�tences suivantes
-- ========================================================
-- Les commandes DDL
-- Les commandes DML

-- Cr�ation d'une base de donn�es
-- la commande CREATE DATABASE nomBase
-- S�lection de la base nouvellement cr��e.
-- La commande USE nomBase


-----------------------------------------------------------------------
-- Suite Lab5
-- Table FournisseurProduits
 
 -- V�rifier la cr�ation de la table avec les donn�es
 
  -- ********************************************************************
 -- Copie enti�re de la structure d'une table. La table sans les donn�es
 -- Cr�er la table tblEmployes qui contient la structure de la table 
 -- Employees de la base de donn�es xtremefr

 -- Verifier l'existence de la table tblEmployes
  
 -- version 1 avec TOP 0

 
 -- Verifier l'existence de la table tblEmployes
 
 -- version 2 avec une condition fausse

 -- V�rification de la cr�ation de la table tblEmployes


 -- Copie paritelle de la structure d'une table. La table sans les donn�es
 -- Cr�er la table tblEmployes qui contient la structure de la table 
 -- Employees de la base de donn�es xtremefr

 -- Verifier l'existence de la table tblEmployes
 
 
 
-- Creation de la table tblDepartement
-- V�rification de l'existence de la table tblDepartement avant cr�ation


-- Cr�ation de la table tblDepartement ayant la structure suivante :
-- ID Dept , entier, cl� primaire, non nul, auto increment�
-- ID departement, identificateur unique, non nul, nouvel identifiant
-- Nom du d�partement, chaine longueur 30, not nul, unique


-- Modification de la structure de la table tblEmployes
-- Ajout d'une cl� primaire � la table


-- Ajout de la colonne IDDept � la table employes (tblEmployes)
-- Specs : entier, non nul


-- Ajout d'une cl� �trang�re � la table employ�s

-- V�rifier la cr�ation des cl�s


-- Suppression d'une cl� primaire de la table tblEmployes


-- Ajout d'une cl� (primaire) compos�e Nom, prenom
-- Un cl� compos�e est une cl� primaire compos�e de plusieurs colonnes

-- V�rifier la cr�ation des cl�s


-- Supprimer la cl� compos�e


-- Recr�er la cl� primaire
-- Supprimer la cl� primaire si elle existe


-- V�rifier la cr�ation des cl�s


-- Modifier la structure d'une table par code
-- Changer le type d'une colonne
-- ATTENTION, ce n'est pas toujours possible apr�s qu'on ait entr� des donn�es.
-- Changer le type des colonnes DateNaissance et DateEmbauche (DateTime) en Date
-- Changer le type de la colonne Salaire (money) en entier (int)

-- Colonne Salaire : Money vers int

-- Colonne DateEmbauche : DateTime vers Date

-- Colonne DateNaissance : DateTime vers Date

-- V�rifier le changement de type


-- Changer la longueur d'une colonne
-- ATTENTION, il y a un risque de troncature � diminuer la longueur d'une colonne

-- PosteOccupe : nvarchar(30) --> nvarchar(50)


-- Changer le nom d'une colonne
-- Exemple : faute de frappe ou nom non significatif
-- Renommer Salaire en SalaireAnnuel


-- Ajout de donn�es dans la table Departement
-- On ajoute 4 d�partements : Informatique, Ressources humaines, Finances, Marketing


-- Ajout de donn�es dans la table employ�s
-- R�gle d'insertion de donn�es dans la colonne IDDept
-- L'employ� appartient au d�partement 1 quand son salaire est inf�rieur ou �gal � 30.000 $
-- L'employ� appartient au d�partement 2 quand son salaire est compris entre � 30.001 $ et 49.999 $
-- L'employ� appartient au d�partement 3 quand son salaire est compris entre � 50.000 $ et 69.999 $
-- L'employ� appartient au d�partement 4 quand son salaire est compris entre � 70.000 $ et 99.999 $


-- V�rifier le contenu de la table tblEmployes


-- �crire une requete qui affiche les employ�s ainsi que le nom de leurs d�partements


GO

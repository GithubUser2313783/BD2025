-- ==============================================================================
-- Description du cours : Introduction au bases de données
-- Code du cours : 420-212-MV
-- Laboratoire 5
-- Les commandes DDL

 ALTER DATABASE Lab5 SET SINGLE_USER WITH ROLLBACK IMMEDIATE --;

-- SHUTDOWN WITH NOWAIT; -- Redémarrage de l'instance

-- Objectif : 
-- Ce Laboratoire vise à acquérir les compétences suivantes
-- ========================================================
-- Les commandes DDL
-- Les commandes DML

-- Création d'une base de données
-- la commande CREATE DATABASE nomBase
-- Sélection de la base nouvellement créée.
-- La commande USE nomBase


-----------------------------------------------------------------------
-- Suite Lab5
-- Table FournisseurProduits
 
 -- Vérifier la création de la table avec les données
 
  -- ********************************************************************
 -- Copie entière de la structure d'une table. La table sans les données
 -- Créer la table tblEmployes qui contient la structure de la table 
 -- Employees de la base de données xtremefr

 -- Verifier l'existence de la table tblEmployes
  
 -- version 1 avec TOP 0

 
 -- Verifier l'existence de la table tblEmployes
 
 -- version 2 avec une condition fausse

 -- Vérification de la création de la table tblEmployes


 -- Copie paritelle de la structure d'une table. La table sans les données
 -- Créer la table tblEmployes qui contient la structure de la table 
 -- Employees de la base de données xtremefr

 -- Verifier l'existence de la table tblEmployes
 
 
 
-- Creation de la table tblDepartement
-- Vérification de l'existence de la table tblDepartement avant création


-- Création de la table tblDepartement ayant la structure suivante :
-- ID Dept , entier, clé primaire, non nul, auto incrementé
-- ID departement, identificateur unique, non nul, nouvel identifiant
-- Nom du département, chaine longueur 30, not nul, unique


-- Modification de la structure de la table tblEmployes
-- Ajout d'une clé primaire à la table


-- Ajout de la colonne IDDept à la table employes (tblEmployes)
-- Specs : entier, non nul


-- Ajout d'une clé étrangère à la table employés

-- Vérifier la création des clés


-- Suppression d'une clé primaire de la table tblEmployes


-- Ajout d'une clé (primaire) composée Nom, prenom
-- Un clé composée est une clé primaire composée de plusieurs colonnes

-- Vérifier la création des clés


-- Supprimer la clé composée


-- Recréer la clé primaire
-- Supprimer la clé primaire si elle existe


-- Vérifier la création des clés


-- Modifier la structure d'une table par code
-- Changer le type d'une colonne
-- ATTENTION, ce n'est pas toujours possible après qu'on ait entré des données.
-- Changer le type des colonnes DateNaissance et DateEmbauche (DateTime) en Date
-- Changer le type de la colonne Salaire (money) en entier (int)

-- Colonne Salaire : Money vers int

-- Colonne DateEmbauche : DateTime vers Date

-- Colonne DateNaissance : DateTime vers Date

-- Vérifier le changement de type


-- Changer la longueur d'une colonne
-- ATTENTION, il y a un risque de troncature à diminuer la longueur d'une colonne

-- PosteOccupe : nvarchar(30) --> nvarchar(50)


-- Changer le nom d'une colonne
-- Exemple : faute de frappe ou nom non significatif
-- Renommer Salaire en SalaireAnnuel


-- Ajout de données dans la table Departement
-- On ajoute 4 départements : Informatique, Ressources humaines, Finances, Marketing


-- Ajout de données dans la table employés
-- Règle d'insertion de données dans la colonne IDDept
-- L'employé appartient au département 1 quand son salaire est inférieur ou égal à 30.000 $
-- L'employé appartient au département 2 quand son salaire est compris entre à 30.001 $ et 49.999 $
-- L'employé appartient au département 3 quand son salaire est compris entre à 50.000 $ et 69.999 $
-- L'employé appartient au département 4 quand son salaire est compris entre à 70.000 $ et 99.999 $


-- Vérifier le contenu de la table tblEmployes


-- Écrire une requete qui affiche les employés ainsi que le nom de leurs départements


GO

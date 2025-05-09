/*****************************************************************************************
## =======================================
## Travaux dirigés : Création de tables 
## En utilisant les commandes DML de SQL
## INSERT. UPDATE, DELETE 
## =======================================
******************************************************************************************/

-- Ce TD doit être réalisé dans une nouvelle base de données.
-- Créer une nouvellle base de données
-- Nom de la base : TD9
-- Se positionner dans cette nouvelle base pour réaliser le travail

-- *************** A T T E N T I O N ***************
-- ****** REGLES D'INTÉGRITÉ RÉFÉRENCIELLES ********

-- CRÉATION DE TABLE
-- La table contenant la clé primaire doit être créée avant la table contenant la clé étrangère
-- La clé primaire doit exister avant la création de la clé étrangère

-- INSERTION DE DONNÉES
-- Les données de la tables 'maitre' doivent être insérées avant celles de la table "détail"

-- SUPPRESSION DE DONNÉES
-- Les données de la table "détail" celle qui contient la clé étrangère doivent être supprimées 
-- AVANT celles de la table contenant la clé primaire sauf si l'option CASCADE est utilisée

-- SUPPRESSION DE LA TABLE
-- La table "détail" doit être supprimée AVANT la table 'MAITRE'


-- Notes: Identity (1, 1) OR NEWID() in INSERT -> No value in first column.


/* ## Énoncé

## Partie I : Création d'une base de données
--===========================================
-- Vérifer l'existence de la base de données avant sa création


-- Se positionner dans la base de données


## Partie II : Création de tables
## ==============================

## Écrire une requête qui crée la table tblEmployes en respectant les spécifications ci-dessous
/***********************************************************************************************
Table "tblEmployes" :

EmpID (Entier - Clé primaire)
Nom (Chaîne de caractères)
Prenom (Chaîne de caractères)
DateNaissance (Date)
Salaire (monétaire)
************************************************************************************************/
-- Votre code ici 
*/

USE master;
GO

DROP DATABASE IF EXISTS TD9;

CREATE DATABASE TD9;
GO

USE TD9;


DROP TABLE IF EXISTS tblEmployes;

CREATE TABLE tblEmployes(
	EmpID int PRIMARY KEY,
	Nom nvarchar(30),
	Prenom nvarchar(30),
	DateNaissance Date,
	Salaire Money 
);


EXEC sp_help tblEmployes;



/***********************************************************************************************
## Écrire une requête qui crée la table tblProjets en respectant les spécifications ci-dessous

Table "tblProjets" :

ProjetID (Entier - Clé primaire)
NomProjet (Chaîne de caractères)
DateDebut (Date)
DateFin (Date)
ChefProjetID (Entier - Clé étrangère faisant référence à l'ID de l'employe)
************************************************************************************************/
-- Votre code ici 

DROP TABLE IF EXISTS tblProjets;

CREATE TABLE tblProjets(
	ProjetID int PRIMARY KEY,
	NomProjet nvarchar(30),
	DateDebut Date,
	DateFin Date,
	ChefProjetID int FOREIGN KEY(ChefProjetID) REFERENCES tblEmployes(EmpID)
);

/***********************************************************************************************
## Écrire une requête qui crée la table tblClients en respectant les spécifications ci-dessous

Table "tblClients" :

ClientID (Entier - Clé primaire)
NomClient (Chaîne de caractères)
Adresse (Chaîne de caractères)
Email (Chaîne de caractères)
Telephone (Chaîne de caractères)
************************************************************************************************/
-- Votre code ici 

DROP TABLE IF EXISTS tblClients;

CREATE TABLE tblClients(
	ClientID int PRIMARY KEY,
	NomClient nvarchar(30),
	Adresse nvarchar(255),
	Email nvarchar(50),
	Telephone nvarchar(50)
);


/***********************************************************************************************
## Écrire une requête qui crée la table tblProduits en respectant les spécifications ci-dessous

Table "tblProduits" :

ProduitID (Entier - Clé primaire)
NomProduit (Chaîne de caractères)
Description (Texte)
PrixUnitaire (Nombre décimal)
StockDisponible (Entier)
************************************************************************************************/
-- Votre code ici 

DROP TABLE IF EXISTS tblProduits;

CREATE TABLE tblProduits(
	ProduitID int PRIMARY KEY,
	NomProduit nvarchar(30),
	ProduitDescription text,
	PrixUnitaire Decimal (2, 2),
	StockDisponible int
);



/***********************************************************************************************
## Écrire une requête qui crée la table tblCommandes en respectant les spécifications ci-dessous

Table "tblCommandes" :

CommandeID (Entier - Clé primaire)
DateCommande (Date)
ClientID (Entier - Clé étrangère faisant référence à l'ID du client)
TotalCommande (Nombre décimal)
************************************************************************************************/
-- Votre code ici 

DROP TABLE IF EXISTS tblCommandes;

CREATE TABLE tblCommandes(
	CommandeID int PRIMARY KEY,
	DateCommande Date,
	ClientID int FOREIGN KEY(ClientID) REFERENCES tblClients(ClientID),
);

/***********************************************************************************************
## Écrire une requête qui crée la table tblArticlesCommandes en respectant les spécifications ci-dessous

Table "tblArticlesCommandes" :

ArticleCommandeID (Entier - Clé primaire)
CommandeID (Entier - Clé étrangère faisant référence à l'ID de la commande)
ProduitID (Entier - Clé étrangère faisant référence à l'ID du produit)
Quantite (Entier)
PrixUnitaire (Nombre décimal)
************************************************************************************************/
-- Votre code ici 

DROP TABLE IF EXISTS tblArticlesCommandes;

CREATE TABLE tlbArticlesCommandes(
	ArticleCommande int PRIMARY KEY,
	CommandeID int FOREIGN KEY(CommandeID) REFERENCES tblCommandes(CommandeID),
	ProduitID int FOREIGN KEY(ProduitID) REFERENCES tblProduits(ProduitID),
	Quantité int,
	PrixUnitaire Decimal
);

/***********************************************************************************************
## Écrire une requête qui crée la table tblCours en respectant les spécifications ci-dessous

Table "tblCours" :

CoursID (Entier - Clé primaire)
NomCours (Chaîne de caractères)
ProfesseurID (Entier - Clé étrangère faisant référence à l'ID de l'employé)
HeureDebut (Heure)
HeureFin (Heure)
************************************************************************************************/
-- Votre code ici 


DROP TABLE IF EXISTS tblCours;

CREATE TABLE tblCours(
	CoursID int PRIMARY KEY,
	NomCours nvarchar(30),
	ProfesseurID int FOREIGN KEY(ProfesseurID) REFERENCES tblEmployes(EmpID),
	HeureDebut Time,
	HeureFin Time
);

/***********************************************************************************************
## Écrire une requête qui crée la table tblEtudiants en respectant les spécifications ci-dessous

Table "tblEtudiants" :

EtudiantID (Entier - Clé primaire)
NomEtudiant (Chaîne de caractères)
PrenomEtudiant (Chaîne de caractères)
DateNaissance (Date)
Adresse (Chaîne de caractères)
************************************************************************************************/
-- Votre code ici 


DROP TABLE IF EXISTS tblEtudiants;

CREATE TABLE tblEtudiants(
	EtudiantID int PRIMARY KEY,
	NomEtudiant nvarchar(30),
	PrenomEtudiant nvarchar(15),
	DateNaissance Date,
	Adresse nvarchar(255)
);

/***********************************************************************************************
## Écrire une requête qui crée la table tblResultatsExamens en respectant les spécifications ci-dessous

Table "tblResultatsExamens" :

ResultatID (Entier - Clé primaire)
EtudiantID (Entier - Clé étrangère faisant référence à l'ID de l'étudiant)
CoursID (Entier - Clé étrangère faisant référence à l'ID du cours)
Note (Nombre décimal)
DateExamen (Date)
************************************************************************************************/
-- Votre code ici 


DROP TABLE IF EXISTS tblResultatsExamens;

CREATE TABLE tblResultatsExamens(
	ResultatID int PRIMARY KEY,
	EtudiantID int FOREIGN KEY(EtudiantID) REFERENCES tblEtudiants(EtudiantID),
	CoursID int FOREIGN KEY(CoursID) REFERENCES tblCours(CoursID),
	Note Decimal,
	DateExamen Date
);

/***********************************************************************************************
## Écrire une requête qui crée la table tblMessages en respectant les spécifications ci-dessous

Table "tblMessages" :

MessageID (Entier - Clé primaire)
ExpediteurID (Entier - Clé étrangère faisant référence à l'ID de l'employé)
DestinataireID (Entier - Clé étrangère faisant référence à l'ID de l'employé)
ContenuMessage (Texte)
DateEnvoi (Date et Heure)
************************************************************************************************/
-- Votre code ici 


DROP TABLE IF EXISTS tblMessages;

CREATE TABLE tblMessages(
	MessageID int PRIMARY KEY,
	ExpediteurID int FOREIGN KEY(ExpediteurID) REFERENCES tblEmployes(EmpID),
	DestinataireID int FOREIGN KEY REFERENCES tblEmployes(EmpID),
	ContenuMessage text,
	DateEnvoi Datetime
);


/*****************************************************************************************
## Partie II : Insertion de données
## =================================

## Ecrire des requêtes SQL qui insèrent des données dans la tables créées précédemment

Code d'insertion de données
===========================
*****************************************************************************************/
-- Insertion dans la table tblEmployes
-- Votre code ici

INSERT INTO tblEmployes (EmpID, Nom, Prenom, DateNaissance, Salaire)
VALUES (1, 'Gaia', 'Shelby', '1999-03-01', 200);


-- Insertion dans la table tblProjets
-- Votre code ici

INSERT INTO tblProjets (ProjetID, NomProjet, DateDebut, DateFin, ChefProjetID)
VALUES (1, 'Animal Sanctuary', 'Shelby', '1999-03-01', 200);


-- Insertion dans la table tblClients
-- Votre code ici

INSERT INTO tblClients (ClientID, NomClient, Adresse, Email, Telephone)
VALUES (1, 'John', '123 Canadian Street', 'johnL@gmail.com', '514-602-1450');

-- Insertion dans la table tblProduits
-- Votre code ici

INSERT INTO tblProduits (ProduitID, NomProduit, ProduitDescription, PrixUnitaire, StockDisponible)
VALUES (1, 'Fish Food', 'Warning: May contain nuts.', 5.99, 50)

-- Insertion dans la table tblCommandes
-- Votre code ici

INSERT INTO tblCommandes (CommandeID, DateCommande, ClientID)
VALUES (1, '2000-01-01', 1);


-- Insertion dans la table tblArticlesCommandes
-- Votre code ici

INSERT INTO tblArticlesCommandes (ArticleCommande, CommandeID, ProduitID, Quantité, PrixUnitaire)
VALUES (1, 1, 1, 10, 5.99);

-- Insertion dans la table tblCours
-- Votre code ici

INSERT INTO tblCours (CoursID, NomCours, ProfesseurID, HeureDebut, HeureFin)
VALUES (1, 'Botanical Science', 1, '12:00', '00:00');


-- Insertion dans la table tblEtudiants
-- Votre code ici

INSERT INTO tblEtudiants (EtudiantID, NomEtudiant, PrenomEtudiant, DateNaissance, Adresse)
VALUES (0001, Aiden, )



-- Insertion dans la table tblResultatsExamens
-- Votre code ici




-- Insertion dans la table tblMessages
-- Votre code ici






/*****************************************************************************************************************
## Partie III : Modification de la structure des tables
======================================================

## Écrire une requête qui modifie la structure de la table tblEmployes en respectant les spécification ci-dessous : 
Ajouter la colonne Departement de type Chaine de caractères et de longueur 50
Ajouter la colonne DateEmbauche de type Date
*****************************************************************************************************************/
-- Votre code ici


/****************************************************************************************************************
## Écrire une requête qui modifie la structure de la table tblProjets en respectant les spécification ci-dessous : 
Ajouter la colonne Budget de type Réel avec 2 décimales
Ajouter la colonne DescriptionProjet de type Texte long 
*****************************************************************************************************************/
-- Votre code ici



/****************************************************************************************************************
## Écrire une requête qui modifie la structure de la table tblClients en respectant les spécification ci-dessous : 
Ajouter la colonne DateCreationClient de type Date
Ajouter la colonne Commentaire de type Texte long 
*****************************************************************************************************************/
-- Votre code ici



/****************************************************************************************************************
## Écrire une requête qui modifie la structure de la table tblProduits en respectant les spécification ci-dessous : 
Ajouter la colonne DateAjoutProduit de type Date
Ajouter la colonne Fournisseur de type Texte de longueur 55
*****************************************************************************************************************/
-- Votre code ici



/****************************************************************************************************************
## Écrire une requête qui modifie la structure de la table tblCommandes en respectant les spécification ci-dessous : 
Ajouter la colonne DateCommande de type Date
Ajouter la colonne StatutCommande de type Texte de longueur 50
*****************************************************************************************************************/
-- Votre code ici



/****************************************************************************************************************
## Écrire une requête qui modifie la structure de la table tblArticlesCommandes en respectant les spécification ci-dessous : 
Ajouter la colonne Remise de type Réel avec 2 décimales
Ajouter la colonne MontantTotal de type monétaire
*****************************************************************************************************************/
-- Votre code ici



/****************************************************************************************************************
## Écrire une requête qui modifie la structure de la table tblCours en respectant les spécification ci-dessous : 
Ajouter la colonne DescriptionCours de type Texte long
Ajouter la colonne SalleCours de type Texte de longueur 50
*****************************************************************************************************************/
-- Votre code ici


/****************************************************************************************************************
## Écrire une requête qui modifie la structure de la table tblEtudiants en respectant les spécification ci-dessous : 
Ajouter la colonne AnneeEtudes de type entier
Ajouter la colonne MoyenneGenerale de Type Réel à 2 décimales 
*****************************************************************************************************************/
-- Votre code ici


/****************************************************************************************************************
## Écrire une requête qui modifie la structure de la table tblResultatsExamens en respectant les spécification ci-dessous :
Ajouter la colonne Appreciation de type texte de longueur 50
Ajouter la colonne MentionHonneur de type booléen
 *****************************************************************************************************************/
-- Votre code ici


/****************************************************************************************************************
## Écrire une requête qui modifie la structure de la table tblMessages en respectant les spécification ci-dessous : 
Ajouter la colonne Lu de type Booléen
Ajouter la colonne Priorite de type entier
*****************************************************************************************************************/
-- Votre code ici



/***************************************************************************************************************
## Partie IV : Suppression de données
====================================

## Écrire une requête qui supprime le contenu de la table tblEmployes
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## Écrire une requête qui supprime le contenu de la table tblProjets
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## Écrire une requête qui supprime le contenu de la table tblClients
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## Écrire une requête qui supprime le contenu de la table tblProduits
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## Écrire une requête qui supprime le contenu de la table tblCommandes
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## Écrire une requête qui supprime le contenu de la table tblArticlesCommandes
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## Écrire une requête qui supprime le contenu de la table tblCours
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## Écrire une requête qui supprime le contenu de la table tblEtudiants
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## Écrire une requête qui supprime le contenu de la table tblResultatsExamens
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## Écrire une requête qui supprime le contenu de la table tblMessages
*****************************************************************************************************************/
-- Votre code ici


-- ## Solution Partie IV
-- ====================

-- Code SQL de suppression des données
-- ===================================
-- Supprimer le contenu de la table tblEmployes
-- Votre code ici



-- Supprimer le contenu de la table tblProjets
-- Votre code ici



-- Supprimer le contenu de la table tblClients
-- Votre code ici



-- Supprimer le contenu de la table tblProduits
-- Votre code ici



-- Supprimer le contenu de la table tblCommandes
-- Votre code ici



-- Supprimer le contenu de la table tblArticlesCommandes
-- Votre code ici



-- Supprimer le contenu de la table tblCours
-- Votre code ici



-- Supprimer le contenu de la table tblEtudiants
-- Votre code ici



-- Supprimer le contenu de la table tblResultatsExamens
-- Votre code ici



-- Supprimer le contenu de la table tblMessages
-- Votre code ici



/*************************************************************************
## Partie V : Suppression des tables
=====================================

## Attention, ne pas confondre avec les requêtes précédentes
## Écrire une requête qui supprime la table tblEmployes
-- Votre code ici



## Écrire une requête qui supprime la table tblProjets
-- Votre code ici




## Écrire une requête qui supprime la table tblClients
-- Votre code ici




## Écrire une requête qui supprime la table tblProduits
-- Votre code ici




## Écrire une requête qui supprime la table tblCommandes
-- Votre code ici




## Écrire une requête qui supprime la table tblArticlesCommandes
-- Votre code ici




## Écrire une requête qui supprime la table tblCours
-- Votre code ici




## Écrire une requête qui supprime la table tblEtudiants
-- Votre code ici




## Écrire une requête qui supprime la table tblResultatsExamens
-- Votre code ici




## Écrire une requête qui supprime la table tblMessages
-- Votre code ici






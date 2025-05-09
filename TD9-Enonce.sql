/*****************************************************************************************
## =======================================
## Travaux dirig�s : Cr�ation de tables 
## En utilisant les commandes DML de SQL
## INSERT. UPDATE, DELETE 
## =======================================
******************************************************************************************/

-- Ce TD doit �tre r�alis� dans une nouvelle base de donn�es.
-- Cr�er une nouvellle base de donn�es
-- Nom de la base : TD9
-- Se positionner dans cette nouvelle base pour r�aliser le travail

-- *************** A T T E N T I O N ***************
-- ****** REGLES D'INT�GRIT� R�F�RENCIELLES ********

-- CR�ATION DE TABLE
-- La table contenant la cl� primaire doit �tre cr��e avant la table contenant la cl� �trang�re
-- La cl� primaire doit exister avant la cr�ation de la cl� �trang�re

-- INSERTION DE DONN�ES
-- Les donn�es de la tables 'maitre' doivent �tre ins�r�es avant celles de la table "d�tail"

-- SUPPRESSION DE DONN�ES
-- Les donn�es de la table "d�tail" celle qui contient la cl� �trang�re doivent �tre supprim�es 
-- AVANT celles de la table contenant la cl� primaire sauf si l'option CASCADE est utilis�e

-- SUPPRESSION DE LA TABLE
-- La table "d�tail" doit �tre supprim�e AVANT la table 'MAITRE'


-- Notes: Identity (1, 1) OR NEWID() in INSERT -> No value in first column.


/* ## �nonc�

## Partie I : Cr�ation d'une base de donn�es
--===========================================
-- V�rifer l'existence de la base de donn�es avant sa cr�ation


-- Se positionner dans la base de donn�es


## Partie II : Cr�ation de tables
## ==============================

## �crire une requ�te qui cr�e la table tblEmployes en respectant les sp�cifications ci-dessous
/***********************************************************************************************
Table "tblEmployes" :

EmpID (Entier - Cl� primaire)
Nom (Cha�ne de caract�res)
Prenom (Cha�ne de caract�res)
DateNaissance (Date)
Salaire (mon�taire)
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
## �crire une requ�te qui cr�e la table tblProjets en respectant les sp�cifications ci-dessous

Table "tblProjets" :

ProjetID (Entier - Cl� primaire)
NomProjet (Cha�ne de caract�res)
DateDebut (Date)
DateFin (Date)
ChefProjetID (Entier - Cl� �trang�re faisant r�f�rence � l'ID de l'employe)
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
## �crire une requ�te qui cr�e la table tblClients en respectant les sp�cifications ci-dessous

Table "tblClients" :

ClientID (Entier - Cl� primaire)
NomClient (Cha�ne de caract�res)
Adresse (Cha�ne de caract�res)
Email (Cha�ne de caract�res)
Telephone (Cha�ne de caract�res)
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
## �crire une requ�te qui cr�e la table tblProduits en respectant les sp�cifications ci-dessous

Table "tblProduits" :

ProduitID (Entier - Cl� primaire)
NomProduit (Cha�ne de caract�res)
Description (Texte)
PrixUnitaire (Nombre d�cimal)
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
## �crire une requ�te qui cr�e la table tblCommandes en respectant les sp�cifications ci-dessous

Table "tblCommandes" :

CommandeID (Entier - Cl� primaire)
DateCommande (Date)
ClientID (Entier - Cl� �trang�re faisant r�f�rence � l'ID du client)
TotalCommande (Nombre d�cimal)
************************************************************************************************/
-- Votre code ici 

DROP TABLE IF EXISTS tblCommandes;

CREATE TABLE tblCommandes(
	CommandeID int PRIMARY KEY,
	DateCommande Date,
	ClientID int FOREIGN KEY(ClientID) REFERENCES tblClients(ClientID),
);

/***********************************************************************************************
## �crire une requ�te qui cr�e la table tblArticlesCommandes en respectant les sp�cifications ci-dessous

Table "tblArticlesCommandes" :

ArticleCommandeID (Entier - Cl� primaire)
CommandeID (Entier - Cl� �trang�re faisant r�f�rence � l'ID de la commande)
ProduitID (Entier - Cl� �trang�re faisant r�f�rence � l'ID du produit)
Quantite (Entier)
PrixUnitaire (Nombre d�cimal)
************************************************************************************************/
-- Votre code ici 

DROP TABLE IF EXISTS tblArticlesCommandes;

CREATE TABLE tlbArticlesCommandes(
	ArticleCommande int PRIMARY KEY,
	CommandeID int FOREIGN KEY(CommandeID) REFERENCES tblCommandes(CommandeID),
	ProduitID int FOREIGN KEY(ProduitID) REFERENCES tblProduits(ProduitID),
	Quantit� int,
	PrixUnitaire Decimal
);

/***********************************************************************************************
## �crire une requ�te qui cr�e la table tblCours en respectant les sp�cifications ci-dessous

Table "tblCours" :

CoursID (Entier - Cl� primaire)
NomCours (Cha�ne de caract�res)
ProfesseurID (Entier - Cl� �trang�re faisant r�f�rence � l'ID de l'employ�)
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
## �crire une requ�te qui cr�e la table tblEtudiants en respectant les sp�cifications ci-dessous

Table "tblEtudiants" :

EtudiantID (Entier - Cl� primaire)
NomEtudiant (Cha�ne de caract�res)
PrenomEtudiant (Cha�ne de caract�res)
DateNaissance (Date)
Adresse (Cha�ne de caract�res)
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
## �crire une requ�te qui cr�e la table tblResultatsExamens en respectant les sp�cifications ci-dessous

Table "tblResultatsExamens" :

ResultatID (Entier - Cl� primaire)
EtudiantID (Entier - Cl� �trang�re faisant r�f�rence � l'ID de l'�tudiant)
CoursID (Entier - Cl� �trang�re faisant r�f�rence � l'ID du cours)
Note (Nombre d�cimal)
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
## �crire une requ�te qui cr�e la table tblMessages en respectant les sp�cifications ci-dessous

Table "tblMessages" :

MessageID (Entier - Cl� primaire)
ExpediteurID (Entier - Cl� �trang�re faisant r�f�rence � l'ID de l'employ�)
DestinataireID (Entier - Cl� �trang�re faisant r�f�rence � l'ID de l'employ�)
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
## Partie II : Insertion de donn�es
## =================================

## Ecrire des requ�tes SQL qui ins�rent des donn�es dans la tables cr��es pr�c�demment

Code d'insertion de donn�es
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

INSERT INTO tblArticlesCommandes (ArticleCommande, CommandeID, ProduitID, Quantit�, PrixUnitaire)
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

## �crire une requ�te qui modifie la structure de la table tblEmployes en respectant les sp�cification ci-dessous : 
Ajouter la colonne Departement de type Chaine de caract�res et de longueur 50
Ajouter la colonne DateEmbauche de type Date
*****************************************************************************************************************/
-- Votre code ici


/****************************************************************************************************************
## �crire une requ�te qui modifie la structure de la table tblProjets en respectant les sp�cification ci-dessous : 
Ajouter la colonne Budget de type R�el avec 2 d�cimales
Ajouter la colonne DescriptionProjet de type Texte long 
*****************************************************************************************************************/
-- Votre code ici



/****************************************************************************************************************
## �crire une requ�te qui modifie la structure de la table tblClients en respectant les sp�cification ci-dessous : 
Ajouter la colonne DateCreationClient de type Date
Ajouter la colonne Commentaire de type Texte long 
*****************************************************************************************************************/
-- Votre code ici



/****************************************************************************************************************
## �crire une requ�te qui modifie la structure de la table tblProduits en respectant les sp�cification ci-dessous : 
Ajouter la colonne DateAjoutProduit de type Date
Ajouter la colonne Fournisseur de type Texte de longueur 55
*****************************************************************************************************************/
-- Votre code ici



/****************************************************************************************************************
## �crire une requ�te qui modifie la structure de la table tblCommandes en respectant les sp�cification ci-dessous : 
Ajouter la colonne DateCommande de type Date
Ajouter la colonne StatutCommande de type Texte de longueur 50
*****************************************************************************************************************/
-- Votre code ici



/****************************************************************************************************************
## �crire une requ�te qui modifie la structure de la table tblArticlesCommandes en respectant les sp�cification ci-dessous : 
Ajouter la colonne Remise de type R�el avec 2 d�cimales
Ajouter la colonne MontantTotal de type mon�taire
*****************************************************************************************************************/
-- Votre code ici



/****************************************************************************************************************
## �crire une requ�te qui modifie la structure de la table tblCours en respectant les sp�cification ci-dessous : 
Ajouter la colonne DescriptionCours de type Texte long
Ajouter la colonne SalleCours de type Texte de longueur 50
*****************************************************************************************************************/
-- Votre code ici


/****************************************************************************************************************
## �crire une requ�te qui modifie la structure de la table tblEtudiants en respectant les sp�cification ci-dessous : 
Ajouter la colonne AnneeEtudes de type entier
Ajouter la colonne MoyenneGenerale de Type R�el � 2 d�cimales 
*****************************************************************************************************************/
-- Votre code ici


/****************************************************************************************************************
## �crire une requ�te qui modifie la structure de la table tblResultatsExamens en respectant les sp�cification ci-dessous :
Ajouter la colonne Appreciation de type texte de longueur 50
Ajouter la colonne MentionHonneur de type bool�en
 *****************************************************************************************************************/
-- Votre code ici


/****************************************************************************************************************
## �crire une requ�te qui modifie la structure de la table tblMessages en respectant les sp�cification ci-dessous : 
Ajouter la colonne Lu de type Bool�en
Ajouter la colonne Priorite de type entier
*****************************************************************************************************************/
-- Votre code ici



/***************************************************************************************************************
## Partie IV : Suppression de donn�es
====================================

## �crire une requ�te qui supprime le contenu de la table tblEmployes
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## �crire une requ�te qui supprime le contenu de la table tblProjets
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## �crire une requ�te qui supprime le contenu de la table tblClients
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## �crire une requ�te qui supprime le contenu de la table tblProduits
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## �crire une requ�te qui supprime le contenu de la table tblCommandes
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## �crire une requ�te qui supprime le contenu de la table tblArticlesCommandes
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## �crire une requ�te qui supprime le contenu de la table tblCours
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## �crire une requ�te qui supprime le contenu de la table tblEtudiants
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## �crire une requ�te qui supprime le contenu de la table tblResultatsExamens
*****************************************************************************************************************/
-- Votre code ici


/***************************************************************************************************************
## �crire une requ�te qui supprime le contenu de la table tblMessages
*****************************************************************************************************************/
-- Votre code ici


-- ## Solution Partie IV
-- ====================

-- Code SQL de suppression des donn�es
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

## Attention, ne pas confondre avec les requ�tes pr�c�dentes
## �crire une requ�te qui supprime la table tblEmployes
-- Votre code ici



## �crire une requ�te qui supprime la table tblProjets
-- Votre code ici




## �crire une requ�te qui supprime la table tblClients
-- Votre code ici




## �crire une requ�te qui supprime la table tblProduits
-- Votre code ici




## �crire une requ�te qui supprime la table tblCommandes
-- Votre code ici




## �crire une requ�te qui supprime la table tblArticlesCommandes
-- Votre code ici




## �crire une requ�te qui supprime la table tblCours
-- Votre code ici




## �crire une requ�te qui supprime la table tblEtudiants
-- Votre code ici




## �crire une requ�te qui supprime la table tblResultatsExamens
-- Votre code ici




## �crire une requ�te qui supprime la table tblMessages
-- Votre code ici






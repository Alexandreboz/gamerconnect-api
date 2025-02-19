CREATE DATABASE GamerConnect;
USE GamerConnect;

CREATE TABLE Utilisateurs (
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    date_inscription DATETIME DEFAULT CURRENT_TIMESTAMP,
    plateformes_liees TEXT
);

CREATE TABLE Profils (
    id_profil INT AUTO_INCREMENT PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    avatar VARCHAR(255),
    jeux_favoris TEXT,
    succes_obtenus TEXT,
    biographie TEXT,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE
);

CREATE TABLE Messages (
    id_message INT AUTO_INCREMENT PRIMARY KEY,
    id_envoyeur INT NOT NULL,
    id_recepteur INT NOT NULL,
    contenu TEXT NOT NULL,
    date_envoi DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_envoyeur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE,
    FOREIGN KEY (id_recepteur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE
);

CREATE TABLE Groupes (
    id_groupe INT AUTO_INCREMENT PRIMARY KEY,
    nom_groupe VARCHAR(100) NOT NULL,
    description TEXT,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Membres_Groupe (
    id_membre INT AUTO_INCREMENT PRIMARY KEY,
    id_groupe INT NOT NULL,
    id_utilisateur INT NOT NULL,
    date_adhesion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_groupe) REFERENCES Groupes(id_groupe) ON DELETE CASCADE,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE
);

CREATE TABLE Evenements (
    id_evenement INT AUTO_INCREMENT PRIMARY KEY,
    nom_evenement VARCHAR(100) NOT NULL,
    description TEXT,
    date_evenement DATETIME NOT NULL,
    id_organisateur INT NOT NULL,
    FOREIGN KEY (id_organisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE
);

CREATE TABLE Participants (
    id_participant INT AUTO_INCREMENT PRIMARY KEY,
    id_evenement INT NOT NULL,
    id_utilisateur INT NOT NULL,
    statut ENUM('Confirmé', 'En attente', 'Refusé') DEFAULT 'En attente',
    FOREIGN KEY (id_evenement) REFERENCES Evenements(id_evenement) ON DELETE CASCADE,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE
);

CREATE TABLE Ressources_Educatives (
    id_ressource INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    type_ressource ENUM('Article', 'Vidéo', 'Tutoriel') NOT NULL,
    contenu TEXT NOT NULL,
    date_publication DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_auteur INT NOT NULL,
    FOREIGN KEY (id_auteur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE
);

CREATE TABLE Badges (
    id_badge INT AUTO_INCREMENT PRIMARY KEY,
    nom_badge VARCHAR(100) NOT NULL,
    description TEXT,
    conditions TEXT
);

CREATE TABLE Obtention_Badges (
    id_obtention INT AUTO_INCREMENT PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    id_badge INT NOT NULL,
    date_obtention DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE,
    FOREIGN KEY (id_badge) REFERENCES Badges(id_badge) ON DELETE CASCADE
);

-- Ajouter des utilisateurs
INSERT INTO Utilisateurs (nom, prenom, email, mot_de_passe, plateformes_liees) VALUES
('Dupont', 'Jean', 'jean.dupont@email.com', 'hashedpassword123', 'Steam,PSN'),
('Martin', 'Claire', 'claire.martin@email.com', 'hashedpassword456', 'Xbox,Steam');

-- Ajouter un événement
INSERT INTO Evenements (nom_evenement, description, date_evenement, id_organisateur) VALUES
('Tournoi FIFA 24', 'Tournoi en ligne pour FIFA 24', '2024-06-15 18:00:00', 1);

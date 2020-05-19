-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 19 mai 2020 à 23:47
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `magui`
--

-- --------------------------------------------------------

--
-- Structure de la table `ayant`
--

CREATE TABLE `ayant` (
  `NUMMEDECIN` int(11) NOT NULL,
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ayant`
--

INSERT INTO `ayant` (`NUMMEDECIN`, `ID`) VALUES
(1, 1),
(3, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `NUMCHAMBRE` int(11) NOT NULL,
  `CATEGORIE` char(100) DEFAULT NULL,
  `TYPE` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`NUMCHAMBRE`, `CATEGORIE`, `TYPE`) VALUES
(1, 'moyenne', 'duo'),
(2, 'grande', 'mixte'),
(3, 'unique', 'petite');

-- --------------------------------------------------------

--
-- Structure de la table `departement_medical`
--

CREATE TABLE `departement_medical` (
  `NUMDEPARTEMENT` int(11) NOT NULL,
  `NOM` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `departement_medical`
--

INSERT INTO `departement_medical` (`NUMDEPARTEMENT`, `NOM`) VALUES
(1, 'AB5'),
(2, 'AB2'),
(5, 'AB1'),
(7, 'AB4');

-- --------------------------------------------------------

--
-- Structure de la table `feuilledevol`
--

CREATE TABLE `feuilledevol` (
  `NUMFEUILLE` int(11) NOT NULL,
  `NUMMALADE` int(11) NOT NULL,
  `DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `feuilledevol`
--

INSERT INTO `feuilledevol` (`NUMFEUILLE`, `NUMMALADE`, `DATE`) VALUES
(2, 7, '2020-05-10'),
(5, 2, '2020-06-03'),
(7, 3, '2020-06-04'),
(10, 4, '2020-05-03'),
(11, 4, '2020-05-10');

-- --------------------------------------------------------

--
-- Structure de la table `lit`
--

CREATE TABLE `lit` (
  `NUMERO` int(11) NOT NULL,
  `NUMCHAMBRE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lit`
--

INSERT INTO `lit` (`NUMERO`, `NUMCHAMBRE`) VALUES
(1, 1),
(15, 1),
(2, 2),
(21, 2);

-- --------------------------------------------------------

--
-- Structure de la table `malade`
--

CREATE TABLE `malade` (
  `numMalade` int(11) NOT NULL,
  `NumDepartement` int(11) NOT NULL,
  `NumMedecin` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  `Sexe` char(1) NOT NULL,
  `DateNaissance` date NOT NULL,
  `LieuNaissance` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `malade`
--

INSERT INTO `malade` (`numMalade`, `NumDepartement`, `NumMedecin`, `Nom`, `Adresse`, `Sexe`, `DateNaissance`, `LieuNaissance`) VALUES
(1, 5, 1, 'aly', 'parcelles', 'M', '1995-05-05', 'parcelles'),
(2, 2, 2, 'wone', 'dakar', 'M', '2000-05-19', 'dakar'),
(3, 7, 3, 'Diallo', 'fann', 'F', '2002-05-11', 'fann'),
(4, 1, 4, 'only', 'soprime', 'F', '2006-05-11', 'soprime'),
(6, 7, 3, 'maty', 'parcelles', 'F', '2020-05-05', 'parcelles'),
(7, 2, 3, 'ABSA', 'THIES', 'F', '2012-04-22', 'THIES'),
(11, 7, 1, 'all', 'parcelles', 'F', '2020-05-11', 'parcelles');

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `NUMMEDECIN` int(11) NOT NULL,
  `NOMMEDECIN` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`NUMMEDECIN`, `NOMMEDECIN`) VALUES
(1, 'MAGUI'),
(2, 'MADISE'),
(3, 'AMINE'),
(4, 'YOU');

-- --------------------------------------------------------

--
-- Structure de la table `occupe`
--

CREATE TABLE `occupe` (
  `NUMMALADE` int(11) NOT NULL,
  `NUMERO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `occupe`
--

INSERT INTO `occupe` (`NUMMALADE`, `NUMERO`) VALUES
(1, 2),
(2, 1),
(3, 1),
(3, 2),
(4, 21),
(11, 21);

-- --------------------------------------------------------

--
-- Structure de la table `specialiste`
--

CREATE TABLE `specialiste` (
  `ID` int(11) NOT NULL,
  `NOMSPEC` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `specialiste`
--

INSERT INTO `specialiste` (`ID`, `NOMSPEC`) VALUES
(1, 'S1'),
(2, 'S2'),
(3, 'S1'),
(4, 'S1'),
(5, 'S2'),
(6, 'S3');

-- --------------------------------------------------------

--
-- Structure de la table `suivre`
--

CREATE TABLE `suivre` (
  `NUMDEPARTEMENT` int(11) NOT NULL,
  `NUMMEDECIN` int(11) NOT NULL,
  `NUMMALADE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `suivre`
--

INSERT INTO `suivre` (`NUMDEPARTEMENT`, `NUMMEDECIN`, `NUMMALADE`) VALUES
(1, 1, 1),
(7, 3, 1),
(1, 2, 6),
(2, 3, 6),
(2, 2, 7);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ayant`
--
ALTER TABLE `ayant`
  ADD PRIMARY KEY (`NUMMEDECIN`),
  ADD KEY `FK_AYANT2` (`ID`);

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`NUMCHAMBRE`);

--
-- Index pour la table `departement_medical`
--
ALTER TABLE `departement_medical`
  ADD PRIMARY KEY (`NUMDEPARTEMENT`);

--
-- Index pour la table `feuilledevol`
--
ALTER TABLE `feuilledevol`
  ADD PRIMARY KEY (`NUMFEUILLE`),
  ADD KEY `FK_AVOIR` (`NUMMALADE`);

--
-- Index pour la table `lit`
--
ALTER TABLE `lit`
  ADD PRIMARY KEY (`NUMERO`),
  ADD KEY `FK_CONTENIR` (`NUMCHAMBRE`);

--
-- Index pour la table `malade`
--
ALTER TABLE `malade`
  ADD PRIMARY KEY (`numMalade`),
  ADD KEY `dept_fk` (`NumDepartement`),
  ADD KEY `medecin_fk` (`NumMedecin`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`NUMMEDECIN`);

--
-- Index pour la table `occupe`
--
ALTER TABLE `occupe`
  ADD PRIMARY KEY (`NUMMALADE`,`NUMERO`),
  ADD KEY `FK_OCCUPE2` (`NUMERO`);

--
-- Index pour la table `specialiste`
--
ALTER TABLE `specialiste`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD PRIMARY KEY (`NUMDEPARTEMENT`,`NUMMEDECIN`),
  ADD KEY `FK_SUIVRE2` (`NUMMEDECIN`),
  ADD KEY `FK_SUIVRE5` (`NUMMALADE`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ayant`
--
ALTER TABLE `ayant`
  ADD CONSTRAINT `FK_AYANT` FOREIGN KEY (`NUMMEDECIN`) REFERENCES `medecin` (`NUMMEDECIN`),
  ADD CONSTRAINT `FK_AYANT2` FOREIGN KEY (`ID`) REFERENCES `specialiste` (`ID`);

--
-- Contraintes pour la table `feuilledevol`
--
ALTER TABLE `feuilledevol`
  ADD CONSTRAINT `FK_AVOIR` FOREIGN KEY (`NUMMALADE`) REFERENCES `malade` (`NUMMALADE`);

--
-- Contraintes pour la table `lit`
--
ALTER TABLE `lit`
  ADD CONSTRAINT `FK_CONTENIR` FOREIGN KEY (`NUMCHAMBRE`) REFERENCES `chambre` (`NUMCHAMBRE`);

--
-- Contraintes pour la table `malade`
--
ALTER TABLE `malade`
  ADD CONSTRAINT `FK_INTERNER` FOREIGN KEY (`NUMDEPARTEMENT`) REFERENCES `departement_medical` (`NUMDEPARTEMENT`),
  ADD CONSTRAINT `dept_fk` FOREIGN KEY (`NumDepartement`) REFERENCES `departement_medical` (`NUMDEPARTEMENT`),
  ADD CONSTRAINT `medecin_fk` FOREIGN KEY (`NumMedecin`) REFERENCES `medecin` (`NUMMEDECIN`);

--
-- Contraintes pour la table `occupe`
--
ALTER TABLE `occupe`
  ADD CONSTRAINT `FK_OCCUPE` FOREIGN KEY (`NUMMALADE`) REFERENCES `malade` (`NUMMALADE`),
  ADD CONSTRAINT `FK_OCCUPE2` FOREIGN KEY (`NUMERO`) REFERENCES `lit` (`NUMERO`);

--
-- Contraintes pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD CONSTRAINT `FK_SUIVRE` FOREIGN KEY (`NUMDEPARTEMENT`) REFERENCES `departement_medical` (`NUMDEPARTEMENT`),
  ADD CONSTRAINT `FK_SUIVRE2` FOREIGN KEY (`NUMMEDECIN`) REFERENCES `medecin` (`NUMMEDECIN`),
  ADD CONSTRAINT `FK_SUIVRE5` FOREIGN KEY (`NUMMALADE`) REFERENCES `malade` (`NUMMALADE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

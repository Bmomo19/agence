-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 06 Avril 2018 à 16:11
-- Version du serveur: 5.5.8
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `agence`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartement`
--

CREATE TABLE IF NOT EXISTS `appartement` (
  `idappart` varchar(12) NOT NULL,
  `lotAppart` varchar(50) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `detail` varchar(1000) DEFAULT NULL,
  `codepro` varchar(12) DEFAULT NULL,
  `idimmeuble` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`idappart`),
  KEY `codepro` (`codepro`),
  KEY `idimmeuble` (`idimmeuble`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `appartement`
--


-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `codefact` varchar(12) NOT NULL,
  `datefact` date DEFAULT NULL,
  `libellefact` varchar(2000) DEFAULT NULL,
  `matloc` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`codefact`),
  KEY `matloc` (`matloc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `facture`
--


-- --------------------------------------------------------

--
-- Structure de la table `immeuble`
--

CREATE TABLE IF NOT EXISTS `immeuble` (
  `idimmeuble` varchar(12) NOT NULL,
  `typeimmeuble` varchar(50) DEFAULT NULL,
  `situation_geo` varchar(2000) DEFAULT NULL,
  `codepro` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`idimmeuble`),
  KEY `codepro` (`codepro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `immeuble`
--


-- --------------------------------------------------------

--
-- Structure de la table `locataire`
--

CREATE TABLE IF NOT EXISTS `locataire` (
  `matloc` varchar(12) NOT NULL,
  `nomloc` varchar(50) DEFAULT NULL,
  `prenomloc` varchar(200) DEFAULT NULL,
  `datenaissloc` date DEFAULT NULL,
  `lieunaissloc` varchar(200) DEFAULT NULL,
  `adresseloc` varchar(45) DEFAULT NULL,
  `villeloc` varchar(100) DEFAULT NULL,
  `civiliteloc` varchar(50) DEFAULT NULL,
  `telephoneloc` varchar(10) DEFAULT NULL,
  `sexeloc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`matloc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `locataire`
--


-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `idappart` varchar(12) NOT NULL DEFAULT '',
  `matloc` varchar(12) NOT NULL DEFAULT '',
  `dateentree` date DEFAULT NULL,
  `datesortie` date DEFAULT NULL,
  PRIMARY KEY (`idappart`,`matloc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `location`
--


-- --------------------------------------------------------

--
-- Structure de la table `modele`
--

CREATE TABLE IF NOT EXISTS `modele` (
  `idmodele` varchar(12) NOT NULL,
  `libellemodele` varchar(50) DEFAULT NULL,
  `idappart` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`idmodele`),
  KEY `idappart` (`idappart`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `modele`
--


-- --------------------------------------------------------

--
-- Structure de la table `proprietaire`
--

CREATE TABLE IF NOT EXISTS `proprietaire` (
  `codepro` varchar(12) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(200) DEFAULT NULL,
  `datenaiss` date DEFAULT NULL,
  `lieunaiss` varchar(200) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `civilite` varchar(50) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `sexe` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codepro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `proprietaire`
--


-- --------------------------------------------------------

--
-- Structure de la table `reglement`
--

CREATE TABLE IF NOT EXISTS `reglement` (
  `coderegl` varchar(12) NOT NULL,
  `typereglement` varchar(50) DEFAULT NULL,
  `montantregl` int(11) DEFAULT NULL,
  `dateregl` date DEFAULT NULL,
  `codefact` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`coderegl`),
  KEY `codefact` (`codefact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `reglement`
--


--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `appartement`
--
ALTER TABLE `appartement`
  ADD CONSTRAINT `appartement_ibfk_1` FOREIGN KEY (`codepro`) REFERENCES `proprietaire` (`codepro`),
  ADD CONSTRAINT `appartement_ibfk_2` FOREIGN KEY (`idimmeuble`) REFERENCES `immeuble` (`idimmeuble`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`matloc`) REFERENCES `locataire` (`matloc`);

--
-- Contraintes pour la table `immeuble`
--
ALTER TABLE `immeuble`
  ADD CONSTRAINT `immeuble_ibfk_1` FOREIGN KEY (`codepro`) REFERENCES `proprietaire` (`codepro`);

--
-- Contraintes pour la table `modele`
--
ALTER TABLE `modele`
  ADD CONSTRAINT `modele_ibfk_1` FOREIGN KEY (`idappart`) REFERENCES `appartement` (`idappart`);

--
-- Contraintes pour la table `reglement`
--
ALTER TABLE `reglement`
  ADD CONSTRAINT `reglement_ibfk_1` FOREIGN KEY (`codefact`) REFERENCES `facture` (`codefact`);

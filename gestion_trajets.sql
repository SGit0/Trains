-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 20 jan. 2020 à 14:11
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestion_trajets`
--

-- --------------------------------------------------------

--
-- Structure de la table `gare`
--
CREATE DATABASE 'gestion-trains';
USE 'gestion_trains';

CREATE TABLE `gare` (
  `ID_gare` int(10) NOT NULL,
  `nom_gare` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tgv`
--

CREATE TABLE `tgv` (
  `ID-TGV` int(10) NOT NULL,
  `gare_depart` int(10) NOT NULL,
  `gare_arrivee` int(10) NOT NULL,
  `heure_depart` date NOT NULL,
  `heure-arrivee` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `trajet`
--

CREATE TABLE `trajet` (
  `ID_trajet` int(10) NOT NULL,
  `date_depart` date NOT NULL,
  `date_arrivee` date NOT NULL,
  `ID_TGV` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `gare`
--
ALTER TABLE `gare`
  ADD PRIMARY KEY (`ID_gare`);

--
-- Index pour la table `tgv`
--
ALTER TABLE `tgv`
  ADD PRIMARY KEY (`ID-TGV`),
  ADD KEY `gareariv` (`gare_arrivee`),
  ADD KEY `garedep` (`gare_depart`);

--
-- Index pour la table `trajet`
--
ALTER TABLE `trajet`
  ADD PRIMARY KEY (`ID_trajet`),
  ADD KEY `TGV` (`ID_TGV`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `gare`
--
ALTER TABLE `gare`
  MODIFY `ID_gare` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tgv`
--
ALTER TABLE `tgv`
  MODIFY `ID-TGV` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `trajet`
--
ALTER TABLE `trajet`
  MODIFY `ID_trajet` int(10) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tgv`
--
ALTER TABLE `tgv`
  ADD CONSTRAINT `gareariv` FOREIGN KEY (`gare_arrivee`) REFERENCES `gare` (`ID_gare`),
  ADD CONSTRAINT `garedep` FOREIGN KEY (`gare_depart`) REFERENCES `gare` (`ID_gare`);

--
-- Contraintes pour la table `trajet`
--
ALTER TABLE `trajet`
  ADD CONSTRAINT `TGV` FOREIGN KEY (`ID_TGV`) REFERENCES `tgv` (`ID-TGV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

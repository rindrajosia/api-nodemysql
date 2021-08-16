-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 16 août 2021 à 08:22
-- Version du serveur :  8.0.26-0ubuntu0.20.04.2
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `excellence`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidate`
--

CREATE TABLE `candidate` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `candidate`
--

INSERT INTO `candidate` (`id`, `name`, `email`) VALUES
(1, 'Josia', 'josia@gmail.com'),
(2, 'Marina', 'marina@gmail.com'),
(3, 'Kristina', 'kreistina@gmail.com'),
(4, 'Gabi', 'gabi@gmail.com'),
(5, 'Feno', 'feno@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id` int NOT NULL,
  `candidate` int NOT NULL,
  `round` int NOT NULL,
  `note` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id`, `candidate`, `round`, `note`) VALUES
(1, 1, 1, 3),
(2, 1, 2, 4),
(6, 1, 3, 5),
(7, 2, 1, 5),
(8, 2, 2, 5),
(9, 2, 3, 10),
(10, 3, 1, 2),
(11, 3, 2, 1),
(12, 3, 3, 2),
(13, 4, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `round`
--

CREATE TABLE `round` (
  `id` int NOT NULL,
  `field` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `round`
--

INSERT INTO `round` (`id`, `field`) VALUES
(1, 'first_round'),
(2, 'second_round'),
(3, 'third_round');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_candidate_email` (`email`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate` (`candidate`),
  ADD KEY `round` (`round`);

--
-- Index pour la table `round`
--
ALTER TABLE `round`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `round`
--
ALTER TABLE `round`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`candidate`) REFERENCES `candidate` (`id`),
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`round`) REFERENCES `round` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

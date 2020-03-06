-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 28 jan. 2020 à 15:38
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bibliotheque-microservice`
--

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id_book` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(35) NOT NULL,
  `book_author` varchar(35) NOT NULL,
  `book_editor` varchar(35) NOT NULL,
  PRIMARY KEY (`id_book`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`id_book`, `book_name`, `book_author`, `book_editor`) VALUES
(1, 'Le monde', 'Richard', 'Soleil'),
(2, 'Contes', 'Frank', 'Lune'),
(3, 'Orgueil et Préjugés', 'Pierre', 'Mars'),
(4, 'Le Père Goriot', 'Jacque', 'Jupiter'),
(5, 'Décaméron', 'Francis', 'Neptune'),
(6, 'Fictions', 'Paul', 'Saturne'),
(7, 'Les Hauts de Hurlevent', 'François', 'Uranus'),
(8, 'Voyage au bout de la nuit', 'Jean', 'Terre'),
(9, 'Nostromo', 'Pascal', 'Pluton');

-- --------------------------------------------------------

--
-- Structure de la table `copy`
--

DROP TABLE IF EXISTS `copy`;
CREATE TABLE IF NOT EXISTS `copy` (
  `id_copy` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(1) NOT NULL,
  `book_id_book` int(11) NOT NULL,
  PRIMARY KEY (`id_copy`,`book_id_book`),
  KEY `fk_copy_book_idx` (`book_id_book`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `copy`
--

INSERT INTO `copy` (`id_copy`, `status`, `book_id_book`) VALUES
(1, '1', 1),
(2, '1', 3),
(3, '1', 4),
(4, '1', 5),
(5, '1', 7),
(6, '1', 8);

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(18),
(18),
(18),
(18);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int(11) NOT NULL,
  `date_begin` varchar(10) NOT NULL,
  `date_end` varchar(10) NOT NULL,
  `is_archived` bit(1) NOT NULL,
  `copy_id_copy` int(11) DEFAULT NULL,
  `user_id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `FKqi7lhfwyhj9d36gskjq8oua3b` (`copy_id_copy`),
  KEY `FK25jqw2231pf7lr2l8u3c8kdtd` (`user_id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `date_begin`, `date_end`, `is_archived`, `copy_id_copy`, `user_id_user`) VALUES
(1, '01.12.2017', '10.11.2020', b'0', 1, 1),
(2, '02.12.2019', '10.11.2020', b'0', 2, 2),
(3, '03.12.2019', '10.11.2020', b'0', 3, 1),
(4, '03.12.2019', '10.11.2020', b'0', 4, 2),
(5, '03.12.2019', '08.01.2020', b'0', 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL,
  `active` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `active`, `email`, `firstname`, `lastname`, `password`) VALUES
(1, b'1', 'aaa@aol.fr', 'Jack', 'Prou', '$2a$10$.961IyusOh6lnC6ZBl/48.FLVKpcNwRr.bIBqGKNKxnapEBmzoH2.'),
(2, b'1', 'bbb@aol.fr', 'Paul', 'Ikke', '$2a$10$.NFooHIoopytUAqnFjO6wuK8Va4OgNC9CipPX4cGEtxnHqwa3Cfvi');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `copy`
--
ALTER TABLE `copy`
  ADD CONSTRAINT `FKdcr74s5bloxk7inpwe31wqhjc` FOREIGN KEY (`book_id_book`) REFERENCES `book` (`id_book`),
  ADD CONSTRAINT `fk_copy_book` FOREIGN KEY (`book_id_book`) REFERENCES `book` (`id_book`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 28 Juin 2016 à 17:53
-- Version du serveur :  5.7.12-0ubuntu1
-- Version de PHP :  7.0.4-7ubuntu2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ventelivres`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `livre_activ` (IN `plivre` INT(11))  update livres
set actif = 1
where LivreID = plivre and actif = 2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `livre_create` (IN `ptitre` VARCHAR(255) CHARSET utf8, IN `pauteur` VARCHAR(255) CHARSET utf8, IN `pprix_unitaire` DECIMAL(10,0), IN `pactif` INT(1))  NO SQL
INSERT INTO livres (titre, auteur, prix_unitaire, actif)
VALUES(ptitre, pauteur, pprix_unitaire, pactif)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `livre_desactiv` (IN `plivre` INT(11))  update livres set actif = 2 where LivreID = plivre and actif = 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `livre_find` (IN `pLivreID` INT(1))  NO SQL
SELECT * FROM livres WHERE LivreID=pLivreID LIMIT 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `livre_update` (IN `pLivreID` VARCHAR(255) CHARSET utf8, IN `ptitre` VARCHAR(255) CHARSET utf8, IN `pauteur` VARCHAR(255) CHARSET utf8, IN `pprix_unitaire` DECIMAL(10,0), IN `pactif` INT(1))  NO SQL
UPDATE livres
SET titre = ptitre, auteur = pauteur, prix_unitaire = pprix_unitaire, actif = pactif
WHERE LivreID = pLivreID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `utilisateur_activ` (IN `putilisateur` VARCHAR(255))  update utilisateurs
set actif = 1
where utilisateur = putilisateur and actif = 2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `utilisateur_create` (IN `putilisateur` VARCHAR(255) CHARSET utf8, IN `pcode` VARCHAR(255) CHARSET utf8, IN `pnom` VARCHAR(255) CHARSET utf8, IN `pprenom` VARCHAR(255) CHARSET utf8, IN `padmin` INT(1), IN `pactif` INT(1))  NO SQL
INSERT INTO utilisateurs
VALUES (putilisateur, pcode, pnom, pprenom, padmin, pactif)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `utilisateur_desactiv` (IN `putilisateur` VARCHAR(255))  update utilisateurs set actif = 2 where utilisateur = putilisateur and actif = 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `utilisateur_exist` (IN `putilisateur` VARCHAR(255))  NO SQL
SELECT COUNT(*) AS total FROM utilisateurs WHERE utilisateur=putilisateur$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `utilisateur_find` (IN `putilisateur` VARCHAR(255))  NO SQL
SELECT * FROM utilisateurs WHERE utilisateur=putilisateur LIMIT 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `utilisateur_update` (IN `putilisateur` VARCHAR(255) CHARSET utf8, IN `pcode` VARCHAR(255) CHARSET utf8, IN `pnom` VARCHAR(255) CHARSET utf8, IN `pprenom` VARCHAR(255) CHARSET utf8, IN `padmin` INT(1), IN `pactif` INT(1))  NO SQL
update utilisateurs
set utilisateur = putilisateur, code = pcode, nom = pnom, prenom = pprenom, admin = padmin, actif = pactif
where utilisateur = putilisateur$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vente_create` (IN `putilisateur` VARCHAR(255) CHARSET utf8)  NO SQL
INSERT INTO ventes (datevente,etat,utilisateurs_utilisateur)
VALUES (UNIX_TIMESTAMP (now()), 'valide', putilisateur)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vente_details_create` (IN `plivreid` INT, IN `pprix_unitaire` FLOAT, IN `pquantite` INT, IN `pidvente` INT)  NO SQL
INSERT INTO vente_details (livres_LivreID,prix_unitaire,quantite,vente_idvente)
VALUES (plivreid,pprix_unitaire,pquantite,pidvente)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `LivreID` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `auteur` varchar(255) DEFAULT NULL,
  `prix_unitaire` decimal(10,0) DEFAULT NULL,
  `actif` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `livres`
--

INSERT INTO `livres` (`LivreID`, `titre`, `auteur`, `prix_unitaire`, `actif`) VALUES
(1, 'La main invisible', 'Adam Smith', '156', 1),
(3, 'Les 3 petits cochons', 'Inconnu', '11', 2),
(7, 'Les trois mousquetaires', 'Alexandre Dumas', '17', 1),
(6, 'Croc-blanc', 'Jack London', '113', 1),
(8, 'Le procès', 'Kafka', '22', 1),
(9, 'Le château de mon père', 'Marcel Pagnol', '13', 2),
(10, 'Les damnés de la terre', 'Amine Maalouf', '24', 1),
(11, 'Le lièvre et la tortue', 'Jean de La Fontaine', '10', 1),
(13, 'Harry Potter', 'J. K. Rowling', '26', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `utilisateur` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `admin` int(1) DEFAULT NULL,
  `actif` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`utilisateur`, `code`, `nom`, `prenom`, `admin`, `actif`) VALUES
('dkr123', 'dkr123', 'Krasucki', 'Dimtri', 1, 1),
('jma123', '1234', 'Abe1', 'Jean-Michel', 1, 1),
('jlm-123', 'jlm-123', 'Lopez-Meca', 'Julien', 1, 1),
('lga123', 'lga', 'Giunta', 'Luca', 1, 1),
('kbr123', 'kbr123', 'Brouckaert', 'Kevin', 2, 1),
('bds123', 'bds123', 'Desguin', 'Bruno', 1, 2),
('sak123', 'sak123', 'Alkilani', 'Samih', 2, 1),
('jbg123', 'jbg123', 'Bourgaux', 'Jordan', 2, 1),
('fou123', 'fou123', 'Ualassri', 'Fouad', 2, 1),
('ccalay', '1234', 'Calay', 'Caroline', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ventes`
--

CREATE TABLE `ventes` (
  `idvente` int(11) NOT NULL,
  `datevente` int(11) DEFAULT NULL,
  `etat` varchar(255) DEFAULT NULL,
  `utilisateurs_utilisateur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vente_details`
--

CREATE TABLE `vente_details` (
  `idvente_detail` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  `prix_unitaire` decimal(10,0) DEFAULT NULL,
  `vente_idvente` int(11) NOT NULL,
  `livres_LivreID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`LivreID`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`utilisateur`);

--
-- Index pour la table `ventes`
--
ALTER TABLE `ventes`
  ADD PRIMARY KEY (`idvente`,`utilisateurs_utilisateur`),
  ADD KEY `fk_vente_utilisateurs_idx` (`utilisateurs_utilisateur`);

--
-- Index pour la table `vente_details`
--
ALTER TABLE `vente_details`
  ADD PRIMARY KEY (`idvente_detail`,`vente_idvente`),
  ADD KEY `fk_vente_detail_livres1_idx` (`livres_LivreID`),
  ADD KEY `fk_vente_detail_vente1_idx` (`vente_idvente`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `LivreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `ventes`
--
ALTER TABLE `ventes`
  MODIFY `idvente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `vente_details`
--
ALTER TABLE `vente_details`
  MODIFY `idvente_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

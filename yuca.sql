-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 08 jan. 2021 à 13:56
-- Version du serveur :  8.0.22-0ubuntu0.20.04.3
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `yuca`
--

-- --------------------------------------------------------

--
-- Structure de la table `aliment`
--

CREATE TABLE `aliment` (
  `id` int NOT NULL,
  `nom` text COLLATE utf8_unicode_ci NOT NULL,
  `date_achat` datetime NOT NULL,
  `prix_achat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stock_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `aliment`
--

INSERT INTO `aliment` (`id`, `nom`, `date_achat`, `prix_achat`, `stock_id`) VALUES
(4, 'Framboise', '2021-01-08 10:59:30', '2.49', 1),
(5, 'Framboise', '2021-01-08 11:00:33', '2.49', 1),
(6, 'Courgette', '2021-01-08 11:00:33', '1.49', 1),
(7, 'Tomate', '2021-01-08 11:00:33', '1.99', 1),
(8, 'Radis', '2021-01-08 11:00:33', '1.29', 1);

-- --------------------------------------------------------

--
-- Structure de la table `assoc_alim_type_saison`
--

CREATE TABLE `assoc_alim_type_saison` (
  `id` int NOT NULL,
  `alim_id` int NOT NULL,
  `type_id` int NOT NULL,
  `saison_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `assoc_alim_type_saison`
--

INSERT INTO `assoc_alim_type_saison` (`id`, `alim_id`, `type_id`, `saison_id`) VALUES
(1, 4, 2, 6),
(2, 4, 2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `saison`
--

CREATE TABLE `saison` (
  `id` int NOT NULL,
  `saison` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `saison`
--

INSERT INTO `saison` (`id`, `saison`) VALUES
(6, 'Année'),
(4, 'Automne'),
(3, 'Ete'),
(5, 'Hiver'),
(1, 'Printemps'),
(2, 'Printemps');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `id` int NOT NULL,
  `stock` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id`, `stock`) VALUES
(1, 0),
(2, 0),
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `id` int NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `type`) VALUES
(1, 'Fruits'),
(2, 'Fruits'),
(3, 'Legumes'),
(4, 'Legumineuses'),
(8, 'Liquide'),
(7, 'Poisson'),
(5, 'Produits laitiers'),
(9, 'Surgelés'),
(6, 'Viande');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aliment`
--
ALTER TABLE `aliment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Index pour la table `assoc_alim_type_saison`
--
ALTER TABLE `assoc_alim_type_saison`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alim_id` (`alim_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `saison_id` (`saison_id`);

--
-- Index pour la table `saison`
--
ALTER TABLE `saison`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saison` (`saison`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock` (`stock`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aliment`
--
ALTER TABLE `aliment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `assoc_alim_type_saison`
--
ALTER TABLE `assoc_alim_type_saison`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `saison`
--
ALTER TABLE `saison`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aliment`
--
ALTER TABLE `aliment`
  ADD CONSTRAINT `aliment_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`);

--
-- Contraintes pour la table `assoc_alim_type_saison`
--
ALTER TABLE `assoc_alim_type_saison`
  ADD CONSTRAINT `assoc_alim_type_saison_ibfk_1` FOREIGN KEY (`saison_id`) REFERENCES `saison` (`id`),
  ADD CONSTRAINT `assoc_alim_type_saison_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `assoc_alim_type_saison_ibfk_3` FOREIGN KEY (`alim_id`) REFERENCES `aliment` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 20 Mai 2017 à 15:03
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `express_food`
--

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gps_latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gps_longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `deliverers`
--

CREATE TABLE `deliverers` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `gps_latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gps_longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dishes`
--

CREATE TABLE `dishes` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `photos` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `managers`
--

CREATE TABLE `managers` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `deliverer_id` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `customers_id` int(11) NOT NULL,
  `deliverers_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders_dishes`
--

CREATE TABLE `orders_dishes` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `dishes_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `deliverers`
--
ALTER TABLE `deliverers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_customers1_idx` (`customers_id`),
  ADD KEY `fk_orders_deliverers1_idx` (`deliverers_id`);

--
-- Index pour la table `orders_dishes`
--
ALTER TABLE `orders_dishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_dishes_dishes_idx` (`dishes_id`),
  ADD KEY `fk_orders_dishes_orders1_idx` (`orders_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `deliverers`
--
ALTER TABLE `deliverers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `managers`
--
ALTER TABLE `managers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `orders_dishes`
--
ALTER TABLE `orders_dishes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customers1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_deliverers1` FOREIGN KEY (`deliverers_id`) REFERENCES `deliverers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `orders_dishes`
--
ALTER TABLE `orders_dishes`
  ADD CONSTRAINT `fk_orders_dishes_dishes` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_dishes_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


INSERT INTO `managers` (`id`, `firstname`, `lastname`, `phone`, `login`, `password`) VALUES (NULL, 'Serge ', 'D\'Assaut', '0645127820', 's.dassaut', '7d837c398f061197825ef5655e85b229'), (NULL, 'Christiane', 'Taubira', '07824519630', 'c.taubira', 'ef710546d1a89771dcecbef0f504ec81');

INSERT INTO `dishes` (`id`, `date`, `name`, `type`, `description`, `photos`) VALUES (NULL, '2017-05-22', 'Velouté de lentilles', 'Délicat velouté de lentilles à la crème de fenouil.
Les lentilles sont réputées idéales contre la fatigue et le fenouil fait un excellent antioxydant.', 1, '[http://www.francine.com/images/content/recettes/EN/crme-de-lentilles.jpg]'), (NULL, '2017-05-22', 'Estouffade d\'agneau aux cèpes', 'Servie avec sa farandole de céréales anciennes, cette estouffade d\'agneau et ses cèpes vous feront passer un repas d\'exception.', 1, '[http://img.cac.pmdstatic.net/fit/http.3A.2F.2Fwww.2Ecuisineactuelle.2Efr.2Fvar.2Fcui.2Fstorage.2Fimages.2Frecettes-de-cuisine.2Fviande.2Fcanard.2Festouffade-de-cepes-a-la-gasconne-276734.2F2945227-1-fre-FR.2Festouffade-de-cepes-a-la-gasconne.2Ejpg/300x225/crop-from/center/estouffade-de-cepes-a-la-gasconne.jpeg]');

INSERT INTO `dishes` (`id`, `date`, `name`, `type`, `description`, `photos`) VALUES (NULL, '2017-05-22', 'Tiramisu', '2', 'Infimement relevé au rhum, ce tiramisu ravira vos papilles. Chaque bouchée fondante vous donnera la sensation de déguster un nuage.', '[http://img-3.journaldesfemmes.com/45Ut-TllYOrlbrBiHuXtFEEHLkg=/750x/smart/image-icu/10021897_1450775950.jpg]'), (NULL, '2017-05-22', 'Tartelette au citron meringuée', '2', 'Un classique, mais pourtant si bon.', '[http://img.cac.pmdstatic.net/fit/http.3A.2F.2Fwww.2Ecuisineactuelle.2Efr.2Fvar.2Fcui.2Fstorage.2Fimages.2Frecettes-de-cuisine.2Fdessert.2Ftartes.2Ftartelette-au-citron-meringuee-276907.2F3086262-1-fre-FR.2Ftartelette-au-citron-meringuee.2Ejpg/345x258/crop-from/center/tartelette-au-citron-meringuee.jpeg]');

INSERT INTO `deliverers` (`id`, `firstname`, `lastname`, `phone`, `login`, `password`, `status`, `gps_latitude`, `gps_longitude`) VALUES (NULL, 'Frédéric', 'Bouleau', '0782496530', 'f.bouleau', '40f69d39709c075dec09f2cb3c7542f0', '1', '48.862725', '2.287592'), (NULL, 'Amélie', 'Soubille', '0654217893', 'a.soubille', '40f69d39709c075dec09f2cb3c7542f0', '1', '48.864851', '2.376766');

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `address`, `zip_code`, `city`, `gps_latitude`, `gps_longitude`, `phone`, `comment`) VALUES (NULL, 'Ginette', 'Pitras', '68 Avenue Denfert-Rochereau', '75014', 'Paris', '48.838509', '2.335625', '0154879236', 'Sonner à l\'interphone, au numéro 3.');

INSERT INTO `orders` (`id`, `date`, `customer_id`, `deliverer_id`) VALUES (NULL, '1495472144', '1', '2');

INSERT INTO `orders_dishes` (`id`, `quantity`, `dish_id`, `order_id`) VALUES (NULL, '1', '1', '1'), (NULL, '1', '4', '1');
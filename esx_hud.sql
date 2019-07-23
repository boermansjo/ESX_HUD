-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 23 jul 2019 om 21:28
-- Serverversie: 5.6.13
-- PHP-versie: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `esx_hud`
--
CREATE DATABASE IF NOT EXISTS `esx_hud` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `esx_hud`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `characters`
--

CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `height` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `jobs`
--

INSERT INTO `jobs` (`name`, `label`) VALUES
('unemployed', 'Unemployed');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `job_grades`
--

CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Gegevens worden uitgevoerd voor tabel `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `outfits`
--

CREATE TABLE IF NOT EXISTS `outfits` (
  `idSteam` varchar(255) NOT NULL,
  `dad` int(11) NOT NULL DEFAULT '0',
  `mum` int(11) NOT NULL DEFAULT '0',
  `dadmumpercent` int(11) NOT NULL DEFAULT '0',
  `skinton` int(11) NOT NULL DEFAULT '0',
  `eyecolor` int(11) NOT NULL DEFAULT '0',
  `acne` int(11) NOT NULL DEFAULT '0',
  `skinproblem` int(11) NOT NULL DEFAULT '0',
  `freckle` int(11) NOT NULL DEFAULT '0',
  `wrinkle` int(11) NOT NULL DEFAULT '0',
  `wrinkleopacity` int(11) NOT NULL DEFAULT '0',
  `eyebrow` int(11) NOT NULL DEFAULT '0',
  `eyebrowopacity` int(11) NOT NULL DEFAULT '0',
  `beard` int(11) NOT NULL DEFAULT '0',
  `beardopacity` int(11) NOT NULL DEFAULT '0',
  `beardcolor` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `hairtext` int(11) NOT NULL DEFAULT '0',
  `torso` int(11) NOT NULL DEFAULT '0',
  `torsotext` int(11) NOT NULL DEFAULT '0',
  `leg` int(11) NOT NULL DEFAULT '0',
  `legtext` int(11) NOT NULL DEFAULT '0',
  `shoes` int(11) NOT NULL DEFAULT '0',
  `shoestext` int(11) NOT NULL DEFAULT '0',
  `accessory` int(11) NOT NULL DEFAULT '0',
  `accessorytext` int(11) NOT NULL DEFAULT '0',
  `undershirt` int(11) NOT NULL DEFAULT '0',
  `undershirttext` int(11) NOT NULL DEFAULT '0',
  `torso2` int(11) NOT NULL DEFAULT '0',
  `torso2text` int(11) NOT NULL DEFAULT '0',
  `prop_hat` int(11) NOT NULL DEFAULT '0',
  `prop_hat_text` int(11) NOT NULL DEFAULT '0',
  `prop_glasses` int(11) NOT NULL DEFAULT '0',
  `prop_glasses_text` int(11) NOT NULL DEFAULT '0',
  `prop_earrings` int(11) NOT NULL DEFAULT '0',
  `prop_earrings_text` int(11) NOT NULL DEFAULT '0',
  `prop_watches` int(11) NOT NULL DEFAULT '0',
  `prop_watches_text` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `license` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `skin` longtext,
  `job` varchar(50) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext,
  `position` varchar(36) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) DEFAULT '',
  `lastname` varchar(50) DEFAULT '',
  `dateofbirth` varchar(25) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `height` varchar(5) DEFAULT '',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_accounts`
--

CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Gegevens worden uitgevoerd voor tabel `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
(1, 'steam:110000102d05f71', 'black_money', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_inventory`
--

CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

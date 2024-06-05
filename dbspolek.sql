-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pát 15. bře 2024, 23:41
-- Verze serveru: 8.0.34
-- Verze PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `dbspolek`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `clanky`
--

CREATE TABLE `clanky` (
  `IdClanku` int NOT NULL,
  `IdAutora` int NOT NULL,
  `NazevClanku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `Prefix` text CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `Obsah` text CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `DatumPridani` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `clanky`
--

INSERT INTO `clanky` (`IdClanku`, `IdAutora`, `NazevClanku`, `Prefix`, `Obsah`, `DatumPridani`) VALUES
(1, 1, 'dafdfs', '  <p><strong>Tohle je perexxxx</strong></p>', '<p>Obsah čl&aacute;nku<strong> BOLD</strong></p>\r\n<p>&nbsp;</p>\r\n<hr>\r\n<p>A pozor!</p>\r\n<p>Ekonomice se skl&aacute;d&aacute; ze dvou hlavn&iacute;ch č&aacute;st&iacute;:</p>\r\n<ol>\r\n<li style=\"text-align: center; font-weight: bold; font-family: impact, sans-serif;\"><span style=\"font-family: impact, sans-serif;\"><strong>Mikroekonomie</strong></span></li>\r\n<li style=\"text-align: center; font-weight: bold; font-family: impact, sans-serif;\"><span style=\"font-family: impact, sans-serif;\"><strong>Makroekonomie</strong></span></li>\r\n<li style=\"text-align: center; font-weight: bold; font-family: impact, sans-serif;\"><span style=\"font-family: impact, sans-serif;\"><strong>Třetí není!!</strong></span></li>\r\n\r\n</ol>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '2024-03-09'),
(2, 1, 'dfsa', '<p>fdsa</p>', '<p>afs</p>', '2024-03-10'),
(3, 1, 'Názevčlánku', '<p>&uacute;vod</p>', '<p>Obsah čl&aacute;nku</p>\r\n<p>&nbsp;</p>\r\n<p><strong>měnit text</strong></p>', '2024-03-13'),
(4, 1, 'Lorem ipsum', '<p><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sapien ipsum, bibendum quis dui eu, tempor maximus nisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sit amet libero diam. Ut vestibulum tortor nibh, a molestie augue lobortis imperdiet. Ut euismod ante ut arcu cursus ultrices. Phasellus ut orci a nisl posuere sollicitudin vitae vitae ex. Aenean malesuada est non dolor mattis rhoncus. Sed sollicitudin fermentum lectus sed condimentum. Aenean eget tortor non ipsum tincidunt volutpat id in urna. Nulla facilisi. Nam sed odio ultricies, scelerisque lacus a, consectetur nunc. Morbi imperdiet et justo non vehicula. Suspendisse at feugiat velit. Fusce lacinia massa et libero aliquam sagittis ut ornare orci.</strong></p>\r\n<p>&nbsp;</p>\r\n<p class=\"c_aW f_f9 speakable\" style=\"line-height: 1.5;\" data-dot=\"ogm-article-perex\">&nbsp;</p>\r\n<div class=\"f_ga\">&nbsp;</div>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sapien ipsum, bibendum quis dui eu, tempor maximus nisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sit amet libero diam. Ut vestibulum tortor nibh, a molestie augue lobortis imperdiet. Ut euismod ante ut arcu cursus ultrices. Phasellus ut orci a nisl posuere sollicitudin vitae vitae ex. Aenean malesuada est non dolor mattis rhoncus. Sed sollicitudin fermentum lectus sed condimentum. Aenean eget tortor non ipsum tincidunt volutpat id in urna. Nulla facilisi. Nam sed odio ultricies, scelerisque lacus a, consectetur nunc. Morbi imperdiet et justo non vehicula. Suspendisse at feugiat velit. Fusce lacinia massa et libero aliquam sagittis ut ornare orci.</p>\r\n<p>Mauris consequat viverra lorem et mollis. Suspendisse nec dolor eget sem mollis gravida. Cras sodales consequat diam sed ultrices. Pellentesque et facilisis mauris, lobortis pharetra elit. Integer interdum efficitur quam id dignissim. Maecenas eleifend lacus commodo, pellentesque neque sit amet, tincidunt arcu. Nulla consequat consectetur tincidunt. Proin lobortis, ligula consequat mollis interdum, tortor urna sollicitudin mi, rhoncus dapibus arcu augue nec eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nisl interdum, rhoncus augue at, elementum velit. Cras efficitur sit amet sem vel dapibus.</p>\r\n<p>Ut vitae lorem semper, semper mi nec, aliquam arcu. Curabitur imperdiet sollicitudin nunc, in sagittis nisi euismod a. Donec porttitor, neque a hendrerit venenatis, metus quam tempus magna, quis porta arcu mauris in nisi. Fusce et tellus et nisl luctus interdum non a mauris. Aenean a ante et dui euismod fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque vestibulum maximus dolor, vitae porta felis ullamcorper ac. Curabitur condimentum vestibulum mollis. Aliquam ac maximus quam, ac efficitur tellus. Nam convallis, nibh et tempor dapibus, libero augue pulvinar sapien, in blandit est elit et erat. Nulla nisi felis, porttitor in ultrices quis, convallis sed est. Integer scelerisque magna eget ullamcorper faucibus. Praesent molestie sodales maximus.</p>\r\n<p>Donec euismod erat sit amet commodo accumsan. Nam ultrices et elit aliquam cursus. Sed sem sapien, sollicitudin vitae turpis eu, malesuada suscipit ante. Sed in sodales nulla. Morbi pretium orci et turpis gravida, auctor rhoncus risus eleifend. Curabitur vehicula erat et arcu lobortis pulvinar. Sed elit odio, posuere a iaculis quis, rutrum at odio. Fusce pretium dapibus ipsum et fermentum. Suspendisse potenti. Maecenas hendrerit lacinia mauris et faucibus. Ut tortor orci, pulvinar a interdum vulputate, lacinia eu neque.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tempor nulla et ante condimentum scelerisque. Phasellus vel consectetur mauris, vel vestibulum augue. Duis ullamcorper eget tellus eget condimentum. Vestibulum sed felis dictum massa sollicitudin egestas. Nullam vulputate nec odio sit amet lobortis. Donec id euismod dolor. Fusce at turpis elementum, scelerisque enim ac, facilisis lorem. Donec vel ipsum condimentum, suscipit augue ac, varius enim. Donec sit amet ex enim. Nulla quis imperdiet risus. Nam luctus lorem sit amet scelerisque facilisis.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sapien ipsum, bibendum quis dui eu, tempor maximus nisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sit amet libero diam. Ut vestibulum tortor nibh, a molestie augue lobortis imperdiet. Ut euismod ante ut arcu cursus ultrices. Phasellus ut orci a nisl posuere sollicitudin vitae vitae ex. Aenean malesuada est non dolor mattis rhoncus. Sed sollicitudin fermentum lectus sed condimentum. Aenean eget tortor non ipsum tincidunt volutpat id in urna. Nulla facilisi. Nam sed odio ultricies, scelerisque lacus a, consectetur nunc. Morbi imperdiet et justo non vehicula. Suspendisse at feugiat velit. Fusce lacinia massa et libero aliquam sagittis ut ornare orci.</p>\r\n<p>Mauris consequat viverra lorem et mollis. Suspendisse nec dolor eget sem mollis gravida. Cras sodales consequat diam sed ultrices. Pellentesque et facilisis mauris, lobortis pharetra elit. Integer interdum efficitur quam id dignissim. Maecenas eleifend lacus commodo, pellentesque neque sit amet, tincidunt arcu. Nulla consequat consectetur tincidunt. Proin lobortis, ligula consequat mollis interdum, tortor urna sollicitudin mi, rhoncus dapibus arcu augue nec eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nisl interdum, rhoncus augue at, elementum velit. Cras efficitur sit amet sem vel dapibus.</p>\r\n<p>Ut vitae lorem semper, semper mi nec, aliquam arcu. Curabitur imperdiet sollicitudin nunc, in sagittis nisi euismod a. Donec porttitor, neque a hendrerit venenatis, metus quam tempus magna, quis porta arcu mauris in nisi. Fusce et tellus et nisl luctus interdum non a mauris. Aenean a ante et dui euismod fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque vestibulum maximus dolor, vitae porta felis ullamcorper ac. Curabitur condimentum vestibulum mollis. Aliquam ac maximus quam, ac efficitur tellus. Nam convallis, nibh et tempor dapibus, libero augue pulvinar sapien, in blandit est elit et erat. Nulla nisi felis, porttitor in ultrices quis, convallis sed est. Integer scelerisque magna eget ullamcorper faucibus. Praesent molestie sodales maximus.</p>\r\n<p>Donec euismod erat sit amet commodo accumsan. Nam ultrices et elit aliquam cursus. Sed sem sapien, sollicitudin vitae turpis eu, malesuada suscipit ante. Sed in sodales nulla. Morbi pretium orci et turpis gravida, auctor rhoncus risus eleifend. Curabitur vehicula erat et arcu lobortis pulvinar. Sed elit odio, posuere a iaculis quis, rutrum at odio. Fusce pretium dapibus ipsum et fermentum. Suspendisse potenti. Maecenas hendrerit lacinia mauris et faucibus. Ut tortor orci, pulvinar a interdum vulputate, lacinia eu neque.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tempor nulla et ante condimentum scelerisque. Phasellus vel consectetur mauris, vel vestibulum augue. Duis ullamcorper eget tellus eget condimentum. Vestibulum sed felis dictum massa sollicitudin egestas. Nullam vulputate nec odio sit amet lobortis. Donec id euismod dolor. Fusce at turpis elementum, scelerisque enim ac, facilisis lorem. Donec vel ipsum condimentum, suscipit augue ac, varius enim. Donec sit amet ex enim. Nulla quis imperdiet risus. Nam luctus lorem sit amet scelerisque facilisis.</p>', '2024-03-15'),
(5, 1, 'Lorem ipsum', '<p><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sapien ipsum, bibendum quis dui eu, tempor maximus nisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sit amet libero diam. Ut vestibulum tortor nibh, a molestie augue lobortis imperdiet. Ut euismod ante ut arcu cursus ultrices. Phasellus ut orci a nisl posuere sollicitudin vitae vitae ex. Aenean malesuada est non dolor mattis rhoncus. Sed sollicitudin fermentum lectus sed condimentum. Aenean eget tortor non ipsum tincidunt volutpat id in urna. Nulla facilisi. Nam sed odio ultricies, scelerisque lacus a, consectetur nunc. Morbi imperdiet et justo non vehicula. Suspendisse at feugiat velit. Fusce lacinia massa et libero aliquam sagittis ut ornare orci.</strong></p>\r\n<p>&nbsp;</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sapien ipsum, bibendum quis dui eu, tempor maximus nisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sit amet libero diam. Ut vestibulum tortor nibh, a molestie augue lobortis imperdiet. Ut euismod ante ut arcu cursus ultrices. Phasellus ut orci a nisl posuere sollicitudin vitae vitae ex. Aenean malesuada est non dolor mattis rhoncus. Sed sollicitudin fermentum lectus sed condimentum. Aenean eget tortor non ipsum tincidunt volutpat id in urna. Nulla facilisi. Nam sed odio ultricies, scelerisque lacus a, consectetur nunc. Morbi imperdiet et justo non vehicula. Suspendisse at feugiat velit. Fusce lacinia massa et libero aliquam sagittis ut ornare orci.</p>\r\n<p>Mauris consequat viverra lorem et mollis. Suspendisse nec dolor eget sem mollis gravida. Cras sodales consequat diam sed ultrices. Pellentesque et facilisis mauris, lobortis pharetra elit. Integer interdum efficitur quam id dignissim. Maecenas eleifend lacus commodo, pellentesque neque sit amet, tincidunt arcu. Nulla consequat consectetur tincidunt. Proin lobortis, ligula consequat mollis interdum, tortor urna sollicitudin mi, rhoncus dapibus arcu augue nec eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nisl interdum, rhoncus augue at, elementum velit. Cras efficitur sit amet sem vel dapibus.</p>\r\n<p>Ut vitae lorem semper, semper mi nec, aliquam arcu. Curabitur imperdiet sollicitudin nunc, in sagittis nisi euismod a. Donec porttitor, neque a hendrerit venenatis, metus quam tempus magna, quis porta arcu mauris in nisi. Fusce et tellus et nisl luctus interdum non a mauris. Aenean a ante et dui euismod fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque vestibulum maximus dolor, vitae porta felis ullamcorper ac. Curabitur condimentum vestibulum mollis. Aliquam ac maximus quam, ac efficitur tellus. Nam convallis, nibh et tempor dapibus, libero augue pulvinar sapien, in blandit est elit et erat. Nulla nisi felis, porttitor in ultrices quis, convallis sed est. Integer scelerisque magna eget ullamcorper faucibus. Praesent molestie sodales maximus.</p>\r\n<p>Donec euismod erat sit amet commodo accumsan. Nam ultrices et elit aliquam cursus. Sed sem sapien, sollicitudin vitae turpis eu, malesuada suscipit ante. Sed in sodales nulla. Morbi pretium orci et turpis gravida, auctor rhoncus risus eleifend. Curabitur vehicula erat et arcu lobortis pulvinar. Sed elit odio, posuere a iaculis quis, rutrum at odio. Fusce pretium dapibus ipsum et fermentum. Suspendisse potenti. Maecenas hendrerit lacinia mauris et faucibus. Ut tortor orci, pulvinar a interdum vulputate, lacinia eu neque.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tempor nulla et ante condimentum scelerisque. Phasellus vel consectetur mauris, vel vestibulum augue. Duis ullamcorper eget tellus eget condimentum. Vestibulum sed felis dictum massa sollicitudin egestas. Nullam vulputate nec odio sit amet lobortis. Donec id euismod dolor. Fusce at turpis elementum, scelerisque enim ac, facilisis lorem. Donec vel ipsum condimentum, suscipit augue ac, varius enim. Donec sit amet ex enim. Nulla quis imperdiet risus. Nam luctus lorem sit amet scelerisque facilisis.</p>', '2024-03-15'),
(6, 1, 'Lorem ipsum', '<p>Lorem ipsum</p>', '<p>Lorem ipsum</p>', '2024-03-15'),
(7, 1, 'Lorem ipsum', '<p>Lorem ipsum</p>', '<p>Lorem ipsum</p>', '2024-03-15'),
(8, 1, 'Lorem ipsum', '<p>Lorem ipsum</p>', '<p>Lorem ipsum</p>', '2024-03-15'),
(9, 1, 'Lorem ipsum', '<p>Lorem ipsum</p>', '<p>Lorem ipsum</p>', '2024-03-15'),
(10, 1, 'Lorem ipsum', '<p>Lorem ipsum</p>', '<p>Lorem ipsum</p>', '2024-03-15'),
(11, 1, 'Lorem ipsum', '<p>Lorem ipsum</p>', '<p>Lorem ipsum</p>', '2024-03-15');

-- --------------------------------------------------------

--
-- Struktura tabulky `evidencekrmeni`
--

CREATE TABLE `evidencekrmeni` (
  `IdZaznamu` int NOT NULL,
  `idKrmeni` int NOT NULL,
  `idVcelstva` int NOT NULL,
  `Mnozstvi` double NOT NULL,
  `DatumKrmeni` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `evidencekrmeni`
--

INSERT INTO `evidencekrmeni` (`IdZaznamu`, `idKrmeni`, `idVcelstva`, `Mnozstvi`, `DatumKrmeni`) VALUES
(2, 1, 1, 2, '2024-03-06'),
(3, 1, 2, 5, '2005-08-15'),
(4, 1, 3, 3, '2023-05-18'),
(5, 1, 1, 25, '2024-03-13'),
(6, 1, 10, 1, '2024-03-13'),
(7, 1, 11, 3, '2024-03-13');

-- --------------------------------------------------------

--
-- Struktura tabulky `evidenceleceni`
--

CREATE TABLE `evidenceleceni` (
  `IdLeciva` int NOT NULL,
  `IdVcelstva` int NOT NULL,
  `Mnozstvi` double NOT NULL,
  `TypOsetreni` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `DatumLeceni` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `evidenceleceni`
--

INSERT INTO `evidenceleceni` (`IdLeciva`, `IdVcelstva`, `Mnozstvi`, `TypOsetreni`, `DatumLeceni`) VALUES
(1, 1, 1, 'gfds', '2024-03-06'),
(1, 2, 15, 'Postřik', '2005-08-14'),
(2, 1, 2, 'postřik', '2024-05-20'),
(1, 10, 1, 'Postřik', '2024-03-13');

-- --------------------------------------------------------

--
-- Struktura tabulky `komentare`
--

CREATE TABLE `komentare` (
  `IdKomentare` int NOT NULL,
  `Autor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `DatumVytvoreni` date NOT NULL,
  `Komentar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `komentare`
--

INSERT INTO `komentare` (`IdKomentare`, `Autor`, `DatumVytvoreni`, `Komentar`) VALUES
(1, 'tondaaaaaa', '2024-02-19', 'fdsasasasasasasasasasasasasasasa'),
(2, 'tondaaaaaa', '2024-02-19', 'Můj super komentář!!! xD'),
(3, 'pepa', '2024-02-19', 'Petra'),
(4, 'tondaaaaaa', '2024-02-21', 'Čau Praho!'),
(5, 'tondaaaaaa', '2024-02-21', 'Cože?'),
(6, 'tondaaaaaa', '2024-02-21', 'Super!!!'),
(7, 'tondaaaaaa', '2024-02-21', 'počkej minutku...'),
(8, 'tondaaaaaa', '2024-02-21', 'wait'),
(9, 'tondaaaaaa', '2024-02-21', 'už vím, čím to bylo!!! xDDD'),
(10, 'tondaaaaaa', '2024-02-21', 'Moment, ještě něco...'),
(11, 'tondaaaaaa', '2024-02-21', 'Už je finiš.'),
(12, 'tondaaaaaa', '2024-02-21', '1'),
(13, 'tondaaaaaa', '2024-02-21', '2'),
(14, 'tondaaaaaa', '2024-02-21', '3'),
(15, 'tondaaaaaa', '2024-02-21', '4'),
(16, 'tondaaaaaa', '2024-02-21', '5'),
(17, 'tondaaaaaa', '2024-02-21', '6'),
(18, 'tondaaaaaa', '2024-02-21', '7'),
(19, 'tondaaaaaa', '2024-02-21', '8'),
(20, 'tondaaaaaa', '2024-02-21', '9'),
(21, 'tondaaaaaa', '2024-02-21', '10'),
(22, 'tondaaaaaa', '2024-02-21', '11'),
(23, 'tondaaaaaa', '2024-02-21', '12'),
(24, 'tondaaaaaa', '2024-02-21', '13'),
(25, 'tondaaaaaa', '2024-03-07', 'Zpráva chat'),
(26, 'tondaaaaaa', '2024-03-13', 'Vkládat komentáře'),
(27, 'pepa', '2024-03-15', 'Ahojky všichni');

-- --------------------------------------------------------

--
-- Struktura tabulky `krmiva`
--

CREATE TABLE `krmiva` (
  `idKrmiva` int NOT NULL,
  `NazevKrmiva` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `Jednotky` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `krmiva`
--

INSERT INTO `krmiva` (`idKrmiva`, `NazevKrmiva`, `Jednotky`) VALUES
(1, 'krmivo', 'l');

-- --------------------------------------------------------

--
-- Struktura tabulky `leceni`
--

CREATE TABLE `leceni` (
  `idLeciva` int NOT NULL,
  `NazevLeceni` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `Jednotky` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `leceni`
--

INSERT INTO `leceni` (`idLeciva`, `NazevLeceni`, `Jednotky`) VALUES
(1, 'pokusnelecivo', 'ml'),
(2, 'nazevleciva', 'litry');

-- --------------------------------------------------------

--
-- Struktura tabulky `matkavcelstva`
--

CREATE TABLE `matkavcelstva` (
  `IdZaznamu` int NOT NULL,
  `IdMatky` int NOT NULL,
  `IdVcelstva` int NOT NULL,
  `DatumPridani` date NOT NULL,
  `JeVUlu` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `matkavcelstva`
--

INSERT INTO `matkavcelstva` (`IdZaznamu`, `IdMatky`, `IdVcelstva`, `DatumPridani`, `JeVUlu`) VALUES
(2, 1, 1, '2024-03-05', 0),
(3, 2, 1, '2024-03-06', 0),
(4, 2, 1, '2024-03-06', 0),
(5, 1, 1, '2024-03-05', 0),
(6, 2, 2, '2022-08-14', 0),
(7, 3, 3, '2023-05-18', 1),
(8, 4, 1, '2024-03-13', 0),
(9, 1, 10, '2024-03-13', 0),
(12, 5, 11, '2024-03-15', 0),
(13, 7, 13, '2024-01-10', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `matky`
--

CREATE TABLE `matky` (
  `IdMatky` int NOT NULL,
  `IdVcelare` int NOT NULL,
  `NazevMatky` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `Puvod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `Linie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `Uhyn` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `matky`
--

INSERT INTO `matky` (`IdMatky`, `IdVcelare`, `NazevMatky`, `Puvod`, `Linie`, `Uhyn`) VALUES
(1, 1, 'První matka', 'dafsssss', 'fsad', 0),
(2, 1, 'Druhá matka', 'adsf', 'afds', 0),
(3, 1, 'Mája', 'koupená', 'linie', 0),
(4, 1, 'Amálka', 'koupená', 'kavkazská ', 1),
(5, 1, 'm', 'm', 'm', 1),
(6, 1, 'fdas', 'dfsa', 'assd', 1),
(7, 2, 'Matka', 'koupená', 'kavkavská', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `prodejmedu`
--

CREATE TABLE `prodejmedu` (
  `IdZaznamu` int NOT NULL,
  `IdVcelare` int NOT NULL,
  `DruhMedu` varchar(255) COLLATE utf8mb3_czech_ci NOT NULL,
  `Mnozstvi` double NOT NULL,
  `Cena` double NOT NULL,
  `DatumProdeje` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

--
-- Vypisuji data pro tabulku `prodejmedu`
--

INSERT INTO `prodejmedu` (`IdZaznamu`, `IdVcelare`, `DruhMedu`, `Mnozstvi`, `Cena`, `DatumProdeje`) VALUES
(1, 1, 'Lesní', 5, 15, '2024-03-15'),
(2, 1, 'Slunečnicový', 1, 150, '2005-05-15'),
(3, 2, 'Lipový', 3, 5, '2024-03-15');

-- --------------------------------------------------------

--
-- Struktura tabulky `produkcemedu`
--

CREATE TABLE `produkcemedu` (
  `idProdukce` int NOT NULL,
  `idVcelstva` int NOT NULL,
  `idVcelare` int NOT NULL,
  `DatumVytaceni` date NOT NULL,
  `TypMedu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `Mnozstvi` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `produkcemedu`
--

INSERT INTO `produkcemedu` (`idProdukce`, `idVcelstva`, `idVcelare`, `DatumVytaceni`, `TypMedu`, `Mnozstvi`) VALUES
(2, 1, 1, '2024-03-05', 'Jetelový', 6),
(3, 1, 1, '2023-07-10', 'Květový', 20),
(4, 2, 1, '2005-08-15', 'Lipový', 10),
(5, 1, 1, '2024-03-05', 'Lipový', 2),
(6, 1, 1, '2024-03-13', 'Květový', 15);

-- --------------------------------------------------------

--
-- Struktura tabulky `soubory`
--

CREATE TABLE `soubory` (
  `idSouboru` int NOT NULL,
  `idAutora` int NOT NULL,
  `NazevSouboru` varchar(255) COLLATE utf8mb3_czech_ci NOT NULL,
  `Cesta` text COLLATE utf8mb3_czech_ci NOT NULL,
  `DatumPridani` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `stanoviste`
--

CREATE TABLE `stanoviste` (
  `IdStanoviste` int NOT NULL,
  `IdVcelare` int NOT NULL,
  `NazevStanoviste` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `UmisteniStanoviste` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `TypStanoviste` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `stanoviste`
--

INSERT INTO `stanoviste` (`IdStanoviste`, `IdVcelare`, `NazevStanoviste`, `UmisteniStanoviste`, `TypStanoviste`) VALUES
(2, 1, 'Prvni', 'Na louce za lesem', 'maringotka'),
(3, 1, 'DruheStan', 'Na louce za lesem', 'maringotka'),
(4, 1, 'TretiStan', 'Na louce za lesem', 'maringotka'),
(5, 1, 'ctvrte', 'Na louce za lesem', 'maringotka'),
(6, 1, 'paté', 'u rybnika', 'pevne na dlazdicich'),
(8, 1, 'PrvniStanoviste', 'Na louce za lesem', 'pevne'),
(9, 1, 'Maringotka - Voznice', 'Lesík za Voznicí', 'maringotka - pojízdná'),
(10, 2, 'Stanoviště - Potůček', 'Za potokem', 'pevné úly');

-- --------------------------------------------------------

--
-- Struktura tabulky `uly`
--

CREATE TABLE `uly` (
  `IdUlu` int NOT NULL,
  `idStanoviste` int NOT NULL,
  `IdVcelare` int NOT NULL,
  `OznaceniUlu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `TypUlu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `HmotnostUlu` double NOT NULL,
  `PocetNastavku` double NOT NULL,
  `TypRamku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `uly`
--

INSERT INTO `uly` (`IdUlu`, `idStanoviste`, `IdVcelare`, `OznaceniUlu`, `TypUlu`, `HmotnostUlu`, `PocetNastavku`, `TypRamku`) VALUES
(1, 2, 1, 'prvni', 'prvni', 2, 1, '30x30'),
(3, 2, 1, 'druhy', 'pevny', 0.5, 2, '32x32'),
(4, 3, 1, 'PrvniUlDruheStan', 'pevny', 1, 2, '32x32'),
(5, 5, 1, 'úl 1', 'Tachovák', 1, 5, '32x32'),
(6, 9, 1, '1', 'pevný', 2, 2, '32'),
(7, 9, 1, '2', 'p', 1, 2, '30x30'),
(8, 8, 1, 'Ulecek', 'maringotka', 25, 4, '32x32'),
(9, 10, 2, 'úl potůček 1', 'pevné', 3, 4, '30x30');

-- --------------------------------------------------------

--
-- Struktura tabulky `vcelari`
--

CREATE TABLE `vcelari` (
  `IdVcelare` int NOT NULL,
  `UzivatelskeJmeno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `Heslo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `Jmeno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `Prijmeni` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `DatumNarozeni` date NOT NULL,
  `Ulice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `Mesto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `PSC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `OverenyClen` tinyint(1) NOT NULL,
  `JeAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `vcelari`
--

INSERT INTO `vcelari` (`IdVcelare`, `UzivatelskeJmeno`, `Heslo`, `Jmeno`, `Prijmeni`, `DatumNarozeni`, `Ulice`, `Mesto`, `PSC`, `OverenyClen`, `JeAdmin`) VALUES
(1, 'tondaaaaaa', '163D638CEF03B7BDF9CD3115398375420E4B1119D41AAD82783F3064D06EF3C6', 'Antonín', 'Jelínek', '2001-08-14', 'K Ubytovně 61', 'Bořanovice', '25065', 1, 1),
(2, 'pepa', '8E854B34EB3BB57CBA581C63AE73C2A737E9D3FF14C61470CEFEF314F2B6D9C2', 'Josef', 'Doležal', '1985-01-12', 'Kožíkova 25', 'Kroměžíř', '76701', 1, 0),
(3, 'marta16', '5F42A655A4328658A36D21A99AEDC08AF2E922FF90B4CD8942323CEB1880AF41', 'Marta', 'Knödlová', '1975-04-22', 'Trocnovská 68', 'Vlašim', 'petra', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `vcelstva`
--

CREATE TABLE `vcelstva` (
  `IdVcelstva` int NOT NULL,
  `IdVcelare` int NOT NULL,
  `IdUlu` int NOT NULL,
  `NazevVcelstva` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `TypVcelstva` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `vcelstva`
--

INSERT INTO `vcelstva` (`IdVcelstva`, `IdVcelare`, `IdUlu`, `NazevVcelstva`, `TypVcelstva`) VALUES
(1, 1, 1, 'vcelstvo1', 'Oddělek'),
(2, 1, 4, 'vcelstvo', 'Oddělek'),
(3, 1, 5, '1. včelstvo', 'Oddělek'),
(10, 1, 6, 'vcelstvo', 'Oddělek'),
(11, 1, 7, 'fsdadfsa', 'Produkční'),
(12, 1, 3, '33', 'Roj'),
(13, 2, 9, 'vcelstvo', 'Produkční');

-- --------------------------------------------------------

--
-- Struktura tabulky `vcelstvauly`
--

CREATE TABLE `vcelstvauly` (
  `IdVcelstva` int NOT NULL,
  `IdUlu` int NOT NULL,
  `DatumPridani` date NOT NULL,
  `JeVUlu` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `vcelstvauly`
--

INSERT INTO `vcelstvauly` (`IdVcelstva`, `IdUlu`, `DatumPridani`, `JeVUlu`) VALUES
(1, 1, '2024-03-05', 1),
(1, 1, '2024-03-05', 1),
(2, 4, '2021-06-18', 1),
(3, 5, '2024-03-07', 1),
(10, 6, '2024-03-13', 1),
(11, 7, '2024-03-13', 1),
(12, 3, '2024-03-14', 1),
(13, 9, '2024-03-15', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `zaznamy`
--

CREATE TABLE `zaznamy` (
  `IdZaznamu` int NOT NULL,
  `IdVcelstva` int NOT NULL,
  `DatumZaznamu` date NOT NULL,
  `Zaznam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `zaznamy`
--

INSERT INTO `zaznamy` (`IdZaznamu`, `IdVcelstva`, `DatumZaznamu`, `Zaznam`) VALUES
(1, 1, '2024-03-06', 'Včelstvo má obecně dobrou, náladu není žádné viditelné poškození úlu.'),
(2, 1, '2024-03-13', 'Proběhla kontrola včelstva, nebyly nalezeny zádní roztoči, přes zimu byly včely dobře zazimovány, včelstvo je v velmi dobré kondici. Matka klade.'),
(3, 11, '2000-01-01', 'a');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `clanky`
--
ALTER TABLE `clanky`
  ADD PRIMARY KEY (`IdClanku`),
  ADD KEY `FKClankyidAutora` (`IdAutora`);

--
-- Indexy pro tabulku `evidencekrmeni`
--
ALTER TABLE `evidencekrmeni`
  ADD PRIMARY KEY (`IdZaznamu`),
  ADD KEY `FKEvidenceKrmeniidKrmeni` (`idKrmeni`),
  ADD KEY `FKEvidenceKrmeniidVcelstva` (`idVcelstva`);

--
-- Indexy pro tabulku `evidenceleceni`
--
ALTER TABLE `evidenceleceni`
  ADD KEY `FKEvidenceLeceniidLeciva` (`IdLeciva`),
  ADD KEY `FKEvidenceLeceniidVcelstva` (`IdVcelstva`);

--
-- Indexy pro tabulku `komentare`
--
ALTER TABLE `komentare`
  ADD PRIMARY KEY (`IdKomentare`);

--
-- Indexy pro tabulku `krmiva`
--
ALTER TABLE `krmiva`
  ADD PRIMARY KEY (`idKrmiva`);

--
-- Indexy pro tabulku `leceni`
--
ALTER TABLE `leceni`
  ADD PRIMARY KEY (`idLeciva`);

--
-- Indexy pro tabulku `matkavcelstva`
--
ALTER TABLE `matkavcelstva`
  ADD PRIMARY KEY (`IdZaznamu`),
  ADD KEY `FKMatkaVcelstvaIdmatky` (`IdMatky`),
  ADD KEY `FKMatkaVcelstvaIdVcelstva` (`IdVcelstva`);

--
-- Indexy pro tabulku `matky`
--
ALTER TABLE `matky`
  ADD PRIMARY KEY (`IdMatky`),
  ADD KEY `FKIdMatkyIdVcelare` (`IdVcelare`);

--
-- Indexy pro tabulku `prodejmedu`
--
ALTER TABLE `prodejmedu`
  ADD PRIMARY KEY (`IdZaznamu`),
  ADD KEY `FKprodejmeduidVcelare` (`IdVcelare`);

--
-- Indexy pro tabulku `produkcemedu`
--
ALTER TABLE `produkcemedu`
  ADD PRIMARY KEY (`idProdukce`),
  ADD KEY `FKProdukceMeduidVcelstva` (`idVcelstva`),
  ADD KEY `FKProdukceMeduidVcelare` (`idVcelare`);

--
-- Indexy pro tabulku `soubory`
--
ALTER TABLE `soubory`
  ADD PRIMARY KEY (`idSouboru`),
  ADD KEY `FKsouboryidAutora` (`idAutora`);

--
-- Indexy pro tabulku `stanoviste`
--
ALTER TABLE `stanoviste`
  ADD PRIMARY KEY (`IdStanoviste`),
  ADD KEY `FLVcelariIdVcelare` (`IdVcelare`);

--
-- Indexy pro tabulku `uly`
--
ALTER TABLE `uly`
  ADD PRIMARY KEY (`IdUlu`),
  ADD KEY `FKUlyidStanoviste` (`idStanoviste`),
  ADD KEY `FKUlyIdVcelare` (`IdVcelare`) USING BTREE;

--
-- Indexy pro tabulku `vcelari`
--
ALTER TABLE `vcelari`
  ADD PRIMARY KEY (`IdVcelare`);

--
-- Indexy pro tabulku `vcelstva`
--
ALTER TABLE `vcelstva`
  ADD PRIMARY KEY (`IdVcelstva`),
  ADD KEY `FKVcelstvaIdUlu` (`IdUlu`),
  ADD KEY `FKtbVcelstvaIdVcelare` (`IdVcelare`);

--
-- Indexy pro tabulku `vcelstvauly`
--
ALTER TABLE `vcelstvauly`
  ADD KEY `FKvcelstvaUlyIdVcelstva` (`IdVcelstva`),
  ADD KEY `FKvcelstvaUlyIdUlu` (`IdUlu`);

--
-- Indexy pro tabulku `zaznamy`
--
ALTER TABLE `zaznamy`
  ADD PRIMARY KEY (`IdZaznamu`),
  ADD KEY `FKZaznamyidVcelstva` (`IdVcelstva`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `clanky`
--
ALTER TABLE `clanky`
  MODIFY `IdClanku` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pro tabulku `evidencekrmeni`
--
ALTER TABLE `evidencekrmeni`
  MODIFY `IdZaznamu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `komentare`
--
ALTER TABLE `komentare`
  MODIFY `IdKomentare` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pro tabulku `krmiva`
--
ALTER TABLE `krmiva`
  MODIFY `idKrmiva` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `leceni`
--
ALTER TABLE `leceni`
  MODIFY `idLeciva` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `matkavcelstva`
--
ALTER TABLE `matkavcelstva`
  MODIFY `IdZaznamu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pro tabulku `matky`
--
ALTER TABLE `matky`
  MODIFY `IdMatky` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `prodejmedu`
--
ALTER TABLE `prodejmedu`
  MODIFY `IdZaznamu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `produkcemedu`
--
ALTER TABLE `produkcemedu`
  MODIFY `idProdukce` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `soubory`
--
ALTER TABLE `soubory`
  MODIFY `idSouboru` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `stanoviste`
--
ALTER TABLE `stanoviste`
  MODIFY `IdStanoviste` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `uly`
--
ALTER TABLE `uly`
  MODIFY `IdUlu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pro tabulku `vcelari`
--
ALTER TABLE `vcelari`
  MODIFY `IdVcelare` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `vcelstva`
--
ALTER TABLE `vcelstva`
  MODIFY `IdVcelstva` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pro tabulku `zaznamy`
--
ALTER TABLE `zaznamy`
  MODIFY `IdZaznamu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `clanky`
--
ALTER TABLE `clanky`
  ADD CONSTRAINT `FKtbClankyidAutora` FOREIGN KEY (`IdAutora`) REFERENCES `vcelari` (`IdVcelare`) ON DELETE RESTRICT;

--
-- Omezení pro tabulku `evidencekrmeni`
--
ALTER TABLE `evidencekrmeni`
  ADD CONSTRAINT `FKtbEvidenceKrmeniidKrmeni` FOREIGN KEY (`idKrmeni`) REFERENCES `krmiva` (`idKrmiva`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FKtbEvidenceKrmeniidVcelstva` FOREIGN KEY (`idVcelstva`) REFERENCES `vcelstva` (`IdVcelstva`) ON DELETE RESTRICT;

--
-- Omezení pro tabulku `evidenceleceni`
--
ALTER TABLE `evidenceleceni`
  ADD CONSTRAINT `FKtbEvidenceLeceniidLeciva` FOREIGN KEY (`IdLeciva`) REFERENCES `leceni` (`idLeciva`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FKtbEvidenceLeceniidVcelstva` FOREIGN KEY (`IdVcelstva`) REFERENCES `vcelstva` (`IdVcelstva`) ON DELETE RESTRICT;

--
-- Omezení pro tabulku `matkavcelstva`
--
ALTER TABLE `matkavcelstva`
  ADD CONSTRAINT `FKtbMatkaVcelstvaIdmatky` FOREIGN KEY (`IdMatky`) REFERENCES `matky` (`IdMatky`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FKtbMatkaVcelstvaIdVcelstva` FOREIGN KEY (`IdVcelstva`) REFERENCES `vcelstva` (`IdVcelstva`) ON DELETE RESTRICT;

--
-- Omezení pro tabulku `matky`
--
ALTER TABLE `matky`
  ADD CONSTRAINT `FKIdMatkyIdVcelare` FOREIGN KEY (`IdVcelare`) REFERENCES `vcelari` (`IdVcelare`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Omezení pro tabulku `prodejmedu`
--
ALTER TABLE `prodejmedu`
  ADD CONSTRAINT `FKprodejmeduidVcelare` FOREIGN KEY (`IdVcelare`) REFERENCES `vcelari` (`IdVcelare`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Omezení pro tabulku `produkcemedu`
--
ALTER TABLE `produkcemedu`
  ADD CONSTRAINT `FKtbProdukceMeduidVcelare` FOREIGN KEY (`idVcelare`) REFERENCES `vcelari` (`IdVcelare`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FKtbProdukceMeduidVcelstva` FOREIGN KEY (`idVcelstva`) REFERENCES `vcelstva` (`IdVcelstva`) ON DELETE RESTRICT;

--
-- Omezení pro tabulku `soubory`
--
ALTER TABLE `soubory`
  ADD CONSTRAINT `FKsouboryidAutora` FOREIGN KEY (`idAutora`) REFERENCES `vcelari` (`IdVcelare`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Omezení pro tabulku `stanoviste`
--
ALTER TABLE `stanoviste`
  ADD CONSTRAINT `FKtbStanovisteIdVcelare` FOREIGN KEY (`IdVcelare`) REFERENCES `vcelari` (`IdVcelare`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Omezení pro tabulku `uly`
--
ALTER TABLE `uly`
  ADD CONSTRAINT `FKtbUlyidStanoviste` FOREIGN KEY (`idStanoviste`) REFERENCES `stanoviste` (`IdStanoviste`) ON DELETE RESTRICT,
  ADD CONSTRAINT `fkUlyIdVcelare` FOREIGN KEY (`IdVcelare`) REFERENCES `vcelari` (`IdVcelare`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Omezení pro tabulku `vcelstva`
--
ALTER TABLE `vcelstva`
  ADD CONSTRAINT `FKtbVcelstvaIdUlu` FOREIGN KEY (`IdUlu`) REFERENCES `uly` (`IdUlu`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FKtbVcelstvaIdVcelare` FOREIGN KEY (`IdVcelare`) REFERENCES `vcelari` (`IdVcelare`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Omezení pro tabulku `vcelstvauly`
--
ALTER TABLE `vcelstvauly`
  ADD CONSTRAINT `FKvcelstvaUlyIdUlu` FOREIGN KEY (`IdUlu`) REFERENCES `uly` (`IdUlu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FKvcelstvaUlyIdVcelstva` FOREIGN KEY (`IdVcelstva`) REFERENCES `vcelstva` (`IdVcelstva`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Omezení pro tabulku `zaznamy`
--
ALTER TABLE `zaznamy`
  ADD CONSTRAINT `FKtbZaznamyidVcelstva` FOREIGN KEY (`IdVcelstva`) REFERENCES `vcelstva` (`IdVcelstva`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

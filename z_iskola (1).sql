-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Okt 16. 10:53
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `z_iskola`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `diak`
--

CREATE TABLE `diak` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `szuletesi_datum` varchar(20) NOT NULL,
  `telefonszam` varchar(50) NOT NULL,
  `iskolaid` varchar(100) NOT NULL,
  `kolcsonzott_hangszerek` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `diak`
--

INSERT INTO `diak` (`id`, `nev`, `szuletesi_datum`, `telefonszam`, `iskolaid`, `kolcsonzott_hangszerek`) VALUES
(1, 'Srámli', 'most', '1242325', '', 'skót duda'),
(2, 'Gipsz jakab', '2006', '06320158', '1', 'zongora');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `elerheto_hangszerek`
--

CREATE TABLE `elerheto_hangszerek` (
  `ID` int(11) NOT NULL,
  `IskolaID` varchar(100) NOT NULL,
  `HangszerID` varchar(100) NOT NULL,
  `db_szam` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `elerheto_hangszerek`
--

INSERT INTO `elerheto_hangszerek` (`ID`, `IskolaID`, `HangszerID`, `db_szam`) VALUES
(1, '', '', '5');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `esemenyek`
--

CREATE TABLE `esemenyek` (
  `id` int(11) NOT NULL,
  `esemeny_neve` varchar(100) NOT NULL,
  `esemeny_leirasa` varchar(255) NOT NULL,
  `iskola` varchar(100) NOT NULL,
  `kapcsolattarto` varchar(100) NOT NULL,
  `helyszin` varchar(100) NOT NULL,
  `idopont` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `esemenyek`
--

INSERT INTO `esemenyek` (`id`, `esemeny_neve`, `esemeny_leirasa`, `iskola`, `kapcsolattarto`, `helyszin`, `idopont`) VALUES
(1, 'Koncert', 'Kiss koncert', '', 'polgi', 'Keszthely vára', 'Holnap');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hangszerek`
--

CREATE TABLE `hangszerek` (
  `ID` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `tipus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `hangszerek`
--

INSERT INTO `hangszerek` (`ID`, `nev`, `tipus`) VALUES
(1, 'zongora', 'Billentyűs'),
(2, 'lant', 'pengő húros'),
(3, 'klarinét', 'fúvós');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kolcsonzes`
--

CREATE TABLE `kolcsonzes` (
  `id` int(11) NOT NULL,
  `diakid` varchar(100) NOT NULL,
  `kolcsonzes_datuma` varchar(100) NOT NULL,
  `visszahozas_datuma` varchar(100) NOT NULL,
  `megjegyzes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nev` varchar(20) NOT NULL,
  `link` varchar(20) NOT NULL,
  `statusz` varchar(5) NOT NULL,
  `tartalom` text NOT NULL,
  `file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `menu`
--

INSERT INTO `menu` (`id`, `nev`, `link`, `statusz`, `tartalom`, `file`) VALUES
(2, 'Zeneiskola', 'zeneiskola', 'aktív', 'Ez a zeneiskola aloldala', ''),
(3, 'Tanárok', 'tanarok', 'aktív', 'Ez a tanárok aloldala', ''),
(4, 'Kölcsönzés', 'kolcsonzes', 'aktív', 'Ez a kölcsönzés aloldala', ''),
(5, 'Diák', 'diak', 'aktív', 'Ez a diák aloldala', ''),
(6, 'Elérhető Hangszerek', 'elerheto-hangszerek', 'aktív', 'Ez az elérhető hangszerek aloldala', ''),
(7, 'Események', 'esemenyek', 'aktív', 'Ez az események aloldala', ''),
(8, 'Hangszerek', 'hangszerek', 'aktív', 'Ez a hangszerek aloldala', ''),
(9, '', '', '', '    <div class=\"search-row\">\n            <div class=\"search\" role=\"search\" aria-label=\"Keresés\">\n                <svg width=\"18\" height=\"18\" viewBox=\"0 0 24 24\" fill=\"none\" aria-hidden=\"true\">\n                    <path d=\"M21 21l-4.35-4.35\" stroke=\"#6b6b6b\" stroke-width=\"2\" stroke-linecap=\"round\"\n                        stroke-linejoin=\"round\" />\n                    <circle cx=\"11\" cy=\"11\" r=\"6.5\" stroke=\"#6b6b6b\" stroke-width=\"2\" stroke-linecap=\"round\"\n                        stroke-linejoin=\"round\" />\n                </svg>\n                <input type=\"text\" placeholder=\"Search\" />\n            </div>\n        </div>\n\n        <h2 class=\"section-title\">Featured Instruments</h2>\n\n        <div style=\"display:flex;align-items:center;gap:12px;margin-bottom:12px\">\n            <div style=\"flex:1\"></div>\n            <div class=\"carousel-controls\" style=\"width:200px\">\n                <button class=\"arrow\" id=\"prev\" aria-label=\"Előző\">&larr;</button>\n                <button class=\"arrow\" id=\"next\" aria-label=\"Következő\">&rarr;</button>\n            </div>\n        </div>\n\n        <div class=\"cards\" id=\"cards\">\n            <article class=\"card\">\n                <img class=\"avatar\"\n                    src=\"https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=0a2aa3c61a5a1c4c6f0b1a2eea0f8f63\"\n                    alt=\"Isabella Smith - piano teacher\">\n                <h3>Isabella Smith</h3>\n                <p>Experienced piano instructor with over 10 years of teaching.</p>\n            </article>\n\n            <article class=\"card\">\n                <img class=\"avatar\"\n                    src=\"https://images.unsplash.com/photo-1545996124-94d5f73b7d8b?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=74b0ad56a3e7f3c27b1a6c9a8f7d98f0\"\n                    alt=\"John Doe - guitar teacher\">\n                <h3>John Doe</h3>\n                <p>Skilled guitar teacher specializing in classical and jazz.</p>\n            </article>\n\n            <article class=\"card\">\n                <img class=\"avatar\"\n                    src=\"https://images.unsplash.com/photo-1524504388940-b1c1722653e1?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=4b3e4c7412d6f6e1b1b2a6e9f8f3c1a5\"\n                    alt=\"Emily Johnson - violinist\">\n                <h3>Emily Johnson</h3>\n                <p>Violinist with a passion for music education.</p>\n            </article>\n        </div>\n\n        <section class=\"contact-section\" aria-label=\"Kapcsolat és regisztráció\">\n            <div class=\"form-card\">\n                <h3 style=\"margin-top:0; font-family:Merriweather,serif\">Contact & Sign Up</h3>\n\n                <form id=\"contactForm\" onsubmit=\"event.preventDefault(); alert(\'Köszönjük! Üzeneted elküldve.\');\">\n                    <div style=\"margin-bottom:10px\">\n                        <label for=\"email\">Email</label>\n                        <input id=\"email\" type=\"email\" placeholder=\"Email\" required>\n                    </div>\n\n                    <div style=\"margin-bottom:10px\">\n                        <label for=\"message\">Message</label>\n                        <textarea id=\"message\" placeholder=\"Üzenet...\" required></textarea>\n                    </div>\n\n                    <button class=\"submit-btn\" type=\"submit\">Küldés</button>\n                </form>\n            </div>\n\n            <div class=\"form-card\">\n                <h4 style=\"margin-top:0; font-family:Merriweather,serif\">Jelentkezés</h4>\n\n                <div class=\"form-grid\">\n                    <div>\n                        <label for=\"name\">Name</label>\n                        <input id=\"name\" type=\"text\" placeholder=\"Név\">\n                    </div>\n                    <div>\n                        <label for=\"email2\">Email</label>\n                        <input id=\"email2\" type=\"email\" placeholder=\"Email\">\n                    </div>\n                </div>\n\n                <div style=\"margin-top:12px\">\n                    <label for=\"msg2\">Message</label>\n                    <textarea id=\"msg2\" placeholder=\"Rövid üzenet, pl. melyik hangszer érdekel...\"></textarea>\n                </div>\n', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanarok`
--

CREATE TABLE `tanarok` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `hangszerek` varchar(100) NOT NULL,
  `telefon` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `iskolaid` varchar(100) NOT NULL,
  `nem` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `tanarok`
--

INSERT INTO `tanarok` (`id`, `nev`, `hangszerek`, `telefon`, `email`, `iskolaid`, `nem`) VALUES
(1, 'Török István', 'Trombita', '0642332523', 'torokistvan@premontrei-keszthely.hu', 'Keszthely Premontrei', 'férfi'),
(2, 'Gipsz jakab', 'zongora', '06321455', 'Gipszjakab@gmail.com', '1', 'férfi');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `z_iskola`
--

CREATE TABLE `z_iskola` (
  `ID` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `irszam` int(4) NOT NULL,
  `telepules` varchar(100) NOT NULL,
  `cim` varchar(100) NOT NULL,
  `telefon` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `webhely` varchar(100) NOT NULL,
  `megjegyzes` varchar(255) NOT NULL,
  `hangszerek` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `z_iskola`
--

INSERT INTO `z_iskola` (`ID`, `nev`, `irszam`, `telepules`, `cim`, `telefon`, `email`, `webhely`, `megjegyzes`, `hangszerek`) VALUES
(1, 'Festetics György zeneiskola', 8360, 'Keszthely', 'Deák Ferenc u. 3', '06 83 312 634', 'festeticszenesuli@gmail.com', '', '', 'Zongora'),
(2, 'Szent István Király Zeneiskola', 8360, 'Keszthely', 'valami u. 4', '0480124235', 'szentkiralyzene@gmail.com', 'www.szentistvanzene.hu', '', 'lant');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `diak`
--
ALTER TABLE `diak`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `elerheto_hangszerek`
--
ALTER TABLE `elerheto_hangszerek`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `esemenyek`
--
ALTER TABLE `esemenyek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `hangszerek`
--
ALTER TABLE `hangszerek`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `kolcsonzes`
--
ALTER TABLE `kolcsonzes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `tanarok`
--
ALTER TABLE `tanarok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `z_iskola`
--
ALTER TABLE `z_iskola`
  ADD PRIMARY KEY (`ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `diak`
--
ALTER TABLE `diak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `elerheto_hangszerek`
--
ALTER TABLE `elerheto_hangszerek`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `esemenyek`
--
ALTER TABLE `esemenyek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `hangszerek`
--
ALTER TABLE `hangszerek`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `kolcsonzes`
--
ALTER TABLE `kolcsonzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `tanarok`
--
ALTER TABLE `tanarok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `z_iskola`
--
ALTER TABLE `z_iskola`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

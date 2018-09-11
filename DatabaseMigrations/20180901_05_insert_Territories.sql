BEGIN;

SET CLIENT_ENCODING TO 'utf8';

TRUNCATE TABLE general."Territories" CASCADE;

INSERT INTO general."Territories"
(id, title, county, area)
VALUES
(1, 'Republic of Lithuania', NULL, 65286),
(2, 'Vilnius county', NULL, 9730),
(3, 'Alytus county', NULL, 5418),
(4, 'Kaunas county', NULL, 8086),
(5, 'Klaipėda county', NULL, 5222),
(6, 'Marijampolė county', NULL, 4466),
(7, 'Panevėžys county', NULL, 7878),
(8, 'Šiauliai county', NULL, 8537),
(9, 'Tauragė county', NULL, 4408),
(10, 'Telšiai county', NULL, 4350),
(11, 'Utena county', NULL, 7191),
(12, 'Akmenė d. mun.', 8, 844),
(13, 'Alytus d. mun.', 3, 1403),
(14, 'Alytus t. mun.', 3, 40),
(15, 'Anykščiai d. mun.', 11, 1764),
(16, 'Birštonas mun.', 4, 122),
(17, 'Biržai d. mun.', 7, 1476),
(18, 'Druskininkai mun.', 3, 453),
(19, 'Elektrėnai mun.', 2, 509),
(20, 'Ignalina d. mun.', 11, 1441),
(21, 'Jonava d. mun.', 4, 943),
(22, 'Joniškis d. mun.', 8, 1151),
(23, 'Jurbarkas d. mun.', 9, 1506),
(24, 'Kaišiadorys d. mun.', 4, 1087),
(25, 'Kalvarija mun.', 6, 440),
(26, 'Kaunas c. mun.', 4, 157),
(27, 'Kaunas d. mun.', 4, 1495),
(28, 'Kazlų Rūda mun.', 6, 554),
(29, 'Kėdainiai d. mun.', 4, 1677),
(30, 'Kelmė d. mun.', 8, 1705),
(31, 'Klaipėda c. mun.', 5, 98),
(32, 'Klaipėda d. mun.', 5, 1323),
(33, 'Kretinga d. mun.', 5, 989),
(34, 'Kupiškis d. mun.', 7, 1080),
(35, 'Lazdijai d. mun.', 3, 1306),
(36, 'Marijampolė mun.', 6, 755),
(37, 'Mažeikiai d. mun.', 10, 1220),
(38, 'Molėtai d. mun.', 11, 1367),
(39, 'Neringa mun.', 5, 139),
(40, 'Pagėgiai mun.', 9, 535),
(41, 'Pakruojis d. mun.', 8, 1315),
(42, 'Palanga t. mun.', 5, 79),
(43, 'Panevėžys c. mun.', 7, 50),
(44, 'Panevėžys d. mun.', 7, 2177),
(45, 'Pasvalys d. mun.', 7, 1289),
(46, 'Plungė d. mun.', 10, 1105),
(47, 'Prienai d. mun.', 4, 1032),
(48, 'Radviliškis d. mun.', 8, 1634),
(49, 'Raseiniai d. mun.', 4, 1573),
(50, 'Rietavas mun.', 10, 586),
(51, 'Rokiškis d. mun.', 7, 1806),
(52, 'Šakiai d. mun.', 6, 1454),
(53, 'Šalčininkai d. mun.', 2, 1493),
(54, 'Šiauliai c. mun.', 8, 81),
(55, 'Šiauliai d. mun.', 8, 1807),
(56, 'Šilalė d. mun.', 9, 1188),
(57, 'Šilutė d. mun.', 5, 1683),
(58, 'Širvintos d. mun.', 2, 905),
(59, 'Skuodas d. mun.', 5, 911),
(60, 'Švenčionys d. mun.', 2, 1691),
(61, 'Tauragė d. mun.', 9, 1179),
(62, 'Telšiai d. mun.', 10, 1439),
(63, 'Trakai d. mun.', 2, 1207),
(64, 'Ukmergė d. mun.', 2, 1395),
(65, 'Utena d. mun.', 11, 1230),
(66, 'Varėna d. mun.', 3, 2216),
(67, 'Vilkaviškis d. mun.', 6, 1263),
(68, 'Vilnius c. mun.', 2, 401),
(69, 'Vilnius d. mun.', 2, 2129),
(70, 'Visaginas mun.', 11, 58),
(71, 'Zarasai d. mun.', 11, 1331);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180901_05_insert_Territories', 'general', now());

COMMIT;

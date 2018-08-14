BEGIN;

TRUNCATE TABLE people."AgePeriods" CASCADE;

-- In age column value:
-- -1 means total (all ages)
-- 85 means age 85 and more (85, 86, 87 etc.)

INSERT INTO people."AgePeriods"
(id, year_id, age)
VALUES
(1, 12, 0),
(2, 12, 1),
(3, 12, 2),
(4, 12, 3),
(5, 12, 4),
(6, 12, 5),
(7, 12, 6),
(8, 12, 7),
(9, 12, 8),
(10, 12, 9),
(11, 12, 10),
(12, 12, 11),
(13, 12, 12),
(14, 12, 13),
(15, 12, 14),
(16, 12, 15),
(17, 12, 16),
(18, 12, 17),
(19, 12, 18),
(20, 12, 19),
(21, 12, 20),
(22, 12, 21),
(23, 12, 22),
(24, 12, 23),
(25, 12, 24),
(26, 12, 25),
(27, 12, 26),
(28, 12, 27),
(29, 12, 28),
(30, 12, 29),
(31, 12, 30),
(32, 12, 31),
(33, 12, 32),
(34, 12, 33),
(35, 12, 34),
(36, 12, 35),
(37, 12, 36),
(38, 12, 37),
(39, 12, 38),
(40, 12, 39),
(41, 12, 40),
(42, 12, 41),
(43, 12, 42),
(44, 12, 43),
(45, 12, 44),
(46, 12, 45),
(47, 12, 46),
(48, 12, 47),
(49, 12, 48),
(50, 12, 49),
(51, 12, 50),
(52, 12, 51),
(53, 12, 52),
(54, 12, 53),
(55, 12, 54),
(56, 12, 55),
(57, 12, 56),
(58, 12, 57),
(59, 12, 58),
(60, 12, 59),
(61, 12, 60),
(62, 12, 61),
(63, 12, 62),
(64, 12, 63),
(65, 12, 64),
(66, 12, 65),
(67, 12, 66),
(68, 12, 67),
(69, 12, 68),
(70, 12, 69),
(71, 12, 70),
(72, 12, 71),
(73, 12, 72),
(74, 12, 73),
(75, 12, 74),
(76, 12, 75),
(77, 12, 76),
(78, 12, 77),
(79, 12, 78),
(80, 12, 79),
(81, 12, 80),
(82, 12, 81),
(83, 12, 82),
(84, 12, 83),
(85, 12, 84),
(86, 12, 85),
(87, 12, -1),
(88, 13, 0),
(89, 13, 1),
(90, 13, 2),
(91, 13, 3),
(92, 13, 4),
(93, 13, 5),
(94, 13, 6),
(95, 13, 7),
(96, 13, 8),
(97, 13, 9),
(98, 13, 10),
(99, 13, 11),
(100, 13, 12),
(101, 13, 13),
(102, 13, 14),
(103, 13, 15),
(104, 13, 16),
(105, 13, 17),
(106, 13, 18),
(107, 13, 19),
(108, 13, 20),
(109, 13, 21),
(110, 13, 22),
(111, 13, 23),
(112, 13, 24),
(113, 13, 25),
(114, 13, 26),
(115, 13, 27),
(116, 13, 28),
(117, 13, 29),
(118, 13, 30),
(119, 13, 31),
(120, 13, 32),
(121, 13, 33),
(122, 13, 34),
(123, 13, 35),
(124, 13, 36),
(125, 13, 37),
(126, 13, 38),
(127, 13, 39),
(128, 13, 40),
(129, 13, 41),
(130, 13, 42),
(131, 13, 43),
(132, 13, 44),
(133, 13, 45),
(134, 13, 46),
(135, 13, 47),
(136, 13, 48),
(137, 13, 49),
(138, 13, 50),
(139, 13, 51),
(140, 13, 52),
(141, 13, 53),
(142, 13, 54),
(143, 13, 55),
(144, 13, 56),
(145, 13, 57),
(146, 13, 58),
(147, 13, 59),
(148, 13, 60),
(149, 13, 61),
(150, 13, 62),
(151, 13, 63),
(152, 13, 64),
(153, 13, 65),
(154, 13, 66),
(155, 13, 67),
(156, 13, 68),
(157, 13, 69),
(158, 13, 70),
(159, 13, 71),
(160, 13, 72),
(161, 13, 73),
(162, 13, 74),
(163, 13, 75),
(164, 13, 76),
(165, 13, 77),
(166, 13, 78),
(167, 13, 79),
(168, 13, 80),
(169, 13, 81),
(170, 13, 82),
(171, 13, 83),
(172, 13, 84),
(173, 13, 85),
(174, 13, -1),
(175, 14, 0),
(176, 14, 1),
(177, 14, 2),
(178, 14, 3),
(179, 14, 4),
(180, 14, 5),
(181, 14, 6),
(182, 14, 7),
(183, 14, 8),
(184, 14, 9),
(185, 14, 10),
(186, 14, 11),
(187, 14, 12),
(188, 14, 13),
(189, 14, 14),
(190, 14, 15),
(191, 14, 16),
(192, 14, 17),
(193, 14, 18),
(194, 14, 19),
(195, 14, 20),
(196, 14, 21),
(197, 14, 22),
(198, 14, 23),
(199, 14, 24),
(200, 14, 25),
(201, 14, 26),
(202, 14, 27),
(203, 14, 28),
(204, 14, 29),
(205, 14, 30),
(206, 14, 31),
(207, 14, 32),
(208, 14, 33),
(209, 14, 34),
(210, 14, 35),
(211, 14, 36),
(212, 14, 37),
(213, 14, 38),
(214, 14, 39),
(215, 14, 40),
(216, 14, 41),
(217, 14, 42),
(218, 14, 43),
(219, 14, 44),
(220, 14, 45),
(221, 14, 46),
(222, 14, 47),
(223, 14, 48),
(224, 14, 49),
(225, 14, 50),
(226, 14, 51),
(227, 14, 52),
(228, 14, 53),
(229, 14, 54),
(230, 14, 55),
(231, 14, 56),
(232, 14, 57),
(233, 14, 58),
(234, 14, 59),
(235, 14, 60),
(236, 14, 61),
(237, 14, 62),
(238, 14, 63),
(239, 14, 64),
(240, 14, 65),
(241, 14, 66),
(242, 14, 67),
(243, 14, 68),
(244, 14, 69),
(245, 14, 70),
(246, 14, 71),
(247, 14, 72),
(248, 14, 73),
(249, 14, 74),
(250, 14, 75),
(251, 14, 76),
(252, 14, 77),
(253, 14, 78),
(254, 14, 79),
(255, 14, 80),
(256, 14, 81),
(257, 14, 82),
(258, 14, 83),
(259, 14, 84),
(260, 14, 85),
(261, 14, -1),
(262, 15, 0),
(263, 15, 1),
(264, 15, 2),
(265, 15, 3),
(266, 15, 4),
(267, 15, 5),
(268, 15, 6),
(269, 15, 7),
(270, 15, 8),
(271, 15, 9),
(272, 15, 10),
(273, 15, 11),
(274, 15, 12),
(275, 15, 13),
(276, 15, 14),
(277, 15, 15),
(278, 15, 16),
(279, 15, 17),
(280, 15, 18),
(281, 15, 19),
(282, 15, 20),
(283, 15, 21),
(284, 15, 22),
(285, 15, 23),
(286, 15, 24),
(287, 15, 25),
(288, 15, 26),
(289, 15, 27),
(290, 15, 28),
(291, 15, 29),
(292, 15, 30),
(293, 15, 31),
(294, 15, 32),
(295, 15, 33),
(296, 15, 34),
(297, 15, 35),
(298, 15, 36),
(299, 15, 37),
(300, 15, 38),
(301, 15, 39),
(302, 15, 40),
(303, 15, 41),
(304, 15, 42),
(305, 15, 43),
(306, 15, 44),
(307, 15, 45),
(308, 15, 46),
(309, 15, 47),
(310, 15, 48),
(311, 15, 49),
(312, 15, 50),
(313, 15, 51),
(314, 15, 52),
(315, 15, 53),
(316, 15, 54),
(317, 15, 55),
(318, 15, 56),
(319, 15, 57),
(320, 15, 58),
(321, 15, 59),
(322, 15, 60),
(323, 15, 61),
(324, 15, 62),
(325, 15, 63),
(326, 15, 64),
(327, 15, 65),
(328, 15, 66),
(329, 15, 67),
(330, 15, 68),
(331, 15, 69),
(332, 15, 70),
(333, 15, 71),
(334, 15, 72),
(335, 15, 73),
(336, 15, 74),
(337, 15, 75),
(338, 15, 76),
(339, 15, 77),
(340, 15, 78),
(341, 15, 79),
(342, 15, 80),
(343, 15, 81),
(344, 15, 82),
(345, 15, 83),
(346, 15, 84),
(347, 15, 85),
(348, 15, -1),
(349, 16, 0),
(350, 16, 1),
(351, 16, 2),
(352, 16, 3),
(353, 16, 4),
(354, 16, 5),
(355, 16, 6),
(356, 16, 7),
(357, 16, 8),
(358, 16, 9),
(359, 16, 10),
(360, 16, 11),
(361, 16, 12),
(362, 16, 13),
(363, 16, 14),
(364, 16, 15),
(365, 16, 16),
(366, 16, 17),
(367, 16, 18),
(368, 16, 19),
(369, 16, 20),
(370, 16, 21),
(371, 16, 22),
(372, 16, 23),
(373, 16, 24),
(374, 16, 25),
(375, 16, 26),
(376, 16, 27),
(377, 16, 28),
(378, 16, 29),
(379, 16, 30),
(380, 16, 31),
(381, 16, 32),
(382, 16, 33),
(383, 16, 34),
(384, 16, 35),
(385, 16, 36),
(386, 16, 37),
(387, 16, 38),
(388, 16, 39),
(389, 16, 40),
(390, 16, 41),
(391, 16, 42),
(392, 16, 43),
(393, 16, 44),
(394, 16, 45),
(395, 16, 46),
(396, 16, 47),
(397, 16, 48),
(398, 16, 49),
(399, 16, 50),
(400, 16, 51),
(401, 16, 52),
(402, 16, 53),
(403, 16, 54),
(404, 16, 55),
(405, 16, 56),
(406, 16, 57),
(407, 16, 58),
(408, 16, 59),
(409, 16, 60),
(410, 16, 61),
(411, 16, 62),
(412, 16, 63),
(413, 16, 64),
(414, 16, 65),
(415, 16, 66),
(416, 16, 67),
(417, 16, 68),
(418, 16, 69),
(419, 16, 70),
(420, 16, 71),
(421, 16, 72),
(422, 16, 73),
(423, 16, 74),
(424, 16, 75),
(425, 16, 76),
(426, 16, 77),
(427, 16, 78),
(428, 16, 79),
(429, 16, 80),
(430, 16, 81),
(431, 16, 82),
(432, 16, 83),
(433, 16, 84),
(434, 16, 85),
(435, 16, -1),
(436, 17, 0),
(437, 17, 1),
(438, 17, 2),
(439, 17, 3),
(440, 17, 4),
(441, 17, 5),
(442, 17, 6),
(443, 17, 7),
(444, 17, 8),
(445, 17, 9),
(446, 17, 10),
(447, 17, 11),
(448, 17, 12),
(449, 17, 13),
(450, 17, 14),
(451, 17, 15),
(452, 17, 16),
(453, 17, 17),
(454, 17, 18),
(455, 17, 19),
(456, 17, 20),
(457, 17, 21),
(458, 17, 22),
(459, 17, 23),
(460, 17, 24),
(461, 17, 25),
(462, 17, 26),
(463, 17, 27),
(464, 17, 28),
(465, 17, 29),
(466, 17, 30),
(467, 17, 31),
(468, 17, 32),
(469, 17, 33),
(470, 17, 34),
(471, 17, 35),
(472, 17, 36),
(473, 17, 37),
(474, 17, 38),
(475, 17, 39),
(476, 17, 40),
(477, 17, 41),
(478, 17, 42),
(479, 17, 43),
(480, 17, 44),
(481, 17, 45),
(482, 17, 46),
(483, 17, 47),
(484, 17, 48),
(485, 17, 49),
(486, 17, 50),
(487, 17, 51),
(488, 17, 52),
(489, 17, 53),
(490, 17, 54),
(491, 17, 55),
(492, 17, 56),
(493, 17, 57),
(494, 17, 58),
(495, 17, 59),
(496, 17, 60),
(497, 17, 61),
(498, 17, 62),
(499, 17, 63),
(500, 17, 64),
(501, 17, 65),
(502, 17, 66),
(503, 17, 67),
(504, 17, 68),
(505, 17, 69),
(506, 17, 70),
(507, 17, 71),
(508, 17, 72),
(509, 17, 73),
(510, 17, 74),
(511, 17, 75),
(512, 17, 76),
(513, 17, 77),
(514, 17, 78),
(515, 17, 79),
(516, 17, 80),
(517, 17, 81),
(518, 17, 82),
(519, 17, 83),
(520, 17, 84),
(521, 17, 85),
(522, 17, -1),
(523, 18, 0),
(524, 18, 1),
(525, 18, 2),
(526, 18, 3),
(527, 18, 4),
(528, 18, 5),
(529, 18, 6),
(530, 18, 7),
(531, 18, 8),
(532, 18, 9),
(533, 18, 10),
(534, 18, 11),
(535, 18, 12),
(536, 18, 13),
(537, 18, 14),
(538, 18, 15),
(539, 18, 16),
(540, 18, 17),
(541, 18, 18),
(542, 18, 19),
(543, 18, 20),
(544, 18, 21),
(545, 18, 22),
(546, 18, 23),
(547, 18, 24),
(548, 18, 25),
(549, 18, 26),
(550, 18, 27),
(551, 18, 28),
(552, 18, 29),
(553, 18, 30),
(554, 18, 31),
(555, 18, 32),
(556, 18, 33),
(557, 18, 34),
(558, 18, 35),
(559, 18, 36),
(560, 18, 37),
(561, 18, 38),
(562, 18, 39),
(563, 18, 40),
(564, 18, 41),
(565, 18, 42),
(566, 18, 43),
(567, 18, 44),
(568, 18, 45),
(569, 18, 46),
(570, 18, 47),
(571, 18, 48),
(572, 18, 49),
(573, 18, 50),
(574, 18, 51),
(575, 18, 52),
(576, 18, 53),
(577, 18, 54),
(578, 18, 55),
(579, 18, 56),
(580, 18, 57),
(581, 18, 58),
(582, 18, 59),
(583, 18, 60),
(584, 18, 61),
(585, 18, 62),
(586, 18, 63),
(587, 18, 64),
(588, 18, 65),
(589, 18, 66),
(590, 18, 67),
(591, 18, 68),
(592, 18, 69),
(593, 18, 70),
(594, 18, 71),
(595, 18, 72),
(596, 18, 73),
(597, 18, 74),
(598, 18, 75),
(599, 18, 76),
(600, 18, 77),
(601, 18, 78),
(602, 18, 79),
(603, 18, 80),
(604, 18, 81),
(605, 18, 82),
(606, 18, 83),
(607, 18, 84),
(608, 18, 85),
(609, 18, -1),
(610, 19, 0),
(611, 19, 1),
(612, 19, 2),
(613, 19, 3),
(614, 19, 4),
(615, 19, 5),
(616, 19, 6),
(617, 19, 7),
(618, 19, 8),
(619, 19, 9),
(620, 19, 10),
(621, 19, 11),
(622, 19, 12),
(623, 19, 13),
(624, 19, 14),
(625, 19, 15),
(626, 19, 16),
(627, 19, 17),
(628, 19, 18),
(629, 19, 19),
(630, 19, 20),
(631, 19, 21),
(632, 19, 22),
(633, 19, 23),
(634, 19, 24),
(635, 19, 25),
(636, 19, 26),
(637, 19, 27),
(638, 19, 28),
(639, 19, 29),
(640, 19, 30),
(641, 19, 31),
(642, 19, 32),
(643, 19, 33),
(644, 19, 34),
(645, 19, 35),
(646, 19, 36),
(647, 19, 37),
(648, 19, 38),
(649, 19, 39),
(650, 19, 40),
(651, 19, 41),
(652, 19, 42),
(653, 19, 43),
(654, 19, 44),
(655, 19, 45),
(656, 19, 46),
(657, 19, 47),
(658, 19, 48),
(659, 19, 49),
(660, 19, 50),
(661, 19, 51),
(662, 19, 52),
(663, 19, 53),
(664, 19, 54),
(665, 19, 55),
(666, 19, 56),
(667, 19, 57),
(668, 19, 58),
(669, 19, 59),
(670, 19, 60),
(671, 19, 61),
(672, 19, 62),
(673, 19, 63),
(674, 19, 64),
(675, 19, 65),
(676, 19, 66),
(677, 19, 67),
(678, 19, 68),
(679, 19, 69),
(680, 19, 70),
(681, 19, 71),
(682, 19, 72),
(683, 19, 73),
(684, 19, 74),
(685, 19, 75),
(686, 19, 76),
(687, 19, 77),
(688, 19, 78),
(689, 19, 79),
(690, 19, 80),
(691, 19, 81),
(692, 19, 82),
(693, 19, 83),
(694, 19, 84),
(695, 19, 85),
(696, 19, -1),
(697, 20, 0),
(698, 20, 1),
(699, 20, 2),
(700, 20, 3),
(701, 20, 4),
(702, 20, 5),
(703, 20, 6),
(704, 20, 7),
(705, 20, 8),
(706, 20, 9),
(707, 20, 10),
(708, 20, 11),
(709, 20, 12),
(710, 20, 13),
(711, 20, 14),
(712, 20, 15),
(713, 20, 16),
(714, 20, 17),
(715, 20, 18),
(716, 20, 19),
(717, 20, 20),
(718, 20, 21),
(719, 20, 22),
(720, 20, 23),
(721, 20, 24),
(722, 20, 25),
(723, 20, 26),
(724, 20, 27),
(725, 20, 28),
(726, 20, 29),
(727, 20, 30),
(728, 20, 31),
(729, 20, 32),
(730, 20, 33),
(731, 20, 34),
(732, 20, 35),
(733, 20, 36),
(734, 20, 37),
(735, 20, 38),
(736, 20, 39),
(737, 20, 40),
(738, 20, 41),
(739, 20, 42),
(740, 20, 43),
(741, 20, 44),
(742, 20, 45),
(743, 20, 46),
(744, 20, 47),
(745, 20, 48),
(746, 20, 49),
(747, 20, 50),
(748, 20, 51),
(749, 20, 52),
(750, 20, 53),
(751, 20, 54),
(752, 20, 55),
(753, 20, 56),
(754, 20, 57),
(755, 20, 58),
(756, 20, 59),
(757, 20, 60),
(758, 20, 61),
(759, 20, 62),
(760, 20, 63),
(761, 20, 64),
(762, 20, 65),
(763, 20, 66),
(764, 20, 67),
(765, 20, 68),
(766, 20, 69),
(767, 20, 70),
(768, 20, 71),
(769, 20, 72),
(770, 20, 73),
(771, 20, 74),
(772, 20, 75),
(773, 20, 76),
(774, 20, 77),
(775, 20, 78),
(776, 20, 79),
(777, 20, 80),
(778, 20, 81),
(779, 20, 82),
(780, 20, 83),
(781, 20, 84),
(782, 20, 85),
(783, 20, -1),
(784, 21, 0),
(785, 21, 1),
(786, 21, 2),
(787, 21, 3),
(788, 21, 4),
(789, 21, 5),
(790, 21, 6),
(791, 21, 7),
(792, 21, 8),
(793, 21, 9),
(794, 21, 10),
(795, 21, 11),
(796, 21, 12),
(797, 21, 13),
(798, 21, 14),
(799, 21, 15),
(800, 21, 16),
(801, 21, 17),
(802, 21, 18),
(803, 21, 19),
(804, 21, 20),
(805, 21, 21),
(806, 21, 22),
(807, 21, 23),
(808, 21, 24),
(809, 21, 25),
(810, 21, 26),
(811, 21, 27),
(812, 21, 28),
(813, 21, 29),
(814, 21, 30),
(815, 21, 31),
(816, 21, 32),
(817, 21, 33),
(818, 21, 34),
(819, 21, 35),
(820, 21, 36),
(821, 21, 37),
(822, 21, 38),
(823, 21, 39),
(824, 21, 40),
(825, 21, 41),
(826, 21, 42),
(827, 21, 43),
(828, 21, 44),
(829, 21, 45),
(830, 21, 46),
(831, 21, 47),
(832, 21, 48),
(833, 21, 49),
(834, 21, 50),
(835, 21, 51),
(836, 21, 52),
(837, 21, 53),
(838, 21, 54),
(839, 21, 55),
(840, 21, 56),
(841, 21, 57),
(842, 21, 58),
(843, 21, 59),
(844, 21, 60),
(845, 21, 61),
(846, 21, 62),
(847, 21, 63),
(848, 21, 64),
(849, 21, 65),
(850, 21, 66),
(851, 21, 67),
(852, 21, 68),
(853, 21, 69),
(854, 21, 70),
(855, 21, 71),
(856, 21, 72),
(857, 21, 73),
(858, 21, 74),
(859, 21, 75),
(860, 21, 76),
(861, 21, 77),
(862, 21, 78),
(863, 21, 79),
(864, 21, 80),
(865, 21, 81),
(866, 21, 82),
(867, 21, 83),
(868, 21, 84),
(869, 21, 85),
(870, 21, -1),
(871, 22, 0),
(872, 22, 1),
(873, 22, 2),
(874, 22, 3),
(875, 22, 4),
(876, 22, 5),
(877, 22, 6),
(878, 22, 7),
(879, 22, 8),
(880, 22, 9),
(881, 22, 10),
(882, 22, 11),
(883, 22, 12),
(884, 22, 13),
(885, 22, 14),
(886, 22, 15),
(887, 22, 16),
(888, 22, 17),
(889, 22, 18),
(890, 22, 19),
(891, 22, 20),
(892, 22, 21),
(893, 22, 22),
(894, 22, 23),
(895, 22, 24),
(896, 22, 25),
(897, 22, 26),
(898, 22, 27),
(899, 22, 28),
(900, 22, 29),
(901, 22, 30),
(902, 22, 31),
(903, 22, 32),
(904, 22, 33),
(905, 22, 34),
(906, 22, 35),
(907, 22, 36),
(908, 22, 37),
(909, 22, 38),
(910, 22, 39),
(911, 22, 40),
(912, 22, 41),
(913, 22, 42),
(914, 22, 43),
(915, 22, 44),
(916, 22, 45),
(917, 22, 46),
(918, 22, 47),
(919, 22, 48),
(920, 22, 49),
(921, 22, 50),
(922, 22, 51),
(923, 22, 52),
(924, 22, 53),
(925, 22, 54),
(926, 22, 55),
(927, 22, 56),
(928, 22, 57),
(929, 22, 58),
(930, 22, 59),
(931, 22, 60),
(932, 22, 61),
(933, 22, 62),
(934, 22, 63),
(935, 22, 64),
(936, 22, 65),
(937, 22, 66),
(938, 22, 67),
(939, 22, 68),
(940, 22, 69),
(941, 22, 70),
(942, 22, 71),
(943, 22, 72),
(944, 22, 73),
(945, 22, 74),
(946, 22, 75),
(947, 22, 76),
(948, 22, 77),
(949, 22, 78),
(950, 22, 79),
(951, 22, 80),
(952, 22, 81),
(953, 22, 82),
(954, 22, 83),
(955, 22, 84),
(956, 22, 85),
(957, 22, -1),
(958, 23, 0),
(959, 23, 1),
(960, 23, 2),
(961, 23, 3),
(962, 23, 4),
(963, 23, 5),
(964, 23, 6),
(965, 23, 7),
(966, 23, 8),
(967, 23, 9),
(968, 23, 10),
(969, 23, 11),
(970, 23, 12),
(971, 23, 13),
(972, 23, 14),
(973, 23, 15),
(974, 23, 16),
(975, 23, 17),
(976, 23, 18),
(977, 23, 19),
(978, 23, 20),
(979, 23, 21),
(980, 23, 22),
(981, 23, 23),
(982, 23, 24),
(983, 23, 25),
(984, 23, 26),
(985, 23, 27),
(986, 23, 28),
(987, 23, 29),
(988, 23, 30),
(989, 23, 31),
(990, 23, 32),
(991, 23, 33),
(992, 23, 34),
(993, 23, 35),
(994, 23, 36),
(995, 23, 37),
(996, 23, 38),
(997, 23, 39),
(998, 23, 40),
(999, 23, 41),
(1000, 23, 42),
(1001, 23, 43),
(1002, 23, 44),
(1003, 23, 45),
(1004, 23, 46),
(1005, 23, 47),
(1006, 23, 48),
(1007, 23, 49),
(1008, 23, 50),
(1009, 23, 51),
(1010, 23, 52),
(1011, 23, 53),
(1012, 23, 54),
(1013, 23, 55),
(1014, 23, 56),
(1015, 23, 57),
(1016, 23, 58),
(1017, 23, 59),
(1018, 23, 60),
(1019, 23, 61),
(1020, 23, 62),
(1021, 23, 63),
(1022, 23, 64),
(1023, 23, 65),
(1024, 23, 66),
(1025, 23, 67),
(1026, 23, 68),
(1027, 23, 69),
(1028, 23, 70),
(1029, 23, 71),
(1030, 23, 72),
(1031, 23, 73),
(1032, 23, 74),
(1033, 23, 75),
(1034, 23, 76),
(1035, 23, 77),
(1036, 23, 78),
(1037, 23, 79),
(1038, 23, 80),
(1039, 23, 81),
(1040, 23, 82),
(1041, 23, 83),
(1042, 23, 84),
(1043, 23, 85),
(1044, 23, -1),
(1045, 24, 0),
(1046, 24, 1),
(1047, 24, 2),
(1048, 24, 3),
(1049, 24, 4),
(1050, 24, 5),
(1051, 24, 6),
(1052, 24, 7),
(1053, 24, 8),
(1054, 24, 9),
(1055, 24, 10),
(1056, 24, 11),
(1057, 24, 12),
(1058, 24, 13),
(1059, 24, 14),
(1060, 24, 15),
(1061, 24, 16),
(1062, 24, 17),
(1063, 24, 18),
(1064, 24, 19),
(1065, 24, 20),
(1066, 24, 21),
(1067, 24, 22),
(1068, 24, 23),
(1069, 24, 24),
(1070, 24, 25),
(1071, 24, 26),
(1072, 24, 27),
(1073, 24, 28),
(1074, 24, 29),
(1075, 24, 30),
(1076, 24, 31),
(1077, 24, 32),
(1078, 24, 33),
(1079, 24, 34),
(1080, 24, 35),
(1081, 24, 36),
(1082, 24, 37),
(1083, 24, 38),
(1084, 24, 39),
(1085, 24, 40),
(1086, 24, 41),
(1087, 24, 42),
(1088, 24, 43),
(1089, 24, 44),
(1090, 24, 45),
(1091, 24, 46),
(1092, 24, 47),
(1093, 24, 48),
(1094, 24, 49),
(1095, 24, 50),
(1096, 24, 51),
(1097, 24, 52),
(1098, 24, 53),
(1099, 24, 54),
(1100, 24, 55),
(1101, 24, 56),
(1102, 24, 57),
(1103, 24, 58),
(1104, 24, 59),
(1105, 24, 60),
(1106, 24, 61),
(1107, 24, 62),
(1108, 24, 63),
(1109, 24, 64),
(1110, 24, 65),
(1111, 24, 66),
(1112, 24, 67),
(1113, 24, 68),
(1114, 24, 69),
(1115, 24, 70),
(1116, 24, 71),
(1117, 24, 72),
(1118, 24, 73),
(1119, 24, 74),
(1120, 24, 75),
(1121, 24, 76),
(1122, 24, 77),
(1123, 24, 78),
(1124, 24, 79),
(1125, 24, 80),
(1126, 24, 81),
(1127, 24, 82),
(1128, 24, 83),
(1129, 24, 84),
(1130, 24, 85),
(1131, 24, -1),
(1132, 25, 0),
(1133, 25, 1),
(1134, 25, 2),
(1135, 25, 3),
(1136, 25, 4),
(1137, 25, 5),
(1138, 25, 6),
(1139, 25, 7),
(1140, 25, 8),
(1141, 25, 9),
(1142, 25, 10),
(1143, 25, 11),
(1144, 25, 12),
(1145, 25, 13),
(1146, 25, 14),
(1147, 25, 15),
(1148, 25, 16),
(1149, 25, 17),
(1150, 25, 18),
(1151, 25, 19),
(1152, 25, 20),
(1153, 25, 21),
(1154, 25, 22),
(1155, 25, 23),
(1156, 25, 24),
(1157, 25, 25),
(1158, 25, 26),
(1159, 25, 27),
(1160, 25, 28),
(1161, 25, 29),
(1162, 25, 30),
(1163, 25, 31),
(1164, 25, 32),
(1165, 25, 33),
(1166, 25, 34),
(1167, 25, 35),
(1168, 25, 36),
(1169, 25, 37),
(1170, 25, 38),
(1171, 25, 39),
(1172, 25, 40),
(1173, 25, 41),
(1174, 25, 42),
(1175, 25, 43),
(1176, 25, 44),
(1177, 25, 45),
(1178, 25, 46),
(1179, 25, 47),
(1180, 25, 48),
(1181, 25, 49),
(1182, 25, 50),
(1183, 25, 51),
(1184, 25, 52),
(1185, 25, 53),
(1186, 25, 54),
(1187, 25, 55),
(1188, 25, 56),
(1189, 25, 57),
(1190, 25, 58),
(1191, 25, 59),
(1192, 25, 60),
(1193, 25, 61),
(1194, 25, 62),
(1195, 25, 63),
(1196, 25, 64),
(1197, 25, 65),
(1198, 25, 66),
(1199, 25, 67),
(1200, 25, 68),
(1201, 25, 69),
(1202, 25, 70),
(1203, 25, 71),
(1204, 25, 72),
(1205, 25, 73),
(1206, 25, 74),
(1207, 25, 75),
(1208, 25, 76),
(1209, 25, 77),
(1210, 25, 78),
(1211, 25, 79),
(1212, 25, 80),
(1213, 25, 81),
(1214, 25, 82),
(1215, 25, 83),
(1216, 25, 84),
(1217, 25, 85),
(1218, 25, -1),
(1219, 26, 0),
(1220, 26, 1),
(1221, 26, 2),
(1222, 26, 3),
(1223, 26, 4),
(1224, 26, 5),
(1225, 26, 6),
(1226, 26, 7),
(1227, 26, 8),
(1228, 26, 9),
(1229, 26, 10),
(1230, 26, 11),
(1231, 26, 12),
(1232, 26, 13),
(1233, 26, 14),
(1234, 26, 15),
(1235, 26, 16),
(1236, 26, 17),
(1237, 26, 18),
(1238, 26, 19),
(1239, 26, 20),
(1240, 26, 21),
(1241, 26, 22),
(1242, 26, 23),
(1243, 26, 24),
(1244, 26, 25),
(1245, 26, 26),
(1246, 26, 27),
(1247, 26, 28),
(1248, 26, 29),
(1249, 26, 30),
(1250, 26, 31),
(1251, 26, 32),
(1252, 26, 33),
(1253, 26, 34),
(1254, 26, 35),
(1255, 26, 36),
(1256, 26, 37),
(1257, 26, 38),
(1258, 26, 39),
(1259, 26, 40),
(1260, 26, 41),
(1261, 26, 42),
(1262, 26, 43),
(1263, 26, 44),
(1264, 26, 45),
(1265, 26, 46),
(1266, 26, 47),
(1267, 26, 48),
(1268, 26, 49),
(1269, 26, 50),
(1270, 26, 51),
(1271, 26, 52),
(1272, 26, 53),
(1273, 26, 54),
(1274, 26, 55),
(1275, 26, 56),
(1276, 26, 57),
(1277, 26, 58),
(1278, 26, 59),
(1279, 26, 60),
(1280, 26, 61),
(1281, 26, 62),
(1282, 26, 63),
(1283, 26, 64),
(1284, 26, 65),
(1285, 26, 66),
(1286, 26, 67),
(1287, 26, 68),
(1288, 26, 69),
(1289, 26, 70),
(1290, 26, 71),
(1291, 26, 72),
(1292, 26, 73),
(1293, 26, 74),
(1294, 26, 75),
(1295, 26, 76),
(1296, 26, 77),
(1297, 26, 78),
(1298, 26, 79),
(1299, 26, 80),
(1300, 26, 81),
(1301, 26, 82),
(1302, 26, 83),
(1303, 26, 84),
(1304, 26, 85),
(1305, 26, -1),
(1306, 27, 0),
(1307, 27, 1),
(1308, 27, 2),
(1309, 27, 3),
(1310, 27, 4),
(1311, 27, 5),
(1312, 27, 6),
(1313, 27, 7),
(1314, 27, 8),
(1315, 27, 9),
(1316, 27, 10),
(1317, 27, 11),
(1318, 27, 12),
(1319, 27, 13),
(1320, 27, 14),
(1321, 27, 15),
(1322, 27, 16),
(1323, 27, 17),
(1324, 27, 18),
(1325, 27, 19),
(1326, 27, 20),
(1327, 27, 21),
(1328, 27, 22),
(1329, 27, 23),
(1330, 27, 24),
(1331, 27, 25),
(1332, 27, 26),
(1333, 27, 27),
(1334, 27, 28),
(1335, 27, 29),
(1336, 27, 30),
(1337, 27, 31),
(1338, 27, 32),
(1339, 27, 33),
(1340, 27, 34),
(1341, 27, 35),
(1342, 27, 36),
(1343, 27, 37),
(1344, 27, 38),
(1345, 27, 39),
(1346, 27, 40),
(1347, 27, 41),
(1348, 27, 42),
(1349, 27, 43),
(1350, 27, 44),
(1351, 27, 45),
(1352, 27, 46),
(1353, 27, 47),
(1354, 27, 48),
(1355, 27, 49),
(1356, 27, 50),
(1357, 27, 51),
(1358, 27, 52),
(1359, 27, 53),
(1360, 27, 54),
(1361, 27, 55),
(1362, 27, 56),
(1363, 27, 57),
(1364, 27, 58),
(1365, 27, 59),
(1366, 27, 60),
(1367, 27, 61),
(1368, 27, 62),
(1369, 27, 63),
(1370, 27, 64),
(1371, 27, 65),
(1372, 27, 66),
(1373, 27, 67),
(1374, 27, 68),
(1375, 27, 69),
(1376, 27, 70),
(1377, 27, 71),
(1378, 27, 72),
(1379, 27, 73),
(1380, 27, 74),
(1381, 27, 75),
(1382, 27, 76),
(1383, 27, 77),
(1384, 27, 78),
(1385, 27, 79),
(1386, 27, 80),
(1387, 27, 81),
(1388, 27, 82),
(1389, 27, 83),
(1390, 27, 84),
(1391, 27, 85),
(1392, 27, -1),
(1393, 28, 0),
(1394, 28, 1),
(1395, 28, 2),
(1396, 28, 3),
(1397, 28, 4),
(1398, 28, 5),
(1399, 28, 6),
(1400, 28, 7),
(1401, 28, 8),
(1402, 28, 9),
(1403, 28, 10),
(1404, 28, 11),
(1405, 28, 12),
(1406, 28, 13),
(1407, 28, 14),
(1408, 28, 15),
(1409, 28, 16),
(1410, 28, 17),
(1411, 28, 18),
(1412, 28, 19),
(1413, 28, 20),
(1414, 28, 21),
(1415, 28, 22),
(1416, 28, 23),
(1417, 28, 24),
(1418, 28, 25),
(1419, 28, 26),
(1420, 28, 27),
(1421, 28, 28),
(1422, 28, 29),
(1423, 28, 30),
(1424, 28, 31),
(1425, 28, 32),
(1426, 28, 33),
(1427, 28, 34),
(1428, 28, 35),
(1429, 28, 36),
(1430, 28, 37),
(1431, 28, 38),
(1432, 28, 39),
(1433, 28, 40),
(1434, 28, 41),
(1435, 28, 42),
(1436, 28, 43),
(1437, 28, 44),
(1438, 28, 45),
(1439, 28, 46),
(1440, 28, 47),
(1441, 28, 48),
(1442, 28, 49),
(1443, 28, 50),
(1444, 28, 51),
(1445, 28, 52),
(1446, 28, 53),
(1447, 28, 54),
(1448, 28, 55),
(1449, 28, 56),
(1450, 28, 57),
(1451, 28, 58),
(1452, 28, 59),
(1453, 28, 60),
(1454, 28, 61),
(1455, 28, 62),
(1456, 28, 63),
(1457, 28, 64),
(1458, 28, 65),
(1459, 28, 66),
(1460, 28, 67),
(1461, 28, 68),
(1462, 28, 69),
(1463, 28, 70),
(1464, 28, 71),
(1465, 28, 72),
(1466, 28, 73),
(1467, 28, 74),
(1468, 28, 75),
(1469, 28, 76),
(1470, 28, 77),
(1471, 28, 78),
(1472, 28, 79),
(1473, 28, 80),
(1474, 28, 81),
(1475, 28, 82),
(1476, 28, 83),
(1477, 28, 84),
(1478, 28, 85),
(1479, 28, -1),
(1480, 29, 0),
(1481, 29, 1),
(1482, 29, 2),
(1483, 29, 3),
(1484, 29, 4),
(1485, 29, 5),
(1486, 29, 6),
(1487, 29, 7),
(1488, 29, 8),
(1489, 29, 9),
(1490, 29, 10),
(1491, 29, 11),
(1492, 29, 12),
(1493, 29, 13),
(1494, 29, 14),
(1495, 29, 15),
(1496, 29, 16),
(1497, 29, 17),
(1498, 29, 18),
(1499, 29, 19),
(1500, 29, 20),
(1501, 29, 21),
(1502, 29, 22),
(1503, 29, 23),
(1504, 29, 24),
(1505, 29, 25),
(1506, 29, 26),
(1507, 29, 27),
(1508, 29, 28),
(1509, 29, 29),
(1510, 29, 30),
(1511, 29, 31),
(1512, 29, 32),
(1513, 29, 33),
(1514, 29, 34),
(1515, 29, 35),
(1516, 29, 36),
(1517, 29, 37),
(1518, 29, 38),
(1519, 29, 39),
(1520, 29, 40),
(1521, 29, 41),
(1522, 29, 42),
(1523, 29, 43),
(1524, 29, 44),
(1525, 29, 45),
(1526, 29, 46),
(1527, 29, 47),
(1528, 29, 48),
(1529, 29, 49),
(1530, 29, 50),
(1531, 29, 51),
(1532, 29, 52),
(1533, 29, 53),
(1534, 29, 54),
(1535, 29, 55),
(1536, 29, 56),
(1537, 29, 57),
(1538, 29, 58),
(1539, 29, 59),
(1540, 29, 60),
(1541, 29, 61),
(1542, 29, 62),
(1543, 29, 63),
(1544, 29, 64),
(1545, 29, 65),
(1546, 29, 66),
(1547, 29, 67),
(1548, 29, 68),
(1549, 29, 69),
(1550, 29, 70),
(1551, 29, 71),
(1552, 29, 72),
(1553, 29, 73),
(1554, 29, 74),
(1555, 29, 75),
(1556, 29, 76),
(1557, 29, 77),
(1558, 29, 78),
(1559, 29, 79),
(1560, 29, 80),
(1561, 29, 81),
(1562, 29, 82),
(1563, 29, 83),
(1564, 29, 84),
(1565, 29, 85),
(1566, 29, -1);

-- -----------------------------------------------------------------------------
INSERT INTO public.migrations
(label, schema, migrate_date)
VALUES
('20180801_05_insert_AgePeriods', 'people', now());

COMMIT;

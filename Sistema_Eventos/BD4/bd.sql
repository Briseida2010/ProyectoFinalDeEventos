-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.1.41 - Source distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para db_eventos
CREATE DATABASE IF NOT EXISTS `db_eventos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_eventos`;


-- Volcando estructura para tabla db_eventos.auditoria
CREATE TABLE IF NOT EXISTS `auditoria` (
  `idAuditoria` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `tabla` varchar(45) DEFAULT NULL,
  `accion` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`idAuditoria`,`idPersona`),
  KEY `fk_Auditoria_Usuario1_idx` (`idPersona`),
  CONSTRAINT `fk_Auditoria_Usuario1` FOREIGN KEY (`idPersona`) REFERENCES `usuario` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_eventos.auditoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;


-- Volcando estructura para tabla db_eventos.comision
CREATE TABLE IF NOT EXISTS `comision` (
  `idPersona` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPersona`,`idEvento`),
  KEY `fk_Comision_Evento1_idx` (`idEvento`),
  CONSTRAINT `fk_Comision_Evento1` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comision_Usuario1` FOREIGN KEY (`idPersona`) REFERENCES `usuario` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_eventos.comision: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `comision` DISABLE KEYS */;
INSERT INTO `comision` (`idPersona`, `idEvento`, `tipo`) VALUES
	(1, 1, 'Publicidad'),
	(14, 1, 'Recepcion'),
	(15, 2, 'Recepcion'),
	(16, 1, 'Organizacion'),
	(17, 1, 'Decoracion'),
	(18, 1, 'Fotografiar'),
	(25, 2, 'Publicidad');
/*!40000 ALTER TABLE `comision` ENABLE KEYS */;


-- Volcando estructura para tabla db_eventos.evento
CREATE TABLE IF NOT EXISTS `evento` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFinal` datetime DEFAULT NULL,
  `lugar` varchar(50) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_eventos.evento: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` (`idEvento`, `tipo`, `fechaInicio`, `fechaFinal`, `lugar`, `titulo`) VALUES
	(1, 'Seminario', '2017-12-14 08:00:00', '2018-12-14 15:00:00', 'lugar uno', 'titulo uno'),
	(2, 'Taller', '2016-11-14 00:00:00', '2017-11-14 00:00:00', 'lugar dos', 'titulo dos'),
	(3, 'Curso', '2010-10-14 00:00:00', '2011-10-14 00:00:00', 'lugar tres', 'titulo tres'),
	(4, 'Congreso', '2014-04-04 00:00:00', '2014-04-06 00:00:00', 'lugar cuatro', 'titulo cuatro'),
	(5, 'Charla', '2014-11-11 00:00:00', '2014-11-11 00:00:00', 'lugar quinto', 'titulo quinto');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;


-- Volcando estructura para tabla db_eventos.gasto
CREATE TABLE IF NOT EXISTS `gasto` (
  `idEvento` int(11) NOT NULL,
  `idGasto` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(45) DEFAULT NULL,
  `monto` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`idGasto`,`idEvento`),
  KEY `fk_Gasto_Evento1` (`idEvento`),
  CONSTRAINT `FK_gasto_evento` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_eventos.gasto: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `gasto` DISABLE KEYS */;
INSERT INTO `gasto` (`idEvento`, `idGasto`, `concepto`, `monto`) VALUES
	(1, 1, 'Gigantografias', 20.00),
	(1, 2, 'Pancartas', 20.00),
	(1, 3, 'Empanadas', 1.50),
	(1, 4, 'Viaticos', 80.00),
	(2, 5, 'Auditorio', 100.00),
	(1, 6, 'Hojas', 10.00);
/*!40000 ALTER TABLE `gasto` ENABLE KEYS */;


-- Volcando estructura para tabla db_eventos.inscripcion
CREATE TABLE IF NOT EXISTS `inscripcion` (
  `idPersona` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `tipoPago` varchar(45) DEFAULT NULL,
  `monto` decimal(8,2) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`idPersona`,`idEvento`),
  KEY `fk_Participantes_Evento1_idx` (`idEvento`),
  CONSTRAINT `fk_Participantes_Evento1` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Participantes_Persona1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_eventos.inscripcion: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
INSERT INTO `inscripcion` (`idPersona`, `idEvento`, `tipoPago`, `monto`, `fecha`) VALUES
	(1, 2, 'Pagado', 1000.00, '2010-10-10 00:00:00'),
	(2, 1, 'Pagado', 50.00, '2014-05-04 21:05:41'),
	(2, 2, 'Pagado', 12.00, '2010-10-10 00:00:00'),
	(2, 4, 'Pendiente', 20.00, '2010-10-10 00:00:00'),
	(3, 1, 'Gratis', 0.00, '2014-05-04 21:05:39'),
	(3, 2, 'Pendiente', 20.00, '2010-10-10 00:00:00'),
	(4, 1, 'Gratis', 0.00, '2014-05-04 21:05:37'),
	(15, 1, 'Pendiente', 20.00, '2010-10-10 00:00:00'),
	(17, 3, 'Pagado', 22.00, '2010-10-10 00:00:00'),
	(19, 1, 'Pagado', 50.00, '2014-05-04 21:05:45'),
	(21, 1, 'Pagado', 50.00, '2014-05-04 21:05:46'),
	(22, 1, 'Pagado', 50.00, '2014-05-04 21:05:48'),
	(22, 2, 'Pagado', 20.00, '2010-10-10 00:00:00');
/*!40000 ALTER TABLE `inscripcion` ENABLE KEYS */;


-- Volcando estructura para tabla db_eventos.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_eventos.persona: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`idPersona`, `nombres`, `apellidos`, `email`) VALUES
	(1, 'Briseida', 'mod', NULL),
	(2, 'Dario', 'Mendoza', 'dmalf@hotmail.com'),
	(3, 'Miguel', 'Mengeche', 'Miguelmenge@hotmail.com'),
	(4, 'Arturo', 'Ponente', 'ArturoPonente@hotmail.com'),
	(14, 'NPrueba', 'APrueba', 'prueba@hotmail.com'),
	(15, 'Adyessirb', 'mod', NULL),
	(16, 'nombre test', 'apellido test', NULL),
	(17, 'Luis', 'Palacios', NULL),
	(18, 'Eduardo', 'Lanchipa', NULL),
	(19, 'Santiago', 'Chura', NULL),
	(20, 'Saul', 'Galan', NULL),
	(21, 'Kevin', 'Chura', 'kevin@hotmail.com'),
	(22, 'Ruth', 'Portugal', 'ruth@hotmail.com'),
	(24, 'Brisa', 'del mar', NULL),
	(25, 'Leo', 'Ramirez', NULL),
	(26, 'b', 'b', 'b@hotmail.com');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;


-- Volcando estructura para tabla db_eventos.ponente
CREATE TABLE IF NOT EXISTS `ponente` (
  `idPersona` int(11) NOT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `gradoAcademico` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  CONSTRAINT `fk_Ponente_Persona1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_eventos.ponente: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `ponente` DISABLE KEYS */;
INSERT INTO `ponente` (`idPersona`, `celular`, `gradoAcademico`) VALUES
	(1, '123123', 'Bachiller'),
	(2, '952838395', 'bachiller'),
	(3, '952838394', 'Magister'),
	(19, '952838399', 'Doctor'),
	(20, '952838396', 'Ingeniero'),
	(21, '952838397', 'Doctor'),
	(24, '952838398', 'Bachiller');
/*!40000 ALTER TABLE `ponente` ENABLE KEYS */;


-- Volcando estructura para tabla db_eventos.programa
CREATE TABLE IF NOT EXISTS `programa` (
  `idEvento` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `tema` varchar(45) DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFinal` datetime DEFAULT NULL,
  `Asistencia` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idEvento`,`idPersona`),
  KEY `fk_Programa_Ponente1_idx` (`idPersona`),
  CONSTRAINT `fk_Programa_Evento1` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Programa_Ponente1` FOREIGN KEY (`idPersona`) REFERENCES `ponente` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_eventos.programa: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` (`idEvento`, `idPersona`, `tema`, `fechaInicio`, `fechaFinal`, `Asistencia`) VALUES
	(1, 1, 'Redes y Comunicaciones', '2014-04-29 23:41:34', '2014-04-30 23:41:37', NULL),
	(1, 2, 'Programacion Extrema', '2014-04-29 23:43:26', '2014-05-01 23:43:32', NULL),
	(2, 3, 'Metodologias Agiles', '2014-04-29 23:42:26', '2014-05-02 23:42:28', NULL),
	(2, 20, 'Tema 1', '2010-10-10 00:00:00', '2011-10-10 00:00:00', NULL),
	(2, 21, 'TT', '2010-10-10 00:00:00', '2011-10-10 00:00:00', NULL),
	(2, 24, 'Taller de Liderazgo y Emprendimientooooo', '2014-04-30 02:48:26', '2014-04-30 04:00:00', NULL),
	(3, 3, 'Tema dos', '2010-10-10 00:00:00', '2011-10-10 00:00:00', NULL),
	(3, 19, 'HTML5', '2014-04-30 02:42:51', '2014-05-23 02:43:04', NULL),
	(4, 20, 'ADOO', '2014-04-30 02:45:37', '2014-05-23 02:45:40', NULL),
	(5, 21, 'Liderazgo', '2014-04-30 02:47:12', '2014-04-30 04:00:00', NULL);
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;


-- Volcando estructura para procedimiento db_eventos.sp_D_Auditoria
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Auditoria`(
		pidAuditoria int(10)
	)
BEGIN
		DELETE FROM Auditoria WHERE idAuditoria =pidAuditoria;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_D_Comision
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Comision`(
		pidPersona int(10),
		pidEvento int(10)
	)
BEGIN
		DELETE FROM Comision WHERE idPersona = pidPersona AND idEvento = pidEvento;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_D_Evento
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Evento`(
		pidEvento int(10)
	)
BEGIN
		DELETE FROM Evento WHERE idEvento =pidEvento;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_D_Gasto
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Gasto`(
		pidGasto int(10)
	)
BEGIN
		DELETE FROM Gasto WHERE idGasto =pidGasto;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_D_Inscripcion  4 뾰া   ₁2   폰ি젠া칸া    O ଠ৆뾰াҰ  'Value A','Value B' 뾰াҰ  usp_S_inscripcion 5 뾰াҰ  latin1_swedish_ci 3 뾰া(;\s*)?InnoDB\s*free\:.*$ 뾰াҰ  sp_S_ProgramaEvento 뾰াҰ 	 Unnamed-2 Unnamed-2 뾰াҰ  sp_U_Inscripcion 55 뾰া   ₁2   폰ি첸া鲈Ϫ    = ੠৆뾰াҰ  latin1_swedish_ci 2 뾰াҰ  10 10 10 10 10 ,10  뾰াҰ  sp_S_PonenteEvento  뾰াҰ  sp_I_Inscripcion 54 뾰াҰ  sp_U_Inscripcion 55 @OLD_FOREIူ 猶 䂘嶀ਈ  Ӌ S=䂘FO쿠াᠤq휼ϧ퀤া┼ে  쿠াҰ  IN _쿠াҰ  '1' 쿠াҰ  IN  쿠াӤ  瑓䙲瑭 쿠াӤ  䉄   쿠াӤ  效䉸瑹e쿠াӤ  摁偤牴 쿠াӤ  敳敬瑣 쿠াҰ  ''  쿠াӤ  牔浩  쿠াӤ  潍敶〲 쿠াꓠȨ捘d꛰Ȩ捘d  쿠াӤ  佉瑕汩s쿠াO鰈ȡ쁀aࠐϱ  쿠াӤ  祔䥰普o쿠াᐠ৆፠৆ᙠ৆e   쿠াྤI햸া    쿠া귰ϡ   `   쿠াҰ  IN _쿠াҰ  OUT 쿠াӤ  汃灩牢d쿠াરȟ兠ষ疠঴�Ȝ  쿠াӤ  汆瑡䉓 쿠াӤ  䑁䑏B 쿠াྤIা    쿠াӤ  硅䑴杬s쿠াӤ  慍歳s 쿠াᐠ৆፠৆ᙠ৆` k 쿠াྤI튠া    쿠াӤ  硕桔浥e쿠াⳀȠ        쿠াꆨ}  ᴬ@괜~  쿠াӤ  敍畮s 쿠াꆨ}  ᴬ@괜~  쿠াྤI�Ȫ    쿠াӤ  瑓䕲摮 쿠াӤ  潳正瑥 쿠াҰ  45  쿠াӤ  潍敶〶 쿠াӤ  獅p  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  汃獡敳s쿠াӤ  潃瑮牮s쿠াҰ  IN  쿠াҰ  IN M쿠াᠤqᓜে표া㯜Ϩ  쿠াᠤq猬Ϩ�া�ϧ  쿠াӤ  潃佭橢 쿠াӤ  浉䱧獩t쿠াӤ  潃獮獴 쿠াӤ  硅䑴杬s쿠াҰ  IN  쿠াӤ  慍桴  쿠াӤ  䱚扩  쿠াӤ  潔汯楗n쿠াᠤq⚜ে큔া鑌ী  쿠াӤ  潣湮捥t쿠াꆨ}  ᴬ@괜~  쿠াҰ  0   쿠াરȟⳀȠࠐϱn   쿠াҰ  3   쿠াᚸIাȬ   쿠াӤ  彀汬桳l쿠াӤ  慆汩摥 쿠াҰ  OUT 쿠াӤ  楗摮睯s쿠াӤ  硅p  쿠াӤ  牆捡  쿠াӤ  潌卷牴 쿠াӤ  灕慃敳 쿠াꆨ}  ᴬ@괜~  쿠াӤ  祓䕮楤t쿠া仰ϲ퐠ϥ      쿠াྤI훰া     쿠াӤ  䍊湯瑳s쿠াҰ  1   쿠াӤ  汏䑥B 쿠াྤI        쿠াҰ  4   쿠াꆨ}  ᴬ@괜~  쿠াҰ  ''  쿠াӤ  潍敶㘳 쿠াҰ  '1' 쿠াྤI㜠ি    쿠াᠤq돌Ӷ㦜ি吔Ϩ  쿠াҰ  IN  쿠াӤ  偊G  쿠া魐Ӻ핰Ȝϰ겐J  쿠াӤ  潆浲s 쿠াꆨ}  ᴬ@괜~  쿠াӤ  灪来  쿠াӤ  䑁䥏瑮 쿠াꆨ}  ᴬ@괜~  쿠াӤ  潃佭橢 쿠াO  鸌Pᙠ৆  쿠াꆨ}  ᴬ@괜~  쿠াӤ  楍n湯a쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  慍楰  쿠াӤ  畂瑴湯s쿠াӤ  婍楌b 쿠াꆨ}  ᴬ@괜~  쿠াҰ  10  쿠াӤ  慍楰  쿠াӤ  偊Gr 쿠াྤIা    쿠াҰ  80  쿠াӤ  瑓卲慣n쿠াҰ  11  쿠াӤ  婍楌b 쿠াꆨ}  ᴬ@괜~  쿠াӤ  汃獯e 쿠াྤI⻐ȨT _   쿠াӤ  湌   쿠াꆨ}  ᴬ@괜~  쿠াҰ  0   쿠াҰ  '1' 쿠াӤ  潍敶㠲 쿠াҰ  1   쿠াӤ  楢摮  쿠াҰ  45  쿠াӤ  桓睌灁i쿠াҰ  0   쿠াҰ  4   쿠াӤ  敇䅴偃 쿠াꆨ}  ᴬ@괜~  쿠া  ￿￿    쿠াྤIা    쿠াҰ  9   쿠া쫰gꎠϧ $   쿠াӤ  䔮扁牯t쿠াӤ  偀睯〱 쿠াӤ  瑓偲獯 쿠াӤ  慔獢  쿠াӤ  摁䥤整m쿠াӤ  癃䥴瑮 쿠াҰ  50  쿠াҰ  11  쿠াO  鸌P፠৆  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াO  鸌Pᐠ৆  쿠াྤI톀া    쿠াӤ  敨灬牥s쿠াྤI턠া    쿠াࠐϱᓠ৆      쿠াྤI        쿠াӤ  浉m  쿠াꆨ}  ᴬ@괜~  쿠াӤ  獉敎䍷s쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াҰ  INT 쿠াྤI툐া    쿠াꆨ}  ᴬ@괜~  쿠াҰ  IN  쿠াҰ  7   쿠াꆨ}  ᴬ@괜~  쿠া阐Ӻ   ,   쿠া鞰ҝ雰ҝ鸌P俠ষ  쿠াꆨ}  ᴬ@괜~  쿠াྤI틨া    쿠াӤ  瑓䙲瑭 쿠াҰ  11  쿠াꆨ}  ᴬ@괜~  쿠াᠤq瑄Ϩ푄া㱼ে  쿠াҰ  IN _쿠াӤ  潐湩t 쿠াӤ  畂瑴湯s쿠াӤ  慔獢  쿠াӤ  汯慥捣 쿠াҰ  INT 쿠াྤI ি    쿠াྤIⰨি    쿠াӤ  楄污杯s쿠াӤ  潆浲s 쿠াҰ  KEY 쿠াҰ  8,2 쿠াҰ  71  쿠াҰ  274 쿠াҰ  179 쿠াҰ  249 쿠াҰ  60  쿠াҰ  50  쿠াҰ  90 F쿠াҰ  217 쿠াҰ  130 쿠াҰ  140 쿠াҰ  100 쿠াҰ  0 0 쿠াҰ  1 ti쿠াҰ  2 ha쿠াҰ  3 UL쿠াҰ  4  P쿠াҰ  5  (쿠াҰ  6 )쿠াҰ  7 In쿠াҰ  8 IN쿠াҰ  9 DE쿠াҰ  10 E쿠াҰ  0  -쿠াҰ  241 쿠াҰ  1 la쿠াҰ  2 ev쿠াҰ  3 to쿠াҰ  4 (a쿠াҰ  5 en쿠াҰ  6 00쿠াҰ  7 BL쿠াҰ  8  D쿠াҰ  9 S 쿠াҰ  10  쿠াҰ  100 쿠াҰ  0   쿠াҰ  1  `쿠াҰ  10 `쿠াҰ  0 na쿠াҰ  1 `,쿠াҰ  525 쿠াҰ  188 쿠াҰ  80 ,쿠াҰ  80 4쿠াҰ  0   쿠াҰ  1 4 쿠াҰ  2  '쿠াҰ  3 , 쿠াҰ  4 o'쿠াҰ  0 Ta쿠াᠤqϧা�া  쿠াҰ  1 00쿠াҰ  2 7-쿠াҰ  3 0:쿠াҰ  4 r 쿠া넀ȧ   = 9 쿠াꆨ}  ᴬ@괜~  쿠াӤ  灯楴湯s쿠াӤ  敳摮  쿠াҰ  11  쿠াӤ  慍歳  쿠াҰ  179 쿠াྤIা     쿠াӤ  瑓䵲癯e쿠াӤ  䍀潬敳 쿠াҰ  50  쿠াꆨ}  ᴬ@괜~  쿠া퇰J̸       쿠াꆨ}  ᴬ@괜~  쿠াྤI㧀ি    쿠াҰ  100 쿠াҰ  
 0쿠াྤI�া    쿠াҰ  
 0쿠াꆨ}  ᴬ@괜~  쿠াӤ  硁瑃汲s쿠া쫰g癀Ϩ (   쿠াӤ  潃卭牴s쿠াӤ  敒癣瑓r쿠াӤ  硁瑃汲s쿠াꆨ}  ᴬ@괜~  쿠াҰ  45  쿠াӤ  剀問䑎 쿠াӤ  楍卤牴 쿠া쫰gﵐϧ (   쿠াӤ  楐杮  쿠াꆨ}  ᴬ@괜~  쿠াҰ  80  쿠াӤ  扅p  쿠াӤ  瑓䍲浯p쿠াҰ  2 湯a쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াᠤq㪬ӵ∬ি덌Ӷ  쿠াꆨ}  ᴬ@괜~  쿠াӤ  區瑥煅 쿠াӤ  牅潲r 쿠াҰ  0  a쿠াӤ  䅀灰湥d쿠াӤ  潌摡瑓r쿠াҰ  241 쿠াӤ  楆敬杁e쿠াꆨ}  ᴬ@괜~  쿠াӤ  瑓䱲湥 쿠াꆨ}  ᴬ@괜~  쿠াӤ  癃䥴瑮W쿠াꆨ}  ᴬ@괜~  쿠াҰ  IN  쿠াҰ  '1' 쿠াӤ  硕桔浥e쿠াҰ  ''  쿠াӤ  求捯䥫O쿠াӤ  䙀畬桳 쿠াҰ  60  쿠াӤ  區瑥畓b쿠াӤ  煓瑲  쿠াӤ  敔瑸湉 쿠াӤ  潌ㅧ  쿠াӤ  牅潲r 쿠াӤ  祓䥳楮t쿠াꆨ}  ᴬ@괜~  쿠াҰ  0   쿠াҰ  50  쿠াҰ  249 쿠াӤ  瑓乲睥 쿠াҰ  5   쿠াҰ  3   쿠াҰ  7   쿠াӤ  潆浲瑡 쿠াҰ  274 쿠াꓠȨ愀d꛰Ȩ愀d  쿠াҰ  39  쿠াྤI        쿠াꆨ}  ᴬ@괜~  쿠াરȟࠐϱ鸌P传ষ  쿠াӤ  䵆䉔摣 쿠াҰ  IN  쿠াྤI        쿠াӤ  祓䵮浥o쿠াӤ  灪来  쿠াҰ  
  쿠াҰ  10  쿠াӤ  瑓䍲灯y쿠াӤ  䡀污ぴ 쿠াҰ  '1' 쿠াҰ  45  쿠াӤ  祓瑳浥 쿠াӤ  祔䥰普o쿠াӤ  瑓偲獡 쿠াҰ  4   쿠া쫰g㻈Ϩ (   쿠াરȟࠐϱ      쿠াꆨ}  ᴬ@괜~  쿠াҰ  4   쿠াҰ  3   쿠াҰ  2   쿠াӤ  潍敶㈵ 쿠াҰ  IN _쿠াҰ  1   쿠াҰ  50  쿠াҰ  0 el쿠াҰ  2   쿠াҰ  3 ht쿠াҰ  0   쿠াҰ  0   쿠াҰ  1   쿠াӤ  潖l  쿠াҰ  80  쿠াҰ  80  쿠াҰ  525 쿠াҰ  1   쿠াҰ  0   쿠াҰ  10  쿠াӤ  瑓偲獯 쿠াҰ  1   쿠াҰ  100 쿠াҰ  10  쿠াҰ  8   쿠াҰ  7   쿠াҰ  50  쿠াҰ  50  쿠াҰ  50  쿠াҰ  163 쿠াӤ  楗䥮敮t쿠াӤ  瑓䕲摮 쿠াꆨ}  ᴬ@괜~  쿠াҰ  10  쿠াӤ  呀啒䍎 쿠াӤ  慒摮浯 쿠াҰ  2   쿠াҰ  188 쿠াҰ  1   쿠াҰ  3   쿠াӤ  慍湩  쿠াྤI㗐ি    쿠াӤ  敔瑸畏t쿠াӤ  䅀獳杩n쿠াӤ  潍敶  쿠াҰ  6   쿠াҰ  5   쿠াҰ  4   쿠াҰ  2   쿠াӤ  煳桬汥p쿠াҰ  100 쿠াҰ  60  쿠াҰ  8 tt쿠া  퀃     쿠াҰ  7   쿠াҰ  45  쿠াҰ  179 쿠াҰ  249 쿠াᠤq탼ϧ퇔াা  쿠াҰ  274 쿠াӤ  潍敶㐴 쿠াҰ  10  쿠াӤ  楶睥  쿠াҰ  50  쿠াҰ  1   쿠াҰ  9   쿠াҰ  140 쿠াҰ  100 쿠াҰ  0   쿠াҰ  0 0 쿠াҰ  90  쿠াҰ  1   쿠াҰ  5   쿠াҰ  6 ts쿠াҰ  2   쿠াҰ  3 es쿠াҰ  1   쿠াҰ  0   쿠াҰ  4   쿠াҰ  7   쿠াҰ  8 a`쿠াҰ  9   쿠াҰ  10 `쿠াҰ  100 쿠াҰ  0   쿠াҰ  1   쿠াҰ  10 .쿠াҰ  525 쿠াꆨ}  ᴬ@괜~  쿠াҰ  188 쿠াҰ  80 t쿠াҰ  4   쿠াҰ  1   쿠াӤ  敄䍣汯 쿠াҰ  2   쿠াҰ  3   쿠াҰ  4   쿠াꆨ}  ᴬ@괜~  쿠াҰ  130 쿠াҰ  1   쿠াӤ  楄䵶摯 쿠াꆨ}  ᴬ@괜~  쿠াӤ  慍汩瑉 쿠াҰ  45  쿠াӤ  敒癣瑓r쿠াҰ  9   쿠াꆨ}  ᴬ@괜~  쿠াӤ  慄整  쿠াҰ  50  쿠াҰ  1   쿠াꆨ}  ᴬ@괜~  쿠াҰ  140 쿠াҰ  100 쿠াҰ  274 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াҰ  2   쿠াҰF  50  쿠াҰ  3   쿠াҰ  50  쿠াҰ  10  쿠াҰ  241 쿠াҰ  2   쿠াҰ  8   쿠াҰ  1   쿠াҰ  0 0 쿠াӤ  硅瑩汄l쿠াҰ  5   쿠াҰ  6   쿠াӤ  摁䥤整m쿠াҰ  100 쿠াҰ  2   쿠াҰ  4   쿠াҰ  80  쿠াҰ  1   쿠াӤ  䝀瑥敍m쿠াҰ  217 쿠াҰ  130 쿠াҰ  7   쿠াꆨ}  ᴬ@괜~  쿠াҰ  0   쿠াҰ  90  쿠াҰ  130 쿠াҰ  6   쿠াҰ  1   쿠াҰ  80  쿠া    	 쿠াҰ  2   쿠াꆨ}  ᴬ@괜~  쿠াҰ  6   쿠াҰ  0   쿠াҰ  10  쿠াҰ  9   쿠াҰ  8   쿠াҰ  1   쿠াҰ  241 쿠াҰ  5   쿠াҰ  4   쿠াҰ  3   쿠াӤ  湁佹p 쿠াҰ  `"  쿠াꆨ}  ᴬ@괜~  쿠াҰ  9   쿠াҰ  8   쿠াҰ  6   쿠াҰ  90  쿠াҰ  4   쿠াҰ  3   쿠াҰ  2   쿠াҰ  1   쿠াҰ  100 쿠াҰ  140 쿠াҰ  130 쿠াҰ  217 쿠াҰ  50  쿠াӤ  桃捥䥫t쿠াҰ  80  쿠াӤ  畃t  쿠াꆨ}  ᴬ@괜~  쿠াҰ  0   쿠াҰ  1   쿠াҰ  1   쿠াҰ  2   쿠াҰ  1   쿠াҰ  3 or쿠াӤ  汆獵ha쿠াҰ  2   쿠াҰ  6   쿠াҰ  3 h 쿠াҰ  0   쿠াӤ  桔浥獥 쿠াӤ  楙汥d 쿠াҰ  0   쿠াӤ  慓敭瑓r쿠াꆨ}  ᴬ@괜~  쿠া쫰g悰Ϩ (   쿠াꆨ}  ᴬ@괜~  쿠াҰ  10  쿠াҰ  71  쿠াҰ  3   쿠াҰ  4 	(쿠াӤ  瑓卲慣n쿠াҰ  45  쿠াҰ  4   쿠াҰ  5   쿠া쫰g鸨ϧ (   쿠াҰ  ''  쿠াҰ  217 쿠াҰ  0   쿠াҰ  0   쿠াҰ  10  쿠াҰ  0   쿠াҰ  11  쿠াҰ  2 pt쿠াҰ  5   쿠াӤ  瑓䱲湥 쿠াҰ  3   쿠াҰ  241 쿠াྤIȪ
    쿠াҰ  0 0 쿠াҰ  1   쿠াྤIҀি    쿠াҰ  50  쿠াꆨ}  ᴬ@괜~  쿠াӤ  敓摮瑓r쿠া【ȫហϬᡀϬᣠϬ0 쿠াӤ  楋汬硅t쿠াҰ  179 쿠াӤ  潄汃捩k쿠াӤ  畎汬灏 쿠াҰ  ''  쿠াӤ  睄慭楰 쿠াӤ  敇䙴湯t쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  敇䑴瑡e쿠াꆨ}  ᴬ@괜~  쿠াӤ  噀牡汃r쿠াᠤq屮ϧা쑌ী  쿠াꆨ}  ᴬ@괜~  쿠াӤ  牗敔瑸 쿠াӤ  慄整灏 쿠াꆨ}  ᴬ@괜~  쿠াӤ  祂整佳f쿠াӤ  扁牯ta쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  敒污灏 쿠াӤ  潂瑴浯 쿠াҰ  0   쿠াӤ  畐桳  쿠াӤ  瑨湯s 쿠াꆨ}  ᴬ@괜~  쿠াӤ  捄潔浂p쿠াꆨ}  ᴬ@괜~  쿠াӤ  潐p  쿠াҰ  2   쿠াӤ  摁敬㍲2쿠াӤ  敄䍣汯 쿠াӤ  汓敥p 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  潔p  쿠াҰ  188 쿠াҰ  41  쿠াҰ  525 쿠াҰ  '1' 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াҰ2  INT 쿠াӤ  浆却牴 쿠াӤ  潆浲瑡 쿠াҰ  0 0 쿠াӤ  瑓䱲浆t쿠াꆨ}  ᴬ@괜~  쿠াҰ  11  쿠াҰ  6   쿠াӤ  楆摮灂l쿠াӤ  牅潲䅲t쿠াꆨ}  ᴬ@괜~  쿠াҰ  525 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  獉汃獡s쿠াꆨ}  ᴬ@괜~  쿠াҰ  7   쿠াӤ  效䍸慨r쿠াꆨ}  ᴬ@괜~  쿠াӤ  瑓䍲浯p쿠াҰ  9   쿠াӤ  敂灥  쿠াҰ  50  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াҰ  45  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াO  蘰aྸȥ  쿠াҰ  INT 쿠াҰ  50  쿠াҰ  50  쿠াҰ  50  쿠াҰ  163 쿠াҰ  0   쿠াҰ  50  쿠াҰ  0 a`쿠াҰ  1 OT쿠াҰ  2 `t쿠াҰ  3 ar쿠াҰ  4 LT쿠াҰ  SET 쿠াҰ  50  쿠াҰ  `"  쿠াҰ  
 r쿠াҰ  50  쿠াҰ  50  쿠াҰ  BIT 쿠া    6 쿠াꆨ}  ᴬ@괜~  쿠া     LT쿠াӤ  瑓䍲灯y쿠াӤ  摁䥤整m쿠াҰ  60  쿠াꆨ}  ᴬ@괜~  쿠াҰ  11  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াҰ  7   쿠াҰ  188 쿠াӤ  敲癣  쿠াꆨ}  ᴬ@괜~  쿠াӤ  瑍x  쿠াҰ  0 o`쿠াҰ  1 ES쿠াҰ  2 (`쿠াҰ  3  O쿠াҰ  4 O 쿠া    3 쿠াҰ  SET 쿠াҰ  249 쿠াҰ  1   쿠াҰ  50  쿠াҰ  BIT 쿠াӤ  潍敶㠶 쿠া     ER쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াҰ  3   쿠াӤ  慖彲  쿠াӤ  湉佴p 쿠াꆨ}  ᴬ@괜~  쿠াӤ  敳摮潴 쿠াӤ  湉瑩  쿠াҰ  4  a쿠াҰ  4 r 쿠াӤ  敒瑣  쿠াӤ  潐湩t 쿠াӤ  潐p  쿠াӤ  慍捴敨s쿠াӤ  吮潆瑮 쿠াӤ  吮敐n 쿠াӤ  湉㙴伴p쿠াӤ  敃汩  쿠াꆨ}  ᴬ@괜~  쿠াӤ  潂湵獤 쿠া쫰g뿀ϧ (   쿠াҰ  ''  쿠াӤ  湁楳潐s쿠াӤ  牆硥p 쿠াӤ  敇呴浩e쿠াҰ  '1' 쿠াӤ  浆却牴 쿠াꆨ}  ᴬ@괜~  쿠াӤ  楍卤牴 쿠াӤ  潐䕳x 쿠াꆨ}  ᴬ@괜~  쿠াӤ  楄䵶摯 쿠াӤ  敌瑦瑓r쿠াӤ  晉桔湥 쿠াҰ  0   쿠াӤ  潎w  쿠াҰ  8   쿠াꆨ}  ᴬ@괜~  쿠াӤ  吮癅湥t쿠াꆨ}  ᴬ@괜~  쿠াӤ  睏敮䉤y쿠াꆨ}  ᴬ@괜~  쿠াӤ  楍n  쿠াӤ  ㍍d  쿠াӤ  潐敷r 쿠াҰ  IN  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  潆浲瑡 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  浆却牴 쿠াꆨ}  ᴬ@괜~  쿠াӤ  慍x湯a쿠াꆨ}  ᴬ@괜~  쿠াҰ  5   쿠াӤ  晉桔湥 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  潆浲瑡 쿠াӤ  敒潣敶r쿠াӤ  牅潲r 쿠াӤ  吮摅瑩 쿠াꆨ}  ᴬ@괜~  쿠াӤ  吮慌敢l쿠াӤ  摁䥤n 쿠াӤ  潍瑮佨f쿠াӤ  湉䡣畯r쿠াӤ  楌瑳摁d쿠াӤ  楍噮牡 쿠াӤ  敒敳t 쿠াӤ  教牡晏 쿠াӤ  潔慤y 쿠াӤ  敂潦敲 쿠াӤ  畄䉰瑩s쿠াӤ  吮楆敬r쿠াӤ  牅潲r 쿠াӤ  吮楂獴 쿠াӤ  吮楌瑳 쿠াӤ  噀牡摁d쿠াӤ  潄牗瑩e쿠াӤ  吮瑓捡k쿠াӤ  吮潍獵e쿠াӤ  潄汁杩n쿠াӤ  吮牂獵h쿠াӤ  摁佤敬2쿠াӤ  吮捉湯 쿠াӤ  扁䵳湩 쿠াӤ  牄条潔 쿠াӤ  敇䑴䉉 쿠াӤ  潄牗瑩e쿠াӤ  潄牗瑩e쿠াӤ  晁整r 쿠াӤ  吮慍歳 쿠াӤ  畐桳  쿠াӤ  捓湡敓t쿠াҰ  ''  쿠াӤ  浅瑰佹p쿠াӤ  敎䱷湩e쿠াҰ  '1' 쿠াӤ  吮敍潭 쿠াꆨ}  ᴬ@괜~  쿠াӤ  楈瑳搳 쿠াӤ  潄牐湵e쿠া쫰g허ϧ (   쿠াӤ  畃牲灏 쿠াӤ  獉慎n 쿠াӤ  慍xD;쿠াӤ  楍n  쿠াӤ  潄牗瑩e쿠াӤ  畎汬 a쿠াӤ  䥇䥆杭 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  瑉牥瑡e쿠াꆨ}  ᴬ@괜~  쿠াᠤq�ϧাἔি  쿠াӤ  噀牡灏 쿠াӤ  牐湩整r쿠াӤ  湅潣敤 쿠াӤ  楆摮  쿠াྤI괘Ҥ    쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠া쫰gﳘϧ (   쿠াҰ  ''  쿠াӤ  慍x  쿠াꆨ}  ᴬ@괜~  쿠াӤ  湁楳潐s쿠াҰ  '1' 쿠াӤ  楔敭  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  吮敍畮 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  楆汬瑓r쿠াӤ  汆潯ra쿠াҰ  3   쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াྤI        쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  晉桔湥 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াҰ  INT 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াҰ  IN  쿠া魐Ӻ        쿠াྤI        쿠া썠ȧ뱰Ȝ満ϱꏠȧ  쿠াרȣڠϪꓠȨ꛰Ȩ  쿠া썠ȧ        쿠া子ȟ        쿠াꆨ}  ᴬ@괜~  쿠াҰ  IN  쿠াӤ  潐s  쿠াӤ  敇䑴䕃x쿠াӤ  獀牴敬n쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াҰ  ap  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  祓䕮楤t쿠াҰ  1   쿠াҰ  p D 쿠াꆨ}  ᴬ@괜~  쿠াӤ  敍畮s 쿠াྤIῸি    쿠াӤ  獉桃汩d쿠াҰ  IN  쿠াꆨ}  ᴬ@괜~  쿠াҰ  0   쿠াྤI톰া    쿠াҰ  591 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াྤIȪ    쿠াꆨ}  ᴬ@괜~  쿠াӤ  楄污杯s쿠াҰ  0   쿠াꆨ}  ᴬ@괜~  쿠াྤI�া    쿠াӤ  祳据扤 쿠াྤI⁰ি    쿠াྤI⁀ি    쿠াྤI⾸ি    쿠াӤ  䉄   쿠াꆨ}  ᴬ@괜~  쿠াӤ  汃灩牢d쿠াӤ  䥇䥆杭 쿠াྤI⑸ি    쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠া魐Ӻ핰Ȝϰꨰϡ  쿠াҰ  
  쿠াྤI�া    쿠াҰ  2   쿠াӤ  敂灥  쿠াྤI        쿠াӤ  桔浥獥 쿠াྤI꒨Ҥ    쿠াྤI        쿠াӤ  慍湩  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠া子ȟ쾠঴寠ϱ겐J  쿠াᠤq乜ӵ㑴ি㈔ӵ  쿠াྤI꒐Ҥ    쿠াꆨ}  ᴬ@괜~  쿠া쫰g�ϧ (   쿠াҰ  ''  쿠াӤ  南牴敓t쿠াҰ  45  쿠াӤ  吮牁慲y쿠াҰ  '1' 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  䑁䑏B 쿠াҰ  292 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  敇却牴 쿠াꆨ}  ᴬ@괜~  쿠াྤI㊠ষ ,   쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  敇側潲p쿠াྤI        쿠াꆨ}  ᴬ@괜~  쿠াӤ  楚p瑮e쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াᠤq䟌ӵῬি댬Ӷ  쿠াҰ  KEY 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  汓敥p 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াq   数獲湯a쿠াὀȠධϮ      쿠াꆨ}  ᴬ@괜~  쿠াӤ  楗卮捯k쿠াq   数獲湯a쿠াྤI⻈ি    쿠াӤ  捁楴敶X쿠াྤIȪ    쿠াӤ  䵆䉔摣 쿠াὀȠ   0 湯a쿠াO  쁀a満ϱ  쿠াӤ  汃獡敳s쿠াҰ  '1' 쿠াҰ  0 k 쿠া븠ȧ        쿠াӤ  汆瑡䉓 쿠া鰈ȡ遀Ȩ      쿠াӤ  祓瑳浥 쿠াӤ  湰汧湡g쿠াӤ  桓佬橢 쿠াྤI⭐ি    쿠া願}᭠Ϭ満ϱ    쿠াҰ  ''  쿠াӤ  楗摮睯s쿠াӤ  潃浭汄g쿠াӘȣ鰈ȡ      쿠া址ȝ攰Ϯ      쿠াӤ  佉瑕汩s쿠াӤ  摥瑩慶r쿠া쫰g硰Ϩ #   쿠া満ϱ   5 ls쿠াO鰈ȡ뺈f뱰Ȝ  쿠াྤI        쿠াӤ  獐偁I 쿠াO  쁀a満ϱ  쿠াO  쁀a満ϱ  쿠াྤIⶨি    쿠াྤI⨰ি    쿠াྤI⸈ি    쿠াྤIⲠি    쿠াO鰈ȡ蘰aᛀȥ  쿠া址ȝ昰Ϯ      쿠াྤIⱀি    쿠া址ȝ搰Ϯ      쿠াྤIⷘি    쿠া址ȝ暰Ϯ      쿠াྤI⧐ি    쿠াꆨ}  ᴬ@괜~  쿠া뱰Ȝ栰Ϯ      쿠াྤI⹐ি    쿠াҰ  217 쿠াٰȣ鰈ȡ      쿠াҰ  90  쿠াὀȠ࠰Ϯ      쿠াྤI⺘ি    쿠াO  쁀aࠐϱ  쿠াҰ  71  쿠াҰ  274 쿠াҰ  179 쿠াҰ  249 쿠াҰ  60  쿠াҰ  50  쿠াྤI⧨ি    쿠া攰Ϯ搰Ϯ      쿠াӤ  潍敶㈱ 쿠াҰ  140 쿠াҰ  4 ls쿠া쫰g�ϧ (   쿠াҰ  ''  쿠াྤI⪨ি    쿠াҰ  '1' 쿠াꆨ}  ᴬ@괜~  쿠াҰ  '1' 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াҰ  8   쿠াҰ  9   쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াҰ  ''  쿠াӤ  祔数sO쿠াꆨ}  ᴬ@괜~  쿠াӤ  慭婤灩 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠া쫰g夰Ϩ (   쿠াྤI⁘ি    쿠াӤ  瑓䱲浆t쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  慐獲e 쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  湅潣敤 쿠াҰ  2   쿠াꆨ}  ᴬ@괜~  쿠াӤ  敄牣灹t쿠াӤ  彀汬楤v쿠াꆨ}  ᴬ@괜~  쿠াӤ  摁䱤湩k쿠া쫰g妸ӵ #   쿠াӤ  敇䕴灢 쿠াꆨ}  ᴬ@괜~  쿠াӤ  乀睥  쿠াҰ  '1' 쿠াҰ  IN  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  噀牡汃r쿠াꆨ}  ᴬ@괜~  쿠াҰ  ''  쿠াӤ  敄潣敤 쿠াꆨ}  ᴬ@괜~  쿠াӤ  慍楧㥣5쿠াӤ  灕瑓r 쿠াӤ  敨灬牥s쿠াӤ  敄潣敤 쿠াӤ  灕桃牡 쿠াӤ  潐味硥t쿠াӤ  慍楧c 쿠াꡐϡ   295 쿠াӤ  煳桬汥p쿠াӤ  扁畯t 쿠াӤ  楔正楄f쿠াӤ  獆 9 쿠া쫰g㗰ӵ    쿠াӤ  协   쿠াꆨ}  ᴬ@괜~  쿠াӤ  畓卢牴 쿠াӤ  敄卣灥 쿠াӤ  瑓牯e 쿠াӤ  䝒B  쿠া썠ȧ뱰Ȝ満ϱ    쿠াӤ  䡀污t 쿠া㬐ȫ  鸌P䶠ষ  쿠াӤ  敓剴捥t쿠াӤ  潌䍷慨r쿠াྤI        쿠াӤ  浀浥灣y쿠াӤ  楆摮卂 쿠াྤI        쿠াӤ  彀汬潭d쿠াӤ  敓側潲p쿠াӤ  敇䵴湥u쿠াӤ  牔剹慥d쿠াӤ  潔獁楣i쿠াӤ  潐即牴 쿠াӤ  楈潗摲 쿠াӤ  潐s䉄 쿠াӤ  潐s  쿠াꆨ}  ᴬ@괜~  쿠াӤ  湅偤条e쿠াᠤq넬Ӷᒔি驜ӻ  쿠াӤ  敇䑴C 쿠াӤ  湅䵤湥u쿠াӤ  牆敥楓d쿠াӤ  潂湵獤 쿠াӤ  楆汬杒n쿠াӤ  汅楬獰e쿠াӤ  慐䉴瑬 쿠াҰ  IN _쿠াӤ  慍歳求t쿠াⳀȠ兠ষ      쿠াӤ  ⸮   쿠াO  쁀aࠐϱ  쿠াꆨ}  ᴬ@괜~  쿠াҰ  1  M쿠াꆨ}  ᴬ@괜~  쿠াྤI㛰ি    쿠াӤ  䅀獳牥t쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  桃牯d 쿠াӤ  畍䑬癩 쿠াӤ  敇䅴偃 쿠াӤ  牁c  쿠াӤ  牁呣o 쿠াӤ  敓剴偏2쿠াӤ  慓敶䍄 쿠াྤI◈ি    쿠াӤ  偌潴偄 쿠াӤ  楌敮潔 쿠াӤ  湅䑤捯 쿠াӤ  楂䉴瑬 쿠াӤ  獬牴慣t쿠াӤ  潃祰R 쿠াӤ  䝀瑥汔s쿠াӤ  敒瑣  쿠াӤ  汓敥p 쿠াӤ  楐e  쿠াӤ  潐祬潧n쿠াӤ  敋灥  쿠াӤ  牔浩瑓r쿠াӤ  敒汰捡e쿠াӤ  浀浥敳t쿠াӤ  湅偤瑡h쿠াӤ  獬牴敬n쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াӤ  敓䵴湥u쿠াҰ  39  쿠াҰ  274 쿠াҰ  179 쿠াҰ  249 쿠াҰ  60  쿠াҰ  50  쿠াҰ  90  쿠াҰ  217 쿠াҰ  130 쿠াҰ  140 쿠াҰ  100 쿠াҰ  0 0 쿠াҰ  1 na쿠াҰ  2 so쿠াҰ  3 en쿠াҰ  4 id쿠াҰ  5 .i쿠াҰ  6 	W쿠াҰ  7 ve쿠াҰ  8 dE쿠াҰ  9 RD쿠াҰ  10 l쿠াҰ  0  ;쿠াҰ  241 쿠াҰ  1 `@쿠াҰ  2 ` 쿠াҰ  3 `S쿠াҰ  4 ri쿠াҰ  5 EG쿠াҰ  6 CT쿠াҰ  7 di쿠াҰ  8 ND쿠াҰ  9 DE쿠াҰ  10 `쿠াҰ  100 쿠াҰ  0   쿠াҰ  1 io쿠াҰ  10 u쿠াҰ  0 R(쿠াҰ  1 EG쿠াҰ  525 쿠াҰ  188 쿠াҰ  80 
쿠াҰ  80  쿠াҰ  0   쿠াҰ  1 us쿠াҰ  2 ;쿠াҰ  3 D;쿠াҰ  4 EF쿠াҰ  0 `@쿠াҰ  11  쿠াҰ  1 `s쿠াҰ  2 on쿠াҰ  3 pi쿠াҰ  4 t쿠াꆨ}  ᴬ@괜~  쿠াҰ  1 D 쿠াӤ  彀汬畭l쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  쿠াꆨ}  ᴬ@괜~  nomb訶 䔸䔸䯐ি  D₀ȝim䌐ি磰Q籐Ȥ禴ʵ    旸ਈ  Ā      魰I鮀I픐ӺՈR䌰ি˛        Āā  ؁諠ਐ  ＀Ốʵ⒘ʵ ￴  Ȫ￱￿              逬VὈʵ                                                秔w籐Ȥ                                                ˛  ˪  ̀ ¥ ˛         ȏ    Ⓚʵ悐ਆ                 āĀ                                                  莹潀Ϭ{ܦ4                  ￿￿    ￿￿  満ਈ
 㪠ʵ鰈ȡꅠȡ  ￿￿￿￿  ￿￿      : Access䌐ি磰Q籐ȤἬʵ        Ā      魰I鮀I籐ȤՈR䘐িʮ Ǧ |       ĀĀ  ఁ賰ਐ  ＀⮈਒戸਒ ￴    ￱￿              逬V挀਒                                                䬘w籐Ȥ                                                ʮ Ǧ ˬ Ƕ θ ȑ ʮ Ǧ |        ȏ    䜰਒捰ਆ                 āĀ                                                  莹潀ͬÛࠐ4                  ￿￿    ￿￿  樘ਈ￿￿䗈਒      ￿￿￿￿  ￿￿      Error de䌐ি磰Q籐Ȥ끬ਐ               魰I鮀I籐ȤՈR䣰িȋ Ǧ         ā  ఁ鮐ਐ  ＀ᙈ਒杠਒ ￴    ￱￿              逬V䑠਒                                                懴w籐Ȥ                                            ⻼਒  Ě Ǌ ŧ ǚ ˇ ǵ Ě Ǌ         ȏ    摀਒曰ਆ                 ā Ā                                                      ࠪ4                  ￿￿    ￿￿  樰ਈ￿￿䅨਒     ￿￿￿￿  ￿￿      htrdev, 亱ি⽔Q                  魰I鮀I  �N䯐িx  ά  ʨ  Āā   ܁    ＀     ￴    ￱￿              逬V                                                                                                  紼ਈ  ά  Ɏ  Х s x  ǖ       ȏ                         ā Ā                                                      ণ4          @  Āā    긴vℰϟ￿￿￿￿      鰈ȡ          2" */
/* Loadin焱ি㽠Q                  魰I鮀I  �N亰িx & ά H ¨  Āā   ༁    ＀     ￴    ￱￿               逬V                                                                                                  ๴ȭ  ά H Ɏ J Х s x & ά H      ȏ                        ā Ā                                                  ⒖潀  খ4          <   ā Ā  긴vℰϟ  ￿￿    ꅐϡĂ          2
-- HeidiSQL V䌐িҰ ő CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFinal` datetime DEFAULT NULL,
  `lugar` varchar(50) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1  atin1; - Volcando est䌐িCREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFinal` datetime DEFAULT NULL,
  `lugar` varchar(50) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 LT NULL,
  `accion` varchar䌐িҰ Ŕ FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]
A small (single-precision) floating-point number. Allowable values are -3.402823466E+38 to -1.175494351E-38, 0, and 1.175494351E-38 to 3.402823466E+38. These are the theoretical limits, based on the IEEE standard. The actual range might be slightly smaller depending on your hardware or operating system. a la tabla db_event䌐িҰ ŗ CHAR[(M)]
A fixed-length string that is always right-padded with spaces to the specified length when stored. M represents the column length in characters. The range of M is 0 to 255. If M is omitted, the length is 1.

*Note*: Trailing spaces are removed when CHAR values are retrieved unless the PAD_CHAR_TO_FULL_LENGTH SQL mode is enabled.  (`idPersona`,`i䌐িҰ Ŕ BLOB[(M)]
A BLOB column with a maximum length of 65,535 (216 - 1) bytes. Each BLOB value is stored using a two-byte length prefix that indicates the number of bytes in the value. 
An optional length M can be given for this type. If this is done, MySQL creates the column as the smallest BLOB type large enough to hold values M bytes long. EFAULT CHARSET=lati䌐িҰ Ř LONGBLOB
A BLOB column with a maximum length of 4,294,967,295 or 4GB (232 - 1) bytes. The effective maximum length of LONGBLOB columns depends on the configured maximum packet size in the client/server protocol and available memory. Each LONGBLOB value is stored using a four-byte length prefix that indicates the number of bytes in the value. 5, 2, 'Publicid䌐িҰ Ŕ FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]
A small (single-precision) floating-point number. Allowable values are -3.402823466E+38 to -1.175494351E-38, 0, and 1.175494351E-38 to 3.402823466E+38. These are the theoretical limits, based on the IEEE standard. The actual range might be slightly smaller depending on your hardware or operating system. RSET=latin1 char(50䌐িҰ ŗ CHAR[(M)]
A fixed-length string that is always right-padded with spaces to the specified length when stored. M represents the column length in characters. The range of M is 0 to 255. If M is omitted, the length is 1.

*Note*: Trailing spaces are removed when CHAR values are retrieved unless the PAD_CHAR_TO_FULL_LENGTH SQL mode is enabled. 2-14 08:00:00', 䌐িҰ Ŕ BLOB[(M)]
A BLOB column with a maximum length of 65,535 (216 - 1) bytes. Each BLOB value is stored using a two-byte length prefix that indicates the number of bytes in the value. 
An optional length M can be given for this type. If this is done, MySQL creates the column as the smallest BLOB type large enough to hold values M bytes long. 14-11-11 00:00:00',䌐িҰ Ř LONGBLOB
A BLOB column with a maximum length of 4,294,967,295 or 4GB (232 - 1) bytes. The effective maximum length of LONGBLOB columns depends on the configured maximum packet size in the client/server protocol and available memory. Each LONGBLOB value is stored using a four-byte length prefix that indicates the number of bytes in the value.  PRIMARY KEY (`䌐িҰ ő CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFinal` datetime DEFAULT NULL,
  `lugar` varchar(50) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 LT CHARSET=latin1  KEY粱িҰ  Ŕ   `indicadorComision` varchar(1) DEFAULT NULL,
  `indicadorUsuario` varchar(1) DEFAULT NULL,
  `indicadorActivo` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  CONSTRAINT `FK_usuario_persona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 LIMITER  LIMITER   䌐িҰ ŗ CREATE TABLE `ponente` (
  `idPersona` int(11) NOT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `gradoAcademico` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  CONSTRAINT `fk_Ponente_Persona1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 REIGN KEY (`idEv䌐িҰ Ő CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Programa`(
	pidEvento INT(10),
   pidPersona INT(10),
   ptema VARCHAR(45),
   pfechaInicio DATETIME,
   pfechaFinal DATETIME
   
	)
BEGIN
		INSERT INTO Programa(idEvento,idPersona,tema,fechaInicio,fechaFinal)
		VALUES(pidEvento,pidPersona,ptema,pfechaInicio,pfechaFinal);
END 
DELIMITER ;
 tin1 BL䌐িҰ ŋ CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_PersonasxEvento`(prmIdEvento int)
BEGIN
		SELECT DISTINCT p.nombres, p.apellidos, p.email, e.titulo, e.idEvento
		FROM persona p join inscripcion i on p.idPersona = i.idPersona join evento e ON i.idEvento = e.idEvento
		WHERE e.idEvento = prmIdEvento
		ORDER BY p.apellidos;
END ion);
END//
DELIMITER  R  5' Ұ  ō CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_U_Auditoria`(
		pidAuditoria int(10),
		pidPersona int(10),
		ptabla varchar(45),
		pacccion varchar(45),
		pfecha DATETIME
	)
BEGIN 
		UPDATE Auditoria SET
		tabla = ptabla,
		accion = paccion,
		fecha = pfecha		
		
		WHERE idAuditoria = pidAuditoria;
		END//
DELIMITER  /
DELIMITER  IMITER   1  F䌐িҰ Š CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_U_Inscripcion`(IN `pidPersona` int(10), IN `pidEvento` int(10), IN `ptipoPago` varchar(45), IN `pmonto` decimal(8,2), IN `pfecha` DATETIME)
BEGIN 
		UPDATE Inscripcion SET
		
		tipoPago = ptipoPago,
		monto = pmonto,	
		fecha = pfecha
		WHERE idPersona = pidPersona AND idEvento = pidEvento;
		END R  ', N䌐ি滨_ȧ                 魰I鮀I  �N艰ি        ª   Āā   ́ȫ  ＀椐Ȭ检Ȭ ￴                     逬V案Ȭ                                                                                                                             ȏ    铸Ȭ䑠ȩ               ￿￿  Ā                                                  @ኜ(࿕4        Ȧ      䥀ϱ牀ʴ             ĀϦϦ釘ʵ   ITER  LIMITER   ,
	(19, 'Santiago', 'Chura', NULL),
	(20, 'Saul', 'Galan', NULL),
	(21, 'Kevin', 'Chura', 'kevin@hotmail.com'),
	(22, 'Ruth', 'Portugal', 'ruth@hotmail.com'),
	(24, 'Brisa', 'del mar', NULL),
	(25, 'Leo', 'Ramirez', NULL),
	(26, 'b', 'b', 'b@hotmail.com');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
-- Volcando estructura para tabla db_eventos.ponente
CREATE TABLE IF NOT EXISTS `ponente` (
  `idPersona` int(11) NOT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `gradoAcademico` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  CONSTRAINT `fk_Ponente_Persona1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- Volcando datos para la tabla db_eventos.ponente: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `ponente` DISABLE KEYS */;
INSERT INTO `ponente` (`idPersona`, `celular`, `gradoAcademico`) VALUES
	(1, '123123', 'Bachiller'),
	(2, '952838395', 'bachiller'),
	(3, '952838394', 'Magister'),
	(19, '952838399', 'Doctor'),
	(20, '952838396', 'Ingeniero'),
	(21, '952838397', 'Doctor'),
	(24, '952838398', 'Bachiller');
/*!40000 ALTER TABLE `ponente` ENABLE KEYS */;
-- Volcando estructura para tabla db_eventos.programa
CREATE TABLE IF NOT EXISTS `programa` (
  `idEvento` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `tema` varchar(45) DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFinal` datetime DEFAULT NULL,
  `Asistencia` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idEvento`,`idPersona`),
  KEY `fk_Programa_Ponente1_idx` (`idPersona`),
  CONSTRAINT `fk_Programa_Evento1` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Programa_Ponente1` FOREIGN KEY (`idPersona`) REFERENCES `ponente` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- Volcando datos para la tabla db_eventos.programa: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` (`idEvento`, `idPersona`, `tema`, `fechaInicio`, `fechaFinal`, `Asistencia`) VALUES
	(1, 1, 'Redes y Comunicaciones', '2014-04-29 23:41:34', '2014-04-30 23:41:37', NULL),
	(1, 2, 'Programacion Extrema', '2014-04-29 23:43:26', '2014-05-01 23:43:32', NULL),
	(2, 3, 'Metodologias Agiles', '2014-04-29 23:42:26', '2014-05-02 23:42:28', NULL),
	(2, 24, 'Taller de Liderazgo y Emprendimiento', '2014-04-30 02:48:26', '2014-04-30 04:00:00', NULL),
	(3, 19, 'HTML5', '2014-04-30 02:42:51', '2014-05-23 02:43:04', NULL),
	(4, 20, 'ADOO', '2014-04-30 02:45:37', '2014-05-23 02:45:40', NULL),
	(5, 21, 'Liderazgo', '2014-04-30 02:47:12', '2014-04-30 04:00:00', NULL);
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Auditoria`(
		pidAuditoria int(10)
	)
BEGIN
		DELETE FROM Auditoria WHERE idAuditoria =pidAuditoria;
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Comision`(
		pidPersona int(10),
		pidEvento int(10)
	)
BEGIN
		DELETE FROM Comision WHERE idPersona = pidPersona AND idEvento = pidEvento;
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Evento`(
		pidEvento int(10)
	)
BEGIN
		DELETE FROM Evento WHERE idEvento =pidEvento;
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Gasto`(
		pidGasto int(10)
	)
BEGIN
		DELETE FROM Gasto WHERE idGasto =pidGasto;
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Inscripcion`(
		pidPersona int(10),
		pidEvento int(10)
	)
BEGIN
		DELETE FROM Inscripcion WHERE idPersona = pidPersona AND idEvento = pidEvento;
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Persona`(
		pidPersona int(10)
	)
BEGIN
		DELETE FROM Persona WHERE idPersona =pidPersona;
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Ponente`(
		pidPersona int(10)
	)
BEGIN
		DELETE FROM Ponente WHERE idPersona = pidPersona;
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Programa`(
		pidEvento int(10),
		pidPersona int(10)
	)
BEGIN
		DELETE FROM Programa WHERE idEvento = pidEvento AND idPersona = pidPersona;
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Usuario`(
		pidPersona int(10)
	)
BEGIN
		DELETE FROM usuario WHERE idPersona =pidPersona;
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Auditoria`(
		pidPersona int(10),
		ptabla varchar(45),
		pacccion varchar(45),
		pfecha DATETIME
		
	)
BEGIN 
			INSERT INTO Auditoria(idPersona,tabla,acccion,fecha)
			values(pidPersona,ptabla,paccion,pfecha);
			END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Comision`(
	pidPersona int(10),
	pidEvento int(10),
   ptipo varchar(45)
	)
BEGIN
		INSERT INTO Comision(idPersona,idEvento,tipo)
		VALUES(pidPersona,pidEvento,ptipo);
END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Evento`(
		
		ptipo varchar(45),
		pfechaInicio datetime,
		pfechaFinal datetime
				
		)
BEGIN 
			INSERT INTO Evento(tipo,fechaInicio,fechaFinal)
			values(ptipo,pfechaInicio,pfechaFinal);
			END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Gasto`(
		pidEvento int(10),
		pconcepto varchar(45),
		pmonto decimal(8,2)
				
		)
BEGIN 
			INSERT INTO Gasto(idEvento,concepto,monto)
			values(pidEvento,pconcepto,pmonto);
			END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Inscripcion`(
	pidPersona INT(11),
	pidEvento INT(11),
	ptipoPago VARCHAR(45),
   pmonto DOUBLE(8,2),
   pfecha DATETIME
  
	)
BEGIN
		INSERT INTO Inscripcion(idPersona,idEvento,tipoPago,monto,fecha)
		VALUES(pidPersona,pidEvento,ptipoPago, pmonto,pfecha);
END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Persona`(
	pnombres varchar(45),
	papellidos varchar(45),
	pemail varchar(45)
	)
BEGIN
		INSERT INTO Persona(nombres,apellidos,email)
		VALUES(pnombres,papellidos,pemail);
END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Ponente`(IN `pnombres` VARCHAR(50), IN `papellidos` VARCHAR(50), IN `pemail` VARCHAR(50), IN `pcelular` VARCHAR(45), IN `pgradoAcademico` VARCHAR(45)
  
	)
BEGIN
	CALL sp_I_Persona(pnombres,papellidos,pemail);
	SET @idPersona=LAST_INSERT_ID();
		INSERT INTO Ponente(idPersona,celular ,gradoAcademico)
		VALUES(@idPersona,pcelular,pgradoAcademico);
END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Programa`(
	pidEvento INT(10),
   pidPersona INT(10),
   ptema VARCHAR(45),
   pfechaInicio DATETIME,
   pfechaFinal DATETIME
   
	)
BEGIN
		INSERT INTO Programa(idEvento,idPersona,tema,fechaInicio,fechaFinal)
		VALUES(pidEvento,pidPersona,ptema,pfechaInicio,pfechaFinal);
END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Usuario`(IN `pnombres` VARCHAR(50), IN `papellidos` VARCHAR(50), IN `pemail` VARCHAR(50), IN `pusuario` varchar(45), IN `ppassword` varchar(45), IN `pindicadorInscripcion` varchar(1), IN `pindicadorEvento` varchar(1), IN `pindicadorGasto` varchar(1), IN `pindicadorPrograma` varchar(1), IN `pindicadorUsuario` varchar(1), IN `pindicadorActivo` varchar(1)
		
	, IN `pindicadorComision` VARCHAR(1))
BEGIN 
	CALL sp_I_Persona(pnombres,papellidos,pemail);
	SET @idPersona=LAST_INSERT_ID();
	INSERT INTO Usuario(idPersona,usuario,password,indicadorInscripcion,indicadorEvento,indicadorGasto,indicadorPrograma,indicadorUsuario,indicadorActivo,indicadorComision)
	values(@idPersona,pusuario,ppassword,pindicadorInscripcion,pindicadorEvento,pindicadorGasto,pindicadorPrograma,pindicadorUsuario,pindicadorActivo,pindicadorComision);
END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_PersonasxEvento`(prmIdEvento int)
BEGIN
		SELECT DISTINCT p.nombres, p.apellidos, p.email, e.titulo, e.idEvento
		FROM persona p join inscripcion i on p.idPersona = i.idPersona join evento e ON i.idEvento = e.idEvento
		WHERE e.idEvento = prmIdEvento
		ORDER BY p.apellidos;
END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_Auditoria`(
	)
BEGIN
		SELECT * FROM Auditoria;
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_Comision`(
	pbusqueda VARCHAR(50)
	)
BEGIN
		SELECT * FROM comision as co
		
		WHERE co.tipo like concat(pbusqueda,'%');
				
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_ComisionEvento`(
pidEvento int

)
BEGIN
	select us.idPersona,concat(pe.nombres,' ',pe.apellidos)as nombrecompleto,e.tipo as tipoevento,co.tipo as tipocomision
   from comision as co
	inner join evento as e on e.idEvento = co.idEvento 
	inner join usuario as us on us.idPersona = co.idPersona
	inner join persona as pe on pe.idPersona = us.idPersona
	where e.idEvento=pidEvento;
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_Evento`(IN `pbusqueda` VARCHAR(50)
	)
BEGIN
		SELECT e.idEvento, e.titulo, e.tipo,e.fechaInicio,e.fechaFinal 
		FROM Evento as e;
		
				
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_Gasto`(
	)
BEGIN
		SELECT * FROM Gasto;
	END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_GastoEvento`(
ptitulo int,
ptipo varchar(45)

)
BEGIN
	select e.idEvento,e.titulo,e.tipo as tipoEvento,ga.concepto as material,ga.monto
   from evento as e
	inner join gasto as ga on ga.idEvento = e.idEvento
	where e.titul釖 䄘蒀਒  ʚ an䄘e.쵀িҰ  cp1251_general_cs 鿬ϧ쵀িҰ  cp1256_general_ci 뻜ϧ쵀িҰ  cp1257_general_ci 炄Ϩ쵀িҰ  geostd8_general_ci Ϩ쵀িҰ  cp932_japanese_ci ꑴϧ쵀িҰ  eucjpms_japanese_ci 쵀িҰ  latin1_spanish_ci * 쵀িҰ  latin1_general_cs * 쵀ি    ⃁2   ঽ  콘ি     �৅쵀ি   ⃁2   ঽ켠ি쾐ি    , �৅쵀ি   ⃁2   ঽ콘ি쿈ি    S �৅쵀ি   ⃁2   ঽ쾐ি퀀ি    . �৅쵀ি   ⃁2   ঽ쿈ি퀸ি    / ৅쵀ি   ⃁2   ঽ퀀ি큰ি    G ৅쵀ি   ⃁2   ঽ퀸ি킨ি    ` ৅쵀ি   ⃁2   ঽ큰ি탠ি    Q ৅쵀ি   ⃁2   ঽ킨ি텐ি     ৅쵀িҰ  Sesiones recientes  쵀ি	   ⃁2   ঽ탠ি        ৅쵀ি   ₁2   폰িি튠ি    ` ৅쵀ি   ₁2   폰ি⼨ী⸐ী    n ৅쵀িҰ  80 80 80 ,80 ,80 80 쵀িҰ  latin1_swedish_ci 3 쵀িҰ  GEOMETRYCOLLECTION  쵀ি   ₁2   폰ি톈িি    e ৅쵀ি   ⃁2   쫀া판ি폰ি    , ৅쵀ি    ⃁2   쫀া  틘ি     ৅쵀িҰ  sistemaactividades  쵀িҰ  2014-05-08 22:15:47 쵀িҰ  Sesiones recientes  쵀ি 7 ⇡2 8 ո 쫀া틘ি퐨িୠȮ齀ҡS 䤠ষ쵀ি   ⃁2   쫀া폰ি푠ি    . ৅쵀ি   ⃁2   쫀া퐨ি풘ি    / ৅쵀ি   ⃁2   쫀া푠ি퓐ি    G ৅쵀ি   ⃁2   쫀া풘ি픈ি    ` ৅쵀ি   ⃁2   쫀া퓐ি핀ি    Q ৅쵀ি   ⃁2   쫀া픈ি핸ি     ৅쵀ি	   ⃁2   쫀া핀ি        ৅쵀িҰ  sp_S_PonenteEvento  쵀িҰ  latin1_swedish_ci 2 쵀ি   ⃁2  唀ী⹈ী      x   쵀িҰ  latin1_swedish_ci 3 쵀ি   ₁2   폰ি廘ী⠨ী    h ৅쵀িҰ  latin1_danish_ci \  쵀িҰ  latin1_swedish_ci , 쵀িҰ  ujis_japanese_ci O  쵀ি    ₁2   ➸ী  吠ী       쵀িҰ  latin2_croatian_ci  쵀িҰ  latin2_general_ci   쵀িҰ  ascii_general_ci ȟ  쵀িҰ  SSL habilitado=No   쵀িҰ  sp_S_Inscripcion    쵀ি   ₁2   ➸ী吠ী冸ী      쵀ি(;\s*)?InnoDB\s*free\:.*$ 쵀িҰ  cp866_general_ci ci 쵀িҰ  sp_I_Inscripcion +) 쵀িҰ  usp_S_inscripcion  	쵀িҰ  sp_S_ComisionEvento 쵀িҰ  sp_PersonasxEvento  쵀িҰ  sp_U_Inscripcion to 쵀িҰ  sp_S_UsuarioEvento  쵀িҰ  sp_D_Inscripcion .  쵀িҰ  sp_S_GastoEvento pr.쵀িҰ  sp_S_Inscripcion o  쵀িҰ  latin1_general_ci ne쵀িҰ  sp_S_ProgramaEvento 쵀িҰ  latin1_german2_ci   쵀িҰ  latin1_general_cs o.쵀িҰ  latin1_spanish_ci 	i쵀িҰ  latin2_general_ci  p쵀িҰ  latin2_hungarian_ci 쵀িҰ  latin2_croatian_ci ;쵀িҰ  ascii_general_ci =`r쵀িҰ  ujis_japanese_ci E `쵀িҰ  sjis_japanese_ci da`쵀িҰ  hebrew_general_ci LE쵀িҰ  koi8u_general_ci 	IN쵀িҰ  gb2312_chinese_ci N 쵀িҰ  greek_general_ci 
	쵀িҰ  cp1250_general_ci at쵀িҰ  cp1250_croatian_ci p쵀িҰ  cp1250_polish_ci ued쵀িҰ  latin5_turkish_ci FI쵀িҰ  armscii8_general_ci 쵀িҰ  utf8_icelandic_ci 
쵀িҰ  utf8_romanian_ci EGI쵀িҰ  utf8_slovenian_ci nc쵀িҰ  utf8_estonian_ci lid쵀িҰ  utf8_lithuanian_ci  쵀িҰ  utf8_spanish2_ci tip쵀িҰ  utf8_esperanto_ci as쵀িҰ  utf8_hungarian_ci s 쵀িҰ  ucs2_icelandic_ci en쵀িҰ  ucs2_romanian_ci s u쵀িҰ  ucs2_slovenian_ci er쵀িҰ  ucs2_estonian_ci  as쵀িҰ  ucs2_lithuanian_ci P쵀িҰ  ucs2_spanish2_ci po;쵀িҰ  ucs2_esperanto_ci oo쵀িҰ  ucs2_hungarian_ci sp쵀িҰ  cp866_general_ci tor쵀িҰ  keybcs2_general_ci n쵀িҰ  macce_general_ci 45)쵀িҰ  macroman_general_ci 쵀িҰ  cp852_general_ci GIN쵀িҰ  latin7_estonian_cs 	쵀িҰ  latin7_general_ci  =쵀িҰ  latin7_general_cs a	쵀িҰ  cp1251_bulgarian_ci 쵀িҰ  cp1251_ukrainian_ci 쵀িҰ  cp1251_general_ci st쵀িҰ  cp1251_general_cs `(쵀িҰ  cp1256_general_ci 	p쵀িҰ  cp1257_general_ci ar쵀িҰ  geostd8_general_ci A쵀িҰ  cp932_japanese_ci pt쵀িҰ  eucjpms_japanese_ci 쵀ি\bCOMMENT='((.+)[^'])' ȥi 쵀িҰ  latin2_general_ci NE쵀িҰ  latin2_hungarian_ci 쵀িҰ  latin2_croatian_ci n쵀িҰ  ascii_general_ci har쵀িҰ  ujis_japanese_ci eti쵀িҰ  sjis_japanese_ci me	쵀িҰ  hebrew_general_ci en쵀িҰ  koi8u_general_ci 	fe쵀িҰ  gb2312_chinese_ci 
	쵀িҰ  greek_general_ci 
	쵀িҰ  cp1250_general_ci dE쵀িҰ  cp1250_croatian_ci N쵀িҰ  cp1250_polish_ci CED쵀িҰ  latin5_turkish_ci st쵀িҰ  armscii8_general_ci 쵀িҰ  utf8_icelandic_ci 45쵀িҰ  utf8_romanian_ci 
	쵀িҰ  utf8_slovenian_ci st쵀িҰ  utf8_estonian_ci pto쵀িҰ  utf8_lithuanian_ci 	쵀িҰ  utf8_spanish2_ci ;
쵀িҰ  utf8_esperanto_ci ot쵀িҰ  utf8_hungarian_ci p_쵀িҰ  ucs2_icelandic_ci rs쵀িҰ  ucs2_romanian_ci  in쵀িҰ  ucs2_slovenian_ci r(쵀িҰ  ucs2_estonian_ci 2),쵀িҰ  ucs2_lithuanian_ci 
쵀িҰ  ucs2_spanish2_ci rip쵀িҰ  ucs2_esperanto_ci  p쵀িҰ  ucs2_hungarian_ci o,쵀িҰ  cp866_general_ci cia쵀িҰ  keybcs2_general_ci r쵀িҰ  macce_general_ci ent쵀িҰ  macroman_general_ci 쵀িҰ  cp852_general_ci RE 쵀িҰ  latin7_estonian_cs n쵀িҰ  latin7_general_ci ch쵀িҰ  latin7_general_cs rc쵀িҰ  cp1251_bulgarian_ci 쵀িҰ  cp1251_ukrainian_ci 쵀িҰ  cp1251_general_ci  p쵀িҰ  cp1251_general_cs pe쵀িҰ  cp1256_general_ci 
	쵀িҰ  cp1257_general_ci on쵀িҰ  geostd8_general_ci `쵀িҰ  cp932_japanese_ci E 쵀িҰ  eucjpms_japanese_ci 쵀িҰ  sjis_japanese_ci    쵀ি\bCOMMENT='((.+)[^'])' ` V쵀িҰ  sp_S_ProgramaEvento 쵀িҰ  sp_U_Inscripcion e  쵀িҰ  latin1_general_ci E 쵀িҰ  SSL habilitado=No   쵀িҰ  Consultas lentas=0  쵀িҰ  SSL habilitado=No   쵀িҰ  usp_S_inscripcion   쵀িҰ  Tablas abiertas=24  쵀িҰ  Consultas lentas=0  쵀িҰ  SSL habilitado=No   쵀িҰ  Tablas abiertas=24  쵀িҰ  Consultas lentas=0  쵀িҰ  sp_S_ComisionEvento 쵀িҰ  Tablas abiertas=24  쵀িҰ  sp_U_Inscripcion ON 쵀িҰ  latin1_german2_ci E 쵀িҰ  latin1_swedish_ci   쵀িҰ  sp_S_ProgramaEvento 쵀িҰ  usp_S_inscripcion S 쵀িҰ  Consultas lentas=0  쵀িҰ  usp_S_inscripcion P 쵀িҰ  latin1_general_ci E 쵀িҰ  latin2_hungarian_ci 쵀িҰ  latin1_german2_ci E 쵀িҰ  latin1_swedish_ci   쵀ি   ₁2   폰িি톈ি    o ৅쵀ি   ₁2   폰ি튠ি⺀ী    e ৅쵀িҰ  sp_I_Inscripcion +) 쵀িҰ  Tablas abiertas=3   쵀িҰ  latin1_german1_ci d 쵀িҰ  sp_S_Inscripcion  ER쵀ি   ₁2   폰ি㐰ীি    d 鸞৅쵀িҰ  sp_S_ComisionEvento 쵀িҰ  latin1_german1_ci   쵀িҰ  sp_D_Inscripcion . `쵀িҰ  Tablas abiertas=16  쵀িҰ  sp_S_GastoEvento =; 쵀িҰ  latin1_spanish_ci   쵀িҰ  sp_S_Inscripcion `  쵀িҰ  sp_S_UsuarioEvento  쵀িҰ  latin1_german1_ci   쵀িҰ  latin1_general_cs E 쵀িҰ  sp_PersonasxEvento  쵀িҰ  Consultas lentas=0  쵀িҰ  sp_S_GastoEvento t  쵀িҰ  latin1_danish_ci ME 쵀িҰ  latin1_general_cs E 쵀িҰ  latin1_danish_ci ME 쵀িҰ  latin1_spanish_ci 		쵀িҰ  latin2_general_ci rG쵀িҰ  latin2_hungarian_ci 쵀িҰ  latin2_croatian_ci 	쵀িҰ  ascii_general_ci ado쵀িҰ  ujis_japanese_ci tiv쵀িҰ  sjis_japanese_ci 	in쵀িҰ  hebrew_general_ci or쵀িҰ  koi8u_general_ci na 쵀িҰ  gb2312_chinese_ci E 쵀িҰ  greek_general_ci ` P쵀িҰ  cp1250_general_ci n`쵀িҰ  cp1250_croatian_ci G쵀িҰ  cp1250_polish_ci ipc쵀িҰ  latin5_turkish_ci s.쵀িҰ  armscii8_general_ci 쵀িҰ  utf8_icelandic_ci ra쵀িҰ  utf8_romanian_ci 
C쵀িҰ  utf8_slovenian_ci `u쵀িҰ  utf8_estonian_ci int쵀িҰ  utf8_lithuanian_ci  쵀িҰ  utf8_spanish2_ci 
 쵀িҰ  utf8_esperanto_ci FA쵀িҰ  utf8_hungarian_ci cr쵀িҰ  ucs2_icelandic_ci  N쵀িҰ  ucs2_romanian_ci  va쵀িҰ  ucs2_slovenian_ci `i쵀িҰ  ucs2_estonian_ci  DE쵀িҰ  ucs2_lithuanian_ci o쵀িҰ  ucs2_spanish2_ci  NU쵀িҰ  ucs2_esperanto_ci  v쵀িҰ  ucs2_hungarian_ci  `쵀িҰ  cp866_general_ci (1)쵀িҰ  keybcs2_general_ci r쵀িҰ  macce_general_ci T N쵀িҰ  macroman_general_ci 쵀িҰ  cp852_general_ci usu쵀িҰ  latin7_estonian_cs `쵀িҰ  latin7_general_ci rs쵀িҰ  latin7_general_cs TE쵀িҰ  cp1251_bulgarian_ci 쵀িҰ  cp1251_ukrainian_ci 쵀িҰ  cp1251_general_ci do쵀িҰ  cp1251_general_cs en쵀িҰ  cp1256_general_ci xi쵀িҰ  cp1257_general_ci  T쵀িҰ  geostd8_general_ci  쵀িҰ  cp932_japanese_ci  (쵀িҰ  eucjpms_japanese_ci 쵀িҰ  sp_I_Inscripcion +) 쵀ি\bCOMMENT='((.+)[^'])' ndi쵀িҰ  SSL habilitado=No   쵀িҰ  sp_S_UsuarioEvento  쵀িҰ  sp_S_ComisionEvento 쵀িҰ  FROM Persona as p   쵀িҰ  Tablas abiertas=16  쵀িҰ  hebrew_general_ci   쵀িҰ  koi8u_general_ci    쵀িҰ  gb2312_chinese_ci   쵀িҰ  greek_general_ci    쵀িҰ  cp1250_general_ci   쵀িҰ  cp1250_croatian_ci  쵀িҰ  cp1250_polish_ci  'N쵀িҰ  latin5_turkish_ci ',쵀িҰ  armscii8_general_ci 쵀িҰ  utf8_icelandic_ci an쵀িҰ  utf8_romanian_ci 'N'쵀িҰ  utf8_slovenian_ci 25쵀িҰ  utf8_estonian_ci  'N쵀িҰ  utf8_lithuanian_ci !쵀িҰ  utf8_spanish2_ci o` 쵀িҰ  utf8_esperanto_ci SE쵀িҰ  utf8_hungarian_ci _M쵀িҰ  ucs2_icelandic_ci  F쵀িҰ  ucs2_romanian_ci _FO쵀িҰ  ucs2_slovenian_ci 1,쵀িҰ  ucs2_estonian_ci  */쵀িҰ  ucs2_lithuanian_ci E쵀িҰ  ucs2_spanish2_ci ET_쵀িҰ  ucs2_esperanto_ci ws쵀িҰ  ucs2_hungarian_ci   쵀িҰ  cp866_general_ci n p쵀িҰ  keybcs2_general_ci *쵀িҰ  macce_general_ci 
S쵀িҰ  macroman_general_ci 쵀িҰ  cp852_general_ci /
쵀িҰ  latin7_estonian_cs A쵀িҰ  latin7_general_ci ma쵀িҰ  latin7_general_cs _N쵀িҰ  cp1251_bulgarian_ci 쵀িҰ  cp1251_ukrainian_ci 쵀িҰ  cp1251_general_ci RE쵀িҰ  cp1251_general_cs PR쵀িҰ  cp1256_general_ci 'd쵀িҰ  cp1257_general_ci  F쵀িҰ  geostd8_general_ci N쵀িҰ  cp932_japanese_ci  `쵀িҰ  eucjpms_japanese_ci 쵀িҰ  SSL habilitado=No   쵀ি\bCOMMENT='((.+)[^'])' GIN쵀িҰ  Consultas lentas=0  쵀িҰ  SSL habilitado=No   쵀িҰ  Tablas abiertas=16  쵀িҰ  Consultas lentas=0  쵀িҰ  koi8r_general_ci    쵀িҰ  sp_PersonasxEvento  쵀িҰ  sp_D_Inscripcion .  쵀িҰ  sp_S_GastoEvento    쵀িҰ  SSL habilitado=No   쵀িҰ  Consultas lentas=0  쵀িҰ  sp_S_Inscripcion    쵀িҰ  Tablas abiertas=4   쵀িҰ  sp_S_ProgramaEvento 쵀িҰ  sp_S_UsuarioEvento i쵀িҰ  sp_U_Inscripcion T *쵀িҰ  usp_S_inscripcion 		쵀ি   ₁2   ȭ麀Ϫᤐী    D 찠৅쵀িҰ  sp_I_Inscripcion +) 쵀িҰ  sp_PersonasxEvento  쵀িҰ  sp_S_ComisionEvento 쵀িҰ  sp_S_GastoEvento IST쵀িҰ  sp_S_Inscripcion na`쵀িҰ  sp_S_ProgramaEvento 쵀িҰ  sp_S_UsuarioEvento L쵀িҰ  sp_U_Inscripcion 5) 쵀িҰ  usp_S_inscripcion rI쵀ি榔_ ᴬ@満ϱ      ﭤ»  梈_梤_梸_  쵀িҰ  cp932_japanese_ci   쵀িҰ  sp_PersonasxEvento  쵀িSELECT * FROM Inscripcion 쵀ি   ₁2   ȭᘀীᦸী    5 ಠ৆쵀িҰ  SSL habilitado=No   쵀িҰ  Consultas lentas=0  쵀ি   ₁2   ȭᤐীᨨী    - ௠৆쵀িҰ  Tablas abiertas=16  쵀ি   ₁2   ȭᦸী᩠ী    O ଠ৆쵀ি   ₁2   ȭᨨী᪘ী    = ੠৆쵀ি   ₁2   ȭ᩠ী᫐ী    ? ঠ৆쵀ি   ₁2   ȭ᪘ীᬈী    J ࣠৆쵀ি   ₁2   ȭ᫐ীᭀী    l ﶠ৅쵀ি	   ₁2   ȭᬈী᭸ী    l ﳠ৅쵀ি
   ₁2   ȭᭀী᮰ী    [ ﰠ৅쵀ি   ₁2   ȭ᭸ীᯨী    T ﭠ৅쵀ি   ₁2   ȭ᮰ীᰠী     猪৅쵀ি   ₁2   ȭᯨী᱘ী    b 易৅쵀ি   ₁2   ȭᰠীᲐী    d 鸞৅쵀ি   ₁2   ȭ᱘ী᳈ী    o ৅쵀ি   ₁2   ȭᲐীᴀী    ` ৅쵀ি   ₁2   ȭ᳈ীᴸী    e ৅쵀ি   ₁2   ȭᴀীᵰী    e ৅쵀ি   ₁2   ȭᴸীᶨী    T ৅쵀ি   ₁2   ȭᵰীᷠী    M ৅쵀ি   ₁2   ȭᶨীḘী    n ৅쵀ি   ₁2   ȭᷠীṐী    [ ৅쵀ি   ₁2   ȭḘীẈী    ] ৅쵀ি   ₁2   ȭṐীỀী    h ৅쵀ি   2   ȭẈীỸী      ৅쵀ি   2   ȭỀীἰী      ৅쵀ি   2   ȭỸীὨী      ৅쵀ি   2   ȭἰীᾠী      ৅쵀ি   2   ȭὨীῘী      ᷠ৆쵀ি   2   ȭᾠী‐ী      Ѡ৆쵀ি   2   ȭῘী⁈ী      Π৆쵀ি    2   ȭ‐ী₀ী      ˠ৆쵀ি!   2   ȭ⁈ী₸ী      Ƞ৆쵀ি"   2   ȭ₀ী⃰ী      Š৆쵀ি#   2   ȭ₸ীℨী       ৆쵀ি$   2   ȭ⃰ীⅠী      ￠৅쵀ি%   2   ȭℨী↘ী      㙠ষ쵀ি&   2   ȭⅠী⇐ী      ⸠ষ쵀ি'   2   ȭ↘ী∈ী      ⎠ষ쵀ি(   2   ȭ⇐ী≀ী      ①ষ쵀ি)   2   ȭ∈ী≸ী      ഠষ쵀ি*   2   ȭ≀ী⊰ী      ࢠষ쵀ি+   2   ȭ≸ী⋨ী      ܠষ쵀ি,   2   ȭ⊰ী⌠ী      ﻠশ쵀ি-   2   ȭ⋨ী⍘ী      褐শ쵀ি.   2   ȭ⌠ী⎐ী      ︠শ쵀ি/   2   ȭ⍘ী⏈ী      ͠ষ쵀ি0   2   ȭ⎐ী␀ী      ֠ষ쵀ি1   2   ȭ⏈ী␸ী      ૠষ쵀ি2   2   ȭ␀ী⑰ী      ᆠষ쵀ি3   2   ȭ␸ী⒨ী      ⦠ষ쵀ি4   2   ȭ⑰ীⓠী      Ⲡষ쵀ি5   2   ȭ⒨ী⚠ী      䏠ষ쵀িҰ  &Vaciar tabla(s)... 쵀িҰ  &Rutina almacenada  쵀ি榔_ ᴬ@ࠐϱ      ﭤ»  梈_梤_梸_  쵀ি   ₁2   폰ি闸Ϫ☰ী    T ﭠ৅쵀িҰ  SSL habilitado=No   쵀ি   ₁2   폰ি◀ী㐰ী     猪৅쵀িҰ  sp_S_PonenteEvento  쵀ি6   2   ȭⓠী        ﹠৅쵀িҰ  Consultas lentas=0  쵀িҰ  Tablas abiertas=16  쵀িҰ  cp852_general_ci ci 쵀ি   ⃁2   唀ী存ী宐ী    _   쵀ি   á2  ~ 満ϱ➸ী➸ী흰ি咐ী  ) 쵀ি榔_ ᴬ@ϰ      ﭤ»  梈_梤_梸_  쵀ি   ₁2   폰ি횐ি꣠ҡ    Y ৅쵀ি   á2  Ħ ϰ⡠ী⡠ী⢘ী刨ী  ) 쵀ি    ₁2   ⡠ী  ⣐ী       쵀ি   ₁2   ⡠ী⢘ী⤈ী      쵀ি   ₁2   ⡠ী⣐ী⥀ী      쵀ি   ₁2   ⡠ী⤈ী⥸ী      쵀ি   ₁2   ⡠ী⥀ী⦰ী      쵀ি   ₁2   ⡠ী⥸ী儐ী      쵀িҰ  sp_S_ComisionEvento 쵀ি孠L  ⑐I              嫐L    쵀িҰ  sp_U_Inscripcion    쵀িҰ  sp_D_Inscripcion .  쵀িҰ  sp_I_Inscripcion +) 쵀িҰ  sp_S_GastoEvento  
	쵀িҰ  sp_S_Inscripcion son쵀িҰ  sp_S_PersonaEvento o쵀িҰ  sp_S_ProgramaEvento 쵀িҰ  sp_S_UsuarioEvento s쵀িҰ  sp_U_Inscripcion TE 쵀িҰ  usp_S_inscripcion  P쵀িҰ  sp_PersonasxEvento  쵀িҰ  latin1_german1_ci ) 쵀িҰ  sp_S_PersonaEvento `쵀িҰ  sp_S_GastoEvento r` 쵀িҰ  usp_S_inscripcion   쵀ি(;\s*)?InnoDB\s*free\:.*$ 쵀ি(;\s*)?InnoDB\s*free\:.*$ 쵀ি   ₁2   폰ি퇀ি廘ী    [ ৅쵀ি   ⃁2   唀ী媰ী혠ি       쵀ি   ₁2   폰িি⼨ী    T ৅쵀ি(;\s*)?InnoDB\s*free\:.*$ 쵀িҰ  sp_PersonasxEvento  쵀ি   ₁2   폰ি⺀ী퇀ি    M ৅쵀িҰ  sp_S_UsuarioEvento t쵀িҰ  usp_S_inscripcion  =쵀িҰ  cp1256_general_ci   쵀িҰ  sp_S_Inscripcion e d쵀িҰ  sp_I_Inscripcion +) 쵀িҰ  latin1_general_ci E 쵀ি(;\s*)?InnoDB\s*free\:.*$ 쵀িҰ  latin1_german2_ci E 쵀িҰ  cp850_general_ci n  쵀িҰ  sp_D_Inscripcion . l쵀িҰ  sp_I_Inscripcion +) 쵀িҰ  sp_S_ProgramaEvento 쵀িҰ  sp_D_Inscripcion .  쵀িҰ  sp_D_Inscripcion .  쵀িҰ  sp_S_ComisionEvento 쵀িҰ  sp_PersonasxEvento  쵀িҰ  sp_S_PersonaEvento  쵀িҰ  latin1_swedish_ci   쵀িҰ  sp_S_Inscripcion o  쵀িҰ  sp_S_ProgramaEvento 쵀িҰ  sp_U_Inscripcion T  쵀িҰ  sp_S_UsuarioEvento  쵀ি   ₁2   폰ি☰ীি    b 易৅쵀িҰ  sp_I_Inscripcion +) 쵀িҰ  sp_S_GastoEvento ri 쵀িҰ  sp_S_Inscripcion    쵀িҰ  sp_S_UsuarioEvento  쵀িҰ  sp_U_Inscripcion :  쵀িҰ  usp_S_inscripcion  
쵀িҰ  sp_S_ProgramaEvento 쵀িҰ  latin1_general_cs E 쵀িҰ  latin1_danish_ci ME 쵀িҰ  latin1_spanish_ci  D쵀িҰ  latin2_general_ci PR쵀িҰ  latin2_hungarian_ci 쵀িҰ  latin2_croatian_ci  쵀িҰ  ascii_general_ci cha쵀িҰ  ujis_japanese_ci 8,2쵀িҰ  sjis_japanese_ci TE 쵀িҰ  hebrew_general_ci nc쵀িҰ  koi8u_general_ci 			쵀িҰ  gb2312_chinese_ci st쵀িҰ  greek_general_ci R=`쵀িҰ  cp1250_general_ci E 쵀িҰ  cp1250_croatian_ci d쵀িҰ  cp1250_polish_ci ent쵀িҰ  latin5_turkish_ci rc쵀িҰ  armscii8_general_ci 쵀িҰ  utf8_icelandic_ci r(쵀িҰ  utf8_romanian_ci Ins쵀িҰ  utf8_slovenian_ci go쵀িҰ  utf8_estonian_ci pmo쵀িҰ  utf8_lithuanian_ci e쵀িҰ  utf8_spanish2_ci  pi쵀িҰ  utf8_esperanto_ci dE쵀িҰ  utf8_hungarian_ci IN쵀িҰ  ucs2_icelandic_ci ED쵀িҰ  ucs2_romanian_ci dPe쵀িҰ  ucs2_slovenian_ci  v쵀িҰ  ucs2_estonian_ci os 쵀িҰ  ucs2_lithuanian_ci h쵀িҰ  ucs2_spanish2_ci PDA쵀িҰ  ucs2_esperanto_ci re쵀িҰ  ucs2_hungarian_ci = 쵀িҰ  cp866_general_ci mai쵀িҰ  keybcs2_general_ci e쵀িҰ  macce_general_ci FIN쵀িҰ  macroman_general_ci 쵀িҰ  cp852_general_ci dPe쵀িҰ  latin7_estonian_cs s쵀িҰ  latin7_general_ci do쵀িҰ  latin7_general_cs ` 쵀িҰ  cp1251_bulgarian_ci 쵀িҰ  cp1251_ukrainian_ci 쵀িҰ  cp1251_general_ci 
B쵀িҰ  cp1251_general_cs (p쵀িҰ  cp1256_general_ci do쵀িҰ  cp1257_general_ci te쵀িҰ  geostd8_general_ci 쵀িҰ  cp932_japanese_ci Ac쵀িҰ  eucjpms_japanese_ci 쵀িҰ  sp_S_GastoEvento    쵀ি\bCOMMENT='((.+)[^'])' t` 쵀িҰ  sp_I_Inscripcion +) 쵀িҰ  sp_D_Inscripcion .  쵀িҰ  sp_S_ComisionEvento 쵀িҰ  SSL habilitado=No   쵀িҰ  Consultas lentas=0  쵀িҰ  koi8r_general_ci s* 쵀িҰ  latin1_swedish_ci   쵀িҰ  latin1_danish_ci    쵀িҰ  latin1_german2_ci   쵀িҰ  latin1_general_ci   쵀িҰ  latin1_general_cs   쵀িҰ  latin1_spanish_ci   쵀িҰ  latin2_general_ci   쵀িҰ  latin2_hungarian_ci 쵀িҰ  latin2_croatian_ci  쵀িҰ  ascii_general_ci    쵀িҰ  ujis_japanese_ci    쵀িҰ  sjis_japanese_ci    쵀িҰ  hebrew_general_ci   쵀িҰ  koi8u_general_ci    쵀িҰ  gb2312_chinese_ci   쵀িҰ  greek_general_ci    쵀িҰ  cp1250_general_ci   쵀িҰ  cp1250_croatian_ci  쵀িҰ  cp1250_polish_ci    쵀িҰ  latin5_turkish_ci   쵀িҰ  armscii8_general_ci 쵀িҰ  utf8_icelandic_ci   쵀িҰ  utf8_romanian_ci    쵀িҰ  utf8_slovenian_ci   쵀িҰ  utf8_estonian_ci    쵀িҰ  utf8_lithuanian_ci  쵀িҰ  utf8_spanish2_ci    쵀িҰ  utf8_esperanto_ci   쵀িҰ  utf8_hungarian_ci   쵀িҰ  ucs2_icelandic_ci   쵀িҰ  ucs2_romanian_ci    쵀িҰ  ucs2_slovenian_ci   쵀িҰ  ucs2_estonian_ci    쵀িҰ  ucs2_lithuanian_ci  쵀িҰ  ucs2_spanish2_ci    쵀িҰ  ucs2_esperanto_ci   쵀িҰ  ucs2_hungarian_ci   쵀িҰ  cp866_general_ci    쵀িҰ  keybcs2_general_ci  쵀িҰ  macce_general_ci    쵀িҰ  macroman_general_ci 쵀িҰ  cp852_general_ci    쵀িҰ  latin7_estonian_cs  쵀িҰ  latin7_general_ci   쵀িҰ  latin7_general_cs   쵀িҰ  cp1251_bulgarian_ci 쵀িҰ  cp1251_ukrainian_ci 쵀িҰ  cp1251_general_ci   쵀িҰ  cp1251_general_cs   쵀িҰ  cp1256_general_ci   쵀িҰ  cp1257_general_ci   쵀িҰ  geostd8_general_ci  쵀িҰ  cp932_japanese_ci   쵀িҰ  eucjpms_japanese_ci 쵀িҰ  koi8r_general_ci n  쵀ি\bCOMMENT='((.+)[^'])'    쵀িҰ  latin1_swedish_ci   쵀িҰ  latin1_german1_ci   쵀িҰ  Tablas abiertas=16  쵀িҰ  latin1_danish_ci t  쵀িҰ  latin1_german2_ci  쵀িҰ  latin1_general_ci  쵀িҰ  latin1_general_cs  쵀ি   ₁2   ⡠ী尸ী區ী      쵀িҰ  sp_PersonasxEvento  쵀ি   ₁2   ⡠ী⦰ী尸ী      쵀ি   ₁2   ⡠ী冀ী刨ী      쵀ি
   ₁2   ⡠ী區ী先ী     
 쵀ি   ₁2   ➸ী�ি咐ী      쵀িSELECT * FROM Inscripcion 쵀ি   ₁2   ⡠ী先ী        쵀িҰ  cp850_general_ci \  쵀ি孠L  ⑐I              嫐L    쵀িҰ  SSL habilitado=No   쵀িҰ  SSL habilitado=No   쵀ি	   ₁2   ⡠ী傠ী冀ী     	 쵀িҰ  Consultas lentas=0  쵀িҰ  Tablas abiertas=16  쵀িҰ  Consultas lentas=0  쵀ি   ₁2   ➸ী흰ি�ি      쵀িҰ  Tablas abiertas=16  쵀ি   ₁2   ➸ী冸ী        쵀িҰ  sp_D_Inscripcion .  쵀ি   á2   ࠐϱ唀ী唀ী存ী혠ি    쵀িӤ ! 湉整汲捯敫䍤浯慰敲硅档湡敧潐湩整r屰  쵀িҰ  cp1251_ukrainian_ci 쵀িҰ  sp_S_GastoEvento    쵀িҰ  sp_PersonasxEvento  쵀িҰ  cp1251_general_cs o 쵀িҰ  sp_D_Inscripcion .  쵀িҰ  sp_S_ComisionEvento 쵀িҰ  sp_S_Inscripcion  te쵀িҰ  sp_S_ProgramaEvento 쵀িҰ  sp_S_UsuarioEvento i쵀িҰ  sp_U_Inscripcion , '쵀িҰ  usp_S_inscripcion  '쵀িҰ  sp_D_Inscripcion .  쵀িҰ  sp_I_Inscripcion +) 쵀িҰ  sp_PersonasxEvento '쵀িҰ  sp_S_ComisionEvento 쵀িҰ  sp_S_GastoEvento uar쵀িҰ  sp_S_Inscripcion 010쵀িҰ  sp_S_ProgramaEvento 쵀িҰ  sp_S_UsuarioEvento S쵀িҰ  sp_U_Inscripcion @OL쵀িҰ  usp_S_inscripcion LL쵀িҰ  sp_PersonasxEvento  쵀িҰ  sp_I_Inscripcion +) 쵀িҰ  sp_D_Inscripcion .  쵀ি   ⃁2   唀ী宐ী⹈ী    N   쵀িҰ  cp850_general_ci    쵀িҰ  cp1257_general_ci   쵀ি    ⃁2   唀ী  ➀ী        쵀ি   ⃁2   唀ী➀ী媰ী    |   쵀িҰ  sp_D_Inscripcion .  쵀িҰ  sp_I_Inscripcion +) 쵀ি   ₁2   ⡠ী儐ী傠ী      쵀িҰ  Consultas lentas=0  쵀িҰ  cp1251_general_ci   쵀িҰ  SSL habilitado=No   쵀িҰ  sp_S_ComisionEvento 쵀িҰ  Tablas abiertas=16  쵀িҰ  sp_S_GastoEvento t  쵀িҰ  sp_S_Inscripcion   쵀িҰ  sp_S_ProgramaEvento 쵀িҰ  sp_S_UsuarioEvento  쵀িҰ  sp_U_Inscripcion   쵀িҰ  usp_S_inscripcion  쵀ি   ₁2   폰ি⸐ী횐ি    ] ৅猶 䃸ڰϭ  ɥ  D䃸im弐ীҰ  sp_U_Programa 
弐ী2014-05-08 23:05:55 0.弐ী2014-05-08 23:05:55 us弐ীҰ  sp_U_Usuario ntr弐ী2014-05-08 23:05:55 rr弐ী2014-05-08 23:05:55  d弐ী2014-05-08 23:05:55 de弐ী2014-05-08 23:05:55 lo弐ীҰ  sp_D_Usuario  rd弐ীҰ  SP_S_Auditoria  弐ীҰ  sp_I_Comision i 弐ী^\s*DELIMITER\s+(\S+) 弐ীҰ  sp_S_GastoTotal 弐ীҰ  utf8_latvian_ci 弐ীҰ  cp1250_czech_cs 弐ীҰ  utf8_spanish_ci 弐ীҰ  sp_I_Programa i 弐ীҰ  sp_D_Persona `  弐ীҰ  utf8_danish_ci  弐ীҰ  sp_D_Ponente    弐ীҰ  sp_D_Auditoria  弐ীҰ  sp_S_Comision   弐ীҰ  sp_I_Persona  i 弐ীҰ  sp_I_Auditoria  弐ীҰ  sp_I_Auditoria  弐ীҰ  sp_D_Comision   弐ীҰ  sp_I_Ponente ci 弐ীҰ  utf8_latvian_ci 弐ীҰ  sp_D_Programa i 弐ীҰ  sp_D_Programa   弐ীҰ  sp_S_GastoTotal 弐ীҰ  utf8_slovak_ci  弐ীҰ  utf8_danish_ci  弐ীҰ  sp_I_Ponente a i弐ীҰ  tis620_thai_ci  弐ীҰ  sp_U_Comision d 弐ীҰ  armscii8_bin ci 弐ীҰ  sp_I_Usuario  i 弐ীҰ  sp_D_Auditoria  弐ীҰ  sp_D_Comision   弐ীҰ  gbk_chinese_ci  弐ীҰ  sp_D_Ponente ` c弐ী2014-05-08 23:05:54   弐ীҰ  VARCHAR(50)
	 L弐ীҰ  sp_D_Auditoria  弐ীҰ  70 70 ,70 70  i 弐ীҰ  utf8_turkish_ci 弐ীҰ  sp_I_Usuario    弐ীҰ  utf8_swedish_ci 弐ী2014-05-08 23:05:54 h 弐ীҰ  utf8_roman_ci   弐ীҰ  indicadorEvento 弐ীҰ  indicadorActivo 弐ী2014-05-08 23:05:54   弐ীҰ  indicadorGasto  弐ীҰ  COLLATION_NAME L弐ী^\s*DELIMITER\s+(\S+) 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54 T 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  sp_D_Persona    弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  sp_U_Ponente    弐ীҰ  armscii8_bin  n 弐ীҰ  utf8_general_ci 弐ীҰ  sp_S_Persona    弐ীҰ  sp_U_Programa   弐ীҰ  sp_S_GastoTotal 弐ীҰ  utf8_general_ci 弐ীҰ  utf8_roman_ci   弐ীҰ  sp_U_Persona    弐ীҰ  utf8_turkish_ci 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী⺬L  ]᫐ȟ꤀Ȩ  ＀x       弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  utf8_czech_ci o 弐ীҰ  utf8_turkish_ci 弐ীҰ  sp_U_Usuario    弐ীҰ  utf8_spanish_ci 弐ীҰ  sp_D_Comision   弐ীҰ  utf8_polish_ci  弐ী2014-05-08 23:05:54   弐ীҰ  utf8_polish_ci  弐ীҰ  utf8_swedish_ci 弐ীҰ  utf8_turkish_ci 弐ীҰ  utf8_slovak_ci  弐ীҰ  utf8_danish_ci  弐ীҰ  utf8_roman_ci   弐ীҰ  utf8_polish_ci  弐ীҰ  armscii8_bin    弐ীҰ  gbk_chinese_ci  弐ীҰ  sp_U_Auditoria  弐ী2014-05-08 23:05:54   弐ীҰ  sp_D_Usuario    弐ীҰ  utf8_czech_ci   弐ীҰ  utf8_latvian_ci 弐ীҰ  utf8_slovak_ci  弐ীҰ  gbk_chinese_ci  弐ী2014-05-08 23:05:54   弐ীҰ  hp8_english_ci  弐ীҰ  Conectado=Sí    弐ীҰ  utf8_turkish_ci 弐ীҰ  utf8_spanish_ci 弐ীҰ  utf8_swedish_ci 弐ী2014-05-08 23:05:54   弐ীҰ  utf8_spanish_ci 弐ী2014-05-08 23:05:54   弐ীҰ  utf8_swedish_ci 弐ীҰ  utf8_turkish_ci 弐ীҰ  utf8_czech_ci   弐ীҰ  utf8_danish_ci  弐ীҰ  utf8_slovak_ci  弐ীҰ  utf8_roman_ci   弐ী2014-05-08 23:05:54   弐ীҰ  utf8_polish_ci  弐ীҰ  dec8_swedish_ci 弐ী2014-05-08 23:05:54   弐ীҰ  armscii8_bin    弐ীҰ  gbk_chinese_ci  弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  sp_U_Auditoria  弐ীҰ  sp_U_Comision   弐ীҰ  tis620_thai_ci  弐ীҰ  euckr_korean_ci 弐ীҰ  swe7_swedish_ci 弐ী2014-05-08 23:05:54   弐ীҰ  latin2_czech_cs 弐ী2014-05-08 23:05:54   弐ীҰ  utf8_spanish_ci 弐ীҰ  dec8_swedish_ci 弐ী2014-05-08 23:05:54   弐ী2014-05-09 00:38:18   弐ীҰ  swe7_swedish_ci 弐ীҰ  sp_S_Persona    弐ীҰ  sp_S_Ponente    弐ীҰ  sp_S_Programa   弐ীҰ  SP_S_Usuario    弐ীҰ  sp_U_Persona s  弐ীҰ  sp_U_Ponente    弐ীҰ  sp_U_Programa   弐ীҰ  utf8_unicode_ci 弐ীҰ  sp_I_Comision   弐ীҰ  sp_I_Persona    弐ীҰ  sp_D_Comision   弐ীҰ  sp_U_Usuario s o弐ীҰ  sp_D_Ponente e  弐ীҰ  sp_D_Persona    弐ীҰ  sp_D_Programa   弐ীҰ  sp_D_Usuario    弐ীҰ  sp_I_Auditoria  弐ীҰ  sp_I_Programa   弐ীҰ  sp_U_Auditoria  弐ীҰ  sp_I_Ponente s, 弐ীҰ  SP_S_Auditoria  弐ীҰ  sp_I_Usuario ys 弐ীҰ  sp_S_Comision   弐ীҰ  SP_S_Usuario    弐ী2014-05-08 23:05:54   弐ীҰ  sp_D_Ponente    弐ীҰ  sp_U_Comision   弐ীҰ  sp_U_Persona    弐ীҰ  sp_D_Ponente e  弐ীҰ  sp_D_Comision   弐ীҰ  sp_U_Ponente    弐ীҰ  sp_U_Usuario    弐ীҰ  utf8_latvian_ci 弐ীҰ  sp_U_Programa   弐ীҰ  utf8_general_ci 弐ীҰ  sp_D_Persona s  弐ীҰ  utf8_roman_ci   弐ীҰ  sp_D_Programa   弐ীҰ  sp_I_Ponente    弐ীҰ  sp_I_Programa   弐ীҰ  sp_D_Usuario    弐ীҰ  sp_I_Comision   弐ীҰ  utf8_persian_ci 弐ীҰ  sp_I_Auditoria  弐ীҰ  sp_I_Persona  EM弐ী2014-05-08 23:05:54   弐ীҰ  sp_S_Ponente    弐ীҰ  sp_S_Programa   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  sp_U_Comision   弐ীҰ  SP_S_Usuario NTO弐ীҰ  sp_U_Persona    弐ীҰ  sp_U_Programa   弐ীҰ  sp_U_Ponente mn 弐ীҰ  sp_U_Usuario    弐ী2014-05-08 23:05:54   弐ী⺬L      ꖐȨ  ＀x       弐ীҰ  euckr_korean_ci 弐ীҰ  sp_S_Persona STI弐ী2014-05-08 23:05:54 1 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী^\s*DELIMITER\s+(\S+) 弐ী2014-05-08 23:05:54 s 弐ীҰ  utf8_slovak_ci  弐ীҰ  latin2_czech_cs 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  utf8_roman_ci   弐ী2014-05-08 23:05:54   弐ীҰ  utf8_spanish_ci 弐ীҰ  utf8_polish_ci  弐ী2014-05-09 00:38:18   弐ীҰ  sp_D_Auditoria  弐ীҰ  utf8_unicode_ci 弐ীҰ  sp_S_Persona    弐ীҰ  sp_S_GastoTotal 弐ীҰ  sp_S_Programa   弐ীҰ  sp_S_Ponente    弐ীҰ  sp_I_Auditoria  弐ী2014-05-08 23:05:54   弐ীҰ  utf8_czech_ci   弐ীҰ  sp_S_Ponente ci 弐ীҰ  SP_S_Auditoria  弐ীҰ  hp8_english_ci  弐ী2014-05-08 23:05:54   弐ীҰ  cp1250_czech_cs 弐ীҰ  utf8_unicode_ci 弐ী2014-05-08 23:05:54 d 弐ীҰ  euckr_korean_ci 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  sp_D_Persona    弐ীҰ  utf8_unicode_ci 弐ীҰ  utf8_general_ci 弐ীҰ  sp_U_Auditoria  弐ীҰ  tis620_thai_ci  弐ীҰ  sp_I_Persona  i 弐ীҰ  sp_D_Auditoria  弐ীҰ  sp_I_Programa   弐ীҰ  euckr_korean_ci 弐ী2014-05-08 23:05:54   弐ীҰ  latin2_czech_cs 弐ী^\s*DELIMITER\s+(\S+) 弐ীҰ  utf8_latvian_ci 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  big5_chinese_ci 弐ীҰ  big5_chinese_ci 弐ীҰ  sp_S_Comision   弐ীҰ  sp_I_Comision i 弐ী2014-05-08 23:05:54   弐ীҰ  swe7_swedish_ci 弐ীҰ  sp_D_Programa   弐ীҰ  cp1250_czech_cs 弐ী2014-05-08 23:05:54 1 弐ীҰ  sp_D_Usuario    弐ীҰ  sp_S_Persona ci 弐ীҰ  utf8_slovak_ci c弐ীҰ  utf8_roman_ci in弐ীҰ  utf8_persian_ci 弐ীҰ  ucs2_general_ci 弐ীҰ  ucs2_unicode_ci 弐ীҰ  ucs2_latvian_ci 弐ীҰ  ucs2_polish_ci  弐ীҰ  ucs2_spanish_ci 弐ীҰ  ucs2_swedish_ci 弐ীҰ  ucs2_turkish_ci 弐ীҰ  ucs2_czech_ci rt弐ীҰ  ucs2_danish_ci (弐ীҰ  ucs2_slovak_ci I弐ীҰ  ucs2_roman_ci ve弐ীҰ  ucs2_persian_ci 弐ীҰ  macroman_bin ent弐ীҰ  Conectado=Sí    弐ীҰ  euckr_korean_ci 弐ীҰ  swe7_swedish_ci 弐ী2014-05-09 00:14:48 BL弐ীҰ  latin2_czech_cs 弐ীҰ  tis620_thai_ci  弐ীҰ  DATETIME
  
	 弐ী^\s*DELIMITER\s+(\S+) 弐ীҰ  70 70 ,70 70 B  弐ীҰ  Questions=671   弐ীᖜq竰ϧ쒬া쒬া作ে歜Ϩ櫤Ϩ蜰ȯ衐ȯ   弐ী2014-05-08 23:05:54 ' 弐ীҰ  Conectado=Sí  e 弐ীҰ  cp1250_czech_cs 弐ীҰ  Host=127.0.0.1 L弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54  U弐ীҰ  big5_chinese_ci 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:53   弐ীደq캠ϟ砼ে砼ে砜ে砜ে  闐ȯ阰ȯ    弐ীҰ  ucs2_czech_ci   弐ীҰ  ucs2_danish_ci  弐ীҰ  ucs2_slovak_ci  弐ীҰ  ucs2_roman_ci   弐ী⺬L  缰N䣠ȝꖐȨ  ＀x       弐ীҰ  VARIABLE_NAME 	 弐ীҰ  Questions=174   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:53   弐ীҰ  armscii8_bin    弐ীҰ  ucs2_roman_ci   弐ীҰ  cp1250_czech_cs 弐ীҰ  Variable_name   弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:54  U弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:53   弐ীҰ  utf8_general_ci 弐ী2014-05-08 23:05:55   弐ীҰ  armscii8_bin    弐ী2014-05-08 23:05:55   弐ীҰ  gbk_chinese_ci  弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55   弐ীҰ  sp_S_Comision s 弐ীҰ  dec8_swedish_ci 弐ীҰ  utf8_unicode_ci 弐ী2014-05-08 23:05:55   弐ীҰ  utf8_swedish_ci 弐ীҰ  euckr_korean_ci 弐ীҰ  utf8_polish_ci  弐ীҰ  utf8_spanish_ci 弐ীҰ  utf8_turkish_ci 弐ীҰ  utf8_czech_ci   弐ীҰ  utf8_danish_ci  弐ীҰ  utf8_slovak_ci  弐ীҰ  utf8_roman_ci   弐ীҰ  ucs2_general_ci 弐ীҰ  utf8_persian_ci 弐ীҰ  ucs2_polish_ci  弐ীҰ  ucs2_unicode_ci 弐ীҰ  ucs2_latvian_ci 弐ীҰ  ucs2_spanish_ci 弐ীҰ  ucs2_swedish_ci 弐ীҰ  ucs2_turkish_ci 弐ীҰ  Variable_name   弐ীҰ  swe7_swedish_ci 弐ীҰ  utf8_slovak_ci  弐ীҰ  Variable_name ⤻ 弐ীҰ  sp_D_Auditoria  弐ী^\s*DELIMITER\s+(\S+) 弐ী2014-05-08 23:05:53   弐ীҰ  utf8_unicode_ci 弐ীҰ  utf8_general_ci 弐ী2014-05-08 23:05:52 r 弐ীҰ  utf8_spanish_ci 弐ীҰ  utf8_latvian_ci 弐ীҰ  utf8_swedish_ci 弐ীҰ  utf8_czech_ci   弐ীҰ  utf8_turkish_ci 弐ীҰ  utf8_roman_ci  (弐ীҰ  utf8_danish_ci  弐ীҰ  utf8_slovak_ci  弐ীҰ  ucs2_general_ci 弐ীҰ  dec8_swedish_ci 弐ীҰ  utf8_persian_ci 弐ীҰ  ucs2_unicode_ci 弐ীҰ  ucs2_latvian_ci 弐ীҰ  ucs2_polish_ci  弐ীҰ  SHOW VARIABLES  弐ীҰ  ucs2_spanish_ci 弐ীҰ  id-peru.com  )  弐ীҰ  ucs2_swedish_ci 弐ীҰ  ucs2_turkish_ci 弐ীҰ  ucs2_danish_ci  弐ী2014-05-08 23:05:55   弐ীҰ  ucs2_slovak_ci  弐ীҰ  macroman_bin h  弐ীҰ  ucs2_persian_ci 弐ীҰ  Conectado=Sí    弐ী2014-05-08 23:05:54 e 弐ী2014-05-08 23:05:54   弐ীҰ  ADD COLUMN %s BL弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:53 t 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  VARIABLE_NAME   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:52  r弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:52   弐ীҰ  utf8_latvian_ci 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  id-peru.com  )  弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  Variable_name  D弐ী2014-05-08 23:05:54   弐ীҰ  MULTILINESTRING 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  VARIABLE_VALUE  弐ীҰ  cp1250_czech_cs 弐ী2014-05-08 23:05:55 : 弐ীҰ  utf8_czech_ci   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54 d 弐ীҰ  swe7_swedish_ci 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54 ee弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  tis620_thai_ci  弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54 : 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  hp8_english_ci  弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  MULTILINESTRING 弐ী2014-05-08 23:05:54  l弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54  T弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  hp8_english_ci  弐ী2014-05-08 23:05:54 : 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:52   弐ী2014-05-08 23:05:54   弐ীҰ  sp_S_Ponente    弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55   弐ীҰ  sp_S_Programa : 弐ীҰ  hp8_english_ci  弐ীҰ  ENUM('Y','N')   弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:54 h 弐ীҰ  utf8_danish_ci  弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55  	弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55   弐ীҰ  dec8_swedish_ci 弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:55   弐ীҰ  latin2_czech_cs 弐ী2014-05-08 23:05:55   弐ীҰ  Variable_name   弐ী2014-05-08 23:05:53   弐ীҰ  Questions=1.570 弐ীҰ  Variable_name ⤻ 弐ীҰ  Host=127.0.0.1  弐ীҰ  VARIABLE_VALUE D弐ীҰ  utf8_swedish_ci 弐ীҰ  utf8_polish_ci  弐ীҰ  SHOW DATABASES  弐ীҰ  TABLE_SCHEMA D  弐ীҰ  MULTIPOLYGON os 弐ীҰ  ucs2_czech_ci   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  macroman_bin    弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:55   弐ী2014-05-08 23:05:52 N 弐ীҰ  ucs2_persian_ci 弐ীҰ  gbk_chinese_ci  弐ী2014-05-08 23:05:53   弐ী2014-05-08 23:05:53   弐ীҰ  Host=127.0.0.1  弐ী⺬L  缰N斠ȝꖐȨ  ＀x       弐ী芼z턤ি욌ী뜌Ϡ      滬ϭ      弐ীҰ  dec8_swedish_ci 弐ীҰ  MULTIPOLYGON  s 弐ীҰ  hp8_english_ci  弐ীҰ  dec8_swedish_ci 弐ীҰ  hp8_english_ci  弐ীҰ  big5_chinese_ci 弐ীҰ  latin2_czech_cs 弐ীҰ  swe7_swedish_ci 弐ীҰ  tis620_thai_ci d弐ীҰ  euckr_korean_ci 弐ীҰ  cp1250_czech_cs 弐ীҰ  gbk_chinese_ci e弐ীҰ  armscii8_bin  DE弐ীҰ  utf8_general_ci 弐ীҰ  utf8_unicode_ci 弐ীҰ  utf8_latvian_ci 弐ীҰ  utf8_polish_ci R弐ীҰ  utf8_spanish_ci 弐ীҰ  utf8_swedish_ci 弐ীҰ  utf8_turkish_ci 弐ীҰ  utf8_czech_ci sp弐ীҰ  utf8_danish_ci n弐ীҰ  utf8_slovak_ci n弐ীҰ  utf8_roman_ci 		弐ীҰ  utf8_persian_ci 弐ীҰ  ucs2_general_ci 弐ীҰ  ucs2_unicode_ci 弐ীҰ  ucs2_latvian_ci 弐ীҰ  ucs2_polish_ci R弐ীҰ  ucs2_spanish_ci 弐ীҰ  ucs2_swedish_ci 弐ীҰ  ucs2_turkish_ci 弐ীҰ  ucs2_czech_ci a 弐ীҰ  ucs2_danish_ci E弐ীҰ  ucs2_slovak_ci a弐ীҰ  ucs2_roman_ci _A弐ীҰ  ucs2_persian_ci 弐ীҰ  macroman_bin arc弐ীҰ  AUTO_INCREMENT  弐ী2014-05-08 23:05:52 e 弐ীҰ  VARCHAR(50)
	  弐ীҰ  SP_S_Auditoria L弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ীҰ  latin2_czech_cs 弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54   弐ী2014-05-08 23:05:54 n 弐ী2014-05-08 23:05:55   弐ীҰ  tis620_thai_ci M弐ী2014-05-08 23:05:54   弐ীҰ  utf8_polish_ci  弐ীҰ  -d="Unnamed-2"  弐ীҰ  Host=127.0.0.1  弐ীҰ  Conectado=Sí    弐ীҰ  Questions=264   弐ীҰ  utf8_swedish_ci 弐ীҰ  Flush tables=1  弐ী2014-05-08 23:05:54   弐ীҰ  sp_I_Usuario    弐ীҰ  Questions=264   弐ীҰ  Flush tables=1  弐ী2014-05-08 23:05:54 s 弐ী⺬L      ꖐȨ  ＀x       弐ী2014-05-08 23:05:54   弐ীҰ  Flush tables=1  弐ী2014-05-08 23:05:54 `@弐ী2014-05-08 23:05:54 `s弐ী^\s*DELIMITER\s+(\S+) 弐ী2014-05-08 23:05:54  v弐ী2014-05-08 23:05:54 de弐ীҰ  DECIMAL(10,0)   弐ী2014-05-08 23:05:54 Ga弐ী2014-05-08 23:05:54 mo弐ীҰ  Host=127.0.0.1  弐ী2014-05-08 23:05:54 		弐ী2014-05-08 23:05:54 `r弐ীҰ  SP_S_Usuario    弐ী2014-05-08 23:05:54 
弐ী2014-05-08 23:05:54 	p弐ীҰ  VARBINARY(50)   弐ী2014-05-08 23:05:54  p弐ী2014-05-08 23:05:54  p弐ী2014-05-08 23:05:54 
弐ী2014-05-08 23:05:54 ns
DELIMITER //
//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_D_Persona
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Persona`(
		pidPersona int(10)
	)
BEGIN
		DELETE FROM Persona WHERE idPersona =pidPersona;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_D_Ponente
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Ponente`(
		pidPersona int(10)
	)
BEGIN
		DELETE FROM Ponente WHERE idPersona = pidPersona;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_D_Programa
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Programa`(
		pidEvento int(10),
		pidPersona int(10)
	)
BEGIN
		DELETE FROM Programa WHERE idEvento = pidEvento AND idPersona = pidPersona;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_D_Usuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Usuario`(
		pidPersona int(10)
	)
BEGIN
		DELETE FROM usuario WHERE idPersona =pidPersona;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_I_Auditoria
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Auditoria`(
		pidPersona int(10),
		ptabla varchar(45),
		pacccion varchar(45),
		pfecha DATETIME
		
	)
BEGIN 
			INSERT INTO Auditoria(idPersona,tabla,acccion,fecha)
			values(pidPersona,ptabla,paccion,pfecha);
			END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_I_Comision
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Comision`(
	pidPersona int(10),
	pidEvento int(10),
   ptipo varchar(45)
	)
BEGIN
		INSERT INTO Comision(idPersona,idEvento,tipo)
		VALUES(pidPersona,pidEvento,ptipo);
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_I_Evento
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Evento`(
		
		ptipo varchar(45),
		pfechaInicio datetime,
		pfechaFinal datetime
				
		)
BEGIN 
			INSERT INTO Evento(tipo,fechaInicio,fechaFinal)
			values(ptipo,pfechaInicio,pfechaFinal);
			END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_I_Gasto
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Gasto`(
		pidEvento int(10),
		pconcepto varchar(45),
		pmonto decimal(8,2)
				
		)
BEGIN 
			INSERT INTO Gasto(idEvento,concepto,monto)
			values(pidEvento,pconcepto,pmonto);
			END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_I_Inscripcion
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Inscripcion`(
	pidPersona INT(11),
	pidEvento INT(11),
	ptipoPago VARCHAR(45),
   pmonto DOUBLE(8,2),
   pfecha DATETIME
  
	)
BEGIN
		INSERT INTO Inscripcion(idPersona,idEvento,tipoPago,monto,fecha)
		VALUES(pidPersona,pidEvento,ptipoPago, pmonto,pfecha);
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_I_Persona
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Persona`(
	pnombres varchar(45),
	papellidos varchar(45),
	pemail varchar(45)
	)
BEGIN
		INSERT INTO Persona(nombres,apellidos,email)
		VALUES(pnombres,papellidos,pemail);
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_I_Ponente
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Ponente`(IN `pnombres` VARCHAR(50), IN `papellidos` VARCHAR(50), IN `pemail` VARCHAR(50), IN `pcelular` VARCHAR(45), IN `pgradoAcademico` VARCHAR(45)
  
	)
BEGIN
	CALL sp_I_Persona(pnombres,papellidos,pemail);
	SET @idPersona=LAST_INSERT_ID();
		INSERT INTO Ponente(idPersona,celular ,gradoAcademico)
		VALUES(@idPersona,pcelular,pgradoAcademico);
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_I_Programa
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Programa`(
	pidEvento INT(10),
   pidPersona INT(10),
   ptema VARCHAR(45),
   pfechaInicio DATETIME,
   pfechaFinal DATETIME
   
	)
BEGIN
		INSERT INTO Programa(idEvento,idPersona,tema,fechaInicio,fechaFinal)
		VALUES(pidEvento,pidPersona,ptema,pfechaInicio,pfechaFinal);
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_I_Usuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_I_Usuario`(IN `pnombres` VARCHAR(50), IN `papellidos` VARCHAR(50), IN `pemail` VARCHAR(50), IN `pusuario` varchar(45), IN `ppassword` varchar(45), IN `pindicadorInscripcion` varchar(1), IN `pindicadorEvento` varchar(1), IN `pindicadorGasto` varchar(1), IN `pindicadorPrograma` varchar(1), IN `pindicadorUsuario` varchar(1), IN `pindicadorActivo` varchar(1)
		
	, IN `pindicadorComision` VARCHAR(1))
BEGIN 
	CALL sp_I_Persona(pnombres,papellidos,pemail);
	SET @idPersona=LAST_INSERT_ID();
	INSERT INTO Usuario(idPersona,usuario,password,indicadorInscripcion,indicadorEvento,indicadorGasto,indicadorPrograma,indicadorUsuario,indicadorActivo,indicadorComision)
	values(@idPersona,pusuario,ppassword,pindicadorInscripcion,pindicadorEvento,pindicadorGasto,pindicadorPrograma,pindicadorUsuario,pindicadorActivo,pindicadorComision);
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_PersonasxEvento
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_PersonasxEvento`(prmIdEvento int)
BEGIN
		SELECT DISTINCT p.nombres, p.apellidos, p.email, e.titulo, e.idEvento
		FROM persona p join inscripcion i on p.idPersona = i.idPersona join evento e ON i.idEvento = e.idEvento
		WHERE e.idEvento = prmIdEvento
		ORDER BY p.apellidos;
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.SP_S_Auditoria
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_Auditoria`(
	)
BEGIN
		SELECT * FROM Auditoria;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_Comision
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_Comision`(
	pbusqueda VARCHAR(50)
	)
BEGIN
		SELECT * FROM comision as co
		
		WHERE co.tipo like concat(pbusqueda,'%');
				
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_ComisionEvento
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_ComisionEvento`(
pidEvento int

)
BEGIN
	select us.idPersona,concat(pe.nombres,' ',pe.apellidos)as nombrecompleto,e.tipo as tipoevento,co.tipo as tipocomision
   from comision as co
	inner join evento as e on e.idEvento = co.idEvento 
	inner join usuario as us on us.idPersona = co.idPersona
	inner join persona as pe on pe.idPersona = us.idPersona
	where e.idEvento=pidEvento;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_Evento
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_Evento`(IN `pbusqueda` VARCHAR(50)
	)
BEGIN
		SELECT e.idEvento, e.titulo, e.tipo,e.fechaInicio,e.fechaFinal 
		FROM Evento as e
		WHERE e.titulo like concat('%',pbusqueda,'%');				
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.SP_S_Gasto
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_Gasto`(
	)
BEGIN
		SELECT * FROM Gasto;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_GastoEvento
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_GastoEvento`(
ptitulo int,
ptipo varchar(45)

)
BEGIN
	select e.idEvento,e.titulo,e.tipo as tipoEvento,ga.concepto as material,ga.monto
   from evento as e
	inner join gasto as ga on ga.idEvento = e.idEvento
	where e.titulo=ptitulo and e.tipo=ptipo;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_GastoTotal
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_GastoTotal`(
ptitulo int,
ptipo varchar(45)

)
BEGIN
	select e.idEvento,e.titulo,e.tipo as tipoEvento,sum(ga.monto)as total
   from evento as e
	inner join gasto as ga on ga.idEvento = e.idEvento
	where e.titulo=ptitulo and e.tipo=ptipo;

	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_Inscripcion
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_Inscripcion`(IN `pidEvento` INT)
BEGIN
		SELECT i.idPersona,concat(p.nombres,' ',p.apellidos) as nombre,i.idEvento, i.tipoPago, i.monto, i.fecha
		FROM inscripcion as i
		INNER JOIN persona as p
		ON i.idPersona = p.idPersona
		WHERE i.idEvento = pidEvento;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_InscripcionEvento
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_InscripcionEvento`(
ptipo varchar(45)

)
BEGIN
	select pe.idPersona,concat(pe.nombres,' ',pe.apellidos)as nombrecompleto,e.tipo as tipoEvento,ins.tipoPago,ins.monto,ins.fecha
   from persona as pe
	inner join inscripcion as ins on ins.idPersona = pe.idPersona
	inner join evento as e on e.idEvento = ins.idEvento
	where e.tipo=ptipo;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_Persona
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_Persona`(IN `pbusqueda` VARCHAR(50)
	)
BEGIN
		SELECT p.idPersona, p.nombres, p.apellidos,p.email
		FROM Persona as p
		WHERE p.nombres like concat('%',pbusqueda,'%') or p.apellidos like concat('%',pbusqueda,'%');
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_PersonaInscripcion
DELIMITER //
CREATE DEFINER=`htrdev`@`localhost` PROCEDURE `sp_S_PersonaInscripcion`(IN `pbusqueda` varCHAR(50), IN `pidEvento` INT)
BEGIN
		SELECT p.idPersona, p.nombres, p.apellidos,p.email,e.idEvento
		FROM Persona as p
		left join Inscripcion as e
		on e.idPersona = p.idPersona and e.idEvento = pidEvento 
		WHERE (p.nombres like concat('%',pbusqueda,'%') or p.apellidos like concat('%',pbusqueda,'%')) 
				and e.idEvento is null;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_Ponente
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_Ponente`(
	pbusqueda VARCHAR(50)
	)
BEGIN
		SELECT * FROM Ponente as po
		INNER JOIN Persona as p
		ON po.idPersona = p.idPersona
		WHERE p.nombres like concat(pBusqueda,'%') OR
				p.apellidos like concat(pBusqueda,'%') ;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_PonenteEvento
DELIMITER //
CREATE DEFINER=`htrdev`@`localhost` PROCEDURE `sp_S_PonenteEvento`(IN `pbusqueda` VARCHAR(50), IN `pidEvento` INT)
BEGIN
		SELECT p.idPersona, p.nombres, p.apellidos,p.email,e.idEvento 
		FROM Ponente as po
		INNER JOIN Persona as p
		ON po.idPersona = p.idPersona
		left join Programa as e
		on e.idPersona = po.idPersona and e.idEvento = pidEvento 
		WHERE (p.nombres like concat('%',pbusqueda,'%') or p.apellidos like concat('%',pbusqueda,'%')) 
				and e.idEvento is null;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_Programa
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_Programa`(IN `pbusqueda` VARCHAR(50)
	, IN `pidEvento` INT)
BEGIN
		SELECT pr.*,concat(p.nombres,' ',p.apellidos) as nombre
			FROM programa as pr
		INNER JOIN persona as p
		ON pr.idPersona = p.idPersona		
		WHERE pr.tema like concat(pBusqueda,'%') and pr.idEvento = pidEvento;
				
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_ProgramaEvento
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_ProgramaEvento`(
pidEvento int
)
BEGIN
	select concat(pe.nombres,' ',pe.apellidos)as nombrecompleto,pr.tema,e.fechaInicio,e.fechaFinal  from evento as e
	inner join programa as pr on e.idEvento = pr.idEvento 
	inner join ponente as po on po.idPersona = pr.idPersona
	inner join persona as pe on pe.idPersona = po.idPersona
	where e.idEvento=pidEvento;
	
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.SP_S_Usuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_Usuario`(IN `pbusqueda` VARCHAR(50))
BEGIN
		SELECT * FROM Usuario as u
		INNER JOIN Persona as p
		ON u.idPersona = p.idPersona
		WHERE p.nombres like concat(pBusqueda,'%') OR
				p.apellidos like concat(pBusqueda,'%') ;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_S_UsuarioEvento
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_UsuarioEvento`(
ptipo varchar(45)

)
BEGIN
	select us.idPersona,concat(pe.nombres,' ',pe.apellidos)as nombrecompleto,e.tipo as tipoEvento,co.tipo as tipoComision
   from evento as e
	inner join comision as co on co.idEvento = e.idEvento
	inner join usuario as us on us.idPersona = co.idPersona
	inner join persona as pe on pe.idPersona = us.idPersona
	where e.tipo=ptipo;
	END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_U_Auditoria
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_U_Auditoria`(
		pidAuditoria int(10),
		pidPersona int(10),
		ptabla varchar(45),
		pacccion varchar(45),
		pfecha DATETIME
	)
BEGIN 
		UPDATE Auditoria SET
		tabla = ptabla,
		accion = paccion,
		fecha = pfecha		
		
		WHERE idAuditoria = pidAuditoria;
		END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_U_Comision
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_U_Comision`(
   pidPersona int(10),
	pidEvento int(10),
	tipo varchar(45)
	)
BEGIN 
		UPDATE Comision SET
		tipo = ptipo
		WHERE idPersona = pidPersona AND idEvento = pidEvento;
		END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_U_Evento
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_U_Evento`(
		pidEvento int(10),
		ptipo varchar(45),
		pfechaInicio datetime,
		pfechaFinal datetime		
	)
BEGIN 
		UPDATE Evento SET
		tipo= ptipo,
		fechaInicio = pfechaInicio,
		fechaFinal = pfechaFinal
				
		WHERE idEvento = pidEvento;
		END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_U_Gasto
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_U_Gasto`(
		pidGasto int(10),
		pidEvento int(10),
		pconcepto varchar(45),
		pmonto decimal(8,2)
		
	)
BEGIN 
		UPDATE Gasto SET
		concepto= pconcepto,
		monto = pmonto
				
		WHERE idGasto = pidGasto;
		END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_U_Inscripcion
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_U_Inscripcion`(IN `pidPersona` int(10), IN `pidEvento` int(10), IN `ptipoPago` varchar(45), IN `pmonto` decimal(8,2), IN `pfecha` DATETIME)
BEGIN 
		UPDATE Inscripcion SET
		
		tipoPago = ptipoPago,
		monto = pmonto,	
		fecha = pfecha
		WHERE idPersona = pidPersona AND idEvento = pidEvento;
		END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_U_Persona
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_U_Persona`(
		pidPersona INT(10),
		pnombres varchar(45),
	   papellidos varchar(45),
		pemail varchar(45)		
	)
BEGIN 
		UPDATE Persona SET
		
		nombres= pnombres,
		apellidos = papellidos,
		email =	pemail
		WHERE idPersona = pidPersona;
		END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_U_Ponente
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_U_Ponente`(IN `pidPersona` INT(10), IN `pnombres` VARCHAR(50), IN `papellidos` VARCHAR(50), IN `pemail` VARCHAR(50), IN `pcelular` VARCHAR(45), IN `pgradoAcademico` VARCHAR(45)
   
	)
BEGIN 
		CALL sp_U_Persona(pidPersona,pnombres,papellidos,pemail);
		UPDATE Ponente SET
		celular = pcelular,
		gradoAcademico = pgradoAcademico
		WHERE idPersona = pidPersona;
		END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_U_Programa
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_U_Programa`(
   pidEvento INT(10),
   pidPersona INT(10),
   ptema VARCHAR(45),
   pfechaInicio DATETIME,
   pfechaFinal DATETIME
	)
BEGIN 
		UPDATE Programa SET

		tema = ptema,
		fechaInicio = pfechaInicio,
		fechaFinal = pfechaFinal
		
		WHERE idEvento = pidEvento AND idPersona = pidPersona;
		END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.sp_U_Usuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_U_Usuario`(IN `pidPersona` int (10), IN `pnombres` VARCHAR(50), IN `papellidos` VARCHAR(50), IN `pemail` VARCHAR(50), IN `pusuario` varchar(45), IN `ppassword` varchar(45), IN `pindicadorInscripcion` varchar(1), IN `pindicadorEvento` varchar(1), IN `pindicadorGasto` varchar(1), IN `pindicadorPrograma` varchar(1), IN `pindicadorUsuario` varchar(1), IN `pindicadorActivo` varchar(1) 
	, IN `pindicadorComision` VARCHAR(1))
BEGIN 
		CALL sp_U_Persona(pidPersona,pnombres,papellidos,pemail);
		UPDATE Usuario SET
			usuario = pusuario,
			password = ppassword,
			indicadorInscripcion = pindicadorInscripcion,
			indicadorEvento = pindicadorEvento,
			indicadorGasto = pindicadorGasto,
			indicadorPrograma = pindicadorPrograma,		
			indicadorUsuario = pindicadorUsuario,
			indicadorActivo = pindicadorActivo,
			indicadorComision = pindicadorComision
		WHERE idPersona = pidPersona;
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_eventos.usp_S_inscripcion
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_S_inscripcion`(
pidEvento int(11)
)
BEGIN
		SELECT * FROM inscripcion as ins
		
		WHERE ins.idEvento = pidEvento;
END//
DELIMITER ;


-- Volcando estructura para tabla db_eventos.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idPersona` int(11) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `indicadorInscripcion` varchar(1) DEFAULT NULL,
  `indicadorEvento` varchar(1) DEFAULT NULL,
  `indicadorGasto` varchar(1) DEFAULT NULL,
  `indicadorPrograma` varchar(1) DEFAULT NULL,
  `indicadorComision` varchar(1) DEFAULT NULL,
  `indicadorUsuario` varchar(1) DEFAULT NULL,
  `indicadorActivo` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  CONSTRAINT `FK_usuario_persona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_eventos.usuario: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idPersona`, `usuario`, `password`, `indicadorInscripcion`, `indicadorEvento`, `indicadorGasto`, `indicadorPrograma`, `indicadorComision`, `indicadorUsuario`, `indicadorActivo`) VALUES
	(1, 'briseida', '123', 'S', 'S', 'S', 'S', 'S', 'N', 'S'),
	(14, 'Pruebaa', '123', 'S', 'N', 'N', 'N', 'S', 'N', 'S'),
	(15, 'Adyessirb', 'mod', 'S', 'S', 'S', 'S', 'S', 'N', 'S'),
	(16, 'Test', 'test', 'S', 'N', 'N', 'S', 'S', 'N', 'S'),
	(17, 'lpalacios', '123', 'N', 'N', 'S', 'N', 'S', 'N', 'S'),
	(18, 'elanchipa', '123', 'S', 'N', 'N', 'N', 'S', 'S', 'S'),
	(25, 'leo', '123', 'N', 'N', 'N', 'N', 'S', 'N', 'S');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

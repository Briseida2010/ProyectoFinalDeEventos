-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.14 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             8.3.0.4694
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

-- Volcando datos para la tabla db_eventos.inscripcion: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
INSERT INTO `inscripcion` (`idPersona`, `idEvento`, `tipoPago`, `monto`, `fecha`) VALUES
	(1, 2, 'Gratis', 0.00, '2014-05-04 21:05:42'),
	(2, 1, 'Pagado', 50.00, '2014-05-04 21:05:41'),
	(3, 1, 'Gratis', 0.00, '2014-05-04 21:05:39'),
	(4, 1, 'Gratis', 0.00, '2014-05-04 21:05:37'),
	(19, 1, 'Pagado', 50.00, '2014-05-04 21:05:45'),
	(21, 1, 'Pagado', 50.00, '2014-05-04 21:05:46'),
	(22, 1, 'Pagado', 50.00, '2014-05-04 21:05:48');
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


-- Volcando estructura para procedimiento db_eventos.sp_D_Inscripcion
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_D_Inscripcion`(
		pidPersona int(10),
		pidEvento int(10)
	)
BEGIN
		DELETE FROM Inscripcion WHERE idPersona = pidPersona AND idEvento = pidEvento;
	END//
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
		FROM Evento as e;
		
				
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_Inscripcion`(IN `pbusqueda` VARCHAR(50)
	)
BEGIN
		SELECT i.idPersona, i.idEvento, i.tipoPago, i.monto, i.fecha
		FROM inscripcion as i;
		
	
				
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
		FROM Persona as p;
				
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


-- Volcando estructura para procedimiento db_eventos.sp_S_Programa
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_S_Programa`(
	pbusqueda VARCHAR(50)
	)
BEGIN
		SELECT * FROM programa as pr
		
		WHERE pr.tema like concat(pBusqueda,'%');
				
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_U_Inscripcion`(
	   pidPersona int(10),
		pidEvento int(10),
		ptipoPago varchar(45),
		pmonto decimal(8,2),
		pasistencia varchar(1)
	)
BEGIN 
		UPDATE Inscripcion SET
		
		tipoPago = ptipoPago,
		monto = pmonto,
		asistencia = pasistencia
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

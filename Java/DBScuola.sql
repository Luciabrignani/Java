-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: DBScuola
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_table` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_anagrafiche`
--

DROP TABLE IF EXISTS `t_anagrafiche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_anagrafiche` (
  `id_anagrafica` int(11) NOT NULL AUTO_INCREMENT,
  `cognome` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `provincia` varchar(4) NOT NULL,
  PRIMARY KEY (`id_anagrafica`),
  KEY `idxcog` (`cognome`,`nome`),
  KEY `idxpv` (`provincia`),
  CONSTRAINT `fkpv` FOREIGN KEY (`provincia`) REFERENCES `t_province` (`provincia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_anagrafiche`
--

LOCK TABLES `t_anagrafiche` WRITE;
/*!40000 ALTER TABLE `t_anagrafiche` DISABLE KEYS */;
INSERT INTO `t_anagrafiche` VALUES (1,'Rossi','Mario','to'),(2,'Bianchi','Maria','al'),(3,'Lima','André','to'),(4,'Lucia','Brignani','to'),(5,'Gianluca','Agrave','to'),(6,'Verdi','Luca','vc'),(7,'Alessi','Giovanni','bi'),(8,'Belli','Aldo','al'),(9,'Rosselli','Marta','at'),(10,'De Marco','Elisa','cn');
/*!40000 ALTER TABLE `t_anagrafiche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_corsi`
--

DROP TABLE IF EXISTS `t_corsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_corsi` (
  `id_corso` int(11) NOT NULL AUTO_INCREMENT,
  `titolocorso` varchar(250) NOT NULL,
  `descrizione` varchar(600) DEFAULT NULL,
  `datainizio` date DEFAULT NULL,
  `durata` smallint(6) DEFAULT NULL,
  `costocorso` decimal(10,2) DEFAULT NULL,
  `datacreazione` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_corso`),
  UNIQUE KEY `udx_tc` (`titolocorso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_corsi`
--

LOCK TABLES `t_corsi` WRITE;
/*!40000 ALTER TABLE `t_corsi` DISABLE KEYS */;
INSERT INTO `t_corsi` VALUES (1,'Java',NULL,'2022-02-01',100,100.00,'2022-03-04 13:01:03'),(2,'html','css','2022-03-04',50,50.00,'2022-04-02 12:01:03'),(3,'inglese','talk and speak','2022-02-02',12,100.00,'2022-08-02 12:01:01'),(4,'jakarta EE','applicazioni windows','2022-12-22',100,20.00,'2022-12-11 13:01:01'),(5,'cucina','decorazioni','2022-05-13',400,50.00,'2022-05-30 22:00:00'),(6,'lettura','comprensione','2022-06-01',300,600.00,'2022-03-08 13:58:30'),(8,'jakarta EE edizione1',NULL,'2022-03-09',NULL,0.00,'2022-03-09 10:50:44'),(10,'ballo','salsa e tango ','2022-03-10',500,1000.00,'2022-03-10 07:55:58');
/*!40000 ALTER TABLE `t_corsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_iscrizioni`
--

DROP TABLE IF EXISTS `t_iscrizioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_iscrizioni` (
  `id_iscrizione` int(11) NOT NULL AUTO_INCREMENT,
  `id_anagrafica` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `dataiscrizione` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_iscrizione`),
  UNIQUE KEY `udx_an` (`id_anagrafica`,`id_corso`),
  KEY `idxscran` (`id_anagrafica`),
  KEY `id` (`id_corso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_iscrizioni`
--

LOCK TABLES `t_iscrizioni` WRITE;
/*!40000 ALTER TABLE `t_iscrizioni` DISABLE KEYS */;
INSERT INTO `t_iscrizioni` VALUES (1,1,1,'2022-03-08 09:58:01'),(2,2,1,'2022-03-08 09:58:01'),(3,1,2,'2022-03-08 09:58:01'),(4,3,5,'2022-03-08 14:54:21'),(5,4,6,'2022-03-08 14:59:29');
/*!40000 ALTER TABLE `t_iscrizioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_opzioni`
--

DROP TABLE IF EXISTS `t_opzioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_opzioni` (
  `id_opzione` int(11) NOT NULL AUTO_INCREMENT,
  `ivastd` decimal(4,2) DEFAULT NULL,
  `scontostd` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id_opzione`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_opzioni`
--

LOCK TABLES `t_opzioni` WRITE;
/*!40000 ALTER TABLE `t_opzioni` DISABLE KEYS */;
INSERT INTO `t_opzioni` VALUES (1,22.00,25.00);
/*!40000 ALTER TABLE `t_opzioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_province`
--

DROP TABLE IF EXISTS `t_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_province` (
  `provincia` varchar(4) NOT NULL,
  PRIMARY KEY (`provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_province`
--

LOCK TABLES `t_province` WRITE;
/*!40000 ALTER TABLE `t_province` DISABLE KEYS */;
INSERT INTO `t_province` VALUES ('al'),('at'),('bi'),('cn'),('no'),('to'),('vc');
/*!40000 ALTER TABLE `t_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_anagrafiche_no_iscrizione`
--

DROP TABLE IF EXISTS `v_anagrafiche_no_iscrizione`;
/*!50001 DROP VIEW IF EXISTS `v_anagrafiche_no_iscrizione`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_anagrafiche_no_iscrizione` (
  `id_anagrafica` tinyint NOT NULL,
  `cognome` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `provincia` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_corsi_ok`
--

DROP TABLE IF EXISTS `v_corsi_ok`;
/*!50001 DROP VIEW IF EXISTS `v_corsi_ok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_corsi_ok` (
  `titolocorso` tinyint NOT NULL,
  `id_corso` tinyint NOT NULL,
  `durata` tinyint NOT NULL,
  `descrizione` tinyint NOT NULL,
  `datainizio` tinyint NOT NULL,
  `costocorso` tinyint NOT NULL,
  `datacreazione` tinyint NOT NULL,
  `costo_noiva` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_corso_best`
--

DROP TABLE IF EXISTS `v_corso_best`;
/*!50001 DROP VIEW IF EXISTS `v_corso_best`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_corso_best` (
  `id_corso` tinyint NOT NULL,
  `titolocorso` tinyint NOT NULL,
  `tot_iscritti` tinyint NOT NULL,
  `profitto` tinyint NOT NULL,
  `costocorso` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_corso_best_alunni`
--

DROP TABLE IF EXISTS `v_corso_best_alunni`;
/*!50001 DROP VIEW IF EXISTS `v_corso_best_alunni`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_corso_best_alunni` (
  `id_corso` tinyint NOT NULL,
  `titolocorso` tinyint NOT NULL,
  `tot_iscritti` tinyint NOT NULL,
  `profitto` tinyint NOT NULL,
  `costocorso` tinyint NOT NULL,
  `id_anagrafica` tinyint NOT NULL,
  `cognome` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `provincia` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_iscrizioni_full`
--

DROP TABLE IF EXISTS `v_iscrizioni_full`;
/*!50001 DROP VIEW IF EXISTS `v_iscrizioni_full`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_iscrizioni_full` (
  `id_iscrizione` tinyint NOT NULL,
  `id_anagrafica` tinyint NOT NULL,
  `id_corso` tinyint NOT NULL,
  `dataiscrizione` tinyint NOT NULL,
  `titolocorso` tinyint NOT NULL,
  `durata` tinyint NOT NULL,
  `costocorso` tinyint NOT NULL,
  `cognome` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `provincia` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_profitto_corsi`
--

DROP TABLE IF EXISTS `v_profitto_corsi`;
/*!50001 DROP VIEW IF EXISTS `v_profitto_corsi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_profitto_corsi` (
  `id_corso` tinyint NOT NULL,
  `titolocorso` tinyint NOT NULL,
  `tot_iscritti` tinyint NOT NULL,
  `profitto` tinyint NOT NULL,
  `costocorso` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_anagrafiche_no_iscrizione`
--

/*!50001 DROP TABLE IF EXISTS `v_anagrafiche_no_iscrizione`*/;
/*!50001 DROP VIEW IF EXISTS `v_anagrafiche_no_iscrizione`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tss`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_anagrafiche_no_iscrizione` AS select `a`.`id_anagrafica` AS `id_anagrafica`,`a`.`cognome` AS `cognome`,`a`.`nome` AS `nome`,`a`.`provincia` AS `provincia` from (`t_anagrafiche` `a` left join `t_iscrizioni` `i` on(`a`.`id_anagrafica` = `i`.`id_anagrafica`)) where `i`.`id_iscrizione` is null order by `a`.`cognome`,`a`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_corsi_ok`
--

/*!50001 DROP TABLE IF EXISTS `v_corsi_ok`*/;
/*!50001 DROP VIEW IF EXISTS `v_corsi_ok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tss`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_corsi_ok` AS select ucase(`c`.`titolocorso`) AS `titolocorso`,`c`.`id_corso` AS `id_corso`,`c`.`durata` AS `durata`,`c`.`descrizione` AS `descrizione`,`c`.`datainizio` AS `datainizio`,`c`.`costocorso` AS `costocorso`,`c`.`datacreazione` AS `datacreazione`,`c`.`costocorso` * (1 / (1 + `o`.`ivastd`) / 100) AS `costo_noiva` from (`t_corsi` `c` join `t_opzioni` `o`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_corso_best`
--

/*!50001 DROP TABLE IF EXISTS `v_corso_best`*/;
/*!50001 DROP VIEW IF EXISTS `v_corso_best`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tss`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_corso_best` AS select `c`.`id_corso` AS `id_corso`,`c`.`titolocorso` AS `titolocorso`,`c`.`tot_iscritti` AS `tot_iscritti`,`c`.`profitto` AS `profitto`,`c`.`costocorso` AS `costocorso` from `v_profitto_corsi` `c` limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_corso_best_alunni`
--

/*!50001 DROP TABLE IF EXISTS `v_corso_best_alunni`*/;
/*!50001 DROP VIEW IF EXISTS `v_corso_best_alunni`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tss`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_corso_best_alunni` AS select `c`.`id_corso` AS `id_corso`,`c`.`titolocorso` AS `titolocorso`,`c`.`tot_iscritti` AS `tot_iscritti`,`c`.`profitto` AS `profitto`,`c`.`costocorso` AS `costocorso`,`a`.`id_anagrafica` AS `id_anagrafica`,`a`.`cognome` AS `cognome`,`a`.`nome` AS `nome`,`a`.`provincia` AS `provincia` from ((`v_corso_best` `c` join `t_iscrizioni` `i` on(`c`.`id_corso` = `i`.`id_corso`)) join `t_anagrafiche` `a` on(`i`.`id_anagrafica` = `a`.`id_anagrafica`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_iscrizioni_full`
--

/*!50001 DROP TABLE IF EXISTS `v_iscrizioni_full`*/;
/*!50001 DROP VIEW IF EXISTS `v_iscrizioni_full`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tss`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_iscrizioni_full` AS select `i`.`id_iscrizione` AS `id_iscrizione`,`i`.`id_anagrafica` AS `id_anagrafica`,`i`.`id_corso` AS `id_corso`,`i`.`dataiscrizione` AS `dataiscrizione`,`c`.`titolocorso` AS `titolocorso`,`c`.`durata` AS `durata`,`c`.`costocorso` AS `costocorso`,`a`.`cognome` AS `cognome`,`a`.`nome` AS `nome`,`a`.`provincia` AS `provincia` from ((`t_iscrizioni` `i` join `t_corsi` `c`) join `t_anagrafiche` `a`) where `i`.`id_corso` = `c`.`id_corso` and `i`.`id_anagrafica` = `a`.`id_anagrafica` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_profitto_corsi`
--

/*!50001 DROP TABLE IF EXISTS `v_profitto_corsi`*/;
/*!50001 DROP VIEW IF EXISTS `v_profitto_corsi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tss`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_profitto_corsi` AS select `c`.`id_corso` AS `id_corso`,`c`.`titolocorso` AS `titolocorso`,count(`i`.`id_iscrizione`) AS `tot_iscritti`,`c`.`costo_noiva` * count(`i`.`id_iscrizione`) AS `profitto`,`c`.`costocorso` AS `costocorso` from (`v_corsi_ok` `c` left join `t_iscrizioni` `i` on(`c`.`id_corso` = `i`.`id_corso`)) group by `c`.`id_corso` order by `c`.`costo_noiva` * count(`i`.`id_iscrizione`) desc,`c`.`titolocorso` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-11  9:35:29

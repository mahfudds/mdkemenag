--
-- DATABASE DUMP for SISFO Sekolah JIBAS 29.0 (20 Sept 2023)
--
-- MySQL dump 10.13  Distrib 5.6.20, for Win32 (x86)
--
-- Host: localhost    Database: jbsakad
-- ------------------------------------------------------
-- Server version	5.6.47

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
-- Current Database: `jbsakad`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsakad` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsakad`;

--
-- Table structure for table `aktivitaskalender`
--

DROP TABLE IF EXISTS `aktivitaskalender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aktivitaskalender` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkalender` int(10) unsigned NOT NULL DEFAULT '0',
  `tanggalawal` date NOT NULL DEFAULT '0000-00-00',
  `tanggalakhir` date NOT NULL DEFAULT '0000-00-00',
  `kegiatan` varchar(50) NOT NULL,
  `keterangan` text,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_aktivitaskalender_kalenderakademik` (`idkalender`),
  KEY `IX_aktivitaskalender_ts` (`ts`,`issync`),
  CONSTRAINT `FK_aktivitaskalender_kalenderakademik` FOREIGN KEY (`idkalender`) REFERENCES `kalenderakademik` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aktivitaskalender`
--

LOCK TABLES `aktivitaskalender` WRITE;
/*!40000 ALTER TABLE `aktivitaskalender` DISABLE KEYS */;
/*!40000 ALTER TABLE `aktivitaskalender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumni`
--

DROP TABLE IF EXISTS `alumni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumni` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(45) NOT NULL,
  `klsakhir` int(10) unsigned NOT NULL,
  `tktakhir` int(10) unsigned NOT NULL,
  `tgllulus` date DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_alumni_siswa` (`nis`),
  KEY `FK_alumni_tingkat` (`tktakhir`),
  KEY `FK_alumni_kelas` (`klsakhir`),
  KEY `FK_alumni_departemen` (`departemen`),
  KEY `IX_alumni_ts` (`ts`,`issync`),
  CONSTRAINT `FK_alumni_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_alumni_kelas` FOREIGN KEY (`klsakhir`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_alumni_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_alumni_tingkat` FOREIGN KEY (`tktakhir`) REFERENCES `tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumni`
--

LOCK TABLES `alumni` WRITE;
/*!40000 ALTER TABLE `alumni` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `angkatan`
--

DROP TABLE IF EXISTS `angkatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `angkatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `angkatan` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_angkatan_departemen` (`departemen`),
  KEY `IX_angkatan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_angkatan_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angkatan`
--

LOCK TABLES `angkatan` WRITE;
/*!40000 ALTER TABLE `angkatan` DISABLE KEYS */;
INSERT INTO `angkatan` VALUES (19,'2008','SMA',1,'Sekedar contoh. Nama angkatan siswa yang ada di departemen sekolah. Biasanya angkatan ini bersesuaian dengan tahun penerimaan siswa baru. Ubah atau tambahkan data ini sesuai dengan nama angkatan siswa di sekolah.',NULL,NULL,NULL,'2010-03-02 03:06:17',11596,0);
/*!40000 ALTER TABLE `angkatan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_angkatan_ains AFTER INSERT ON jbsakad.angkatan
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.angkatan', iddata = NEW.replid, state = 'I', dataload = 1
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_angkatan_aupd AFTER UPDATE ON jbsakad.angkatan
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.angkatan', iddata = OLD.replid, state = 'U', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_angkatan_adel AFTER DELETE ON jbsakad.angkatan
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.angkatan', iddata = OLD.replid, state = 'D', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asalsekolah`
--

DROP TABLE IF EXISTS `asalsekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asalsekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `sekolah` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sekolah`),
  UNIQUE KEY `UX_asalsekolah` (`replid`),
  KEY `FK_asalsekolah_departemen` (`departemen`),
  KEY `IX_asalsekolah_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asalsekolah`
--

LOCK TABLES `asalsekolah` WRITE;
/*!40000 ALTER TABLE `asalsekolah` DISABLE KEYS */;
INSERT INTO `asalsekolah` VALUES (31,'SDN','SDN Indonesia Membaca',NULL,NULL,NULL,NULL,'2010-03-02 03:06:17',29807,0),(30,'SMAN','SMAN Indonesia Membaca',NULL,NULL,NULL,NULL,'2010-03-02 03:06:17',48716,0),(21,'SMPN','SMP Indonesia Membaca',NULL,NULL,NULL,NULL,'2010-03-02 03:06:17',23099,0);
/*!40000 ALTER TABLE `asalsekolah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aturangrading`
--

DROP TABLE IF EXISTS `aturangrading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aturangrading` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nipguru` varchar(30) NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `dasarpenilaian` varchar(50) NOT NULL,
  `nmin` decimal(6,1) NOT NULL,
  `nmax` decimal(6,1) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_aturangrading_pegawai` (`nipguru`),
  KEY `FK_aturangrading_tingkat` (`idtingkat`),
  KEY `FK_aturangrading_pelajaran` (`idpelajaran`),
  KEY `FK_aturangrading_dasarpenilaian` (`dasarpenilaian`),
  KEY `IX_aturangrading_ts` (`ts`,`issync`),
  CONSTRAINT `FK_aturangrading_dasarpenilaian` FOREIGN KEY (`dasarpenilaian`) REFERENCES `dasarpenilaian` (`dasarpenilaian`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturangrading_pegawai` FOREIGN KEY (`nipguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturangrading_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturangrading_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aturangrading`
--

LOCK TABLES `aturangrading` WRITE;
/*!40000 ALTER TABLE `aturangrading` DISABLE KEYS */;
INSERT INTO `aturangrading` VALUES (207,'101',26,45,'Praktik',75.0,100.0,'A',NULL,NULL,NULL,'2010-03-02 03:06:17',34878,0),(208,'101',26,45,'Praktik',60.0,74.9,'B',NULL,NULL,NULL,'2010-03-02 03:06:17',39560,0),(209,'101',26,45,'Praktik',50.0,59.9,'C',NULL,NULL,NULL,'2010-03-02 03:06:17',27637,0),(210,'101',26,45,'Praktik',40.0,49.9,'D',NULL,NULL,NULL,'2010-03-02 03:06:17',19503,0),(211,'101',26,45,'Praktik',0.0,39.9,'E',NULL,NULL,NULL,'2010-03-02 03:06:17',14603,0),(217,'101',27,45,'Pemahaman Konsep',75.0,100.0,'A',NULL,NULL,NULL,'2010-03-02 03:06:17',14507,0),(218,'101',27,45,'Pemahaman Konsep',60.0,74.9,'B',NULL,NULL,NULL,'2010-03-02 03:06:17',28724,0),(219,'101',27,45,'Pemahaman Konsep',50.0,59.9,'C',NULL,NULL,NULL,'2010-03-02 03:06:17',34571,0),(220,'101',27,45,'Pemahaman Konsep',40.0,49.9,'D',NULL,NULL,NULL,'2010-03-02 03:06:17',21151,0),(221,'101',27,45,'Pemahaman Konsep',0.0,39.9,'E',NULL,NULL,NULL,'2010-03-02 03:06:17',2041,0),(222,'101',27,45,'Praktik',70.0,100.0,'A',NULL,NULL,NULL,'2010-03-02 03:06:17',12283,0),(223,'101',27,45,'Praktik',50.0,69.9,'B',NULL,NULL,NULL,'2010-03-02 03:06:17',55290,0),(224,'101',27,45,'Praktik',40.0,49.9,'C',NULL,NULL,NULL,'2010-03-02 03:06:17',43011,0),(225,'101',27,45,'Praktik',30.0,39.9,'D',NULL,NULL,NULL,'2010-03-02 03:06:17',49186,0),(226,'101',27,45,'Praktik',0.0,29.9,'E',NULL,NULL,NULL,'2010-03-02 03:06:17',51364,0),(227,'101',28,45,'Pemahaman Konsep',75.0,100.0,'A',NULL,NULL,NULL,'2010-03-02 03:06:17',43731,0),(228,'101',28,45,'Pemahaman Konsep',60.0,74.9,'B',NULL,NULL,NULL,'2010-03-02 03:06:17',64565,0),(229,'101',28,45,'Pemahaman Konsep',50.0,59.9,'C',NULL,NULL,NULL,'2010-03-02 03:06:17',60569,0),(230,'101',28,45,'Pemahaman Konsep',40.0,49.9,'D',NULL,NULL,NULL,'2010-03-02 03:06:17',43622,0),(231,'101',28,45,'Pemahaman Konsep',0.0,39.9,'E',NULL,NULL,NULL,'2010-03-02 03:06:17',36402,0),(242,'101',28,45,'Praktik',70.0,100.0,'A',NULL,NULL,NULL,'2010-03-02 03:06:17',51145,0),(243,'101',28,45,'Praktik',50.0,69.9,'B',NULL,NULL,NULL,'2010-03-02 03:06:17',15456,0),(244,'101',28,45,'Praktik',40.0,49.9,'C',NULL,NULL,NULL,'2010-03-02 03:06:17',54904,0),(245,'101',28,45,'Praktik',30.0,39.9,'D',NULL,NULL,NULL,'2010-03-02 03:06:17',31562,0),(246,'101',28,45,'Praktik',0.0,29.9,'E',NULL,NULL,NULL,'2010-03-02 03:06:17',58628,0),(252,'101',26,45,'Pemahaman Konsep',75.0,100.0,'A',NULL,NULL,NULL,'2010-03-02 03:06:17',1865,0),(253,'101',26,45,'Pemahaman Konsep',60.0,74.9,'B',NULL,NULL,NULL,'2010-03-02 03:06:17',30031,0),(254,'101',26,45,'Pemahaman Konsep',50.0,59.9,'C',NULL,NULL,NULL,'2010-03-02 03:06:17',13500,0),(255,'101',26,45,'Pemahaman Konsep',40.0,49.9,'D',NULL,NULL,NULL,'2010-03-02 03:06:17',42936,0),(256,'101',26,45,'Pemahaman Konsep',0.0,39.9,'E',NULL,NULL,NULL,'2010-03-02 03:06:17',43118,0);
/*!40000 ALTER TABLE `aturangrading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aturannhb`
--

DROP TABLE IF EXISTS `aturannhb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aturannhb` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nipguru` varchar(30) NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `dasarpenilaian` varchar(50) NOT NULL,
  `idjenisujian` int(10) unsigned NOT NULL,
  `bobot` tinyint(3) unsigned NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_aturannhb_jenisujian` (`idjenisujian`),
  KEY `FK_aturannhb_dasarpenilaian` (`dasarpenilaian`),
  KEY `FK_aturannhb_pelajaran` (`idpelajaran`),
  KEY `FK_aturannhb_tingkat` (`idtingkat`),
  KEY `FK_aturannhb_pegawai` (`nipguru`),
  KEY `IX_aturannhb_ts` (`ts`,`issync`),
  CONSTRAINT `FK_aturannhb_dasarpenilaian` FOREIGN KEY (`dasarpenilaian`) REFERENCES `dasarpenilaian` (`dasarpenilaian`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturannhb_jenisujian` FOREIGN KEY (`idjenisujian`) REFERENCES `jenisujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturannhb_pegawai` FOREIGN KEY (`nipguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturannhb_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturannhb_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aturannhb`
--

LOCK TABLES `aturannhb` WRITE;
/*!40000 ALTER TABLE `aturannhb` DISABLE KEYS */;
INSERT INTO `aturannhb` VALUES (203,'101',26,45,'Pemahaman Konsep',108,10,1,NULL,NULL,NULL,NULL,'2010-03-02 03:06:17',42437,0),(214,'101',27,45,'Pemahaman Konsep',108,10,1,NULL,NULL,NULL,NULL,'2010-03-02 03:06:17',55114,0),(222,'101',28,45,'Pemahaman Konsep',108,10,1,NULL,NULL,NULL,NULL,'2010-03-02 03:06:17',5132,0);
/*!40000 ALTER TABLE `aturannhb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditnilai`
--

DROP TABLE IF EXISTS `auditnilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditnilai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenisnilai` varchar(45) NOT NULL,
  `idnilai` int(10) unsigned NOT NULL,
  `nasli` decimal(10,2) NOT NULL,
  `nubah` decimal(10,2) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alasan` varchar(255) NOT NULL,
  `pengguna` varchar(100) NOT NULL,
  `informasi` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditnilai`
--

LOCK TABLES `auditnilai` WRITE;
/*!40000 ALTER TABLE `auditnilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditnilai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bobotnau`
--

DROP TABLE IF EXISTS `bobotnau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobotnau` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idinfo` int(10) unsigned DEFAULT NULL,
  `idujian` int(10) unsigned NOT NULL,
  `bobot` int(10) unsigned NOT NULL DEFAULT '0',
  `idaturan` int(10) unsigned DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_bobotnau_infobobot` (`idinfo`),
  KEY `FK_bobotnau_ujian` (`idujian`),
  KEY `IX_bobotnau_ts` (`ts`,`issync`),
  CONSTRAINT `FK_bobotnau_infobobot` FOREIGN KEY (`idinfo`) REFERENCES `infobobotnau` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bobotnau_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bobotnau`
--

LOCK TABLES `bobotnau` WRITE;
/*!40000 ALTER TABLE `bobotnau` DISABLE KEYS */;
/*!40000 ALTER TABLE `bobotnau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calonsiswa`
--

DROP TABLE IF EXISTS `calonsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calonsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) NOT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `nik` varchar(50) DEFAULT NULL,
  `noun` varchar(50) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `idproses` int(10) unsigned NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  `suku` varchar(20) DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `kondisi` varchar(100) DEFAULT NULL,
  `kelamin` varchar(1) DEFAULT NULL,
  `tmplahir` varchar(50) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `warga` varchar(5) DEFAULT NULL,
  `anakke` tinyint(2) unsigned DEFAULT '0',
  `jsaudara` tinyint(2) unsigned DEFAULT '0',
  `statusanak` varchar(10) DEFAULT NULL,
  `jkandung` tinyint(2) unsigned DEFAULT '0',
  `jtiri` tinyint(2) unsigned DEFAULT '0',
  `bahasa` varchar(30) DEFAULT NULL,
  `berat` decimal(4,1) unsigned DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned DEFAULT '0.0',
  `darah` varchar(2) DEFAULT NULL,
  `foto` blob,
  `pinsiswa` varchar(25) NOT NULL,
  `alamatsiswa` varchar(255) DEFAULT NULL,
  `jarak` tinyint(1) unsigned DEFAULT '0',
  `kodepossiswa` varchar(8) DEFAULT NULL,
  `telponsiswa` varchar(20) DEFAULT NULL,
  `hpsiswa` varchar(20) DEFAULT NULL,
  `emailsiswa` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(150) DEFAULT NULL,
  `asalsekolah` varchar(100) DEFAULT NULL,
  `noijasah` varchar(25) DEFAULT NULL,
  `tglijasah` varchar(25) DEFAULT NULL,
  `ketsekolah` varchar(100) DEFAULT NULL,
  `namaayah` varchar(60) DEFAULT NULL,
  `namaibu` varchar(60) DEFAULT NULL,
  `statusayah` varchar(10) DEFAULT NULL,
  `statusibu` varchar(10) DEFAULT NULL,
  `tmplahirayah` varchar(35) DEFAULT NULL,
  `tmplahiribu` varchar(35) DEFAULT NULL,
  `tgllahirayah` varchar(35) DEFAULT NULL,
  `tgllahiribu` varchar(35) DEFAULT NULL,
  `almayah` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `almibu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pendidikanayah` varchar(20) DEFAULT NULL,
  `pendidikanibu` varchar(20) DEFAULT NULL,
  `pekerjaanayah` varchar(60) DEFAULT NULL,
  `pekerjaanibu` varchar(60) DEFAULT NULL,
  `wali` varchar(60) DEFAULT NULL,
  `penghasilanayah` int(10) unsigned DEFAULT '0',
  `penghasilanibu` int(10) unsigned DEFAULT '0',
  `alamatortu` varchar(100) DEFAULT NULL,
  `telponortu` varchar(20) DEFAULT NULL,
  `hportu` varchar(20) DEFAULT NULL,
  `emailayah` varchar(100) DEFAULT NULL,
  `alamatsurat` varchar(100) DEFAULT NULL,
  `keterangan` text,
  `hobi` text,
  `replidsiswa` int(10) unsigned DEFAULT NULL,
  `emailibu` varchar(100) DEFAULT NULL,
  `sum1` decimal(10,0) NOT NULL DEFAULT '0',
  `sum2` decimal(10,0) NOT NULL DEFAULT '0',
  `ujian1` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian2` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian3` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian4` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian5` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian6` decimal(5,2) NOT NULL,
  `ujian7` decimal(5,2) NOT NULL,
  `ujian8` decimal(5,2) NOT NULL,
  `ujian9` decimal(5,2) NOT NULL,
  `ujian10` decimal(5,2) NOT NULL,
  `info1` varchar(20) DEFAULT NULL,
  `info2` varchar(20) DEFAULT NULL,
  `info3` varchar(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nopendaftaran`),
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`),
  KEY `FK_calonsiswa_prosespenerimaansiswa` (`idproses`),
  KEY `FK_calonsiswa_kelompokcalonsiswa` (`idkelompok`),
  KEY `FK_calonsiswa_suku` (`suku`),
  KEY `FK_calonsiswa_agama` (`agama`),
  KEY `FK_calonsiswa_statusiswa` (`status`),
  KEY `FK_calonsiswa_asalsekolah` (`asalsekolah`),
  KEY `FK_calonsiswa_tingkatpendidikan` (`pendidikanayah`),
  KEY `FK_calonsiswa_jenispekerjaan` (`pekerjaanayah`),
  KEY `FK_calonsiswa_tingkatpendidikanibu` (`pendidikanibu`),
  KEY `FK_calonsiswa_jenispekerjaanibu` (`pekerjaanibu`),
  KEY `FK_calonsiswa_kondisisiswa` (`kondisi`),
  KEY `IX_calonsiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_calonsiswa_agama` FOREIGN KEY (`agama`) REFERENCES `jbsumum`.`agama` (`agama`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_asalsekolah` FOREIGN KEY (`asalsekolah`) REFERENCES `asalsekolah` (`sekolah`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_jenispekerjaan` FOREIGN KEY (`pekerjaanayah`) REFERENCES `jbsumum`.`jenispekerjaan` (`pekerjaan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_jenispekerjaanibu` FOREIGN KEY (`pekerjaanibu`) REFERENCES `jbsumum`.`jenispekerjaan` (`pekerjaan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_kelompokcalonsiswa` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokcalonsiswa` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_kondisisiswa` FOREIGN KEY (`kondisi`) REFERENCES `kondisisiswa` (`kondisi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_prosespenerimaansiswa` FOREIGN KEY (`idproses`) REFERENCES `prosespenerimaansiswa` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_statussiswa` FOREIGN KEY (`status`) REFERENCES `statussiswa` (`status`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_suku` FOREIGN KEY (`suku`) REFERENCES `jbsumum`.`suku` (`suku`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_tingkatpendidikan` FOREIGN KEY (`pendidikanayah`) REFERENCES `jbsumum`.`tingkatpendidikan` (`pendidikan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_tingkatpendidikanibu` FOREIGN KEY (`pendidikanibu`) REFERENCES `jbsumum`.`tingkatpendidikan` (`pendidikan`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 196608 kB; (`pendidikanibu`) REFER `jbsumum/tin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calonsiswa`
--

LOCK TABLES `calonsiswa` WRITE;
/*!40000 ALTER TABLE `calonsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `calonsiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dasarpenilaian`
--

DROP TABLE IF EXISTS `dasarpenilaian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dasarpenilaian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dasarpenilaian` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dasarpenilaian`),
  UNIQUE KEY `UX_dasarpenilaian_replid` (`replid`),
  KEY `IX_dasarpenilaian_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dasarpenilaian`
--

LOCK TABLES `dasarpenilaian` WRITE;
/*!40000 ALTER TABLE `dasarpenilaian` DISABLE KEYS */;
INSERT INTO `dasarpenilaian` VALUES (3,'PKON','Pemahaman Konsep',1,NULL,NULL,NULL,'2010-03-02 03:06:17',50529,0),(4,'PRAK','Praktik',1,NULL,NULL,NULL,'2010-03-02 03:06:17',24109,0);
/*!40000 ALTER TABLE `dasarpenilaian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleteddata`
--

DROP TABLE IF EXISTS `deleteddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleteddata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tablename` varchar(100) NOT NULL,
  `rowid` bigint(20) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_deleteddata_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleteddata`
--

LOCK TABLES `deleteddata` WRITE;
/*!40000 ALTER TABLE `deleteddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleteddata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departemen`
--

DROP TABLE IF EXISTS `departemen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departemen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `nipkepsek` varchar(30) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`departemen`),
  UNIQUE KEY `UX_departemen_replid` (`replid`),
  KEY `FK_departemen_pegawai` (`nipkepsek`),
  KEY `IX_departemen_ts` (`ts`,`issync`),
  CONSTRAINT `FK_departemen_pegawai` FOREIGN KEY (`nipkepsek`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departemen`
--

LOCK TABLES `departemen` WRITE;
/*!40000 ALTER TABLE `departemen` DISABLE KEYS */;
INSERT INTO `departemen` VALUES (11,'SMA','101',1,'Sekedar contoh. Menu ini mengatur departemen-departemen yang ada di sekolah. Ubah atau tambahkan data ini sesuai dengan departemen yang ada di sekolah anda.',1,NULL,NULL,NULL,'2010-03-02 03:06:17',34486,0);
/*!40000 ALTER TABLE `departemen` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_departemen_ains AFTER INSERT ON jbsakad.departemen
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.departemen', iddata = NEW.replid, state = 'I', dataload = 1
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_departemen_aupd AFTER UPDATE ON jbsakad.departemen
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.departemen', iddata = OLD.replid, state = 'U', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_departemen_adel AFTER DELETE ON jbsakad.departemen
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.departemen', iddata = OLD.replid, state = 'D', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `guru`
--

DROP TABLE IF EXISTS `guru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `statusguru` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_guru_pegawai` (`nip`),
  KEY `FK_guru_pelajaran` (`idpelajaran`),
  KEY `FK_guru_statusguru` (`statusguru`),
  KEY `IX_guru_ts` (`ts`,`issync`),
  CONSTRAINT `FK_guru_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_guru_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_guru_statusguru` FOREIGN KEY (`statusguru`) REFERENCES `statusguru` (`status`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guru`
--

LOCK TABLES `guru` WRITE;
/*!40000 ALTER TABLE `guru` DISABLE KEYS */;
INSERT INTO `guru` VALUES (44,'101',45,'Guru Pelajaran',1,'',NULL,NULL,NULL,'2010-03-02 03:06:17',34572,0);
/*!40000 ALTER TABLE `guru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infobobotnau`
--

DROP TABLE IF EXISTS `infobobotnau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infobobotnau` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL,
  `idaturan` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infobobotnau_ujian` (`idujian`),
  KEY `IX_infobobotnau_ts` (`ts`,`issync`),
  CONSTRAINT `FK_infobobotnau_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infobobotnau`
--

LOCK TABLES `infobobotnau` WRITE;
/*!40000 ALTER TABLE `infobobotnau` DISABLE KEYS */;
/*!40000 ALTER TABLE `infobobotnau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infobobotujian`
--

DROP TABLE IF EXISTS `infobobotujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infobobotujian` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idjenisujian` int(10) unsigned NOT NULL DEFAULT '0',
  `pilihan` tinyint(4) NOT NULL DEFAULT '0',
  `info` varchar(100) NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infobobotujian_idpelajaran` (`idpelajaran`),
  KEY `FK_infobobotujian_idsemester` (`idsemester`),
  KEY `FK_infobobotujian_idjenis` (`idjenisujian`),
  KEY `FK_infobobotujian_kelas` (`idkelas`),
  KEY `IX_infobobotujian_ts` (`ts`,`issync`),
  CONSTRAINT `FK_infobobotujian_idjenis` FOREIGN KEY (`idjenisujian`) REFERENCES `jenisujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_infobobotujian_idpelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_infobobotujian_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_infobobotujian_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infobobotujian`
--

LOCK TABLES `infobobotujian` WRITE;
/*!40000 ALTER TABLE `infobobotujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `infobobotujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infojadwal`
--

DROP TABLE IF EXISTS `infojadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infojadwal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deskripsi` varchar(100) NOT NULL DEFAULT '',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `terlihat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `idtahunajaran` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infojadwal_tahunajaran` (`idtahunajaran`),
  KEY `IX_infojadwal_ts` (`ts`,`issync`),
  CONSTRAINT `FK_infojadwal_tahunajaran` FOREIGN KEY (`idtahunajaran`) REFERENCES `tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infojadwal`
--

LOCK TABLES `infojadwal` WRITE;
/*!40000 ALTER TABLE `infojadwal` DISABLE KEYS */;
/*!40000 ALTER TABLE `infojadwal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infonap`
--

DROP TABLE IF EXISTS `infonap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infonap` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaimin` decimal(5,2) NOT NULL DEFAULT '0.00',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infonap_pelajaran` (`idpelajaran`),
  KEY `FK_infonap_semester` (`idsemester`),
  KEY `FK_infonap_kelas` (`idkelas`),
  KEY `IX_infonap_ts` (`ts`,`issync`),
  CONSTRAINT `FK_infonap_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_infonap_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_infonap_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infonap`
--

LOCK TABLES `infonap` WRITE;
/*!40000 ALTER TABLE `infonap` DISABLE KEYS */;
/*!40000 ALTER TABLE `infonap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `nipguru` varchar(30) NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `departemen` varchar(50) NOT NULL DEFAULT '',
  `infojadwal` int(10) unsigned NOT NULL DEFAULT '0',
  `hari` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `jamke` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `njam` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sifat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `jam1` time NOT NULL DEFAULT '00:00:00',
  `jam2` time NOT NULL DEFAULT '00:00:00',
  `idjam1` int(10) unsigned NOT NULL DEFAULT '0',
  `idjam2` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jadwal_departemen` (`departemen`),
  KEY `FK_jadwal_pegawai` (`nipguru`),
  KEY `FK_jadwal_jam1` (`idjam1`),
  KEY `FK_jadwal_jam2` (`idjam2`),
  KEY `FK_jadwal_infojadwal` (`infojadwal`),
  KEY `FK_jadwal_pelajaran` (`idpelajaran`),
  KEY `FK_jadwal_kelas` (`idkelas`),
  KEY `IX_jadwal_ts` (`ts`,`issync`),
  CONSTRAINT `FK_jadwal_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_infojadwal` FOREIGN KEY (`infojadwal`) REFERENCES `infojadwal` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_jam` FOREIGN KEY (`idjam1`) REFERENCES `jam` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_jam2` FOREIGN KEY (`idjam2`) REFERENCES `jam` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_pegawai` FOREIGN KEY (`nipguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal`
--

LOCK TABLES `jadwal` WRITE;
/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jam`
--

DROP TABLE IF EXISTS `jam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jam` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jamke` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `departemen` varchar(50) NOT NULL DEFAULT '',
  `jam1` time NOT NULL DEFAULT '00:00:00',
  `jam2` time NOT NULL DEFAULT '00:00:00',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jam_departemen` (`departemen`),
  KEY `IX_jam_ts` (`ts`,`issync`),
  CONSTRAINT `FK_jam_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jam`
--

LOCK TABLES `jam` WRITE;
/*!40000 ALTER TABLE `jam` DISABLE KEYS */;
INSERT INTO `jam` VALUES (34,1,'SMA','06:30:00','08:00:00',NULL,NULL,NULL,'2010-03-02 03:06:17',52283,0),(35,2,'SMA','08:00:00','09:30:00',NULL,NULL,NULL,'2010-03-02 03:06:17',40376,0),(36,3,'SMA','09:30:00','10:00:00',NULL,NULL,NULL,'2010-03-02 03:06:17',45031,0),(37,4,'SMA','10:30:00','12:00:00',NULL,NULL,NULL,'2010-03-02 03:06:17',38498,0),(38,5,'SMA','12:00:00','13:30:00',NULL,NULL,NULL,'2010-03-02 03:06:17',57397,0),(39,6,'SMA','13:30:00','15:00:00',NULL,NULL,NULL,'2010-03-02 03:06:17',40428,0);
/*!40000 ALTER TABLE `jam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenismutasi`
--

DROP TABLE IF EXISTS `jenismutasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenismutasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenismutasi` varchar(45) NOT NULL DEFAULT '',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_jenismutasi_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenismutasi`
--

LOCK TABLES `jenismutasi` WRITE;
/*!40000 ALTER TABLE `jenismutasi` DISABLE KEYS */;
INSERT INTO `jenismutasi` VALUES (2,'Pindah Sekolah','',NULL,NULL,NULL,'2010-03-02 03:06:17',29948,0),(3,'Dikeluarkan','Sekedar contoh. Menu ini mengatur jenis-jenis mutasi siswa. Ubah atau tambahkan data ini sesuai dengan jenis-jenis mutasi siswa yang terjadi.',NULL,NULL,NULL,'2010-03-02 03:06:17',28455,0),(4,'Mengundurkan Diri','',NULL,NULL,NULL,'2010-03-02 03:06:17',52431,0),(5,'Meninggal Dunia','',NULL,NULL,NULL,'2010-03-02 03:06:17',45730,0),(6,'Pindah Tempat Tinggal','',NULL,NULL,NULL,'2010-03-02 03:06:17',5828,0);
/*!40000 ALTER TABLE `jenismutasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenisujian`
--

DROP TABLE IF EXISTS `jenisujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenisujian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenisujian` varchar(50) NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jenisujian_pelajaran` (`idpelajaran`),
  KEY `IX_jenisujian_ts` (`ts`,`issync`),
  CONSTRAINT `FK_jenisujian_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenisujian`
--

LOCK TABLES `jenisujian` WRITE;
/*!40000 ALTER TABLE `jenisujian` DISABLE KEYS */;
INSERT INTO `jenisujian` VALUES (108,'PR',45,'Sekedar contoh. Menu ini mengatur jenis-jenis ujian untuk pengambilan nilai siswa pada setiap pelajaran di sekolah. Ubah atau tambahkan data ini sesuai dengan jenis-jenis ujian yang digunakan di sekolah.','PR',NULL,NULL,'2010-04-16 01:55:23',32036,0);
/*!40000 ALTER TABLE `jenisujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kalenderakademik`
--

DROP TABLE IF EXISTS `kalenderakademik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kalenderakademik` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kalender` varchar(50) NOT NULL DEFAULT '',
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `terlihat` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `idtahunajaran` int(10) unsigned NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_kalenderakademik_tahunajaran` (`idtahunajaran`),
  KEY `FK_kalenderakademik_departemen` (`departemen`),
  KEY `IX_kalenderakademik_ts` (`ts`,`issync`),
  CONSTRAINT `FK_kalenderakademik_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_kalenderakademik_tahunajaran` FOREIGN KEY (`idtahunajaran`) REFERENCES `tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kalenderakademik`
--

LOCK TABLES `kalenderakademik` WRITE;
/*!40000 ALTER TABLE `kalenderakademik` DISABLE KEYS */;
/*!40000 ALTER TABLE `kalenderakademik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kejadianpenting`
--

DROP TABLE IF EXISTS `kejadianpenting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kejadianpenting` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkriteria` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(15) NOT NULL DEFAULT '',
  `nip` varchar(15) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `kejadian` text NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_kejadianpenting_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kejadianpenting`
--

LOCK TABLES `kejadianpenting` WRITE;
/*!40000 ALTER TABLE `kejadianpenting` DISABLE KEYS */;
/*!40000 ALTER TABLE `kejadianpenting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelas` varchar(50) NOT NULL,
  `idtahunajaran` int(10) unsigned NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL,
  `nipwali` varchar(30) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_kelas_pegawai` (`nipwali`),
  KEY `FK_kelas_tahunajaran` (`idtahunajaran`),
  KEY `FK_kelas_tingkat` (`idtingkat`),
  KEY `IX_kelas_ts` (`ts`,`issync`),
  CONSTRAINT `FK_kelas_pegawai` FOREIGN KEY (`nipwali`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_kelas_tahunajaran` FOREIGN KEY (`idtahunajaran`) REFERENCES `tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_kelas_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas`
--

LOCK TABLES `kelas` WRITE;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` VALUES (46,'1-A',20,50,'101',1,'Sekedar contoh. Menu ini mengatur setiap nama kelas yang ada di setiap tingkatan di sekolah. Ubah atau tambahkan data ini sesuai dengan nama-nama kelas di sekolah.',26,NULL,NULL,NULL,'2010-03-02 03:06:17',17056,0);
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_kelas_ains AFTER INSERT ON jbsakad.kelas
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.kelas', iddata = NEW.replid, state = 'I', dataload = 1
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_kelas_aupd AFTER UPDATE ON jbsakad.kelas
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.kelas', iddata = OLD.replid, state = 'U', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_kelas_adel AFTER DELETE ON jbsakad.kelas
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.kelas', iddata = OLD.replid, state = 'D', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kelompokcalonsiswa`
--

DROP TABLE IF EXISTS `kelompokcalonsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompokcalonsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `idproses` int(10) unsigned NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_kelompokcalonsiswa_prosespenerimaansiswa` (`idproses`),
  KEY `IX_kelompokcalonsiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_kelompokcalonsiswa_prosespenerimaansiswa` FOREIGN KEY (`idproses`) REFERENCES `prosespenerimaansiswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompokcalonsiswa`
--

LOCK TABLES `kelompokcalonsiswa` WRITE;
/*!40000 ALTER TABLE `kelompokcalonsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompokcalonsiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompokpelajaran`
--

DROP TABLE IF EXISTS `kelompokpelajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompokpelajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) NOT NULL,
  `kelompok` varchar(45) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompokpelajaran`
--

LOCK TABLES `kelompokpelajaran` WRITE;
/*!40000 ALTER TABLE `kelompokpelajaran` DISABLE KEYS */;
INSERT INTO `kelompokpelajaran` VALUES (1,'KP','Kelompok Pelajaran',1);
/*!40000 ALTER TABLE `kelompokpelajaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komennap`
--

DROP TABLE IF EXISTS `komennap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komennap` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idinfo` int(10) unsigned NOT NULL DEFAULT '0',
  `komentar` text NOT NULL,
  `predikat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_komennap_infonap` (`idinfo`),
  KEY `FK_komennap_siswa` (`nis`),
  KEY `IX_komennap_ts` (`ts`,`issync`),
  CONSTRAINT `FK_komennap_infonap` FOREIGN KEY (`idinfo`) REFERENCES `infonap` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_komennap_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komennap`
--

LOCK TABLES `komennap` WRITE;
/*!40000 ALTER TABLE `komennap` DISABLE KEYS */;
/*!40000 ALTER TABLE `komennap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komenrapor`
--

DROP TABLE IF EXISTS `komenrapor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komenrapor` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) CHARACTER SET utf8 NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `jenis` varchar(3) NOT NULL,
  `komentar` text NOT NULL,
  `predikat` tinyint(1) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_komenrapor_siswa` (`nis`),
  KEY `FK_komenrapor_kelas` (`idkelas`),
  KEY `FK_komenrapor_semester` (`idsemester`),
  CONSTRAINT `FK_komenrapor_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_komenrapor_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_komenrapor_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komenrapor`
--

LOCK TABLES `komenrapor` WRITE;
/*!40000 ALTER TABLE `komenrapor` DISABLE KEYS */;
/*!40000 ALTER TABLE `komenrapor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kondisisiswa`
--

DROP TABLE IF EXISTS `kondisisiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kondisisiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kondisi` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kondisi`),
  UNIQUE KEY `UX_kondisisiswa` (`replid`),
  KEY `IX_kondisisiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kondisisiswa`
--

LOCK TABLES `kondisisiswa` WRITE;
/*!40000 ALTER TABLE `kondisisiswa` DISABLE KEYS */;
INSERT INTO `kondisisiswa` VALUES (8,'Berkecukupan',1,NULL,NULL,NULL,'2010-03-02 03:06:17',30009,0),(9,'Kurang Mampu',2,NULL,NULL,NULL,'2010-03-02 03:06:17',54640,0);
/*!40000 ALTER TABLE `kondisisiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kriteriakejadian`
--

DROP TABLE IF EXISTS `kriteriakejadian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kriteriakejadian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kriteria` varchar(50) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_kriteriakejadian_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kriteriakejadian`
--

LOCK TABLES `kriteriakejadian` WRITE;
/*!40000 ALTER TABLE `kriteriakejadian` DISABLE KEYS */;
/*!40000 ALTER TABLE `kriteriakejadian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mutasisiswa`
--

DROP TABLE IF EXISTS `mutasisiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mutasisiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `jenismutasi` int(10) unsigned NOT NULL DEFAULT '0',
  `tglmutasi` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_mutasisiswa_jenismutasi` (`jenismutasi`),
  KEY `FK_mutasisiswa_siswa` (`nis`),
  KEY `FK_mutasisiswa_departemen` (`departemen`),
  KEY `IX_mutasisiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_mutasisiswa_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_mutasisiswa_jenismutasi` FOREIGN KEY (`jenismutasi`) REFERENCES `jenismutasi` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_mutasisiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutasisiswa`
--

LOCK TABLES `mutasisiswa` WRITE;
/*!40000 ALTER TABLE `mutasisiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `mutasisiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nap`
--

DROP TABLE IF EXISTS `nap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nap` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL DEFAULT '',
  `idaturan` int(10) unsigned NOT NULL DEFAULT '0',
  `idinfo` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaiangka` decimal(10,2) NOT NULL DEFAULT '0.00',
  `nilaihuruf` varchar(2) NOT NULL DEFAULT '',
  `komentar` text NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_nap_infonap` (`idinfo`),
  KEY `FK_nap_siswa` (`nis`),
  KEY `FK_nap_aturannhb` (`idaturan`),
  KEY `IX_nap_ts` (`ts`,`issync`),
  CONSTRAINT `FK_nap_aturannhb` FOREIGN KEY (`idaturan`) REFERENCES `aturannhb` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nap_infonap` FOREIGN KEY (`idinfo`) REFERENCES `infonap` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nap_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nap`
--

LOCK TABLES `nap` WRITE;
/*!40000 ALTER TABLE `nap` DISABLE KEYS */;
/*!40000 ALTER TABLE `nap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nau`
--

DROP TABLE IF EXISTS `nau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nau` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(20) NOT NULL,
  `idkelas` int(10) unsigned DEFAULT NULL,
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idjenis` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaiAU` decimal(10,2) NOT NULL DEFAULT '0.00',
  `keterangan` varchar(255) DEFAULT NULL,
  `idaturan` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_nau_idpelajaran` (`idpelajaran`),
  KEY `FK_nau_nis` (`nis`),
  KEY `FK_nau_idsemester` (`idsemester`),
  KEY `FK_nau_idjenis` (`idjenis`),
  KEY `FK_nau_idaturan` (`idaturan`),
  KEY `FK_nau_kelas` (`idkelas`),
  KEY `IX_nau_ts` (`ts`,`issync`),
  CONSTRAINT `FK_nau_idaturan` FOREIGN KEY (`idaturan`) REFERENCES `aturannhb` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nau_idjenis` FOREIGN KEY (`idjenis`) REFERENCES `jenisujian` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nau_idpelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nau_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nau_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nau_nis` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nau`
--

LOCK TABLES `nau` WRITE;
/*!40000 ALTER TABLE `nau` DISABLE KEYS */;
/*!40000 ALTER TABLE `nau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nilaiujian`
--

DROP TABLE IF EXISTS `nilaiujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nilaiujian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(20) NOT NULL,
  `nilaiujian` decimal(10,2) NOT NULL DEFAULT '0.00',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_nilaiujian_idujian` (`idujian`),
  KEY `FK_nilaiujian_nis` (`nis`),
  KEY `IX_nilaiujian_ts` (`ts`,`issync`),
  CONSTRAINT `FK_nilaiujian_idujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nilaiujian_nis` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nilaiujian`
--

LOCK TABLES `nilaiujian` WRITE;
/*!40000 ALTER TABLE `nilaiujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `nilaiujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelajaran`
--

DROP TABLE IF EXISTS `pelajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  `sifat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_daftarpelajaran_kode` (`kode`),
  KEY `FK_pelajaran_departemen` (`departemen`),
  KEY `IX_pelajaran_ts` (`ts`,`issync`),
  KEY `FK_pelajaran_kelompokpelajaran` (`idkelompok`),
  CONSTRAINT `FK_pelajaran_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pelajaran_kelompokpelajaran` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokpelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelajaran`
--

LOCK TABLES `pelajaran` WRITE;
/*!40000 ALTER TABLE `pelajaran` DISABLE KEYS */;
INSERT INTO `pelajaran` VALUES (45,'FIS','Fisika','SMA',1,1,1,'Sekedar contoh. Menu ini mengatur nama dan kode pelajaran yang diajarkan di sekolah. Ubah atau tambahkan data ini sesuai dengan pelajaran-pelajaran yang ada di sekolah.',NULL,NULL,NULL,'2018-04-02 04:16:10',52115,0);
/*!40000 ALTER TABLE `pelajaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phsiswa`
--

DROP TABLE IF EXISTS `phsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpresensi` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `hadir` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ijin` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sakit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cuti` smallint(5) unsigned NOT NULL DEFAULT '0',
  `alpa` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_phsiswa_siswa` (`nis`),
  KEY `FK_phsiswa_presensiharian` (`idpresensi`),
  KEY `IX_phsiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_phsiswa_presensiharian` FOREIGN KEY (`idpresensi`) REFERENCES `presensiharian` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_phsiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phsiswa`
--

LOCK TABLES `phsiswa` WRITE;
/*!40000 ALTER TABLE `phsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `phsiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilihandata`
--

DROP TABLE IF EXISTS `pilihandata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilihandata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtambahan` int(10) unsigned NOT NULL,
  `pilihan` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urutan` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_pilihandata_tambahandata` (`idtambahan`),
  CONSTRAINT `FK_pilihandata_tambahandata` FOREIGN KEY (`idtambahan`) REFERENCES `tambahandata` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihandata`
--

LOCK TABLES `pilihandata` WRITE;
/*!40000 ALTER TABLE `pilihandata` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilihandata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilihkomenpel`
--

DROP TABLE IF EXISTS `pilihkomenpel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilihkomenpel` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL,
  `dasarpenilaian` varchar(50) CHARACTER SET utf8 NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `komentar` text NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_pilihkomenpel_pelajaran` (`idpelajaran`),
  KEY `FK_pilihkomenpel_dasarpenilaian` (`dasarpenilaian`),
  KEY `FK_pilihkomenpel_tingkat` (`idtingkat`),
  CONSTRAINT `FK_pilihkomenpel_dasarpenilaian` FOREIGN KEY (`dasarpenilaian`) REFERENCES `dasarpenilaian` (`dasarpenilaian`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pilihkomenpel_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pilihkomenpel_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihkomenpel`
--

LOCK TABLES `pilihkomenpel` WRITE;
/*!40000 ALTER TABLE `pilihkomenpel` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilihkomenpel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilihkomensos`
--

DROP TABLE IF EXISTS `pilihkomensos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilihkomensos` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL,
  `jenis` varchar(3) NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `komentar` text NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_pilihkomensos_pelajaran` (`idpelajaran`),
  KEY `FK_pilihkomensos_tingkat` (`idtingkat`),
  CONSTRAINT `FK_pilihkomensos_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pilihkomensos_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihkomensos`
--

LOCK TABLES `pilihkomensos` WRITE;
/*!40000 ALTER TABLE `pilihkomensos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilihkomensos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppsiswa`
--

DROP TABLE IF EXISTS `ppsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpp` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(20) NOT NULL,
  `statushadir` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Hadir; 1 Sakit; 2 Ijin; 3 Alpa; 4 Cuti',
  `catatan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_ppsiswa_presensipelajaran` (`idpp`),
  KEY `FK_ppsiswa_siswa` (`nis`),
  KEY `IX_ppsiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_ppsiswa_presensipelajaran` FOREIGN KEY (`idpp`) REFERENCES `presensipelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ppsiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Presensi kehadiran siswa dalam pelajaran';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppsiswa`
--

LOCK TABLES `ppsiswa` WRITE;
/*!40000 ALTER TABLE `ppsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppsiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_ppsiswa_ppsiswahadir_100` AFTER INSERT ON `ppsiswa` FOR EACH ROW BEGIN
	DECLARE xidkelas INT;
	DECLARE xidsemester INT;
	DECLARE xidpelajaran INT;
	DECLARE xgurupelajaran VARCHAR(20);
	DECLARE xbulan INT;
	DECLARE xtahun INT;
	DECLARE xcount INT;
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		IF NEW.statushadir = 0 THEN
		
			SELECT idkelas, idsemester, idpelajaran, gurupelajaran, MONTH(tanggal), YEAR(tanggal)
			  INTO xidkelas, xidsemester, xidpelajaran, xgurupelajaran, xbulan, xtahun
			  FROM jbsakad.presensipelajaran WHERE replid = NEW.idpp;

			INSERT INTO jbsakad.ppsiswahadir 
			SET nis = NEW.nis, idkelas = xidkelas, idsemester = xidsemester,
				idpelajaran = xidpelajaran, gurupelajaran = xgurupelajaran, bulan = xbulan, tahun = xtahun, 
				hadir = 1, token = FLOOR(1 + (RAND() * 65530))
			ON DUPLICATE KEY
			UPDATE hadir = hadir + 1, issync = 0, ts = CURRENT_TIMESTAMP;
		
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_ppsiswa_ppsiswahadir_100` AFTER UPDATE ON `ppsiswa` FOR EACH ROW BEGIN
	DECLARE xidkelas INT;
	DECLARE xidsemester INT;
	DECLARE xidpelajaran INT;
	DECLARE xgurupelajaran VARCHAR(20);
	DECLARE xbulan INT;
	DECLARE xtahun INT;
	DECLARE xcount INT;
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		IF NEW.statushadir = 0 AND OLD.statushadir <> 0 THEN
		
			SELECT idkelas, idsemester, idpelajaran, gurupelajaran, MONTH(tanggal), YEAR(tanggal)
			  INTO xidkelas, xidsemester, xidpelajaran, xgurupelajaran, xbulan, xtahun
				FROM jbsakad.presensipelajaran WHERE replid = NEW.idpp;

			INSERT INTO jbsakad.ppsiswahadir 
			SET nis = NEW.nis, idkelas = xidkelas, idsemester = xidsemester,
				idpelajaran = xidpelajaran, gurupelajaran = xgurupelajaran, bulan = xbulan, tahun = xtahun, 
				hadir = 1, token = FLOOR(1 + (RAND() * 65530))
			ON DUPLICATE KEY
			UPDATE hadir = hadir + 1, issync = 0, ts = CURRENT_TIMESTAMP;
			
		ElSEIF NEW.statushadir <> 0 AND OLD.statushadir = 0 THEN
		
			SELECT idkelas, idsemester, idpelajaran, gurupelajaran, MONTH(tanggal), YEAR(tanggal)
			  INTO xidkelas, xidsemester, xidpelajaran, xgurupelajaran, xbulan, xtahun
				FROM jbsakad.presensipelajaran WHERE replid = NEW.idpp;
			
			UPDATE jbsakad.ppsiswahadir SET hadir = hadir - 1, issync = 0, ts = CURRENT_TIMESTAMP
			  WHERE nis = NEW.nis AND idkelas = xidkelas AND 
			    idsemester = xidsemester AND idpelajaran = xidpelajaran AND
			    gurupelajaran = xgurupelajaran AND bulan = xbulan AND tahun = xtahun;
				
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ppsiswahadir`
--

DROP TABLE IF EXISTS `ppsiswahadir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppsiswahadir` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `gurupelajaran` varchar(30) NOT NULL,
  `bulan` tinyint(1) unsigned NOT NULL,
  `tahun` smallint(5) unsigned NOT NULL,
  `hadir` smallint(5) unsigned NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_ppsiswahadir` (`nis`,`idkelas`,`idsemester`,`idpelajaran`,`gurupelajaran`,`bulan`,`tahun`),
  KEY `FK_ppsiswahadir_siswa` (`nis`),
  KEY `FK_ppsiswahadir_kelas` (`idkelas`),
  KEY `FK_ppsiswahadir_semester` (`idsemester`),
  KEY `FK_ppsiswahadir_pelajaran` (`idpelajaran`),
  KEY `FK_ppsiswahadir_pegawai` (`gurupelajaran`),
  CONSTRAINT `FK_ppsiswahadir_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ppsiswahadir_pegawai` FOREIGN KEY (`gurupelajaran`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ppsiswahadir_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ppsiswahadir_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ppsiswahadir_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppsiswahadir`
--

LOCK TABLES `ppsiswahadir` WRITE;
/*!40000 ALTER TABLE `ppsiswahadir` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppsiswahadir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presensiharian`
--

DROP TABLE IF EXISTS `presensiharian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presensiharian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL,
  `tanggal2` date NOT NULL,
  `hariaktif` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_presensiharian_semester` (`idsemester`),
  KEY `IX_presensiharian_tanggal1` (`tanggal1`),
  KEY `IX_presensiharian_tanggal2` (`tanggal2`),
  KEY `FK_presensiharian_kelas` (`idkelas`),
  KEY `IX_presensiharian_ts` (`ts`,`issync`),
  CONSTRAINT `FK_presensiharian_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_presensiharian_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presensiharian`
--

LOCK TABLES `presensiharian` WRITE;
/*!40000 ALTER TABLE `presensiharian` DISABLE KEYS */;
/*!40000 ALTER TABLE `presensiharian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presensipelajaran`
--

DROP TABLE IF EXISTS `presensipelajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presensipelajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `jam` time NOT NULL DEFAULT '00:00:00',
  `gurupelajaran` varchar(30) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `materi` varchar(1000) NOT NULL DEFAULT '',
  `objektif` varchar(255) DEFAULT NULL,
  `refleksi` varchar(255) DEFAULT NULL,
  `rencana` varchar(255) DEFAULT NULL,
  `keterlambatan` tinyint(4) DEFAULT NULL,
  `jumlahjam` decimal(4,2) NOT NULL DEFAULT '0.00',
  `jenisguru` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(20) DEFAULT NULL,
  `info2` varchar(20) DEFAULT NULL,
  `info3` varchar(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_presensipelajaran_semester` (`idsemester`),
  KEY `FK_presensipelajaran_jenisguru` (`jenisguru`),
  KEY `FK_presensipelajaran_pelajaran` (`idpelajaran`),
  KEY `FK_presensipelajaran_pegawai` (`gurupelajaran`),
  KEY `FK_presensipelajaran_kelas` (`idkelas`),
  KEY `IX_presensipelajaran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_presensipelajaran_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_presensipelajaran_pegawai` FOREIGN KEY (`gurupelajaran`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_presensipelajaran_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_presensipelajaran_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_presensipelajaran_statusguru` FOREIGN KEY (`jenisguru`) REFERENCES `statusguru` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informasi presensi kehadiran guru dan siswa per mata pelajar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presensipelajaran`
--

LOCK TABLES `presensipelajaran` WRITE;
/*!40000 ALTER TABLE `presensipelajaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `presensipelajaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prosespenerimaansiswa`
--

DROP TABLE IF EXISTS `prosespenerimaansiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prosespenerimaansiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proses` varchar(100) NOT NULL,
  `kodeawalan` varchar(5) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_prosespenerimaansiswa_departemen` (`departemen`),
  KEY `IX_prosespenerimaansiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_prosespenerimaansiswa_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prosespenerimaansiswa`
--

LOCK TABLES `prosespenerimaansiswa` WRITE;
/*!40000 ALTER TABLE `prosespenerimaansiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `prosespenerimaansiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratauk`
--

DROP TABLE IF EXISTS `ratauk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratauk` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idujian` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaiRK` decimal(10,2) NOT NULL DEFAULT '0.00',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_ratauk_idsemester` (`idsemester`),
  KEY `FK_ratauk_idujian` (`idujian`),
  KEY `FK_ratauk_kelas` (`idkelas`),
  KEY `IX_ratauk_ts` (`ts`,`issync`),
  CONSTRAINT `FK_ratauk_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ratauk_idujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ratauk_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratauk`
--

LOCK TABLES `ratauk` WRITE;
/*!40000 ALTER TABLE `ratauk` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratauk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rataus`
--

DROP TABLE IF EXISTS `rataus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rataus` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idkelas` int(10) unsigned DEFAULT NULL,
  `idjenis` int(10) unsigned NOT NULL DEFAULT '0',
  `rataUS` decimal(10,2) NOT NULL DEFAULT '0.00',
  `keterangan` varchar(255) DEFAULT NULL,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `idaturan` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_rataus_nis` (`nis`),
  KEY `FK_rataus_idsemester` (`idsemester`),
  KEY `FK_rataus_jenis` (`idjenis`),
  KEY `FK_rataus_idpelajaran` (`idpelajaran`),
  KEY `FK_rataus_kelas` (`idkelas`),
  KEY `IX_rataus_ts` (`ts`,`issync`),
  CONSTRAINT `FK_rataus_idpelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_rataus_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_rataus_jenis` FOREIGN KEY (`idjenis`) REFERENCES `jenisujian` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_rataus_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_rataus_nis` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rataus`
--

LOCK TABLES `rataus` WRITE;
/*!40000 ALTER TABLE `rataus` DISABLE KEYS */;
/*!40000 ALTER TABLE `rataus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayatdeptsiswa`
--

DROP TABLE IF EXISTS `riwayatdeptsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayatdeptsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `mulai` date NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '0 -> Baru, 1 -> Siswa Pindah Departemen',
  `keterangan` varchar(255) DEFAULT NULL,
  `nislama` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_riwayatdeptsiswa_departemen` (`departemen`),
  KEY `FK_riwayatdeptsiswa_siswa` (`nis`),
  KEY `IX_riwayatdeptsiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_riwayatdeptsiswa_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_riwayatdeptsiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayatdeptsiswa`
--

LOCK TABLES `riwayatdeptsiswa` WRITE;
/*!40000 ALTER TABLE `riwayatdeptsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `riwayatdeptsiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayatfoto`
--

DROP TABLE IF EXISTS `riwayatfoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayatfoto` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `foto` mediumblob NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_riwayatfoto_siswa` (`nis`),
  KEY `FK_riwayatfoto_pegawai` (`nip`),
  KEY `FK_riwayatfoto_calonsiswa` (`nic`),
  KEY `IX_riwayatfoto_tanggal` (`tanggal`),
  CONSTRAINT `FK_riwayatfoto_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_riwayatfoto_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_riwayatfoto_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayatfoto`
--

LOCK TABLES `riwayatfoto` WRITE;
/*!40000 ALTER TABLE `riwayatfoto` DISABLE KEYS */;
INSERT INTO `riwayatfoto` VALUES (1,NULL,'101',NULL,'����\0JFIF\0\0\0\0\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 70\n��\0C\0\n\n\n\n\r\r#%$\"\"!&+7/&)4)!\"0A149;>>>%.DIC<H7=>;��\0C\n\r;(\"(;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;��\0\0P\0:\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�յ]J=b�8��Qw\n�#\0MT:Ϋ�\0A�����N��\'W������k+S���-��̣���(k�]�\0&���%bO�Xr�K�V!no�	i�?δ��\0ɭ��u\"�?�;٩��ec�mY�I��*\0�a�K�Lm���%\ZV~�e��c��w�\0��k\'S�~�n�o��t��n*����U̗v!��C�ϩ��\r׵�8�o?���z���e��f�	$䓁^0��m7�Av���?�@{��u��?��\03\\���-�ez	��q�k����\'����\0��\"�K�xd�I��R~3펼zP�z�\Z>�rE4��.jE�m%�7����pEOs��ڝ���H�`�q�jy4�3�<E�b�p=(!�c����,k\"����&��Ö����?��@z}��e���+h�$\0�{�7i\r��Q��G���>�w��(�t�_Ӹ�-��\"���u�Z��\0�k�\0\\S�\n\0�5_��s�\0-����	d�MѹV�2=*Ʃ�\0!{����\0��7�\"]�:����\0t�t��G)F�e�MP���H�u�)���F�ݜ�V��<�v6�	W�84�[���X�+\0����\0l\\�+i�6�°��Y��l\\�Q��[zĲŦ;�T<�\"*�����?�7+��S��P.9�Z��A����?��-u��R��\0�}��r_�(����TԖ �\"O\"y��͓ҳ/D�֑���\'���c��[���nu��rz�����o���v�3�Q{�;�Q��X�2��x�7����}j�	H��=�(�¸_�Ikf4hQ������ �G��e���!�V�\"cq�[�;}(��Y�V�{���eh����c���f�-�/�\\B�0Ĩ �ȪZN�ڍ�Қ7��9	���q���Vmaiׯ��r����#\Z��!��	l+�}?�U��c�4�G��tW�궒.�l����a�\r{��\0Ѭ@9g��(���#�5�3��3y�GN�����M�l� \0t*}��׬�C}�.��H�h� K��[w-��N��j�<Q0���k	!E\"6*Y?vbU�$gw|P\r�����;BA���\0f��7�C�n���~��k�R�S��.4�Av�%_-X4cpR�<�y��V�YM?J��6���cw�A�m�o���s�P�i\0	� o%Ao^M&�v_��5z�x�\"��\0c؇-��$g�e9�������O_�k�a4q�(�8_%��\0AKo\0㟜�>����\0�E���*�[#�׹i`\r&�/Ac����e�5�+w�Z�)2�c�-�G�9a�s��8\0�ʡT*�\0\0v���','2020-03-25 13:25:39');
/*!40000 ALTER TABLE `riwayatfoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayatkelassiswa`
--

DROP TABLE IF EXISTS `riwayatkelassiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayatkelassiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `mulai` date NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '0 -> Baru, 1 -> Naik, 2 -> Tidak Naik, 3-> Pindah',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_riwayatkelassiswa_siswa` (`nis`),
  KEY `FK_riwayatkelassiswa_kelas` (`idkelas`),
  KEY `IX_riwayatkelassiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_riwayatkelassiswa_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_riwayatkelassiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayatkelassiswa`
--

LOCK TABLES `riwayatkelassiswa` WRITE;
/*!40000 ALTER TABLE `riwayatkelassiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `riwayatkelassiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rpp`
--

DROP TABLE IF EXISTS `rpp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtingkat` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `koderpp` varchar(20) NOT NULL,
  `rpp` varchar(255) NOT NULL,
  `deskripsi` text,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_rpp_tingkat` (`idtingkat`),
  KEY `FK_rpp_semester` (`idsemester`),
  KEY `FK_rpp_pelajaran` (`idpelajaran`),
  KEY `IX_rpp_ts` (`ts`,`issync`),
  CONSTRAINT `FK_rpp_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rpp_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rpp_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rpp`
--

LOCK TABLES `rpp` WRITE;
/*!40000 ALTER TABLE `rpp` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `semester` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_semester_departemen` (`departemen`),
  KEY `IX_semester_ts` (`ts`,`issync`),
  CONSTRAINT `FK_semester_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (20,'Semester I','SMA',1,'Sekedar contoh. Menu ini mengatur setiap nama  semester yang ada di departemen sekolah. Setiap pergantian semester, pengguna harus mengubah status aktif semester ini. Ubah atau tambahkan data ini sesuai dengan nama semester yang digunakan disekolah anda.',NULL,NULL,NULL,'2010-03-02 03:06:18',6418,0);
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_semester_ains AFTER INSERT ON jbsakad.semester
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.semester', iddata = NEW.replid, state = 'I', dataload = 1
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_semester_aupd AFTER UPDATE ON jbsakad.semester
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.semester', iddata = OLD.replid, state = 'U', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_semester_adel AFTER DELETE ON jbsakad.semester
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.semester', iddata = OLD.replid, state = 'D', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `settingpsb`
--

DROP TABLE IF EXISTS `settingpsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settingpsb` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idproses` int(10) unsigned NOT NULL,
  `kdsum1` varchar(5) DEFAULT NULL,
  `nmsum1` varchar(100) DEFAULT NULL,
  `kdsum2` varchar(5) DEFAULT NULL,
  `nmsum2` varchar(100) DEFAULT NULL,
  `kdujian1` varchar(5) DEFAULT NULL,
  `nmujian1` varchar(100) DEFAULT NULL,
  `kdujian2` varchar(5) DEFAULT NULL,
  `nmujian2` varchar(100) DEFAULT NULL,
  `kdujian3` varchar(5) DEFAULT NULL,
  `nmujian3` varchar(100) DEFAULT NULL,
  `kdujian4` varchar(5) DEFAULT NULL,
  `nmujian4` varchar(100) DEFAULT NULL,
  `kdujian5` varchar(5) DEFAULT NULL,
  `nmujian5` varchar(100) DEFAULT NULL,
  `kdujian6` varchar(5) DEFAULT NULL,
  `nmujian6` varchar(100) DEFAULT NULL,
  `kdujian7` varchar(5) DEFAULT NULL,
  `nmujian7` varchar(100) DEFAULT NULL,
  `kdujian8` varchar(5) DEFAULT NULL,
  `nmujian8` varchar(100) DEFAULT NULL,
  `kdujian9` varchar(5) DEFAULT NULL,
  `nmujian9` varchar(100) DEFAULT NULL,
  `kdujian10` varchar(5) DEFAULT NULL,
  `nmujian10` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_settingpsb_prosespsb` (`idproses`),
  CONSTRAINT `FK_settingpsb_prosespsb` FOREIGN KEY (`idproses`) REFERENCES `prosespenerimaansiswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settingpsb`
--

LOCK TABLES `settingpsb` WRITE;
/*!40000 ALTER TABLE `settingpsb` DISABLE KEYS */;
/*!40000 ALTER TABLE `settingpsb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `nik` varchar(50) DEFAULT NULL,
  `noun` varchar(50) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `idangkatan` int(10) unsigned NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `suku` varchar(20) DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `kondisi` varchar(100) DEFAULT NULL,
  `kelamin` varchar(1) DEFAULT NULL,
  `tmplahir` varchar(50) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `warga` varchar(5) DEFAULT NULL,
  `anakke` tinyint(2) unsigned DEFAULT '0',
  `jsaudara` tinyint(2) unsigned DEFAULT '0',
  `statusanak` varchar(10) DEFAULT NULL,
  `jkandung` tinyint(2) unsigned DEFAULT '0',
  `jtiri` tinyint(2) unsigned DEFAULT '0',
  `bahasa` varchar(60) DEFAULT NULL,
  `berat` decimal(4,1) unsigned DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned DEFAULT '0.0',
  `darah` varchar(2) DEFAULT NULL,
  `foto` mediumblob,
  `alamatsiswa` varchar(255) DEFAULT NULL,
  `jarak` tinyint(1) unsigned DEFAULT '0',
  `kodepossiswa` varchar(8) DEFAULT NULL,
  `telponsiswa` varchar(20) DEFAULT NULL,
  `hpsiswa` varchar(20) DEFAULT NULL,
  `emailsiswa` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(150) DEFAULT NULL,
  `asalsekolah` varchar(100) DEFAULT NULL,
  `noijasah` varchar(25) DEFAULT NULL,
  `tglijasah` varchar(25) DEFAULT NULL,
  `ketsekolah` varchar(100) DEFAULT NULL,
  `namaayah` varchar(60) DEFAULT NULL,
  `namaibu` varchar(60) DEFAULT NULL,
  `statusayah` varchar(10) DEFAULT NULL,
  `statusibu` varchar(10) DEFAULT NULL,
  `tmplahirayah` varchar(35) DEFAULT NULL,
  `tmplahiribu` varchar(35) DEFAULT NULL,
  `tgllahirayah` varchar(35) DEFAULT NULL,
  `tgllahiribu` varchar(35) DEFAULT NULL,
  `almayah` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `almibu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pendidikanayah` varchar(20) DEFAULT NULL,
  `pendidikanibu` varchar(20) DEFAULT NULL,
  `pekerjaanayah` varchar(60) DEFAULT NULL,
  `pekerjaanibu` varchar(60) DEFAULT NULL,
  `wali` varchar(60) DEFAULT NULL,
  `penghasilanayah` int(10) unsigned DEFAULT '0',
  `penghasilanibu` int(10) unsigned DEFAULT '0',
  `alamatortu` varchar(100) DEFAULT NULL,
  `telponortu` varchar(20) DEFAULT NULL,
  `hportu` varchar(20) DEFAULT NULL,
  `emailayah` varchar(100) DEFAULT NULL,
  `alamatsurat` varchar(100) DEFAULT NULL,
  `keterangan` text,
  `hobi` text,
  `frompsb` tinyint(1) unsigned DEFAULT '0',
  `ketpsb` varchar(100) DEFAULT NULL,
  `statusmutasi` int(10) unsigned DEFAULT NULL,
  `alumni` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 bukan alumni, 1 alumni',
  `pinsiswa` varchar(25) NOT NULL,
  `pinortu` varchar(25) NOT NULL,
  `pinortuibu` varchar(25) NOT NULL,
  `emailibu` varchar(100) DEFAULT NULL,
  `info1` varchar(20) DEFAULT NULL,
  `info2` varchar(20) DEFAULT NULL,
  `info3` varchar(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nis`),
  UNIQUE KEY `UX_siswa_replid` (`replid`),
  KEY `FK_siswa_angkatan` (`idangkatan`),
  KEY `FK_siswa_suku` (`suku`),
  KEY `FK_siswa_agama` (`agama`),
  KEY `FK_siswa_status` (`status`),
  KEY `FK_siswa_kondisi` (`kondisi`),
  KEY `FK_siswa_pendidikanayah` (`pendidikanayah`),
  KEY `FK_siswa_pendidikanibu` (`pendidikanibu`),
  KEY `FK_siswa_pekerjaanayah` (`pekerjaanayah`),
  KEY `FK_siswa_pekerjaanibu` (`pekerjaanibu`),
  KEY `FK_siswa_statusmutasi` (`statusmutasi`),
  KEY `FK_siswa_kelas` (`idkelas`),
  KEY `FK_siswa_asalsekolah` (`asalsekolah`),
  KEY `IX_siswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_siswa_agama` FOREIGN KEY (`agama`) REFERENCES `jbsumum`.`agama` (`agama`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_angkatan` FOREIGN KEY (`idangkatan`) REFERENCES `angkatan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_asalsekolah` FOREIGN KEY (`asalsekolah`) REFERENCES `asalsekolah` (`sekolah`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_kondisi` FOREIGN KEY (`kondisi`) REFERENCES `kondisisiswa` (`kondisi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_pekerjaanayah` FOREIGN KEY (`pekerjaanayah`) REFERENCES `jbsumum`.`jenispekerjaan` (`pekerjaan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_pekerjaanibu` FOREIGN KEY (`pekerjaanibu`) REFERENCES `jbsumum`.`jenispekerjaan` (`pekerjaan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_pendidikanayah` FOREIGN KEY (`pendidikanayah`) REFERENCES `jbsumum`.`tingkatpendidikan` (`pendidikan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_pendidikanibu` FOREIGN KEY (`pendidikanibu`) REFERENCES `jbsumum`.`tingkatpendidikan` (`pendidikan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_status` FOREIGN KEY (`status`) REFERENCES `statussiswa` (`status`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_statusmutasi` FOREIGN KEY (`statusmutasi`) REFERENCES `jenismutasi` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_suku` FOREIGN KEY (`suku`) REFERENCES `jbsumum`.`suku` (`suku`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siswa`
--

LOCK TABLES `siswa` WRITE;
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_siswa_ains AFTER INSERT ON jbsakad.siswa
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.siswa', iddata = NEW.replid, state = 'I', dataload = 2
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_siswa_aupd AFTER UPDATE ON jbsakad.siswa
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.siswa', iddata = OLD.replid, state = 'U', dataload = 2
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_siswa_adel AFTER DELETE ON jbsakad.siswa
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.siswa', iddata = OLD.replid, state = 'D', dataload = 2
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `statusguru`
--

DROP TABLE IF EXISTS `statusguru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statusguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`status`),
  UNIQUE KEY `UX_statusguru_replid` (`replid`),
  KEY `IX_statusguru_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusguru`
--

LOCK TABLES `statusguru` WRITE;
/*!40000 ALTER TABLE `statusguru` DISABLE KEYS */;
INSERT INTO `statusguru` VALUES (8,'Asisten','Sekedar contoh. Menu ini mengatur status setiap guru yang mengajar di sekolah. Ubah atau tambahkan data ini sesuai dengan status guru yang ada di sekolah.',NULL,NULL,NULL,'2010-03-02 03:06:18',11638,0),(7,'Guru Honorer','',NULL,NULL,NULL,'2010-03-02 03:06:18',52760,0),(6,'Guru Pelajaran','',NULL,NULL,NULL,'2010-03-02 03:06:18',32293,0);
/*!40000 ALTER TABLE `statusguru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statussiswa`
--

DROP TABLE IF EXISTS `statussiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statussiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`status`),
  UNIQUE KEY `UX_statussiswa` (`replid`),
  KEY `IX_statussiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statussiswa`
--

LOCK TABLES `statussiswa` WRITE;
/*!40000 ALTER TABLE `statussiswa` DISABLE KEYS */;
INSERT INTO `statussiswa` VALUES (7,'Eksklusif',2,NULL,NULL,NULL,'2010-03-02 03:06:18',3185,0),(6,'Reguler',1,NULL,NULL,NULL,'2010-03-02 03:06:18',50107,0);
/*!40000 ALTER TABLE `statussiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tahunajaran`
--

DROP TABLE IF EXISTS `tahunajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tahunajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `tglmulai` date NOT NULL,
  `tglakhir` date NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_tahunajaran_departemen` (`departemen`),
  KEY `IX_tahunajaran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_tahunajaran_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tahunajaran`
--

LOCK TABLES `tahunajaran` WRITE;
/*!40000 ALTER TABLE `tahunajaran` DISABLE KEYS */;
INSERT INTO `tahunajaran` VALUES (20,'2009/2010','SMA','2009-06-01','2010-07-30',1,'Sekedar contoh. Nama tahun ajaran yang berlangsung di departemen sekolah. Ubah atau tambahkan data ini sesuai dengan nama tahun ajaran yang ada di sekolah.',NULL,NULL,NULL,'2010-03-18 02:53:06',44390,0);
/*!40000 ALTER TABLE `tahunajaran` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_tahunajaran_ains AFTER INSERT ON jbsakad.tahunajaran
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.tahunajaran', iddata = NEW.replid, state = 'I', dataload = 1
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_tahunajaran_aupd AFTER UPDATE ON jbsakad.tahunajaran
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.tahunajaran', iddata = OLD.replid, state = 'U', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_tahunajaran_adel AFTER DELETE ON jbsakad.tahunajaran
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.tahunajaran', iddata = OLD.replid, state = 'D', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tambahandata`
--

DROP TABLE IF EXISTS `tambahandata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tambahandata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `kolom` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 Text 2 Binary',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urutan` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_tambahandata_departemen` (`departemen`),
  CONSTRAINT `FK_tambahandata_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tambahandata`
--

LOCK TABLES `tambahandata` WRITE;
/*!40000 ALTER TABLE `tambahandata` DISABLE KEYS */;
/*!40000 ALTER TABLE `tambahandata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tambahandatacalon`
--

DROP TABLE IF EXISTS `tambahandatacalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tambahandatacalon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) CHARACTER SET utf8 NOT NULL,
  `idtambahan` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 Teks 2 File',
  `teks` varchar(1000) DEFAULT NULL,
  `filedata` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `filemime` varchar(255) DEFAULT NULL,
  `filesize` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tambahandatacalon_calonsiswa` (`nopendaftaran`),
  KEY `FK_tambahandatacalon_tambahandata` (`idtambahan`),
  CONSTRAINT `FK_tambahandatacalon_calonsiswa` FOREIGN KEY (`nopendaftaran`) REFERENCES `calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tambahandatacalon_tambahandata` FOREIGN KEY (`idtambahan`) REFERENCES `tambahandata` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tambahandatacalon`
--

LOCK TABLES `tambahandatacalon` WRITE;
/*!40000 ALTER TABLE `tambahandatacalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `tambahandatacalon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tambahandatasiswa`
--

DROP TABLE IF EXISTS `tambahandatasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tambahandatasiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) CHARACTER SET utf8 NOT NULL,
  `idtambahan` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 Teks 2 File',
  `teks` varchar(1000) DEFAULT NULL,
  `filedata` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `filemime` varchar(255) DEFAULT NULL,
  `filesize` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tambahandatasiswa_siswa` (`nis`),
  KEY `FK_tambahandatasiswa_tambahandata` (`idtambahan`),
  CONSTRAINT `FK_tambahandatasiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tambahandatasiswa_tambahandata` FOREIGN KEY (`idtambahan`) REFERENCES `tambahandata` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tambahandatasiswa`
--

LOCK TABLES `tambahandatasiswa` WRITE;
/*!40000 ALTER TABLE `tambahandatasiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tambahandatasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tingkat`
--

DROP TABLE IF EXISTS `tingkat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tingkat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_tingkat_departemen` (`departemen`),
  KEY `IX_tingkat_ts` (`ts`,`issync`),
  CONSTRAINT `FK_tingkat_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tingkat`
--

LOCK TABLES `tingkat` WRITE;
/*!40000 ALTER TABLE `tingkat` DISABLE KEYS */;
INSERT INTO `tingkat` VALUES (26,'10','SMA',1,'Sekedar contoh. Nama tingkatan kelas yang ada di sekolah. Ubah atau tambahkan data ini sesuai dengan nama tingkatan kelas di sekolah.',1,NULL,NULL,NULL,'2010-03-02 03:06:18',6098,0),(27,'11','SMA',1,'',2,NULL,NULL,NULL,'2010-03-02 03:06:18',28378,0),(28,'12','SMA',1,'',3,NULL,NULL,NULL,'2010-03-02 03:06:18',58064,0);
/*!40000 ALTER TABLE `tingkat` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_tingkat_ains AFTER INSERT ON jbsakad.tingkat
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.tingkat', iddata = NEW.replid, state = 'I', dataload = 1
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_tingkat_aupd AFTER UPDATE ON jbsakad.tingkat
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.tingkat', iddata = OLD.replid, state = 'U', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsakad.jssync_tingkat_adel AFTER DELETE ON jbsakad.tingkat
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsakad.tingkat', iddata = OLD.replid, state = 'D', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ujian`
--

DROP TABLE IF EXISTS `ujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idjenis` int(10) unsigned NOT NULL DEFAULT '0',
  `deskripsi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `tglkirimSMS` date DEFAULT NULL,
  `idaturan` int(10) unsigned NOT NULL,
  `idrpp` int(10) unsigned DEFAULT NULL,
  `kode` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_ujian_idpelajaran` (`idpelajaran`),
  KEY `FK_ujian_idsemester` (`idsemester`),
  KEY `FK_ujian_idjenis` (`idjenis`),
  KEY `FK_ujian_idaturan` (`idaturan`),
  KEY `FK_ujian_rpp` (`idrpp`),
  KEY `FK_ujian_kelas` (`idkelas`),
  KEY `IX_ujian_ts` (`ts`,`issync`),
  CONSTRAINT `FK_ujian_idaturan` FOREIGN KEY (`idaturan`) REFERENCES `aturannhb` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_idjenis` FOREIGN KEY (`idjenis`) REFERENCES `jenisujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_idpelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_rpp` FOREIGN KEY (`idrpp`) REFERENCES `rpp` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian`
--

LOCK TABLES `ujian` WRITE;
/*!40000 ALTER TABLE `ujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbscbe`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbscbe` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbscbe`;

--
-- Table structure for table `anggota`
--

DROP TABLE IF EXISTS `anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anggota` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelompok` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL COMMENT '0 Siswa, 1 Pegawai, 2 Other, 3 Calon Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nouser` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_anggota_kelompokpeserta` (`idkelompok`),
  KEY `FK_anggota_siswa` (`nis`),
  KEY `FK_anggota_pegawai` (`nip`),
  KEY `FK_anggota_calonsiswa` (`nic`),
  CONSTRAINT `FK_anggota_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_kelompokpeserta` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokpeserta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggota`
--

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `iduser` varchar(30) CHARACTER SET utf8 NOT NULL,
  `informasi` varchar(500) NOT NULL,
  `alasan` varchar(500) NOT NULL,
  `jenis` varchar(75) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_audit_user` (`iduser`),
  KEY `IX_audit_jenis` (`jenis`),
  CONSTRAINT `FK_audit_user` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audithapusujian`
--

DROP TABLE IF EXISTS `audithapusujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audithapusujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `alasan` varchar(500) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `username` varchar(255) NOT NULL,
  `idujian` int(10) unsigned NOT NULL,
  `ujian` varchar(255) NOT NULL,
  `nilai` varchar(10) NOT NULL,
  `petugas` varchar(255) NOT NULL,
  `idpetugas` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audithapusujian`
--

LOCK TABLES `audithapusujian` WRITE;
/*!40000 ALTER TABLE `audithapusujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `audithapusujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoakses`
--

DROP TABLE IF EXISTS `autoakses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoakses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_autoakses_departemen` (`departemen`),
  KEY `FK_autoakses_pegawai` (`nip`),
  CONSTRAINT `FK_autoakses_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_autoakses_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoakses`
--

LOCK TABLES `autoakses` WRITE;
/*!40000 ALTER TABLE `autoakses` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoakses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beritaacara`
--

DROP TABLE IF EXISTS `beritaacara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beritaacara` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL,
  `jenispeserta` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 Pegawai 2 Siswa 3 Calon Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `startdate` datetime NOT NULL,
  `ujianmode` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1 Online, 2 Offline',
  `clienttype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 Desktop, 2 Android, 4 Web Client',
  `clientip` varchar(50) NOT NULL,
  `clientdevice` varchar(255) NOT NULL,
  `finishdate` datetime DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Started, 1 Finished',
  `keterangan` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_beritaacara_ujian` (`idujian`),
  KEY `FK_beritaacara_siswa` (`nis`),
  KEY `FK_beritaacara_pegawai` (`nip`),
  KEY `FK_beritaacara_calonsiswa` (`nic`),
  KEY `IX_beritaacara` (`idujian`,`nis`,`nip`,`nic`),
  CONSTRAINT `FK_beritaacara_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_beritaacara_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_beritaacara_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_beritaacara_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beritaacara`
--

LOCK TABLES `beritaacara` WRITE;
/*!40000 ALTER TABLE `beritaacara` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritaacara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formatsms`
--

DROP TABLE IF EXISTS `formatsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formatsms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `formatsms` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_formatsms_departemen` (`departemen`),
  CONSTRAINT `FK_formatsms_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatsms`
--

LOCK TABLES `formatsms` WRITE;
/*!40000 ALTER TABLE `formatsms` DISABLE KEYS */;
INSERT INTO `formatsms` VALUES (1,'SMA','Hasil {SISWA} untuk {UJIAN} tanggal {TANGGAL} nilai {NILAI}');
/*!40000 ALTER TABLE `formatsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ftdatasoal`
--

DROP TABLE IF EXISTS `ftdatasoal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ftdatasoal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_ftdatasoal` (`idsoal`),
  FULLTEXT KEY `FT_data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ftdatasoal`
--

LOCK TABLES `ftdatasoal` WRITE;
/*!40000 ALTER TABLE `ftdatasoal` DISABLE KEYS */;
/*!40000 ALTER TABLE `ftdatasoal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambarlatar`
--

DROP TABLE IF EXISTS `gambarlatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambarlatar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gambar` mediumblob NOT NULL,
  `warna` varchar(10) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambarlatar`
--

LOCK TABLES `gambarlatar` WRITE;
/*!40000 ALTER TABLE `gambarlatar` DISABLE KEYS */;
INSERT INTO `gambarlatar` VALUES (1,'����\0JFIF\0\0\0\0\0\0\0��\0Adobe\0d\0\0\0\0��\0C\0��\0C��\0��\0��\0\0\0\0\0\0\0\0\0\0\0\0\0	\n��\0H\0\r\0!1AQaq�\"���2B�����#R3	b$%rC�Scs4&�5\'��\0\0\0\0\0\0\0\0\0\0\0\0	��\0R\0\0!1AaQq�2���\"�B�Rbr��#�3��CS$��cs4%����DTdt&�6��\0\0\0?\0����A<�n���\0�D�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\0\0������3��H&IB4����G96�(�$@z�,���.r/d8Z\Z�M�H[!��-�\"�n洄<�n����)��s�H\'���h}J t�Qm�CU\n%�Ç\n�0Kh����e4ii��5���qe� �M�<i�{ ��\0v����%�j��-�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������28�M!��V�\'$�2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�! $�W]Ȗ�{�eYT�����\r�`��s5�[]�	jY\n8�����%^�U�6����j.��� \rHZT���O1ZFR�J�W!r%�h6P���(�$R�cd��Wr%���k\'2��l�Q��jz@\0�P�Y�F�$%�b,r4;�6B![�\"_�f\rcQt���➤-7A{�1ZD�vd0�U+��\rڭ�\Z&If@� 	����8a�3Y�U7Ck(�d5= \0�<2�ڈgQ�	����C��(@�+O���c���j.�t�˓դ��@�q�bH�M�U)$:CA���Q))d��#H����x�k72���Nv���^�����Mފ��d�M�Ǎ�D*)V�ȗ��p�娺.���P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE���%�H*֩<��*$^M�j�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB�,�AV�I���D�ɴB���\03>�KH��BH� �\'ΕIJ�!;�<�Q�h�s��/lҁ[��(�#~�Q��W\0���%�h�N\"Y4��j���҉�h�r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-Gt��h##�b��H��jE&�k�8r�\r8�-��Ιd���W���\"�J��BcH��uI-d2$�Kpĸ��Ɠ��\0� �`��\n��8˞	x	��IFi�M��\"��t�X��%G�&�U���.�+Z�i2��q`\ZE��)E��$�`�H����E\n��̂���F��K���)��\n���IF8Yp�4F��H�Q�I�Z�~n���J�dER8��l�\n\r(,�D�RG�8�*ȡ@[Ĉ����(V�^�.b�st(��ߠ�k���D�4�H-���$�H*�\\����H�I�\r���i3�ԉk#��q���%�.C��:9�3���`U�L��\0�\0S��+t�B4���]�\"p�j�X��՝S�Y4��j�7gzr.[D:���������i�L2D��8xtT���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB�,�AV�I���D�ɴB���\03>�KH��BH� �\'ΕIJ�!;�<�Q�h�s��/lҁ[��(�#~�Q��W\0���%�h�N\"Y4��j���҉�h�r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![��I�a}��5�N�P�B��R�E����0�|\0dR��S#i�N�C��E�k>���V�p\'#�)ƥ�L���0D�@#\\��\0x�cJT/�\\�E$ixl��kd*!��F�ǟ$�\\(P0S�\02���E���0D&\\��Rp�����kl�ˍ��\\��.�9�7�Dk�S\0x���_DU[������I6EU�����p��w������\0Vύ\'�l1���!K���W�!Zߕp.��N5<�!���\'�\Z�0��h��W#���3��5�!s[�<�Ϙ����1����\0�����dQǡ�Q�C���\rP�c?Y\n�٫�+����r�\"���#~���A`�ǐ4J��@uRF�\ZBgH����(䠜y�\n-cT]@0S�����Mn���X\n�d8\nb�(Q��_��kp\\���S�r�!ڊ�ϳ&��k�L�)ʅ�L��H�\"ipK(�j� s[a�yڊ��T&�8��G3N����4��n{\Zb�MܪkD��B��*�]ǚUF��MQh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B|�p�Zm{�ή`�K$����ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�D�A���kj�K��7�\0��W^��T�����($-���!m�#��U�\r�έ�	r؀��z�em�0�n)3T���\Z�{~�h��.��0��\0�*,�Z@l��[����6Sr��3p)�E�N�G\0��3^Y\Z��(n�J�^��a�ΑsT2&�K��)3U��n����^h~j��>(ܞ�\r�m��V�r+d�RH��i){؎�7��t�-���!m\0x\Zʱ���1	\\� (��43�C��������f�C�\00F�pBV��/|h�P]$������H��@�kH��RV��I\0V�~�L)d�A�#KǨ�߲�5����T脎[ydi��7Q�62�-�(>&�T:��KB�\\���^��*��|Q��A7iK�*�.EY�ꤍ�(ZJ���n,�HO���Ql�x\Z��hn�*�y�R��E6z��P��%�d��@qT2-��QS�x�M̨.��1�K�@S�kZ��압H\ZSJ+�d[dh�\"�T%g�A\0(���¢���*T��M�(�M��uM�FK��\Z�S��&�5c~�\Z<�I�������	R�Xrʶ��[$�!�����od\\(��K&�=�j95\"���EaCuWQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH����5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH����5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH���+ٮ(������\\\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j��%\0���t̎|�)>d��B5\\4P�[\n�W/`��L��IS���+O�(e`H�?d��b�LM.BC�)B/�jLX��$�����sG���V|�Z�յ�H�������&�~ũ��A�@,��x\n�/�UF�KZ�|8&V6���l \r��\0y[/\0��B�]C�BA���I�Щt�5�Y�h�b�=����n���&\0���CQ	�Q�M�#�hl#Pr ,B[ҨD�\"�3N 8���\r7.�T+Ӏ.6��~�I˱��N�A�����b��C$�7�	g���~��f�X�:(�>P�-?O�|W\n���@�(��\0�xU��_D�\"Cv��y]G+|����`�Q<8s�)�X���L@8����\"��ǍI�őE��|@�z�/�=C�gP�X�:(��(������3��E�M.P\0i�%��kA/���į�oЃM˰�%Zp�\'�~�M˱��.E��\0\ZF �\"�;�,@�z�.��m�O+X�5��\'���D$s�(�&�M�=����h��c{U��}���7kJ��6CȨ�}�q��k����&&�>�Jl\nB�K��@\nH�8��b�	Ues$��SE����Ա�oک��@�-?Ng�E������MԠ\0K \n?{V�._D@VA�Aǎ�Z��\rP�4���y%=X��K|M�JE(�������,�d�[�h�f���\"ʜ!k_(ޖ�:s#��\"O�ɭ\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������A<�n��C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t���ᡪ�<�¤��\"�G�Jh�Ӟdx�fd��:��\"\0?��e��Ƨ���6Z��N �@�_��Չ�[D��q \"xZ߲y�[���B�	�{~�F�$�\0�\r�j�@��;TK %�EҎ�B7�ә��>-fg#k&̈}Ȁ�4}C�?:\\�^�p���\r]@��/��V&ŴI�bbZ�g��!%`9�A<���ס�(����-+�5R�[Ơ��X!�\\d���119V|�6�\0\n�d�\0�\0S���R�\"���hk۫J����sδb�$�1-\0sK[�Jz�I�B�y^�*(��S�5�\rQ\0�ÅA�%�F����\Z44���G����Y����\0�h������E��5�V�V����gV2\0[D��7sB!�-�,��P��\n�8(\'��1u��(tw��Q�*`-�.�@KU�Hp�PC}-+�_Q�ʣ��Y:�o݈\0�\0SE�-��{��E��=���*\0��5b`�%dbZ�\0<�e�%W�Q0$\'$���ܻ�:<j!Hh\n\0\"c��&n[D��we4hi�}G�*�bmdQS\\��\Z�3�����sH^ɰ6�p{ui�B���ZFlX�&VZn����U�*K�ࠟ�<�QO�B[�iqm�R�[Ӆ#7-�*�;�Ho��3g��rmeN��\0�����qJbr�\Z��\rH�[\0E�5�r\0ytJ����8d��x�QȐ�y^ߺӫ�M-�\n[pU,0�gjF`��@Y��%7��e���T�k*`�k�\0�\0SE��#�w�\'!{$魐iŤ-�\"�5���M4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������28�M!��V�\'$�2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"���J��`mdLiND��?bPV��.D��\\�b�U7@���F��\"Z�V��\0Y1�C���m�%��y*<�ZbT\Z���-��Z��@V�}Ȥ%� ��d�T�I`�%���� �؄㙬\\ʦ�vV�n\r��\0)�KQ\n��\0�\\�>�(Nts=ȐB���~�NaQt2�����ob>5q��N�I�\n\Zv�ygD�H�2�(��u܉���NgRj��n~���\0*����	�+cą�K%��������\Z\"���b��5ᘡ�j.���\0��\0�b8�*�)�#خB�:P4j	`\ZS$�3 7�B	��*Q8浟���v���0���1J	j!F��5=)��E�����Q/���X�]�Z#ԗB�W��V�2�U/VU&��\rh?PKD̈�����f�����5�eStݬ������~��E�k��s@���Ƈz\"� ���TK���P��C���/OR��ob8� H�2T���IB�CF\Z�[r�))d��\Zٚ�*�EÎ$�neY];/x��������E¦�Y-\r��C{�)��3ED��@�K����s\n��R��\n��!{�ְ�fM��U)r-\0�E��D�M���gA0W(�2L<I�s*��ʜ�\0�CS����*|�D2\'�.jY\n��@/D*-�ba|O�b�&5C��F\\�R��-��u�	�L�C*�t�\0q�^C\Zr���2@7r̟p+�QY<j<�>d�:@�\ZAN)a�`���!s@��?\Zz!Q�MH��s\r0y*.�t��%�I$����[BD^�v�C+��4���ZȔ�IfM\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰY�D�iZ�\'���D�ɴM\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB�,�AV�I���D�ɴB���\03>�KH��BH� �\'ΕIJ�!;�<�Q�h�s��/lҁ[��(�#~�Q��W\0���%�h�N\"Y4��j���҉�h�r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�8��P	���(�:\"alRh%\Z�\0I�(�b�\"�Yp�M �[�iJ�m`��,H�|�I$Z�*��Kp����5�K�Y����#S�cD�Sb.x*�F_���)48�]�\0�ρ�ŴIΈ�����j���)T�H�K\0�\0TH��eE\'\Z[�g��H�J-ta!j;�1�R~Z!�Dq�u4!���ƀI�G�[R94���\\TNKDK�Ȏ�dҺ��\'�w*S.Y\Z:)cCBYH$�r��S�q�XY\\o�8�I��N��@�7Ă��49�\\��T��4&V�V�&�	F<S����4�����ܒɤc��v(��\0aޮE`-��r�RKY:!!�\r-��H8����0�.�#>F�M Y�W�Km�L~497AQ�E&�f���/:�I�h��q��X��.��.[Dݕʬ\Z�2��\\� �l�KBI9d����ꧦ�Ø#>G��!k $�?\Z`�t*jC&��k�\\���5P5cd�~�NId���xa�\n$Ĳ\0oRFkl�<<��%��%�\'n��d�949%PP�\n\"�4;\Z��\\e���2QLU\0��	F��\\�UŴUp���ɤMj����NE��%�������~ܖ�Z�L%�&�3\'�MIM�UJ!\Z\\<�S:`�u�P	�Q�S�{��I��c�\\8�WŴK��e�4kT�ק\"�LJ]\Z[lϻΑ-eT)N\r�#m�9xs�䔪��#��L|j�d;��^�.b�stЂ\"~�Q���6E��b��S�e�4kUS�t�^L�@t2�F�4�}ɒ�KY0^��$Ny����EIE�Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB�,�AV�I���D�ɴB���\03>�KH��BH� �\'ΕIJ�!;�<�Q�h�s��/lҁ[��(�#~�Q��W\0���%�h�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Љ���ї��~�$��dM1����{�\n]�&0J�n�������\n\"\\�	jj��?P\01ؠ�د��T<�$����E���{!����`��xT�dmh�jq�\Z�\ZW�A)�0�q	��ҵJD�dbY5�z\Z�n�DK�I�\"�SZ�v)����y��D���	�\\�d^�z�Z!\n�0#/\ZF��+�Mcg\Z�|\Z<j\\��#K&D�!��T;T��V�����m�����N5.�,Un�E&���A`�|�����\0�>7H�P�qҤ�P����p�N>;Y\n�����.g�\'{��2(�:�\0�I�$(����B������UB��C���шd��w��د��}��E$f@4�;�P�uBX \Z��AϘ��Ն�Ƨx\02�|h��(�c9��t �*6!4��+f��<.�P�sd��GF!�<c�S\0��D�_D#��0�\0k�9�?ڥ0�	h�jm� ��P�uA�q��\0���:-dQFcQ	�<� ��cɬ�CP4qw�*�R�ȨU:1��F;��~N��IηRF:@48%���R�����k|�\n`��wB��\\l0\09�+C�У\"tm:�l8�LB��%~�5ZЍ\\�ǘQry��$���ɬc���|\r�t�p��c�\04�9�}+�\0����ji�m8c�7#�1T!�f�;��x�Z�S�;`:�l����S檦�K&�c~U���1U\Z�A(_�Mm�b\0�|���͒C+]\"���<�5�Ks[\0i�9�)�w�\0h��\0\\�\Zb��l����Sl��\Z���V��J�N\nƄ\0�b��5<�%��=�\'��2?\nr�}�n�F�K�f(5�T�4Bi�[ǘ�N��\0�\0L	u�\0e�3Zl�QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D\'��m%�׽�|���N�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:@H��R-�+�VU�\r���C��|)\Z�\'�b%�d(>4��Q�D�V�\0���34�:�h�� .�b���\"�RX#{��oU�Q7�T^�`@k�[g��Ct��<�-�\n1�ZD9t�\"qr�!��T\"A(F�6>�j|�E�����\r�$X�&�R����\'�4��W^Ⱦt��R�t�@x�\"��\0�b�s\Z��V脎k��|)3��Vț.��&\"�\"]o�i\rEE�������e�&\Z�CAOIK�V�r;\"�TRF�􆖒��؏ޔ��C��-G�Ȩ��.`�\'�Mɲ\'B$pr؀��J>el�F�9m�ʒ\n�l�@u�;4�\"�����Рi�E����`�V�I��ǆ�CKM�ױ�)��gO�\\�����k#�Ц�0���V@��.�![a.r�,)\n!ʚD�F�P{x�\Zc�C���&;H�\Z	IK\0�����V�J���Ct�����Ή��ϤB�/�[_���1�T�a!�d\n<��rC��KcLQT-��\Z��ǚq�>j;]>6<�\Z\Z\nzJX_�^�����\\*��\r�n�ew��7�T�f	t�\0q�%�:̼hUy�>#���q�\Z*l-��r�!�0QT%�f���N)��>j��T��zz�t�G���U�B��!��C�N�eu�Bӛ�O*ae-�-\rr**��k?-�S��>&��ĔL8���B��#s�	D()�T���h�\"�N(3�̨.�]5���\0�QZR��\n�El���r:t�)��i�)d;,���\\�۟�G����prآ�>W�*�D\\�\Z\0j�А&i\r\n@[�8�\Z�y�.��1�\"�\0������m\"�I�J׀SIi������@bx���#�߲��EaCuH]{���i��4\" ��-����)T��	Q���8�\Z~z��ѵ�A�JX$�b	�.��p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH����5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH���+ٮ(������\\\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\\nHi$!�k&xG�̬���P�B)B/��Y��}\n����%������fbE���ld�\0_�i�3����&��Z[.P�h�����_D�MSR孺�W�1QGh6ԣ\0�y[��T��H�F!��PB)D�?�I��Kto�����t����+\"�LqD�>P�\r?O�|W\nLM�Z�.P\0!Dc{S���	Mӈ�O.pƇ6��@��%-X���n��$8\"�\"�q�0b�\0uR��[�`����*LLmd�{�c(�KM��><�\"Med�[!��\05,B[ҫ��ʠ���Cn	��d��(4EuE�\0�\"~��T�yM\0E}��!psCT�Rp�x�1b� ��C�� K��p�+#-d�ڭ��P�-)����p�od�jd\0�8\0�\0V�T\"	��=�3I�APq�m��i���TV\rs�\0�@����C��	����\\�M��p�Hŋ�Q�[���>0K����Vf&5O��D/F��9��P\"eSd5���5j�ZY���X�%�I�#Cv��	\\�|,Wʛ�,�����4�\\9��P�q@�@qrM��4�@/�C��̒0K�O�<PbcQd߶���z5������Sds5����A�Z\0E\n<oj�D�\0u.bȓ�� V�p�Znl,��T�4�\0?��\0P�B��@qr4�B/�%�G(�L�Ѿ K=MN.;f�&2�T\n��$��,(t��9�\0�\"M�n��u(�M�~դb	}�i�*��ǅ��9~QdQ\n`?l��J`�K2;�].���p+���O��ڲ��D	h�ё�&5<�X�X.���P���G5�\Zb&^k ӽ;�@�\05,�[vB_��d�I<��j����@Ij\\<�$)����BZ@j�\"���r�_D��|`�z�/��S�.R-eoڅ��`�\r7��\0�bn��0D5��4����%�VF!��?���k��t0{P^�qD���*�)��� \\��I_/z\\��\':��c��ї�$�\n\\�Zɂ�C$��\0KM�D\'ǅ1n��D ����\"a���_@��KA$��d�+V;���k�!�k&x%>!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�p$���qZ8�:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mF��Z\0�d��$�``H$����&�+�dŷ\rrb�ff�N��Nt�j1�c��\nϘ��I�U��\Z�M1���\"�J�S$\Z��[\0����T&m�NDW4\"x[<\0@.!I(�*ࠞJs�נ�J27Qm�\rԄ\0-�;Vr���	d�(!���/�G$³�&�I>�@}�SFc�+K���;�kd�Ph�HT\0%�4��,l����\0���8Νo�%T����VSo�E+cT�S�\Z�E�\Z�Ba���	��i$K(!���������M�b6}ȀG0YG��R��^�&��m�����4�p_���h��\07 ��p	Cך:$�DA���k[5�ġQx.-�kZ�Pad\0p�9-�C{R�@C}-9�Q��3��vD�$@\0�\n>`9� R�\"�	=�K^J�KU޴\0-p���r�B-k.�({�h�v�*�	�r���E\'�(����Qj�@T��<8R9-�EI��o���?1���I\Z\nݔ\Z�\0?���@���2H^�u��n��%�)DK�u��ŴI�=!K�C�[��\nԄ�������[9�6M����n\Z\Z�d�?�\nG-�C���r@C}\r9���γ9$h(uC\\@��>���@�E��׍ZUZB�Z�~���m�\"¥�\0yZ�	L��*�l\\\n���S{T7b[�5�\r\rT�1�jG %�oj��$��������\n�2m@�Ⅵ�\0�h�|��q�����{^5i]M!P\0�r�Z�d\0��\\+-Ĵ ��)��\Z�\r��bB�x�۞*(��ږ����\Z�\n��ڙ�\'�Mdܔ�k\r���{�I�<`�D\0w��چ#Ǖ1���&���&�!P\0E�5����V[�h@2���X%;�a�ȸ%���ح:��AN�o�)iP��Dc��<���L{�G�%3�ҷ\'�|T�ɵ�P!i� �M_�|j�Ƚ�ܚ$\Z�nZZ�s�֑��MQ������/�������j�ܡ�_ �[�@\\��8p���\n��?�J�KNg� �`�<���f��H�G4Y~�⸊|�^�mEӄ�;H�HTE�x֑��Eb@ �c��U��!��y^�+T���p��\rE�\r\rT(0�ڑ�%�M �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�C#��\Z�k\"rJS$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\n�D�\n\"�O�C�T]\"�B\\\0T-*P^�&5q$^�Y�<����mA0	S9)dPST���7(�9xcYy�/2jp[3��P\"����\0�K@��C��z �1!X��.�W1�Թ�E��i�Pj�%Q��	�WCdw���������\ZS�\"��t��R��O�b�U��VFd85-�?��t�D�>�-OJc�Ɠ��z0�U�\n%�>�~J���k���i����X�|�Rj-(Z\0!5Zȟ�)ȑO*��K\0L�y�\"Z�˙&��FU7M��xaK\09����D�}�Z�B�#K��(�D!Z��)�ⴹ�j.��D�z���F��	�֐��ʤ��K�!����	�:S$�3 {҃D�W]Ȝ\r���`e�St؎�e��\r҂���R2dQ\\\\Բ<|is:	E�B����UCK�ơ\'%i�X\n�:M�^�&#\Z�a�*J�5��kA���O4�\"E<��i�]r��a�5��5M�oj�80����Ɋ)em:�hLo~XR�t8SO�\n���ntsrV7J��jA�Ii_�-���[BD\n�P줪AB���Y>4ND�R(t�ߺ�J\'�x�&\\�7N�*9��5-�!�Q��}4�%�l��htQV�V��{���>nZ�2|z�RAi*�-�O涄��UK����4j�^�\'���H���.DP�\'YssT�0HB�85\nZ�\0\n|̛�k�����K?ޘ���KD![b�|O�\nb\\�gM��(Zn�\n��0o[��+d����t����PK\0��Ӝ��j�Z&j��Q�ĭe�eSt�dpa\rK |깙0�?Yst�1�����U��m��:b\\�	3���\'��I$�B�8��\" Wʑ,�bKJi\rڭd\Zs$��0��Z�BQ8񬟞�ꫢHCR��\nn�B ��n�%�Ƙ$�;$�7\'�T-E�tq�@�ZVͽ���[BDy��v�u�%�\0�U�\':r����Y��5^Ar&Y`x��橺=�7��\0�������! %�Ƙ��D[�	�\0�(�@/|��%ct]:2�.���жD�+XH��\r5A+�A�@h��-�?�T�6`�*	B��1㙨ΦꇽS�pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰY�D�iZ�\'���D�ɴM\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB�,�AV�I���D�ɴB���\03>�KH��BH� �\'ΕIJ�!;�<�Q�h�s��/lҁ[��(�#~�Q��W\0���%�h�N\"Y4��j���҉�h�r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)YX\"�s�C��	��u4�\ncR	7H�V�#�A(�`�M�y�œ(��$�B�_��<�R�K)�\'��lϻ�L�PY��+N@�)\',�T�%���\\F��+�FK��9t�od���Q��W\0�y҉i6�]��J�Z��w��2呣�H�F����\n�YOz�N4�̑�\n��0i�#����䴝����H�����JN�(��I��c�\\�ΜdŴI�9F��$�ө�UL��S3�[Dh�ML\0?�%�%���P��Kl,K���j]���HF��@��\nN�I2 �\\\0s���UR)4�ri\\6OD$Ŵ(��:e�5u5�O��R����C�7�0\r\r	����,���p�ϸx�w�,�P�aɏ#Γ��\Z�@&^ܩ�\'Em\"\'�%\Z�\0���BM&�+�),���֪��߽)�6����4������:8��1$��q���w�\Zaโ�4���Q����d��	(VԎM����y�BL[D(�2ɦŬ��]�ry0�B�H�Km��%I$&\n��%�.C�Jza9x�=��j\'܊=R�\"��\0z�R(G�Rh$��8�t������5NId�.�*��\0Js�ɴB��i�✒��M�K L����!ƪ�C�\n>ݨPĨ�热��%�t%�1I��k�\\�^���-�Mʧ$�iZ�T�.�Ӝ���A.��[3��%̝R��\r!S7{�\Zn�@*�B�Q� ~�-D�*�YP\"i�ڎ�--�B�-~�w�֐,[D=�%�@!�n<��9I�v!���%�\Z�;aʇL\nK�wKm�q�$V����\0��d<�1D)s�����+t%��M\n�u�����b�*��8�d�!����\0Jr/&�d%��yyPKZʙ�\\��-ĸ�\0��;��c�\n�A�g�i��LLY�dj�^�#�\\\"�A(�pQ<\r\\h[D\Z���M �s��NE�&,�RX�s)�PIBK�`�I?Ǎ72LqT��x��O�D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�D@#��}宩\"kD�N�����j�:���-R�(��+��hF�!v+�)F�Ԛ\"-?X�Y�0+� iN��@stǰȚ\\1ǝD�d��B����&��^���O��jn�tY6&��|9zV��%�6F%~�k~Pp\'��\\�Gވ��I�c�S\0�)�4�B�w\r�7��\0�l��8�T�)#-l\0�s��*l�Lcg\Z�y\02��֤�I˦��:�1O�Itl`�Mn\n����w`Q\Z��\"Q���1�2XR��R�\'��\0i��³5C���rP��%��M��0Sap\0˙Ԓ�E�lQ���m��Γ��	DȄ�kp�54�.N/�U�D����\0c���_�ҝ��D���4��{p��tsUYh�(�0s攝��Xق��\0�2*]�dq0�\n�e���A(��Mn\n����)¥�H���:1�\0�v)���CD�_DMվ7H\0\"�\n�A�,��)+�xRv��f���\0e����qš�S�����*lm������TB�ǘPy6F�:6��@#]�&\0�� h�ĸ�|z�\ru�\n>$��Nca\n�9�;Y\n��S�Ap���V��N�mqo�L�61+�8+[�7�\\*_DE�9�)5\0�w����t/����ea�\r$&b��\n5��[�B�Λ��І	�%�4e̊z�X�de��)��Tw*z�lm�MN\n�����*�T��>�/�E&��c�L�gU*�$2���l�|�]0R���\\YGiʘ-dL����@�Ӫ�a��e���C����V�4��W���G\rR����F?�L��j�B�&����P\\1��=R��\0��A��ϕ0Y@\Z\'\Z���@˟:�Tв7F\n�-�N<P�%�Y\n������Uƥ���\"�X�|ɓ����_D�{���D����\0?�3[&�\0Q�c�)ڠ�;��&����3Ƙ�z,�cQ	������M��D��B��j�]��V��}x%��\'�\Z�S\'b���_D�t25�I��{�5�a��06#�?֝EuB\0�� ��kT>n�����up[�@���F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��	�5�[Ii��d_:��,��Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:@H��R-�+�VU�\r���C��GB��t�b%�l�\Z�j�ՠ�#B�on~t��J�Z�c�j@�6����$V�Y�rX�P-�B�S7�C�o�CK�9��\\ֱ?%\rҽ����\n�L8�Ԑ��U�6�#%ˑ�f�RI4L\0L�]��4�ieAt�u�&9�(?��\\7��S��ii���!iLr�Y\rW�\0�p\0����s�?-\r���\"G5�d��RK�:6D#%�ہ�T�A%o�Ю��M/5O�@��� .�\Z	�JX�U�ȯ�A-@�F9ji6Sr��T����+ޖ\Z!\08!���\r`^47N���<�*��rʤ�Q� �J�!�+U&:�\rj**g�iy�.�[�j�� (����ʮ.EY�:)#pB�@�쟽)�<���\0���E���sZ���7H��Y�H�되di\Z�D�C	r���;�6f����T9!�biVVH�Z���44YAK�V�$��R$)$nB������D�\nyP�A����P_�x\Z��Z\Z&��[�pr؋�r�)誶���C��E�]U���P�?T��>z��c�\Z����ma�*�E|�2���:t�8j+d�蛁�(d�>�Q�6���+�ЧuN�=���.8ۍM�6��d�ށDUQo�j5�@o��L|�r���t\r\nZ�~ռ	\"�T�U,n����V���7�T8Y�[Q�\n(L��5��Ъ@��r�L8�w(�B\"���!Lv���5\Z8�ߢ�L|�C��� *5���)`8e[��*ܨ%�p\0-6RVȴ��R�u��Q�\n*o�\Z��Cu`�[�pq6@��U�m؄DK��Xa��C���L�\Z��.>5A�@���F� ]!������V�#N�1�t��Jz���Rp)�L��@�ixG\"۞\0���*������q6L8�^��@!le�[%�T�E�&j4)@n8�\Z�9��Lc��@���2��9�h��Z�:t�?U�Dģo*�Y��ȶ�9�CuW4�[�pq6L*��$ �+l�U\0�N�>�F�8��䨦�|�J�)�c�R\0\0��RÖU���7Р��C�4�)��i����YJB4�\0Qm�������@��M�(�T�UN�DK��X|h���� \r@/1�8�y�.��F� T\r�)`<���$VȺ�5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH����5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+����yZɞ	U���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nS�\0��$�P�����^�.	E�F	g���bG;cY�k!�6��\0_�a�s>*,\rO)7H�Z��v��.<oj�W/�WN\0�\0�>�eb���(\ZI	���I_�hq(H-E�^�<k9E�6��Yk����}?R{���H��tlc�\0��Ҟ���\\�bod��֦D5!��ҨC�O�T��ḁu�ʛ��&�L\0��\0yxx\0*IЛ$J���d�KH\r�{�ߍA��\nVKto��S����V&$Zɻ���9%\0���tK��I��%�ֶB�J4\r$�G�j�K�*I>)�-i%J�{_R\'@h�Ԧ�qD<��x%I:� ��f�. ��\0����@/�UK1� K=L���bc!j�ݑ27�w��-�π4�I�Y\'Z�u\\\0��9�r�^�RJrb$�ⴜ�ce/؋N\r$�9�x%\'К�0���.\0���Ƥ��\0t�$�H�K}L��ˈ���G26G$�zZn\Z�H��\ZB$�����@�\0K\"[ҬD��.���J��>D\Z�,l�ei�C���R}%d:����Z�P��^�jL@/�I�wF��,�4_O�i����k*r���@���:n�s[\0h&�I֖�5jB\0	bF� ���H�E��m�<쇑QM���SI�M�<�d��(�Л ��t QA�3�4�@/�@<VgF��-\Z�/�09%�$X�7Q��@�\r(t�G5�P\"e{!�x�-�\0K \n�\r�j�D�\0u�N-T�B�UO�l�T[�$�?����V&�	N����8\"�\"��ƙ��B��䉤�jh�b@��r�b�7B�I+Aw���QG>\0ӌI��~ۦ�B��A\0(����%��Bҥ�����5o��*��$!�~�L\r�%�QrE(��4�DK�����%����/\n�-d���lo��\0K��T##{&�!n�\0�Y�~��b	{ETF-i%{&V**��&\nYC\\HC� ��%P:D6�)�48�	\0P�s��G(�(s�I�Y�`�%�\n�R-e@�x�lo��\0K\n)�#��B$��7n��u�\n\ZD��Ƶ�\\��W�TAR\ZUq��L�TV���dڔB�	D�����@��\Z*ItCQr��]W��a�^�(r�=�F	o���~�<��O)��~��H=~��!��Į\0��R��@�P���DQ�*mZF._@��A-�{~�kA�$%TP~� �4�Lԗ�.BA��8�t4�@/�E�G1�Z�h���䘊\\�Zɂ�C$��\0K\r�F\'ǅ1n��D �:�\0�\0��Z�}TV��<�d��kNUKٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���H\'����q(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���\"h*�H\'��\"�u)�V��ۀ����Y�[D3%8����ZE��Lg�)Z�D�$`j�4 |�s\\jy���`J���ۖ��/��U�mid�-�,N\0Y)qJ1��%Ou�>U5~i#�B�\0B�xڢS��\'r���\rF����\n�̛Y:l2D�{E��5�*y������k����@�_ǍX����ҥ��p�\0({��N�����R����M���5p��rʢS��K&Iӟ�G�\0�&r6�t��d�\0�s�~��S�c{)5<V��5ܴ��Q���U�\0-p���z\\�����2���I	S�]G<A�z�+#�B��\Z�Pa��T���B�$���i�3X�$��F���G�YG�5�\n_RB�H���\rA�Ij���\Z���\nk�hi\nX\0򵯅�gI�d4M�Fp�T���Խ��NtV^�J���DEA�	�d��$44�S��drHځ7�d�\0�\0[�b�Ɨ9�W���\rZqi�\"�\Z���$��������\'�s�+\r�q���B�V�6C�(�E��n�E�Rf	cd�!�I\r�4���Z�s+YR�k�\0�\0[E�}@s\\@����\"\r�Z\Z�H$���*�� ��WVG�	��,�t��!�+�MĴ�?�E�]hvc*����s��Ҡ�1-��%�C��I\r�4�W�G�%G9���S~�@z�-����d^�/t��7�*\0�W����-�\\l����!�k~�Uk(�7C���H\'����ٌ�%��Q\0\0��ڃ��\0���$���\ZT/�L*ɵ��Ѝq\0�-�|�s9����pSC�v�K�Z�b/��ֱ�meE�.h-C��B�V�ɹ�M�� ��˞ ��lJn��E�c�Pr	�#��+��o��5:��T���Ɋ],k�\0�SE�@�z��B�\n�d����n[\0AZ�9\0,+���#\0mb� �<��.e^�i�pPO+�s�j�ħT��j-�ht�����;���2Hj5�b~b<�<��P&�\Z�,�\0w��0����\n�9\nJʮ�$n�8��(>��3\0��J����C���URE��ZT8�T��1�Z�lM��/{K����c�)��[�K̒������>Ts,���F\0���x�¨L��U\n`�.�pB�\0�֢`�+0T�b��{���wKD �H\'��<V��BL�\rD`�\n%�Ç\n9�-���ey�@t�Zs?1XR&�C\0P5ό\0�s���)U�(��mE�[ ӋHT\0|?Z�L�&�S�.h!+c��*�hH����y^�+UĪt.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���!��\ni\r굑9%)�E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|E��B�s��#��i@�2F�2G9�A��[���E�/T���S��E������V^\Z��R��e�@�\0����d(x���z\"�1!X��.�W1�Կ-E��j�Po�\'��	W{!�B�@�_�L�\"�F��Z3u8��\"�{�`I��\"t��5,��)Œ�dn$%��/�Ԍ��\"�� n����|�\Z��Tܲ�	v�qik��ob������H�(�.B����o�R�I��\0�9�J\"�a�5�9<�7E��-��Rd�J�Nc��jY,x���r�J&\0\"\n�O�8\Z�nJ��εE��-\'��V���R%���փmV�W��\"E�@\0���E0�5�$Φ�Zȋ�Hj3)a�2b��F��Zd��\n�\'�AL\r�jj���b�<ܵ\njV��\0�B�U\Z�\'�i	?e*+�QCA��O,�d�\"�T?b[Z&h&�D_<k�deY]�781����)sv%܉�.hm��L|h�b�G�D��^꿸48�EҮ�LZ�.�	�od��XH�_*E�ȨP��&\\O:2JDS�覉A�f���N�X�St9V�87M�]8��s2[]�Z�B������VZ!j���/������Qt��Ԁ����F��qζ����.�(Z\Z\r��\'�蜉�*�\Z&j���6��c��StT�}������O��T�}�9��B������*�D-V�ȜI��)�r�]�\Z�T-\' �N#��� +d?j�u!B���`>4�\"E<���[�B�O����N����CK})�a�����=Š2<h}\noD.h���TEğĹk�2=@BҶ��r!\"|��]��N�րl��Nr$Sʊ,��f���E�㙬���S�����>n\\̨%���1���\',�$������@�T]�6j\0*�@��O1\\�r U��$���4��|j�\"G�e J�(�	��Y�s��6d��1��k�«���A�� q��z쀤@��(���\Z�y*.��22�\n�l/b?z�c$\n�R�r	��%�\0�A,>t�\'�K,�	��B��0�ɬ���S\Z%H���\0\0_���n�Ia���ɎG���[DY�bj���E9��0L*.�Ѱ��Aɷ�~ⷁ\"�ȷr	K�J�\r�[/�T�M��ʟt+�.D�a��P��7@�[�#pjzP_ۅW3QP�K��\0�c��V%�DZ�JD�n(���\r?%E��M��OR�(؄Ƶ� U�v%�J:CA��Y�UH�(� Yg��W]Ȝ�Ƴ��MS���1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX,�\"Y4��j���ҢE��&�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB�,�AV�I���D�ɴB���\03>�KH��BH� �\'ΕIJ�!;�<�Q�h�s��/lҁ[��(�#~�Q��W\0���%�h�N\"Y4��j���҉�h�r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0FV�T�V�(�DRh%\Z�\0�υ,[D��P��\n���.��)N�dX\"y-H�g���嵔���5�Ĝ�AƳ$Ȣɀ�k�C�~>6J�<�l����/Cd2c��IF�4��\0��D��D�D�\0����w���r�%��H��4�&|��)� ��r�<i�zkH�#�6�1���6�F�	�<��)P�j&FDRh%\Z�@p?�Ӊb�%t�D� *օ<ܩ�3<�mZ#v�\0@����k\"���0\ro�\'.C�A.��&5!����T;Q*�E�����ەK��tLbE&�Q��p4FL[E5!0�$�G����<\nT��I�	#~�\0@�|*�ɬ�\"��ц$��A�j	{)~�֤!�� 5.�I6=R� ���R\n	�7�%�E8;�	4�D�ѝ2I�Mo����)L�I�I�&?S\0�,���&�T�A8A�d�\0�/k���Q�q �|xRr�j�@iȧ�Γ�Һ���&�N�`��%�	1m����I�!k.y��)Jr�-�(�Bch�Њ2��! n�\nfH�����ԝX�\0��G0�?cz���� %�&\0�Z{�͊�?jM�ǏO\'*\'��ŴB��&�Ak[��L�mU&����\"Zɿb>���)o�����u-\0���8��@,�R2dXl,0���jG&�Q��W\'pZ�K�M��6Y4��m�`��|�K���K�04��3���ɥ86q������9(t(!�.A���ӡT�O�[jb�b�4�&�Q��NA�/:��&��,�A��*�n�NRy6��MLH�|��\"Y0t�K�p��2��T�!8sg�����(X�\\\0�x�F]�M,$Rh\'K\\-�9Q<\rk	1m\n\n��iC1�]�U)9mb�r�bih3��C����C�� �bO��*��\n!�F|��P-D�@�O�l��j�^�E���ɤ�k�����֐�)m\nio\"Y4��b���W\"�md�����aI۹SD���ih��w\Z�P&�e\"�@Ǘ�X-D�ށ���.t�n�%��M\n�p\ZW#�xU��mh�D��!����*�^Ll�0\r#|)�ֲ�Jq�\Z�dRNY �N�\n Q-w�<y\Z�yS�[��.ڮ\'��A�I(�`���j�X���\\D���j�\rT�^L���G9�(\0f}ܖ�Z�T�\'<���s���e��\\���4Q��P	��i@��{i�I(�|��wKUŴB�,�AV�I���D�ɴB���\03>�KH��BH� �\'ΕIJ�!;�<�Q�h�s��/lҁ[��(�#~�Q��W\0���%�h�N\"Y4��j���҉�h�r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=��ZX	s��_֕���,��Y5�.���}4���\0�pB�;�4�C͢�^�F�����/�/d\n�A\0��U�5�&�8��0\0{^�ߵ ��BU[���1�Y5��oʸ��u%h�M`#g&��2�t=T�FdE����e[$(��\0�0�-9���H�&5�q��\0�x�M�妩�0�D& -M�$K�	�`�Mn\n�����A�\Z��\"Z�0�E&���A�\\y-N@�Œ�M{����PU��	E�Br�T��I1�>@d8�\Z�^�\"j�`�6ʥI(��,��V6�p.�|�sd��a`���Q���`�NJ������3�Y\Z��W���o�\\�\0j�D���	�� 2�EI/R��\'E`:��2��H�l�K&�c~^�`S�r����m�M@#�d�ǐ4N�}��2&�0��5����E��jm� ��ʥ۽.�a��jv��xҩ�G�6(�!��p��v�N���d�B��(8.7�S��_D\"1��/\rF�流�Jt�蓢|e�\\4�b��C�Nh�ҹ��1JN�wV�	Ƨ*`\08s<hwC��8�1����phv�������U��AD.�S�O���N��ɬ5�9�W�ӑb� 9\n��&�03��R���\0V�/~c����P`�+�pj�̋-�v*������|i��G6�DbY5��[��.��\n�VO��I�k�d��\Zr�}��#s�B��R%�KsDS|9�)�:j�0N5:���4Θ/ޅL�����z��L6�&����ǘ�E�A.8�|b)5�#�&��4L1tò\\����l�t�`�=���q�Y1�+Kf\n�2\0��|j�Sz�de��8�9sZ�Y=h�%~���W���V��_D8J{O�1��NU_U ��M�2��:.�)/h�(�|��j��)E��+��?���hX��u8&UB��P`�Md+[f��<y�Z�\\��@���5�2X�ΪA��4b�+����.#�Qp�,R�S|?��w�K�\'\Z����3ƨU��671�M�\\K]3Z�	^^B��\n�]��Uƥ�v�����F��L�N>��}~���\r.	�3[*�.��`�xq�V�AA�N��\0ɪ5LQXXӨ�!ß�TO)�j�H�D+Z*!v+�*�ŜP=�5\0�v)�<��~m��J�\"ipL���(��,R��q�n�J\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��	�5�[Ii��d_:��,��Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n�c���qʆj���L�h�\0��qN5>j��h��K�\0���\\A7�ѹ�K!i���*r,��P���]��^�xP�4N�H��G�Kj�Lda��l�dK7�S4L\0L4�\r@/1ǂ��V����� 44���pʪ �[$S��t��+�bΔ�bD�t [��\n-��0k�0�$s^M�[�Pj��1�쀰����\"M�M\0L�hR�{^�j|ԊVZ�c�\Z��\nzlPڮ.E|�X&I�:@ �RV�p���SʇB�\"n�&�߷��<�Z߲�V�l�9V��Ȅd�m���ک|Q���\r����|�Il�7E�%,�W\"��I�2H�M:M���/�NG�J�(\05��įu�?%\r�w��>�y&ɀ�ÅA�R�ޘȃ	 �!�ƎV�J遢f�nP��t����z�n (���Y?j�;V�I���Hii(�+d�����K	t�5ck��`~J���=�q6L8�*MjLd\"2\\,���ҲTV�v�B��8�d��P]V��r\rA���(�� �WʕQI��B	̭�idp(ܨI\r45�B�>u�&47C�f�Y0ҽP���XK��a��ZV���&j4�\\S3�C�P]\"J�o-\Z�\r=*,�Z�ȭ������H����#��n,�,�D-���EAu��|k\'塺�U:�)D�Tl\"2�d��3�Z�~�%�v���[؏y�5��N�7\'�\0OM��[�ȯ��X܇N��G�{y�Nn,��� n��r-��1Y��\r����T&�i��\0�0����8\nb�)� L�Վ\Z��P]7M�75���m`��oj�R�K�7\0t�Zl	���U2@��u��B�\n-��8�o�CuW�J|A�&�qƛ=Qd��n!���������B4)�3��q�=�!�lqCCA8(��/\\�9�t�cpH��[�����`���B9�?�£�CuIO�=���.8�^���A���\\��*�O�Ih���%��V>zEQ>�q��\rA�\n�X\n�Aȯ�\'K��\0�D6�^ȶ���O*|VB!\0(�1�£�B��O�=��d���b�@\"le��PeT.hR�5\Z��\"qN5`P!۽X�!t����Xڶ�2ln�R��t�-(=W�~���`��e @4�!B]W#���񡺫�� �dÍSsUP�X�F\\�\Z�\Z�(�\Z.�|�iƨ<�.�(��%�\0~�Xڷ�	���A+\\[m$�{\"�Ә1��1u�Єp���ǁ����3[%� �-�T�-S=U�T��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%tW�\\Q+Y3�*��рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��F�>P�\0KM�~�9��M줭M�j�\0%�a�1/��j*�U|.��+G\0T�`[4�OY6	R{	O��%	\0��)�Y��}���HZK}M��>)YA����$\0���!��§��5�+c\"\n\r�\n&#ҎPK�$��J�W��?u��)z�40�C�߮)�&�3ڋ�Q(KHҥ��A��*x���Xu0_O��ư1\"�M߽26I(���2^����\"ymu���A�k@K \n07���_E<�!@��reb��?v&�)��(%/���`�V4Oz#�JQC��j@/�C�,� K=LL\\ik��	8�Lc(������\0Ԉ�{!m�\\�4�b0�S����tO\r�����Z�K���#\r�i(����/�,F��?��BA\ZT�_֠�;�ғ��H�-��_O�<\Z����I��@.���Ҟ���jye+����5�\0B #\n|���+����T����H�&1�D�\rRָ����\n\\�ؖ	h��%�M�q�j@/pRt��Y�`��\\EdbB>`�K\r��H�-#܇kl#P7k@K ���_Nԝ3I�j��P�X����:0�f�����d����J\0�I���1�1b�\"�.�XA,G0_O�<8�fA�p���0C���~�9�H{�v��������1Sj�K�)�qhq*W��\n��ycWET#\0\\@��\nnI�4$�urT��ƃ蛐��9a��`����\"fAɻ�M�Y�sѬ7��\0܇	큺Ð��$��Íh\"	}�Ăs�2�QT�\0tU�D\ZJ��\0rK%��W3�X�-д8��n�(E�Í Ф�#�|@�z�/�=@x`R��;�87B#�P�,7�,�9���$�d�PB���l1�Z��\'�7��ۖ���WQ�*��M	4��A�\0*�$�!%�Q(H!(A[�8�r�_B�������SB�Err⟭O,�k*,G$��Zo����\n�+��L�Kv�B%���ySz sJ���qA{�V�#d����$\'��SCd\\��J!\\SƯ���.�=���S��@rL@��(�ʮ�2I\0/���9���\Z�ě��D!\Z��\"�s+h��	�U�U<��X�h��\'ܔA(�C��;��� $> \\��4���W(�)��FI.g���R�rƗ)�T%�қ��y��})�#�\rP�7�n����4(�l9ۍm�^�\"^�\\\n���W�ek��vFʇjQ�$���~�F�l�C�j���N�4r�{�N�����SE��CÍ�yl�v�lo��\0CM��Gǀ5@{&x&6 \\\n\0 �@\0�?N5����\'BUKAU<�d� ��v��,�$\'�C�J�M�N�膢�C�)C�8q������|`���.��q��\"�F�\Z��w������j�I�YR��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){9��O+ہ�h�P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �%�KNQD��%L�\0�h�9��8��{$;B�׍A��ղޘ���W�kA��@+[�rBW<Z\n�8(&���RN����.\ZЩlF^U��V�K &IA\r�4�~��e�M��0�\Z�l�x�)H̋��c$\Z��TE�<(\0��j��B�O[����Ll��Ap\'Q�ȌE֤�e&����᡺�(0�5��%�K&IA\r�0���dfM��J�1�F\0w����x�\"����H�<V��\Z�Ui\n���W8�H҉�\\���<,�u\'�6	q�5��$(\'$��pj	o��J2��m�Z!� Vr�	�F��ܔ#@c�}G�`+	L�$ݷLn����h��@ʤd\"��5�[X�\Z��j�B/���ʛ\'����l��ML��TM\rD$�����jkIJ��=cQ\05P�1�j�d��	7���h���}D	�brk#��q\0�`���9��OԐ���5�զ奺��<錀ЩM\rĴ��`�����`m�!A<��+RM��\nU=�̍�[t\r[���S;TK %�R̔~����\r6\\���#2md�0I��j�JOHd#�[#C�E�B�/�7�?����&%�h!<,B�:	5�hH���aJ��j^�Ҩ)w�s�AThT(���u4�%4hi���VFfV�i� �M՘y\n�od����*�!P\0E�<*�@h��w4\Zo��p �Ƈ�6MV��s�!Ǖ�(��r��:D.x�[p��Byڃ�.�%�Y�d��kNQ�G9���*��\"\0;��e d�ց2/d�jp{ui�)\0�|kQ�׊�Ā��b�\'�C�2�\0I!����<A򪯚U	�K|�.-+�5R�@6��j���$��zs?1<*~�=ʨ�}�@�4[P�%�T2܄���\r����\\���c��uT���,��`�Nk(ѓ�@ZlH.�M�u��RC�D�<}!�Ki���9-�Mc��Jj1�?�<r���V��^���!\0;��m_P/\Z��\"�B`x� ��|?Z�9\0-�Soj�H�c�Uv�6��J��H\'��������䇼j-$��\0[.5G \'�Bt+�䀆�\r9�G�yR9	��KY\"W��<���\n��\"�ɑ��čէ��b/��\Z�9\0-�{���$�@���,��?xh�K#[��{(�Z��j�� .#\0֪���U�	o��̒5�a��#�\0is�PP&�j����0YB��St�\"�T�ޚ$n�8��l<�X��$��T����\\\0h\r�,�w%����W��-c��\r	\n���-�\rn���3�#0d�ud��J�CNQeHL�Y]Xt�\0�h@���q��\"�S>�C�ZB��7�ֱ��C!p7sA\ZlO�AZ�D�\r�B����5`����-������n[D�W�$����~�<y��k*,��\0�h�����2/d��j�r�5 \0��ւ@�����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�BP���~�Y�R�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E��d5,�M�<24�b�#Z#d�BBzr<}�.�E�Z ���Á���!k��\0:KI�od�TI�Jɒ9ȍ-\r&���Z�d�FJ\0�j*�E��5�����qF��\0)N<2�I-D�����7Җ)��rR!���\"\n���oI�*<�T�m��Er�����:��|�Jl��I���U��FBH����mV�w̉����<��J5L/-j�&L����hL~5N��t�A[b�)N?���䨺L�\\%�\rHA86�#�ZD�+�H���\\���[���?�g�D��R��Lײ.qLk�)sT�	��\r#�o�L�\0���%�[�U�Ȳk@�+PE7>\\*�+��J�	v���tlBc�k@��I5��K�������d�����n�Mh����!0\\�O5MҪax��%�P\r�5$�E��7	[�BX�\rI��\"SP@�jj��xf*_��M�ūO�I�7�b8�U	+�J�Trm(���d�\"��쁭4�\\ZȘs5�22��Ĥ2��\0Q�ʤ���D����F�����\r�Ka\n�Յ�C�)sr�]%�-I�Ӥ�Hh�b8�Ei	+e$��K����4j��O�I8#�$7�5\\A(����X��St�;ո�85-e#�\nFM܎\n���Zd���Թ��$���Z�@�K��f(�娺N��j\r��ӓB؊� V�:�uSHh?R�\"4ND�Yس���\\�Ȋ,m�3Y?5M�vT�84���>	fM͐����(�<j|�D?r��� K��*ޟ7-E���ǨV��T�DO;�Б�H��f�Zt���mA���9ȑK!�Vm\"f��R\"�a��ϛ���@�������>`���3O�����*`�9����@v��1T%�d]z�j҆�жO����\"kMȺ	�i(Z�\n���Ɯ�H���e�&j�5\"(	��j���ډR81����r�5bMܨ\ZQ,<H\\�6LJ����rɾ�nh�jbj���B\\�G�.�lжL��\'��{�L]����8\'��2H��3��V��QX��k.c*���J{�\ZG�X|j���]�����\r�cƬ����Jp�M `/��Z	r�]4l.OR�M���# ~�W��f.Bh\0�U���\n�E<��X��u܉��.u�SuIR<1���D^�d�BHpysP�Lx�ՠ���ԷU�����P<��62�#V��Q��_}r H��gs�����>kY��I�v,nP�%�b=�s;�]BS��4�J\\�S�l�b@�9�zP��T�4A-�@���T%EӺ8���!i$�b�mZ�R�3�CEƫY��r$�0\n�2��v$\'�ԇ�O�4/�0������݋&�H$.hB�����K�!Z�ȗ��p���];��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�gqɤkT�n��/&�5r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m��sH��w%��k!Y\"q��%�/+Qr�R�\"��A���%	���K�C�:N�)\\�aI��k�\\?�4�h��LQ$�\n���.��S2��C&����g���j$Z��=��NF�ⵙ.R�cR�uԔ c��v5RjS�%��hL��EK��Sc\")t�wʹ;ǝ�Щ��\\��(h*�b�|D˖�-8�<�4ihL�\nȒ�@	����F�L������F�a�p�ƳvJ����K����J�{��&�DRi%\Z�\0M���dŴS�j�d�-`WU�*2-�R8�<��\0щ�r��d�(�3fO�8�A/@�ɭHB;�8yr�v�N�O��������(֥\"�\"\'�%\Z�Ҹ�-8��h���j�dU���]�*2K���|^K\0�Ж^B��!�\0\'\Z[ȗ!����t֤\0��؇�\n�n�7N�T���\"��w�((���	F:�rq˒�1d��II�]���\0�v�*g.b�pF���\0�Ϻ�%��I�\rˎG����LjB��?c�R슔�Þ	p	���HI�-tMH���k�\"l��ɤ�!��@�V�U0.�9sI�J��V��38��D$����BJ-\'%V�!� c��JNBG���6�[*{�ձ#�I�_������˔����G�k1����)K�M���1�Kl�Ja�H�����#$$���\Z�&�HB\"�υE\n(�j�u4&VyUJ��M�]p�Ò��M&�:�$�iZ�T8����[D:�i3<9y�2!U-d�0�,.9xqT�w�*�����#�L�S5<@�\nU�O�[H�M(�����J+H,��~�d��2目�)U)s��%.�\r-V�xr��;�!�8��lK�\\�:�_��Y�t�Ů\\��!0_����6i�9V�.�=���IF�Ȯu�9r��	o\"W�Z�\\�vc�UH��D�Y*RX�4�xQ*T\'�R0�0ē���L��)D�F�̃�ƨ������������q/tj�($Rh%�\0��]�rQ[c�A�t���iC1�]�xU�O&�P��J\\��m���ʛ��س�\'\Z[�%��5@�,R���.��d��a/SBel��%4��C!a(�`�?Z��h��\"Yt��j����\\���OG�*bX\0h\Zs9Õ7�PYܓх��oƩ܆E� ik���y\Z`�U^��i.2<G�Uƴ6OVKQ���v����ir��D�\rZ�\'�9�H��D\n ���im�>��d�*�H��FR��\ZndSU�Bp����l�XK�Pp)�q���SH��IF��\\�rZ��-�j�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D#sK�����.U���ꈁ�\r���p�4�M[Z\'\np�pO�w&�M��c8�8p�Qj����Y5�j���Q\Z��A>��0E&���L��΢T<�&,��4��م��TJ�\n^�FZ��Ⴡ8�*��;�F�8���Ù�H��Y>����\0bj\nD�M��Y5��ji\\��F��H�2a`�M@#\\��\0x�T�_D�Ls�����*�U�I� ���yT\Z ���`�A���w�VZ!a`:�Ӑ[T�)%�llɬ�h�U.쏀�\Z��)�j�\'��2<y-F@��Bs�_�K�8��&��zD#P����M�Z���8`\08s<jG�t��Z!��Ө�#\nN�J��̌K&�kSH8��(�O��)�1��F���_��N�}t�F^�[����9I�L����y��zWLcD�S�F\\�Ρ�\Z���n	�Pp��R쓦G�R�cl�p.W�\nQ���%�\"�Xo�؁�<|)N��I�d@�[1ǟ�fkd��l!G G�%�tj��	��\0ɣ.df�.��D�6(�`�6�Rv�D�&�%�Y\n����`|�}$�]�ɨ\0���ҟ�\'�\0�+tO��\0k�����$�!Ca\n8���T!X\'���\0]9�4���q؎8�`�u��\0k��F���YK~U���*��/�S�؟���2dx�D���H̉�ޜ��Αds s\0�\0��1�Rb;��F\'��\0p�xө)�[\"1��(2(��cI��Lm��.7�U��/�	-��\"�P�b�q�4�B� ����4�Yhw��	n`�(�6-9�v����l�M�\r�5@�t�T��6�d\Z�K�X�d�[�o�����/�n��e�1�\02`�\Z�P�C���D������\0jo�L��@r�>c�P-eB�Z8��0\rs<j�~�Z���8�V�pq,��X�K!s���*�\\)��*]7�*H�2k\Z�0��U*I�O�T�2��3���*�w���`A�E29mt�aJ�&\n�\0���Nֲ0�N��d*�\Z���Y\n����w*�r�?�)�I�k�K\0q^j���B�+�Z����pʂ��B�0W��b�U~��\"p\\�\0?�ƬU1D���6�+H��K�Y\n֦�D$]|i��/�L���)5��~)�w��H1}J��@4� �G?\nb�)5��Sy8�b�Ut�-�jv\0��\Za�zn�X�:����b�(wKk�k!Xߕp.��\n�Ժ��S�!�P�b�˅Q�6� ����Na*w����\0Q�`�|8%]��t�a��\0��4Û�5La��[<*�J�=P5�W�!Zߕp.��*�R�*TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��	�5�[Ii��d_:��,��Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ�OJ����\\3�`�K!� 	t�z�m\0s�/\Z�+TF0�M�Z�=P�A��mÅI\rT�L	0F�p���MI��.�V�Z��\0\0)鵇�TA\"�S�c��6�ZJod��&��h��Q��-�l�1X�\rҺ3���؁o�I��%�9�� �,8~�<PJhIڍ@n8p�Ա���d-qh]!��鵀�K�D+e%5�po�N� W�/:��<�8z�h��(�3��\\b�o���lH��T �GΠ�H\'2 �\\�GQj�JpV�E��l8fj΂�,�B��oM���\\\\��RfM|n\0�\r-\'�/�*��,����MG 8�15�/\n��MS��y[|8T71RKQ68C	r�L8Z\r*��n�\0�#B�{��Ơ��R�B� ] )\n���	�O�9�=(ZJ+�d\\3���R�?�@��=EArx/:㗍\r�)�g�9�U	����P{P��̄D���TqRQ�\'j4��j|�H��ށt�������1���[)%��4��ZJ㨢-NG�8�\0Z\Z�E�k�V����!�9l@QRj]Q� �H_�K5JD������4����Uk�\' ԁ��\nXV�r+e.�\0�\0���lG�Q7�-�����\0�X����\'B��I,3��M���\\,2\nV�):�?x#P�y�����C�Z#c�F�!��*,�^��&�Iԕ�\r��-6W^ȼ蓋Y����T[c�f��7LU:�n�;��p����u��eLR�\n�~�Q�bT\'�ƀy�.��#��\rA�hP����m\0H����9�IA���Ή��ڲ�F�YȨ3���naI]R[�!��iީ�؄D��ƨP�}�@Z&j\0��8�����r#c��4�(�.k�j�E����Hik�\0��b�ƪn,�=�X�5��5���yhn��88� �\Z�)���#s��B�$�άv���Nf�@.H6#�2j��At�27\'�AEiK�\n�cr+d�ڕ3\Z�Iغ�}�sp)e@��G���!P~���yhn��$�y[&b�U�҄A��l0<i�)}%�J�N$go��W��7dLc�\n\0m�҈��/\\�nEl�)31��%�ȵrp)�T*���#���s�xT��\rӺK�pq6EN5w��Y$F\\�){`*�d�S��Х�C�q��ʁ7GG�Hh8���?�r �Wʓ�ޓ3\\\Zt���z��ή@�K&\n�hZ���_�CЫ�%> �/��H�8-U�)\"!�A�C��W�Z!-�N�h�\0��	�fi��at�܉�qhT\r鵀�J�\0�5�\n\\�v�N�	E7��j���6e��\0��p�cl�>�|�7T\nT����*{r��60�\\�B���4%&j4z��f��~j���(��*����~·�$Vɂ�I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WE{5��<��A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�\"j�$\0K&\'�aJVVbn�P�@\np�8q��X��!�%9���sG���V\\�Z��k�h��iC��#���&���D5�\0F�\Z|�^�I)�X�_Ԩ�\"�\"K��0.�@�������\"���d�-!��5���)Y,�H�s=m_P�����K �M��L���z��\n�Rod��U���@�h\n\"(É��)��_��ܞR֕�2�Z�t\n8�CI 7��g�\n��h�d*T�_\Z��N�����-�0_O�>\"��d-d=8������iDnds�\rG)7�N�k!��\rhBB\0�t�A/`�ր\n�\n��l�TT�Ս�=��|�%������Ս�E3�\0��@\0�㏑��@=��Bc� K}M��5������ll|�j�0�J#���命�O�md-�P\0K����D�h�\0n֕R��0��&�R�р$�=��Vd�D�R��E�Hpҥ8�ƢQ\0�VG?nXA,��\\��YXJ$w\"���I@/:XS��� \rO)7��[#�!k@E\0��:|���I:j����uJl�X��R�|S\Z.ָ���������\Z�0�8�	k�\0�K�\Z�/V(.�o��SG��ˈ��e%R��� ���1�S�M쓁޵��h���c¬D;�%R������h$�$�O��HCˇ<��P�F�P�@\Z�|O�A\0�\'JtrD	i��}7$\\R� �-���l��^�����CH���Yhl-�\n\0O1�7�P���\'G�.8^ߺ�}C�Ӏu��	C�J-зQr( ���{��b�!賺7�	j����x�b-d��Sc�P�:ZP�����h\0�5�b� \Z�h���Z\0	}Qn-�<�\0KG�[��Qn\0�������	.�&��\"؋�\Z@/�*G���,��_I����\n�B<���n�#|�]�i�s>+`\r1J�N�4B�@�h\n �֢\0����B��֒T��`��PS�%���q-�yYg`S�bh�C�hqr�R�_8�r�}j����[��@r�.R;�;���0C���}Gǀ��IL_dj[�( a�\n�1�ySz�B�n$~?\rh\ryb]	.�I@\r�<V��FUC޳��A*�*P��8q��\0��)��X�c����}8�^�d,�҄o��K\r��GǂՈ�^�%���\rA�\0(���V�����ѐ�4��ⵣ�ERK��%�c`�`��1B��&�!-pҥ��ƫ��\"��� K}Mm���cG)V���>Ts�,?O�|W\n�ě�=F��h����\Z�1��s�*��H&�^�p�Eh;#d�jY4�V@������HtM$�C�\Z	B/|�y�r�_E@�22HC��m��@g� Q�E��]��$�?���#�\0j�	��%�b&�\ZY\0Q��V\"��H�%�$�y]B,A�G`U�0i$\'��s�*�.�;�Ģ�J|p�O��腕�|@��4_O�.4�H�������!�������U�O��\"\Z�(h(��<+X���z2�-�I*o��<5b�5Hv!���yZɞ	U��!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/g8	�{p8�J�\Z�n\Z\Z�Pa��I�%�BAt��o��?��*9���T�> �M��}�^�Z զ�j@�\0��\"����S����A<�n�ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Ms�\0;�ј�����E셡�\rZnZF�\0\Z� h�..h!+Yp%>!\n^�p$���qZ|J�\Z�n\Z\Z�Pa��I�%�BAt��o��?��*9���T�> �M��}�^�Z զ�j@�\0��\"����S����A<�n�ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Ms�\0;�ј�����E셡�\rZnZF�\0\Z� h�..h!+Yp%>!\n^�p$���qZ|J�\Z�n\Z\Z�Pa��I�%�BAt��o��?��*9���T�> �M��}�^�Z զ�j@�\0��\"����S���lH%O�K�7r��W��.\0�X����	mG�(�%P�cH�}G�+VFD�Y<S_k�0Ys�Nu<��\n���*�!P!����m���A\0V(Tp	�{B&09��6��Z�hJ��Fdn�.\0n�(0ǝ�3 K}Ф�’%ѡ�3�����M���:3$@��,�K���Ts�{%C]V�H�@--[\0G�Ǎ16-���<KAyX�\0,�Ƒ�0�H��\\9��|�q�؝Q�&}��\"�j����Z�S��&B�J���NdV2����lfH�G�X�k�g�E쑭����A���E/�Ɵ�\0�E�\\�b��yԗ�RNkn	\'$+nx�Y��MRwL���E�Z,0���3�I�Q2J�����G�����ɵ�d�̐��`������r;�[X��K�B�B=G�\Z>��ꕠ6䀀c� r¤�YDYMӚ>RA �a{[V�7�AG_q��n\0n���#ʢY-^P�e�#F�O�A�xV2�6E���H�?��e��r�7��SK�̐i�i\n�:�;ޟ��%d�ۗ\0�y[�%I.�4/�`n�A<��|֤�JU/�\"ᨶ���b<�T��ɫ�JY��\Z4��G� ��k32md�#����j��{�L�/d�x�m{ui�*\0*y�b�$�ɡ��\08Z��\'�\'�$�7B����ZNnl�*�E�\05R�[Ơ��%T�	$�ә>�琬�ɵ�n�m��\0�`@���)K���$@�Ok��.AdK��F-��Ĵ������(�N�ǂ^�*)��B[���.\0\n�2���9��	����i���x�*yɵ��P��\0�j0�\\@�L��6�hx��,E�\0{ւ`�*ܨ[����Q�`�c�4M��q�p���u��$&�/{up\0T(��	A���5��\0rPCF���f|�&�L{҆���4}C�+�j�Ƚ�M���B���h&�����@�� .ީܙF��D��A*y�8�P-YT�����ۆ��d�������D�Hd��cNQ�.s+Y1D��!\0?���ޕQ�N�G��1U�����kh�\0���p7 ��������$�A �^9�a�)N�g{ۨ��4(�ү�Z���X�2Jo����I��K��YP�IH@��}_P/\Z�̋�4_q��E�B����ö�d�6���k/%X:�:Q�����޵c���Y����ph\nL��*��<\0L[��!�P�F4��|0��meB�+$@z�-�b��9��w#���\Z.4�D\"�<V���-x���\\���7��\'� ��\Z&,�(�	�m����B�b�F�H|��AP\Z�B\0������M�X�t��4澢3�K��h�����lQ�c��\"�N脍դ\\������-�J�p��i?��d�U��M(��A �\"�?pj�ܦ\"I��45Q\0�.4��-�z��2H=#CNQ<�	k*	k$I���e[���\"�A�$\Z������Z�3\0��U�\0��N	d���]�9��O+ہ�j��N��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�C#��\Z�k\"rJS$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt���mHZN\r����\"H�\rd�r$�mA-�9TL�(̔R�J�\\T�(��e��#�� %�<�b�!wMd�˚� �?��;�H�0U�6\ns�T��Qt2�phNMb?z��.̤������\rA,?���E�@�&ιLp!?�ē �,��n\rK �¤��&�5�}�Z�Ǐ�j�j&�!\n�D+��V��j.��+d%������\\I�U%�Myq���j	dO*�!$~�D�h�u���^5�\'���ښ�}�\r\"�S{�	�67�B c�5�x�@�k�1��2�HԲ�	r\rHZN\r����Đ+�RS�\\���&����2!O*�(�%\n�%ു<�7E��u��Y�U:)M��G��1�\\�	z$��[������xbA�\'��M�é�%��齈��\"l��s˴�K@ڂY���H��ʒ�;U�\\��a�3X�St�K�\Z��Ơ�E�#py-K%��A��D�`������I��1Pe�Qu7��	r\0�-%N�؊�H�[%̚�t�:CA_U�T��B�H�-f�����ֱ~k�$���\Z�	ʑ�}c�	j#R���Ts=)�6�PBM�N>5.cQt��ũ/��V�lG�W{)E\"�Bq���ND�0�@\Z&h.MH�\r��k2�5C��81��`��ɨ�\\\\��!B�.g�:��!j�D�3���\'娺L�G�q��6�!8^�������ut���mV�xQ9k\'D�\"f���ܰ�I�ߚ��eNpc�t�@\nS�J|�D�:!9�\0�?\Z��.�Z�E����娺��[\'�z���Q����h\0�J2O�Ӝ��B�@���	DQl0^u\0�T���K{�jzl�5\\�D�Ã�hm��Z�\'�o�@@�5��F5@���dLT���؄�:��VɺT��t�\Z\n�V�1�5S�\"�LB�3u8��@E�㙬���v�I���\rK\0/�h$�ʁ�(?YsRɉ�υP��;])�@�����\0�h-E�z�av�qi��؎9޷�\"|���J%�h?U����R\"�t�X�5\\��\'?sR��7LP�H��\0�J7A�j*}�������D�\\-V���f+@yj.��V��G!�b�2@�r�\"b�:KCA��`���$SʨR�`� �0�jy��n��H��\n ��V$�T�$.jY,xՃT�t�U��V��T]1TL.Ai��d��-rq��T��#�Z\Z\n���O�D�O*�β&\Z�T�[�ɨ~j��k$�O��İ��r�p�U+�	槥1��T\n�%<F��B_���t�z��װ[��H�W��e%���U�r��$Q�TB�W!r\"�`�jA2����0�\'�t�*�� %k���,�<|xU�L���&�Jq��j��d�cs�Ԅ(���k@�2%��}%����k\"rK�H�(� Yg��W]Ȝ�Ƴ��MS���1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋��K&�U�Ry��TH��D���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{��)IF��8��\Zb��D���	d\rZ�x3�����4�-�yT�Z�Q�p\Z�2pd�$�\n&�F�x�3�_¦�]6\"_�\0�s\"�L�&0���J5�\np*��H-����BY4��`��<\nTβd���1����9TJ�I\Z��kl�O�8��\\���B�n�E��s�	p�6�0���M���J5ȋ�w@҉i6�/�v�$�\n�����FC�&�K\'8��\0}G�ʲ�k �&0���\Z�֊Sڐ7K�AG³%�V���	p�>�{-C��h�<0�c�\\�O:Q�I�R�$�H*����S��S�m������@�1)�rZ�D�$Q��in�p���9��7K�AL|x%fI	-�H	p~[eR�t0	��M�p�(��\rLdŔީĉ�\rZ�^�y�L�mNyt`i̧�YH�� �O�*	z�h�Ԁ����J�Z�oT�H�l�R��pLf���J1Ȝ�Ð4@�R>��ɥU��]�JS/&� ��LM &g!˕g\"ֲDH&<K�rV��$��Ԅi9��\Z��St�x%��>U.MЉ��	F��9r��-�O،����m�3ⷩ�y2�1����ϐ��$Z��>�Aa�?�\"\\��V��@��\ZOʇ:#�d��2>�P	7AumH��J5ȋ�8\'%�ŴE�),���f)��sJ$^M�J�V���ϻ�#&�`� N������G1%O�������C�F :�l�S�&��K	��v����i6�mP�%�H*֪�.��*�\\��v�	U���39IG1�wIrL4��\0[��R���v@RC�0�#T	�h������q/{&�%���IF�\0p��\\�Δ��M �Z��J���&;e��ә�)9�>%�8��1.?����QHA���q-E@�[�X\Zr�h���B�Q��xp䵤	�d-�] �wp.��i)s�4���H������w*�Yߧp�-�ē�!�j�>(�H��]|Hrc�V(�Ki2\\���\"^�J���J5�.G�\0�`X����%�H*֩7��y�9�hӊT���,o�{������Yߦq�a�\'.C�X.��H��o�1��(��m%��=�J������I(�`NT�\rm���B��IyɤkT���4��r��I��`��7<�7kY?�KȘ �̟w\Z�^��](�\0-p�R��U�&kT.���-�>׫S�$���v�q(����	���[ȖM �Z�݇�VK��:�\\���,���7kYX�Hq�[�%�.@f�N�Y�Ak�A\0���Kas��e�U����IF�\0��up�m]-��4ky�ǕQ��D����\03>�KA��!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB�,�AV�I���D�ɴB���\03>�KH��BH� �\'ΕIJ�!;�<�Q�h�s��/lҁ[��(�#~�Q��W\0���%�h�N\"Y4��j���҉�h�r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�c��B��*�H��Q\Z��Rn��D�`#]b�b��_D�Ctni�4�gQ*�ILA\0>IY�w�Q�	�N6����ޥ>&���˂TZ�&��`���+f���\nB���SO�5���q�����͢N�N{�����GY����\rM� �Π� �Ɖ��a�Ԛ�n�8�aʢ�UINc��B��j�HϘ���D�v�ÀF;�ʾ@�y(_B�i�9�/K�-Ű��Z)L\0B5 ��s��,�s\Z\'\Z�m�g�fj���6p�T��%~���Wq^`R���Ȳ~���F8]0?�4�B�)ӊs�^\Z\Z��.�?�c*�$`6�`�AϘ�4��Nc[8��.\0g��=�j���:���?�gk�\"S��M&�6\0���_\n�R�Id����Q��29�S:	h���-e*� uLA�\n���^��h�)�\0墳JG��m�Q���R%���K\'�s}\r�A���\0�.�0�G&����x�Z�о�&����,����\'E�Da�>c��?)��X�0$�-��Rjkt��0��l���K���#l�k!Z�Ҹ����%�\",lrk�S\0�>���\'(���K���*�I��P��m��#�p�QT;�kD�S��\rs<i\\�Iڂ��c�8�!Ý�(5Q��d/!X�5p.��K�H�+tfM`#g �w@ґb�&�*�c�\05�Nc�:�(��\rM�\0��1E���U6p��(�p�FtT�ݔdf0ud-��TT�޺��I5��oʸǘq$��2�^���F������B� Y�J�H�1C��J{D!F���J�H��`��5N\0p��|ƷGLa`!�	�P-R��hI��Zߕp\'�V��}J��)>�B5�0���T�2��Nax�AsP�/B���\0��N<����M+H�d\Z?�3Z�[�c�-�,M�+H���҃,��V��\\	��+HT���*Fd�F�92v$�j�\n`���\"ipL�Uu@��k`\Z�����S�2�Z\'n�e`�pO�#R�0�89�1�Xqt�)�Y5��m���k\0��OD�\"��k�L\'�B��I�N%�t�Z^��g��w\n��y\0�jn��<+AD�H L5;\0+W\Z���,i��,�H�7I�^B���]�����V�R^��\0�8�\0�d\ri*Р��^�]�&���Ixl#Sp��x�T����w�.+T*��1��D&#�XC�H`�B���W7b���O6�%����\0�w̙9qN��O����\\�2��3�{\'^)\0���*�ޞ�N58�\0�3�T�ja\0a`:�����.�P	_��cpTBq_W\n��v����\0�v)��8UJ���\Z��^�\\0��PkeHH�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D\'��m%�׽�|���N�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Z`�B�y�4VTJ�\\Mr\rA��E�a�U�+e ����N�\'�*Q2��\"�T\\�-�Q�\n(>�xP��o�!�b�8�T��J6F#.r�!�T�T�@5\Z�ȼ���%�X]\"K��1�\r\0[�l��A!͔��!M$��cJq1�<�O-HZ��[]x.b��1�L։�0�5�b�\rj�&� �J�!�Ƣ�K��&j6��\"���\nj�t,r\0���H���pʪ.El��5�v�i-%�B~��@@���\0!n�(�����?-\rԒ�\"-r���Vr�t\'�!.[d=�����3Q�N<��P^T\nI����=H\0)鵀��HcZEE9�rzP���l��Q����*5\"n�\0��o��>5�?%\r��;쇖�} q��j��N�&�K����\r*�)�	��\n�T9&)Ƴ?5��n��-\Z���r�\0����-[(M{Ӥ��q[\"��p)d��U4@k�ٯ�/\n��L1���T��.	��#%�dT�P�}�Jpf�E��陥栺�V�Z��\0������	����M{\r�A8��Oޢn<�p�G(���\0Z��\n2W)�dHC�Ҙq�5�D�S���l�ǍK5Q�t��\Z����ԓ�At���qF��h���\n����@�E#�\ZA8���T�����J\0B�r��:��hn�$�0��9l�q�kTQale�[&)TU��3t�+���&��P]#\"\n��P�ޕ�U�\\��:���t�Zm꽈�p)d:΂��#�P-��k71��n��l�9l�q�z���0�-�ܨ�E\n�0-j/{�s*��269��m��?�k\"�I����O��U\'�L�Y�r*-��~Z�-�	�\"�p��S���˜����T)Tڒ�%6����3V	��4lc�\Z�4f�X����c�!�����E���O*`�e!�sr��*Ɔ긤���-�Tǅ6���@�1����U\0��4�0F����q�5��Lc�\Z\Z	�JXڹ8܊�QOjT�v���eqR��ur\nY��H[��Տ�0p1SX��X.�$BG� ����U\n����-�p��Hp�hR/�ˉ��AuOډ�rz�\r�V���*�cs\Z�	�ȃI���5����1B�����!m|x�5��hU��!����%�\Z��V�?h0���Åi\ZU4��F�8��9fk@9�.�{U��D(\0)鵀_*��y\n�*`���!�\ZZ�\nJ؎��)�N�bp�K�q�O�:��Ъ�����K�<*�T��b78�����NuJrN�hW\0\r�4�֑T	TDֻH] ��Xڷ�2��L�r�Z���#�� @���d)t�5&X��Ma{��S�!���ճ�T�D��a���TH\Z�9&i\r\0�C��\Z��f��-\Z��9Z�����ȱA+\\��-%=El��N@�K �V[B4�\0�T%��Ɔ��T����#?\nꚍ�0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]��C��L�J�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-,��p��0�����))�Z	*y_��Z8�G��������\'Vc\0�! �(E�ÍA�{����H�K=ML\\8��&$\ZY)�d��_�i�pq�r�����[\"�ݭ,������	}AZ$H�k�洏`�\"�܁(�����\Z#�MԨHp\rR�|p�D�\'E:�s$�0�h�}@xf`bE���zll�P�\0K_Q�Yj9I��%�.�G�\n�$����/`�E���\0����b�U$�卒Nn-k������:�L�m%	�3ǝ�9@�).P� K=Mo���fq�-P�tO��J\Z_�a��	*�/Q�M�-e�8��� \0[d�a�\n9�dT�ih��|ͳȭ�1�I����@+2j\"K\0���AK��Z\Z��8q��\0�R�V�\"G��)n.@�%,���$��\0KJԹOY�{ �[�u\rM�\\\"~�r\\�I���ZUnp�_��INK\\HC��L�A�A$�4	#�-%	\"���\Z�DN�-	c�R�SGӘ�����k)wO����\0KM��G><�[$J�ț�PV��,�+p<mG+��#ش\0B�IS��b���\Z)M\rT����*B�#R�%�\"�*������H�j�4������♁X�E���61�_�iONg�pZ�&�I��D5!\0��9��	}�Z����A��\0LA�KP)����Bx{�JNlS����An�(Uq�j@/�N�c� KN������Y�G�;�F���\0K\r�R��p���Qhl#^�����8�T\"	}wML@q ��qZ�u\0\\@�%\0�P�n����C�\nQ/�h1b�&��3� KF��z��,E�)B��㥦Ṟ�S\0�2D#Pq4\r*Ka����%�I�-Š���+o�N�H�@�\n`�RH|AK��B)�����@��*�c{%��/���\Z9H���G$�������\n�	��DB�R�(�n���A/`�Рsq\0؞^�\Z�`�KpTi$!���U`l����J�*P����r�}��#$��b.|R�S�`�h|�_�i�s#�#N0����Y�ir�\r \0�<�o�_DT���h$��{��5�-H�RS�\rq@0������	�Y�uHsCT�x�Ư��P,�H�!O����ˍ�ZʁI�$�������\Z�ě��+�AC�\0\ZI��ڷ���v�����Z�<��U�!��$\'�A<�V��D�	��W9	\"��\Z9e�\n�^�b{qg��*_P�1�Lme@�R4�(����FK�\Z�0&�N����Ԩ@,��v�`	�� z�\r$��(�Ej?TY4�$!�d��*��EK4�\0��%�\"��hj�@/�LYb{$����>��R�\"�LMR�$��/����1&�Ude��\r\0��0�8�ш%�H�͠�\r�b��-*J?H%\0���J���$`<�	h\np�>F���+���,�4_O�!��H���5�J���t�H�¬D��	� �pR�0�j�@>��)�p�_�ZӀ7I�f\ZI\0퉵P��BK���K\\\0S���h�\0��afs_%�����\\R�ċYR�k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�s� �W���ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Ms�\0;�ј�����E셡�\rZnZF�\0\Z� h�..h!+Yp%>!\n^�p$���qZ|J�\Z�n\Z\Z�Pa��I�%�BAt��o��?��*9���T�> �M��}�^�Z զ�j@�\0��\"����S����A<�n�ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Ms�\0;�ј�����E셡�\rZnZF�\0\Z� h�..h!+Yp%>!\n^�p$���qZ|J�\Z�n\Z\Z�Pa��I�%�BAt��o��?��*9���T�> �M��}�^�Z զ�j@�\0��\"����S����A<�n�ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Ms�\0;�ј�����E셦9\0v�ZB�=XUs\0[E2OK�\0D䔸�h��\0ABy]G֕|�J\'HM�@T��ҳ3��@L��h�әď�Yk!5��0�M�Mx��b/d[#�jK����OV�>ph������2O:Z��ANh�I\nfX⢑�)����ZT�RKc�VR�%�R�@]$���\r9�G�±�����:H���\05�\'�T�{$C�U�9@:UZB�/��s�[D����B\'������)�9�8��lV��d�����\0j�\0	�;Vr�%��IR�+Q�K]��A�q�2m@�S��#\0;�ЁG����1���ź9��PB���\0��-x�5��Š�<�nV@*M̢(4N�H%2��x�P]��PT�����5��1O\n�Y-�E\n�(F�\Z���=°�̭d�N��\Z��՘׀��\"�Iod��\Z���E\0#Հ�\Z_P�+CA�9��<,�p��P{E\0S�9����y\\�kV��ʠ��� .-�hj�P\0���)d�%���H�Ù���V\\�UE��2D\0w��-��EI�����m��R\\�5X�G8�*J��\0���� �=��O�5��$(>-c���u(vL���E�Z�B�l�M�h���$���\ZT/�|\rfdM����B\0��ڇ�<Tޣ������<j\rU���Ɵ8�Sz��!KB!�k.%.�	L*�H\'?��ԓ���+t�Qm���HPa�LmY��mD�d�#����<r�2&�O�L�\0�`���=��ȺL�Z\Z���r�s�b�!�&iĴ ���d���$��	��^��ZД%���E�hT(���R3r�&�!�YA��烈��&�Ct\0��S�}@x�Ĉ���Ol�84M-ՀK�\Z�0h�zۗ0��1� ��#����Ꮕ�Zق*�Ċ*!�\Z�T��\nlyڎpK}�q#�䠆�\ZG�~b��2meA���� �m_�}P��)�?�5ii\nQ���[F`�6��snKA\0xZǒ�:��Ip�$�a{/�Z��Qe�I�.\0\n�xp������X�2Jo��?��(&�T=�$@j�4[P��R�NB�N�Ā;N--TA_޵����Kx�sA\0V�<,��r,�S�sT��<TyՋ��\nk;�n�4�hj�@c�*��%��R�!�f������\r�&�T��D�.��`~�2�#2/d۲��ui�ij�B/l����m�Ĵ��$��*�Q�T=�$R0��Xⵠ�R\n�VY$\Z�n\Z\Z���6���<`Ua�� !�����G�§���\n��\n���7�\0!��#2/P��cP �l_ֹ�o���sA\ZJ�o��h.�ɤ��!u\"�-��Ջ�l�Uf�PIj�hT6��*���\0)$���\ZF\'�?���R��Ht���`���3V&E�Ԧ}��\r\nZ[��_ou��0h�Q-��-!�k.\0 AZ��\Z&ND��u�W�:��H�@J\\\0�s�[FL��@C}\r9�G��D���V�āަq�s�\"�I��V�%�-���ј�OD\'�k^�%X�!���j�r���$����4*Kc�\n|��ѓY���#}-9�G�S�M��S\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�BP���~�Y�R�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!�m�m||G:D��]I�Z�s��Zn�-��WE��(�]�\0Ԣȟ�NBH�\0�����!p	�8s5�yT�;f@�\'�jIj$c�=�hLoz�^�������m|���R~SK���	r\rHA��6?���H��K�M��C��PL��!$~�F�Z�7S�.D_9�k�O5J(�d!�#@\no³%�I��=�\0Lr<jIz$S������3�~Z��J�	pR��ob��$�_*E=���q�߿�g��)�R��L�\\����`��\ZDʦ�N�CS�\0z̖H\'F��Z���~�.��\"\n�E9��iy���[�q�x6�!1Ϊ$��Τ���,@h?U��u�I)e.��L�r��\'�\\by�n���pF�԰\0/��*$Z�=�>9D��7Ҙ��\n̗H��Z� 8���\0R\rA<�\nJ����ZJ�B؏�UD����Nqq-\r�%�+<�$RΓ�`\rNBp	���1<׺Z��OHM�%��鱿Y-�X�aPd���<U��V� �fO-E�:�	pRx�~�Q\'_*�\\G��4�[/d�I)e<P�	���Q>ư$ʧ̋ST� ���pNu�Z&��\0p��d����=d�\rV��k�|8T?-E�5Z�.Ԅ;&��q����T�r!B��lk&XT�Dځ\'K\r7Sй؏�b�U7E�:@�\Z��1�R%��mxy-OJcƓ�D��>�Vآ)�p\"�䨺w��x�%��6� ��đSe$k���P�4���D�jP \0*���\n�EK���o�R~d٬��Է��$��T������΀^��	h�+9��f*�娺.�phդ��ж#��a\"/dZ�sP�4j	dO�R&�O�dA3U�\\(�{�H&U7L8K{�n\r\"�s��W3P&F�(H$s�dǏ�X/M�Jp�M /��`��]5� ��m{%m�G[#�H��\n�Ӛ�ZH�k+f���K[9ԂeS�@,�#��,3��Z	2���YsS�A\0�`�Q3B��!\n��S�_�<��U��}HZ�B��8�@������%���V�	�֒%�eZ,D	�� �	l?sR5M�	/�FC����vUT��$%�l\'?\Z�^��bS�`i-@Q/�_�k@yj.�U��.��&��~��N2@���D�rCA��X$��\"�M`p��Wb�l����Û��L�pjzQ���	2�d����d(r?\n�*�K�����q>���I�b�հ�R�l�؄�k���+�J��<��CA��`?Z�D�O*���&\n����2\\����,�0��\'��PX��Rā��ɏ\Z�]\Z:IHZKP:�HS��Eh-B�tls�j-!�١l�s�F2@���f&�Z\Z�U��\Zy	\"�M�����-��&�<�����d�0���w�~�`�`�=������o���A�$!Z��/���V>Z�������Sc��o��+d�d�\"�\0�	ʜ�4ʢ��)I��*��Îg\Z��\r:@���\n}�Sv��\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋��K&�U�Ry��TH��D���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$Ny����J��e��\\���4؉x:�#\"��+�I�8�\"���c�\\�5�([DJ����iZ˞n���Υ�	�q`\Z@3��*�R�(�Na��5�mRLi�9�3�|�,Y#R��#N�4�x���\Z&���	F?�\\�@�ŴI����Y4�[����!r�&��s��\0���YɣQ0A�g�8�T\Z�N�S�D-C��j\r(��DNt�\\dmY�T��ё�Q�D\\TNJ)D���\"��H�Z�~�� Td<�m���07H1<9V4�\nb��h����s��l��CH�|�8\Z�QN�L%��˝���:\'6)4�~�$�r�-����,�A����@��\\��S�]\Z@A�KpD�kHT�����.9r)PI)T�t�-�8g��n�=V��dP�\0�E�9d�ȉᤣ\\�.\0��1<�m)����\n���.T��<��M���0\r\"���Y�tKN)���I?��RK�6�s���\0�?ڳ\'��]h��A��EK�Ԧ��)4��ri\\�\\���h��NQ$�AV�n�\n�g�Ll���.�\r-�O���k%�F�p�bI��PI\'�@U�ZD9�3���v�\rS�.x:��H�w�Gގ2\"�A(����r�.@��h��za-�@�U�U�s2�m�=ŀim���RI����p��O�RK�d�����><);]�t��\0�C��HT4�&��k�\0㗁�����\'Vt� hr����\\��������H	��ʥ�%�L�H�#��E�@��A�ʘ<�T�^��ʪ5��P��E&�Q��pڪ%�h���,���X��n��F���A1,h�Ѓ2�;\ZYP޳�\'\ZZ0�\',�qZ�\\��D\rGsB���UE�Kat��4i&Ǎi\ZЧ�T�DO��wʸe~V�,[D�t���&�U�U�]�*�r�&)D���E��*�\"�5��8F�rO�8ՂId�H��Ĵ�oW�uWJi2\\`\nc�n��HD��]�EQ9+H�h��\"Y4��j���4�$y�h�I��`\Z@E��$YSU�g��Km�\'kZJz����p៍�d���] %�i�V�/t�F��	F;�\\��ְ,[D�%p�M ���.�	�-���1,\0��ϗ�S�eZ2��\'j7rN\\�=Y0�H�y�{��b�*�R��\"��l~5�mT�@p��	F�\0�\'�����hSj��D�iZ�%.����r��L�s\0�fx|����8 a�\'.C�X���J�!jh@��j�(S�[	~�@!��:�\\*I�\"�A(�\".N8�\Z�b�|R�p�@�U���y�W/����%��0\r-�g�R�����\'j1$�\0���)�����|��\'r��t��`\nUF�)��I��c�\\9rZ��h�@�	d�-e�7`G�Q��8� ��`�e?j\r,��$��2p��JvP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,S�i�N	���J��#cD��B��()w��ҕ(�H�M@#]� ���53�}	�i�\r.���U4L�Au,��T��ACfj�l�˂�֢���F�h��0C�L���Sj��t��%~���W�>�C��+�\")�F9U29�\Z�����j��K����X���1-Q���Pid��`�\0[Ƴ5�KDL,8�!����\Z�tmɨ�c�p.��!�6�K�S��1�\02dWQ��/����{�dM.	e���M\0Ba��n����)�h����M5*J�Lm:���J�Ih��Y5��h\ZW��<&�lRk\Z�����h�9�@�.M��>U����\r���@��y�Ͻ$�����&��x�\Z��B��C��܇���JZ�{%yy\n����p���!��))�Rj�PX9q�\rg:�K�z�旆��\"�\n0��T	�\0!\Z�s����zG�9�l�]��p��Yԓڤ�0��Ө�ː��5I:66Y5��j\"�H�9T��S�8�E&���0��D�_D^��a�45�1p��Vf�LF�5,$ߘ�ˎ�|SX�8.q��Z2���\Z���S�i�N� d?�M�PK��0H�D+G�g��S͢F��O���\02d�CS*m��:2�4����S/�4E�9ӟ>U6���D։��X`\0�Nf��TȘc9��p�k���e�Y\nƢsp��\n�T��%�tm�M`#�`���}�F\0������ sDSn0p9�d2�8.>����w��#-QN��Th���#�S���o�q�TK�d����D�H�v)�9�\Z�C͢�].V5�3ܩ��&)Oh�ji��s��*�t�\"v�.\0s>5b��c�.6Ã�!�5��G�(0K&���W�<��!R�*�T�I�5�\0�2\'~�f��F�BD�2\0\Z���9�]���B5\r�9���L$�&\Z��@�p��2�B�֖8&A|��.��8`�Md+\Z�pϘ��r�&K$���\0�q�&D�S kIRO�`�zD�/M.�\'����r��@ ��#�4�M$�;u:�H\rs<k@�)�1�j6���.��t�\"i5��jiTBF~U�0��LY&Fd�1�\02`�kCC�1d��dK���󪩲���6�a���U�0�@�jv\02��P������B-�.5�S�#@�B�������+la˛ ��#DR\0�r��*�d����U��%ix�ʧ����&@�B����0<���Yѳ5\\����\Z�V��cLk��*��0]+@�B��M+�p��V�×�2X�I��\'������֒\r\'�;��X�5�3�W�L��`�GiUP�T�JR6v��!ÚgT��Q�4�ө�2��й@�V�+��oʸ��ZB��Dh���F�]�|\rT�_D��	\Zdӥ�3A��I @x�ª��5\0I�/,ֆ{�;Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!>F�i-6���W0@��t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH����5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��m�1��l��43US-0F�P\0���q��P]H�֘���t�Ң�K��{$n���i�m{��S�o*�5!hk������5�x��#tf0��dÏ�I���1d�F#v���T3T��M��F���ߦf����V�[`k�F�!������b	��׵����ә+b�  R��jB�趺�Ɛ1�L�0�$s\\���5$=R4Z#�FK�ɇ:Ȅ�MjL�h���\Z��Rv�[�k��hh��d����V�	Ns\\��%��\0+�>5�@@��-_U��5�	���<\rqd9n�����l��k9�EhdA��l�<j@bJ���&j6���#Í�O�k�\"V�Z�7@OM�?�i�+�S�N{�N�ҁ]{�dp8:�\Z��5�**�qd�4O�\"Bדb8�\0z�R�tq˞��SY�U6�s@��Qoc�3�?5�[�c��\04[k\0�Xӈ$V�oT�1�d-q@]{�( R�X���[��\n-����P�H�O���\"�Q �H��FI����M��\r-\0���k2�D��5�@:@_���^�A7�K���9=(ZH��d��<�,��R�\0T��`^47J�;�Ҷ (��PkT�)̈F��l��-R�h����p���jO�At���X�\Z�4�,�Ñ[(\'��c�(���Q[\"�Ґ 8����B��^�4�C���C�P@)�Τ�1N�M�0�0��J�H��-\"V���8|iy�2+Dl$\r@��$X$�`�V�j�F���k��~�M���U�MGYȨ3^VC�Y?-\n�]�!ĨL24�T��T#%���ʘ�v�hW\0���q�5�r\n60��@OIK䕼A!�M*f9\ni�J�E�N,�k[��H��R-�s�jG�Cuw�������.8�ީ����Ѝ�+�B����B�C��3Q�H�\\�&�*��tMc�ԁ������\"�G���$\r%��.+d_:�*,�,E!��!P]xΐ�hn�)�=��nEj�4����Xp��D5U:C��j4loc傚�|�L��9.\0\0���E����vt���\'N��ײU����Z��&��t[\\��T����{�d�HC�ַ��\0r銤��e�THb��HrN�h�]qS�h>j�\n1�A�H\0�����U��	�$��i!�t�����\05���T(��!n��$-�O�`ԏ���{w���l�j�z����	r���;�D5U���&ikB���᙭\"9��\Z� P��=6��5���|������li(�����)�M����E�7�	�R�4*�p�$bB�-���έ��,�1��J\\�C:�\rSd�$�\Z=@/1ᙫ�2�N�\Z�.\Z\Z()`8ez�cr+d�jL�piӤ��j��\"��t[{��cCt�R�{É�G\n����a��m{U\0�TmT��4��P\nV��38Տ���j��v��G��pʷ�&�AK�;II���?zs[ʘ��քip�����5>Z�kk%�0�-�T�\Z�z�T��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El��^�qD<�d���PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��V־D/���t�Ds�r��Z-l�jB\0(D�9}OD����u��Wa��FܚJ�Ù��Mئ;Q��$���?�fb���%�D�o��+�Pf+4�`����P���}9���S�H��T-��j�\0ָD�(���\"V���R�]Bx\\U�,�srk�	� �	Y��e(���\\��\0R�_8�J\0С	c�\n�{E��C;q��ck$K������������	��\r����h\rK \n��>@K��7KskI ��ܬV�ߔYJ{q\0�O~	Y�Ֆ��C��A	����	:*�_%�����^ǔ��r�d��,?J\\�|�@�[)%��@�!�\"�Ka�\n9/����A%O%9x|�	g�j���HC�!o\n�R\"K\0��}������D�8q��\0�SD�Y�`��uǔH�E:6I(i����Ϗ��I��%����\Z�(\0iP�(�ڎ@K�)ҫP��	 �W�eb�����t�b֒@��pJ�R��#d�C�BC�)D��ߍD���R�K���і$\\p�%-dj�$��\0KJ88��$�K�[��!\0�l1�)r�_@�Բ�-W�J�^jN�$S��q!�	Y��H��m���\"��q����R�!\r� \\�S_P̠�V2�E\ns$��KJ88�k�5M�$h�2!�-hi\n�cW/��X\'�r\ZI�K� ��$\Z��\0m���#���J/����	\ZA(���oQ(�}P���	o���~�������D�>P�-(t�G>\0�&��\\J��F�n\0Q\0Q�7«���D�#LZۂy)�y�:�\Z$�KY��V��)V��!�:�7 �Sq|y����7�Y\\�\"��о�Jr�*L��t6���\0]�a�~��\n�od�7�4�PP\0B�(µ�C��E���4���^ɕ���� qJ*�8������b�ɞԇ����%���8q����.c{$�é��qp�J�YS�R�I+C��n:pq��*�n�/�5�\r)dn��b	}.��v�J�/Ȩ�E� ]%��Bxd<�Ce\\4Y��9�H (�qÍP��)�=���SE����(�\"�T��IZ�-\'�D$s൤bM쪏El*\0L�Q�\n�1r�\"�-ꥠ���!���\0�Y �-$�/,�`�yM\0N�Y�C�P���J%�\'\Z�@Պ��H�\"��n:~�=�r�k\'��A�Jy��}?Q�\\�X�=ʂ�hj�\0i�l9ڹ�2}Kz��	*y]m�T\Z�~�K�b�\n@q!,�<�����	��D������8ւ\0X�X%l�Y�h���ˈ���A)��+�-7Ҟ�9�Zq�56T�������\r�a�\\k�_�ҝ�B���,l���\r$��l�6AV.�Y�C�BC�\Z��.�8��\0_EZ,l�4�z�\n����h�\"�ʁI|�������W�+dݩ�/�5������%��z�v`[���Z�~��\nA_�����`��\\h�f|cV��B)C�8q��	�X�k�R�S@]9��1�\"E���X�n�\0K\r��G�p�&�D؆�P��ka��a/`��+v��y^ɕ�+AvQ�_\0J\'�C�J���%ѷQrE(�������*z,�k�R�SE��>4�H�bʚ��w������i���kCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){9��O+ہ�h�P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M���/��M��p��!{%����*KH[!�4Ā-�MD�$��9`�t5\\)�8����X�&�S\n�(Rۀ\Z\nb<�Vf@��KUS�$��i��G�*ǘ�Y��2D�����09�5&D\\Q����*��@�_�LH��ijhD��`���BsUA �Jx۝��ft%J/�����yڳ��-��T]$�j5�c������D�9�\0�b�1��\"�A���\Z\Z.�*�.y�:9ض�4Z\Z-���+~��<jM�\Z$�܉>(�⢳:WH\'	Z\\ZT�@��yp��0K}�,�d�#}\r9�G��򜍬���$@��-��%\\�	�+e$]o�Q�6�-�\"�~�(3�)Z[�-\0yZ�G$��I�!@��|�p%O+��Y������a���n\0\n��ӏ;Vr�%�	\Z����C\r��#�*㙙Z���$Zu��>��K)\'*�r/e2[㑺�T���sϏ\n\\��B�ZG�Z\0��I�P]��@����\n���Z�%#d߸5pu!@~���0KX)�R�+Ho����#�\"M,�\'F�#�SB�x�����[��j\rUij�\0\"�\0\Z\\��N�CF%�\0<�R��������I ��E��ji����)j�UA����YJ`�� �Y$j4iağ����L��x���D\0w���5D^�[��dr�Zqi\n��Ts\0[E$:x������5��v�h�A<��حI?x�F����[pu!\0\0��A�%�	��d�#}\r9�Dy`+NF�K�K�\0;�����qJ�2/d�U��\Z�UA\n���u�\0��11 \"xX�,·�ѰM���!A<�Q|և�Ҳ���Kn\0j����d%n���IA\r�4�~d�T��ځUZ�Gz�>����9�����Pn--�d ��kh�;h�TE˚\0��+Z�v�${R���(\'����EV��*Y� W6�j�@�lE�j\\����9$��i�?Q<�&�V�+T�w��j0�\"�Ў(��t��5\"����0$�u$+[���h;B\r��x���\nփBUQ�y$\nZ�45P�0�\\)�x��2:I��4�~b��BD�YS$,���h�� y�\"�N�_�\Z��Vȗ��0h�D���4�,�\0_i	���p$�I��j�ĥPS�IF�6ᡪ��q��W���PXd2Kf�\Zl�Rx���LQ#\\�\0�`��5�+Hȋ�V���u� �VD����0u;��� A�֭G�F�\'�C�Ap$8�Q�\Z�~����,��M�@T(��*�õX*X%t���i��#�K��Rʀb�$A�h���<��3\"�Ut_u���KHR�E�x�o�m�K�$\0<�n�������q �p���u� �ř�7QCCU\n2L|*��-�T�$\r\Z\Zs̏u��ʢ��H��sFP�\\@�#2l�=uE�F�7-!P\0EϾ���?��P���\0���\n�\\���$�࠯�F6**Ƅ�PY_ R� \0�a�#��3D}��C$��i/�G��H�Y]���I��/�>5|�\\Q;�bP�U�dK����@є考r�BV��V��+6K�H�<���Z���$����4*Xa����*j,�2H������0��M���!k�ަ�����1�kCd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B��4���ZȜ���\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�V�>�R�P��H�2е[�%�<�\Z�-E���rz���؏�\\$E얩�8�M ��\'�D�6`T?�j���8a�:��St����-k�*Ij*ѓc�H�7M�(r5�\Z&��lQ/����d�u�8\0Ai���#�u�I�T�s��\n����`<�J�!$R�E�5&j��Ç뙬$L�Qb��Ѕ8��g\"�B{$�\\Բ\'?\Z�ܤn��+QQ/��j	䨺�-�9�B�iR�-����H��A��9��SH\0��%�?��)&�T(Ԕ+����5ő橺A<H洋%�q�Vr)��8�=94����--HA-@Q/�\\�%j	娺��B\\\0դ���{�ޜd@��INs��-\r\Z�Y8�yI\"�u:�Q�3Ara�p\\�q�y�n�t�H����d�N��>�C})c��z�މ-\rH@-@Q/rm��PO-Eԗ+t.r\rHZJ�ocjq$\n�I5d��N���Bj	�D�S2M���jJ�r\"�X/\Z㗝MҰ��ZE���IPK	���4oY���h\0B�\n%�\0�U�<�Su���ZN\rcL/d���B���\0��$�YG�Rf�.�s��k�^E��4)�@�%���A,��dr�n�C�ǅA.Y+&�����Á�?%E�ܭ���HZn��D�;֑q\Z�\"���\n��mV���	#�B�mV�����x��j���7���\'\Z�j�(�\'�$\'�#��I�S�L�A[�w:�䨺�-1�R��q޵� Wʤ����Q\0oo�z&dE<�r� ���E��β~j��@�d�e0��O��� 		S#Ǎ0jʅ�-V�\nq+V-B�c�F�%���؃���fqK����`<��I�@X���v$\'׉���SuVJ�@�jX%�nŕ],I���\rP/DҜ\r%��������*�\\\0դ��\0�{Ʒ�\"�A��;�\rn/�hI\"�ac L�qW\"[�H*��Y�xaҞ���Z	1eB�\"@��d(R��i.H���O�h>J��*�\\��!i$���:�@�+d��y��\n��mV�\Z�E,�\Z���+��Q�f�|���\nYg|�7\0����]��VI	�� �����t��Ijj@/��+X�Z��/�[\\��i-!}7�\\�k���+gA��w8����[$Oֵ�$SʩarL�\\Av��5#橺�z$K ���S��EIpHK@�X�ƈ�h�䉪�\\/����Z��Qtʍs��B	T|땈��SH���P��PL�\Z�E��b)(�2�^5/�Suq���0�KYO­ئu����c���ZD�j���@Q/�9f�q<�bJ69��QiiS齼U\r둌�{ �&wv���m��\'�\\�#�S	I���D��<j�����$-j[�iTQ1^��&�8dǍX/Eb̖R����>\"�����Q1��%Q���u�	�L�.R�(Z\0?R�?�T�\"�@Y�0RUȖ�s5�euVK�@�%���[�B�5�Բ��\0\n蚖�+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�;��M �Z��w���y6����`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB�,�AV�I���D�ɴB���\03>�KH��BH� �\'ΕIJ���\r���K�B�T��dP	�JB�E���94��p��	�iF��RC�$J��V�I��<Ҧe�� Y:G�t��O����,�Z��#϶5$��f�Mk�\0�Ǘ$�.(���9�4�-���[�Bs\"�0�kЅ��/DK4AM�%�H*�O�<��H���4i\0ϟ�j�H�\"oKp��?�5�E=��K�7gt��gd�ֈIx%�&�C��=��E a(�`�d��bF�$\'j�H*�*�.����^M�HQhs�\0�Й�^�� &\'��Ĺ?�\Z�USڞ�!�*��N�T�j�\Z��-Scp�M�,�9Q<��x)O�%�4c�����b�)hs�ih�ܢ��J�TA�f�8Fۋ���ⵙsE:���F�x����gd�Zaqx:�D��*��S$�ȊM�]��W:��YpS*�?P�᪭i$�\'�JG�����s�[3��Z�A�MQ0\r $��+Y�%E���P�$<�f^%%�\':@u\0���Q{��67�\ZJ5Ȋl\n�yԊH���jɤk.x\\y�D�YH	�s�\r�-e)�VR��L�\'0���˒�5�\Z�QÉg|�lQt�\\_w\0�s��H&��)4��ri\\�Ð4�X��Jv�#�X���?!Q��h��c��4i���ʳ����\Z�1.9roPjRLi���M���tD�����]�um\"94�r\"�� i��Щ>�n-�M �Z���9�$y���2���KBfxr��eA%�L�-�3�j���P����#?\nb�@�9�v��_�*�Uj�\"qa(�\".�\0��i6��=͕ᠫY��}\\�ɴH%N���-�!IȲ���;t�R�!�T���V�Q�g{p��b��5k2�<��QT2F���r\"�l���aBɐ�&G	$-Z�\'��?j��@h��R��H\0f}ܖ���T�<��@�q�Ƭ9!0��B�0x�?\n���0%����%k\Z�P�$j���k�\\�Z������	$�\n����ħ�9b�&fs��3��r���N4�I9xqZ��V�%�\0C�j�$��z��ΐ8�K[ۅi�Y���J1�˓�D�\rm��m)p�@�U�U�.���4�EL�;��4��s��@��VY����N\\�\Z�V���	�w�#?F�U��K��ЙZ��*�F�������p䵶2Ŵ(�I{��iZ�{غ�W\"�	�E\"W9�ihL�*�eq�Y�D�KpK�\\��P.��!�dǑ��(�R��2jhK���<S�I?A(��(KZ�-&�3Q�)�ˤk.x{ҮE�h�@�+���[�xPhh���!l�5�b\\r�8�JvK$B�b\rX<���a2j�ѧ+~�b��JE!a(�|�pq�rZ��h��np�M �X���ҪU-�\0�	\\��\03>�f�N�/\"{���SP(�!� ��ʟ���F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�5��V��Z.��\Z\'D�:�!o֤R�D�	��cB5p.�|(Ժ�ؘZ\"~��]I�qϒ��4�D\'H�&�.	bB�����l��G0\"��;�)�\r��h��+P\\��4N��6��e������r�)�h���+Z���#>`Q�}��DRk��0_�\Z���������@�.	�QƲ�T�$>��A8�\ZY\"��\'n�a�h?���Pn�Bu���5E�5.�D���oʸ3�1_E�N�\"~��UA`� j2����q4�&c�u�=�!Ð ��ʠ��{S��]�\0as���)�Z�i�;S���4�Z�F�,��V4#W�W�T�s\nJv���#=I��T�j2/��~+C��C\\n�2�\r��;�q�<+3E:�4	��a�\0����l�j�@�:�d��?�f\\]L�S�o�~�=-�K�q�1�}ʔO�\"~�=.>�ȞT�����/@�l��?�e*�\"���m��Y�w�N`4��\02�x�A���Zbi��l�.5��RM��G��oʸ��ҤT�h��;H�M`#b�)+�\Z�о�A����@����5��d�L!��\0�<oY��c\0����\0˙�RjOjF���6�r���	�h���+Z�W�ߘ���O�4�D�@#�`�>� i>�F旆��ay��9UN��L-o G�TY$m\r���@\rK:ӢicN�Ymʦ�7D��$�B���p.��#�_E\'�]G���M�|ɀ>\r�)}[�24�\r.�c�RΫT���C�uv�$��5;�g�;��\ZX�j6���b��0J���M+�r����y>��I{DO�1ئ����I�H%L�&��ΕM��=!\Z����1銥\0\'\n� 2��Xrx�ƈ��D\"�.ެR黤i�Y\n��.���+hT�f�Rdh���#]� ���\rY��1n)2��\r&ؐ��W��,�I���pJ�B���\'Kf\n|\0g�Xs{�d���G5!Zƕ6T.��J��=- 5p$|�Xb�\'�C�#��k��#��\Zr�}�34ɧK�fª�T/�ezB57��h̩���pK� ^#5��ilc�!2���#K���ˬ�k@\r\\�%|m�9����H����r�L���\Z�A��*J��ᡮ��U�� ��Ps�ʬQWbAa��\02�����cS�]\n� �e#H���+[�n\\y�[c_Di�&F���5�ԙ9s��b��q[�J����{p�g���gzB5\r�<8��RȹH L5;�\0p�+W\Z��\Zc��]i\Z#�$4J�d+��?P+\\a�訖R����F;�L��8U�1},�+L��-�\Z.h��Ҥ\r��B�Ψ8�L9JA0��0\0e�Z��U\n!cLz�8\"�{��.���,��+[��|�H/�z%=�95��v)��_U*�\0�F����[��kd�Jx�q�JS��@I�/,֛=��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�O���KM�{\"���)d�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH����5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�[#��l�����fL�\0�j4z�+��\Z�5�)u�0��\0~��&�P�#\\�\0�����Q0@���@�����oo�x\Z��Ct�������Ԑ�U���F�9lAPCUAsB�f�q��O�MdX]+��\Z\\\Z\Z\nzm`8eZD+d�s�����eq[\"��Y�\nYH��t�_g�°�1�E�o�xq6L8�rT��b�lf�Pn��&۔^|j[���@�@�i\n\0hP���UD*ܫ2��ID-%.VȾu�@@��\n5!\Z^ɪ׷>uŗ�B�O���&ɇ�g*�#D����m� )5J{R`ZЮ@y��8�g���U��\Z�4-�k�1&5��Ns\\����eu솳����D\r�66�ǅq�hn�t�{�ɱՙ������l�ơ��\'�&\05�^c��f~j�<V�C�j�\Z��Xӈ$Wʤ��s��!��1����f����DȨ�9�\0�/\n��w�-q6K�<*r�S�3S��8Vd1t�OL�\\��\0q��2������\Z�k���\'�8\Z\ZZ�+��2�Y�)e:�B� h�m��|\r`^47A�y�=��b�a�!��d��W-����!���5��n(\r�Qq�?=��m��ڃCB�M��d�\"�5�)�\r!�t��E��R��-�D�rb���#��+���!�&EATl�FI�i6�x�$�\Z���xq�nj�5�Zb��CAK�pʴ��� �#H4��\\���t�$<�b��\"j:��>|+&塺�K��1#���a�U3�K�Ј�d�m��i�WLU)�+Q�8�|l*��OT��@�~[X�o\0Hsd�fk�\0�\rElG�W @�����آ����P>Z�K|a�=l�G\Z����a.[\0PeTU:�!�N�\Z�ȷ�S�h��(Q08�\Z\Z?���xEl�~)��t��oQ\\�{Ր@��u��@p�R��(n��\"H�βlr�\0rꅒDa���m¬�BC�`@\'����.�(���\0\Z	\nҖ�ʹ��\"f��I(�b�`�K*U��G�r*|x\Z����P��w��I�\\q��$F#s��\n��^����/\"v�۹��♚��j��Vֹ����\0����rq�c[:\r����Ӥ��{\"ڵ� RΩaq�\0q� �<�@塻+�,bGd���\0�=G���Xp�!=>�Q�N7�L�5�G=��Z�%t�\nzm�e\\�o ʚD��J!i���E�$�b)@u�k���SXЫ�~���C��Qƭ��$�H9a�V�\r]j�䙤4\\^��fj��b��-\Z�CB����/\\�`�[ �\"f��4���{\'�ZH?e8�D�Z���ߏ\n͌KUW)rF減�*�z�Q+�8�l�&5`5J���������ˎ5C栺H��g�\0H���V���3d�C���A){�UL)�@Y�B�����55�\r���o�=�rش[��\0�@�B��	r�,=�����KL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH����5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�f��V�g�Up(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɫc_\"�Zo��><�)\"�h��1�:���Sr�$�N�U��h���K�i���\0�&�S�AK��Z�K���f,_E*��\"\Z��h���x��LH������-8729�RbH��YldcR�\0�0�(N|�IZ���_��k��r����H\0��\"Vg���\0�! �R�_¢P\0��(K_�������K+�(�Y\'zj�ƾV��\0KUt�|xT{$V�F�j45\n�Cu6���)�Z�\0�*	�|xX��7\")\'7&��x{�AY����	�6�HsCT�^�5��}�U��g��}9�ˊWP\"�E��l��_�i�}Dd���\"�RHo� ^\n�� �����)+Kq!�T�R�\n�V��T�{O��C��9T\'��\nM�>�.�\0���\Z�P\0��-x(Y$@�z�/���H+�bE�)ѶI@/������£���2[�j�iP�[����	}5ZFa��8�O�j\r�E]I=�Na*\Z�B\'� �	S��6M�`8�$9�T�f��g(\0_D�T������}9���c(idQ��k�\n�\0KJ9��p�1\'�e.����@\rE�p��	}�H[��T�WP�\Z���8�8�xb��V|\r��l)rJ�Ífb�B��$���u0b���c(�h����$��ZP��|xPbMԻ-��\r�\0B�.0����>�Id�N\r*���X���\"�M��V�;�=�E<�M�sCT�_8�\0_D�YD	g�������e-d�Ѱ>P�-?NgǅH�7�F�SX�(DQ����/h��b�U���/HߔY�Z�	D������D����	(H!�u\\/A�}\nU+3��Y�h�1�Ƥ��YP�\0$�����s�Q�56N��`�B���@a�հ�w�S\n�nZҠ��7�b�|�{�*�(�d	�*��0��0���\r*Q/�ir\'�\0����Ig���~��ƎR-eo�K\r�P�:Y��ϏT\"MӰ}U���B\0\ZT&F���\0d��r�h*��+��\Z�8��Ą<�o�\n�h\n�Y䍡��H-Js?�W �)�Ņ�|m%���麁ˊS� �ʝ\'K�\n�\0KN\r���V\"M�S�Kv�Բ\0�v��\0K�Kq?+I*[��\ri�&Ms�C�+y%Pw�4P�Y��jqBZB)L�Í_ �)��F�%����z����w*I�P�,7��� \ri�{*�_�\Z�\\\04؄��7�o_D�����4_�V����!�Hk�	�d�J�_��*Ye�!-!����\0��V��� K=MO�|@����T�Y#L��y������|�`MM�+�m/(hQF�`	{=��h*	��eb��单Y%���@�q�U��tB�����\r*H\"�8q��\0������\",�0���G!T���T/���?Q�\\i+dݻ�}�]�@	b��7��\0K���d.[��A+�6<,A��Y\Z$�UQ	�ks�AV4�PY�R�@\nP⫅�A�$Yc�> ��4Ә�)�k*�uKk*9����>+�P�7T,�D5�B\Z\n\r��?�j\"��N�I7\0������Ej;�d�\0�O��Uv):K�\Z���B)����r\0_EOE��|JY�h������\"�LYZ�@.���ә�-1|�MhlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/g8	�{p8�J�\Z�n\Z\Z�Pa��I�%�BAt��o��?��*9���T�> �M��}�^�Z զ�j@�\0��\"����S����A<�n�ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Ms�\0;�ј�����E셡�\rZnZF�\0\Z� h�..h!+Yp%>!\n^�p$���qZ|J�\Z�n\Z\Z�Pa��I�%�BAt��o��?��*9���T�> �M��}�^�Z զ�j@�\0��\"����S����A<�n�ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Ms�\0;�ј�����E셡�\rZnZF�\0\Z� h�..h!+Yp%>!\n^�p$���qZ|J�\Z�n\Z\Z�Pa��I�%�BAt��o��?��*9���Q�|H�h\"���G4�얋[$\Z��-!l�_x�$mj\'q  ������rq\n�[Z�\Z�w)��N�)m�\r\n1\\+3 Kh���ϒV�}\r#���&�L\n&1�D�����05Ƥȋ�)�[ էZ�./�&m�ՠa���8Z���B{rq���s�U�΄�Otj-R\Z\Z����;TJ`��\"�Qt�j5��~c�aXH�P$@Mc�Gz�k�Eg�E�U�9��ť�Q��>ph�E����\08Z�9X%A�0�J{q����gI\Z�D�դ�\rj�O��\n�R��R�T]$�\Z�i[�D{����mdj���\0�\0[E�fJ�*D���.��(\rUi\n���>p������h ���L��fA/(�%���.���~�Pn% �x&F�6��K�ǝ�9L�`�ST��o��c���q�#+Y\"��7_��ڳ!�Q�E씖�J�A��MH��ގq��+H��\0xX��Π��tS�9��q\n��<�Z���-~�K��\r\n����Rr�)T$���Zs���+\"md��s$@��j0��fD\\Q&[�����@z��M��N�@̴���\\&I�#P��OnD�A<��Ýfn�I���-R\0j�@-���� Kh���e����O���V&D�Y5�� �m�\Z�\"�R�E��\0�Uij�\0���h�b�$A#�pĖ�\0<�R�(�@�C�kUApPM��~kH�#d�/���Ҡ5�DQ��% O\0��[�$���i��?ұ2��L��\"W��=X�2^ R\"�ȡ�Z�0P.ZB�B/��U�k��J>.h�<�|�J8�$�8	�����!�j��\0,0�����!%e{�#}-9���2���T�|`z�-�0=�Ĥ/d�7�;N-!J!�5�d��;2�BV���\Z�X %�BC�+�E��4�Sd�D��E�CZ�DAlE�R��Ɂ�X��%7�¡W�G�KMɲl�_$M���|��*�\"/eT6E�F��P[�|?^�dm(�p��h.�$��A!ǈ��r փ���IB��@P�����	��a��H�������aLH�YS$�&��\0SA���>5�dE���ҪVȊMm1m�K~%��[<�h��0T(D�A<�S�_*��J���4��N\rR���Np�VT$���\rL~�:9��d⓮H���}Y�ύ\\dcuAO�5iRA\Z����Ȍ�-�S�����C�/��\0L]!���H\'����V�ZR�)����phj�@-��W��ʖ]$��i�� �\0����\0+>��޶�\Z��Ƚ�]�����t�B.��\Z�Ba�D2K� �A��Ẹ������$l/�ub���,�j ���(��|���\'���I#Q����\"�\0���M��]$>H��sP�*Ĉ�l����U�*\0�\0Ȍ�-�z�ve��<�B�	V5�F�%~g^b�8���PY� Rۀ���4�\">�\0Y$2Kf�\ZF?Q�BD��������/�\0�q��\"�ё6Q�ZB�E��[	\0[E,���O\0�\\�\n�v���/�\"���j��$�_(Rۀ���yPd�T�Y�%P�CNQ�\\��ɋ*k�ަ�����1�kCd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B��4���ZȜ���\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7�C��hB���/���S娺�[�1i\n��&���\\I�F��:l@����rl�$5&`.*�O��`^E��hQ�jXxT�œ����8�dn��P�E6M�!ZP�_?x��j.��[`s�B�ZJ�B؏޵� V�S^��-\r	�Z�\'��2E,����]�\'��\\�q�y�n�D�#c !A���>9>�sRŶ<��d�F����7��7� �Z��η@�t-7F�F5Q$\0�U{S��\"�����Y>5I\"�U<5Q�3Au�s��k�#�StT��Ե�xdk9AOd�䄲X�p��Z\ZD-��ܟ���JAn��ҥ%Q������+e&���{��-\0!\Z�ao}FBH��RTbL��\\��$�n+�/���ӊy�FZ��ÅfhR.��p��Y\ni�\n̗,��9�B	j*%�|�T���7�o���5Zrh[\"c��Đ+e6�s��(@h*5���FBH��Om\"P� ����7��St���5�d\0��D�Q\"4Md��-��P�E6Z�jB_�\Z���H��;H.�Z���\07�$�إ�Ms�zH\rڂXڣ#�K)eM\"`� �E���X�M�(Y4�#sBzP|mn)PiD�Md�G��B���T^�j&��[�>�K�>b���J�Z�{��A*�b?{�E��TZ]6G��A��`���I\r�4����ԉ�9����)V(̡�4��/RK*��2]D�JsC�t�E�D�Z��{���R�h��\0jB�~�����[%U$yB����U�NTMȧ�Y�6V���Kr�x�U�JlP�P�\Z���>4�\n�4B$%�Y,r4�{��@�!n��ȗE<�(j��P��6=�+�-%Q�l��[ĐB����\n��`�X�h��Y���H���D\\8�I�=M�Z�)��\Z�K�v�T�}�+����C߂�\n���!islJ<�\0��|�L�5�@\nn���J��VdPU&g;I �4jQdOaW\"M�Ō��r\'�ΐ��n��Y�1�!KL8V��	�}�#�S��\Z�^��!�D�j.��s��Qtʍ{����жD�:� VΝ�\'{�����\'�j�I��స�Z���~&�|�7T5�I�På-k�+@X�(�%3O�\nܦ�X���$-V�(�q?\n�|�Lls�jBIF���1\\�d�_*�\"g;I �4:ڭd�$I��f�иQc˝H��n�7Y� c�Rٔ�	VKQ6H���	n<yUD��ė�K���_�֑�jr�\\�\n���/b듈�+�LߊL�v����Z���֒$�0�cް�%\n���ƥ��n�Rd�FZ��JU�T�@�H�\0,��r�Z�b�OHB��D�\'Å\\O-BJ69�z�KJ�m�G�\\�d�[ ��㤡hh#��\\�6��j��D���u�eSt��1�R�\0M�J�Z���	��^�j�z+ђ�B�Z��/��3�|�KTLs��*Q�l��u�	�e.B�(Z\0�\0�F�U2M��vY�3U�\\��9��5M�4��� c�����v�bʛ&�Z�C{��C�RЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�gqɤkT�n��/&�5r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�M:\':@ueoڤV�mDlp��	F;����\n�=Q�ɤky�ڦu�)Ms�ƍ \0�>�U��h�V���0���\Z��Z�P��q��)���H	p�F��)ɑ�D�����r�r�K�+���,���X���ǀ��R�)fNs���\0�\\9-c*�b55$��q�5R��B;��\\���\ZQ-h����[{gQށvN��)4��ʸ�*bX��*{���$\r3n[��FO�M�L�繀i3>��I�D�����H�����[*s�Z�\'�i���:�L�ҽ�5Z\"x�M�.N��P(x)6N��d\rZϙ0.�9�Q���N��s�H\r�rNu��$*0�\Z[a�\'�qT��RNc�\0��V���\r�Z!yx%�\"��΢��m�p�M�]���d�1-&�M���d\rX۞n���O���@n���,\r�fR��f_D�Q�&\ZF�}�5%�	���B��?��Y�4�J���:�L����$�ؤ�\\�~��\n�B�tN��d�\n���	��+9Զ�Y6G��KZ>U��`�U�8��,K�\\��.O�js \Z\\9��?\n�E7)�9�\\-�(�7��CLc�riTk�T�6Bx\ZB��H�L2	d@���]��3&�H��@�yr��ʚ��8\r��\n��R�Q������I��̀�	�?� ����6)49��`�e�E88-�I�:���ɥ��U3v~B�Զ�j*��0��)�4�8N4���s�t��\0!�s`y\Z`5Ω�.�[.|��ƴM���ri%�N%��ƅ�C���YU�U�]ÝT�&L	r��\0�[4��*v�T�%��-�e���j�����K]�K�<*��� qsF��ւ�(���lRi%\Z�\0�p��\Z�-���H�� ` ���	άԲ,8���\Z[���<*�eB�3��in��8��I�$�A̨<��X�U������i?j�TU=R�Rh%�p�NKUŴL�H��Y4��j�|O��	y6����<�z@A��UQe\\y��ْp8�V��\\ ik��A�|�����\0�y\Z�5�z$jɠ�c��p󭱖-�bΓ#Ĳ�b��<H�ŀio�nxU\n���&\Z[�%�95F�0�\\!�d;�P�����[X~դx��I�\"���c��\'\' V��X��6H��YAV�I�]�i\"�m�zL�,\n�nxu��*೼�Ɩ��\',�j�S�H.�\r�H s���(�@�:E�en�\\mT�I�\"���k�\\�A�Z�,[D\Z��H�+�j���4Z�VM���^��-���Z�\0:��\'1.��q�X&(R˄\rGx���ꃂ�бΐ8�ȧ:���j��D�$�]��	˒֐�m5@�	$�-h+��Ҝ�&@A#��4�e-�L��� �8Al�8x&����@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB�,�AV�I���D�ɴB���\03>�KH��BH� �\'ΕIJ�!;�<�Q�h�s��/lҁ[��(�#~�Q��W\0���%�h�N\"Y4��j���҉�h�r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��M���2��ވ�h�B���W3��%!R�\"T�f���F>�\\y*��1}��LsL���,��YʶL�F�rQǚeR\\�!tmf�� 2�H�jnkt�\n|-1����\n�\Z�j�D�j!X�5p.\\|�͒vMA��F;�L�S�1}\n��Nx/ӥ�3�jȇ	�Q��(���A�B��I���`+Y��F�DMt`�d9TX%�t`J���M+�<y���_E%8�D����2v+�\Z�����S��I�K�f?z�A�\nj6\00��<Mfie)�pK��˙�Y��IZa0C������f���>&�Y5��b\0�3�H�}�i�\\1��N��k9�/���\"ipӉ�~U��� �\0�>W4�q��fCw���1\'\Z�������3�N�DM1����r��Z�=]>0%~��@7q�1�})���k��\n��\Z�a��)�ևH��	�����Rl�9�:��+�9�L	q�/5��#D�A�z���ƥ��Jse�Q\n֦�����Hy�H��\"~��k�d�������Mx2\0\Zᤢ�}g �\n~(�0��1�*\"��T֤�S� \\͂�C9E�| �N�C�C5�5)��K!y\n������\09t��\"~����\"yp��b�!��x\Z\\:����Z�!r���%\"9P��0�O ^<i^�E�0ud8Rd�Q�e�Y\n֢.�?W�_D�C�)5��w̘}ƉĂ�$�I@4��p��3����@�c��;Y6A�L�\0�\Z`sw����n���)�5�t!�W�!Zߔ	��W\Z��A ?X�*�����D1t�{���ipL����g�`�zK��D��fLU*ӂ\\x����\nHs���Z\nT��(,�q�Xϕp.���9t�$HRj\Z�Ԙyd\rhC�;�L�\Z}9�g�M!�Pq���2j�j�*�R`���:��T(�ֺ0C�l@��Wk�;V}\"W���j�N+���1�.	�ڤ�Rj\Z�S\'b����b�*H�9�\Z���.\"���U���jo A��L��d�I)8.u������+ZD:mVKcL`�pK�2�it�F�4��+���4�q�/�z$����#b�;��hC�V��\\1Ʃ���g�#P8�8��S	&��8yf�`:�D���q�U�S�>�+���*��U��0��	��R\0�r�`����1}\n�[�\"V�ᡤ&$qҪ��&�A#��ǘ�V)d�Q�5N@�xՊ�;%��=Z�o�%hWI�%���CP5swZ�\\�\"ǊT�?P�ئ��W!�_D�+L��i�{��^Ɋ$9 n��G&���LT��fj�29�5aɭ�4(X�N�Yl=�Q�r��V�+��oʸ�i\n�m(����u���\Z�B�&+MPJ�K�bB�kd�I Bx�ʪ��\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��	�5�[Ii��d_:��,��Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=�����0�5\Zp�03N4��Au&��TA�} ��a����$V�,���m$��d_:���O*�*�D#K����\'ǅ`^47L�3퇸=lF\\jHt�dq�9m��!��:hI���/�c�j���mu��n�:A�m`?k֐�ʢ������k��S�?eBB�.@�T�\\r9hS�i�<��@���2O���9�[p�RCU\Z��&\04)J�S3Y��P)4+l!�\rH\Z�R�K��+�H��9=(Z�+�����@@��O}�4�Z�]y�\n�HТ���q*��t�btl%�d����OaOL�m͊a�3K�]M��NzCA�m`8Y*�	�l��=�ȃIi(����\rg�)e6T� n��l�s� Ɔ��w�89}(-���!��OdB2^\r��.~5����&j4+��✸��At��\\Z5 h$+JXڪ �l��{Ã}:KJ7(���yA��ʚ�Q��5�¸�P�-x\'�pz؀���Ad��K��3���p\"f�B�[����.��[! j�\0�\0ĥ��W�\"Z�T�S��i���?z�$H��H�ip�6��X�aCt^��1#��l�q�#]�&��7d��Tr�JЦ&j1�9q�c*�PV�C��\0H:JX�-[%�����:M��l��j\'-d��\"\Z^\0v6��1YaCt^Ȍa�k�Ʌ&z�[XK�A�\nL�)#S0Fܢ���3I��.�k�j j\r\r\n=%,�z�\"DV�K��4��\Z�؅�.`)d<R5F�X����.`�m�Ct߱�$pq*����B�`as�ɇ\n`5Jh��KB�_Êfi�gAtY60��!��\0X����A0xm���V�~��,�0X˄-G� �F�r�T�R��#���`>5B/T݃���r�,8s>@5Qt�0F�8��8�U��At�D���!�T��Oڷ�N�Gu�&\0��\r���E�$�\"�Qm��I�(n�Ҥ`{���a�X���:	r�l��j�{D�!�c|G�f���.�l j\r\rj��r�F8�+d7�\"f�4��ZJ+�؅�d,%���\'�\rCr��PJ|BG��E#�it�)l0�-�����$���CP�oˆf���諫hr\0t��t��~׮N0L\\�;�N�\0-\'V�pδ� RʖGc���\rO���$`{��ɇ:\0uC�#@as��2�\0b��K���5	E�Y[�i�P\"��@դ4-�K�W\'$Vȷz�0pN��\\V�/�i @��XX��pB��>�Ա�\nwH���8�p�V�4���\\\r���d�d��4��v<7�\0�T쉍qPh\0������F0H��!&`�!�t�z�d��O ��z�����p���ǁ�)cuw4�K�!�c��V�U���l�U@5P]إ�&\ZZ=@-�G�\Z���D����k�V��\"�T�t�iF� �M����Pgu��t�\0���<\rH47E$h�ч�9lF~��F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH����5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���k�!�k&x%W��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds������p\0K �Ur9}ʩ���H\'^�y�.��6�Q<8\'�R���F0�	i\0)C�8dk3\0	7�� K=M���dbE��k$�9�����#�\0j9I�&V��\Z��\0�D�@K蠔�o��O5���U%9���^�3d��2e���$�\r*Q/s����}耶HA,:�.�P����a�M��H��aӁ ��5<�^k)%������\0[%�ǅ���R+H���u	�V���)�Na��)�����T��E�M�s@R�p�Y�\0��*G�	o��+��:���F�Dm�@�-(S�#��+>C+�N��21�8%�\0��U\'��M�N\0������Ru�j��t��|&x%A���Rl��ں�Z梒���Ʋ�0	�)(t�Ig���qp���P ��pS�L�K\r�@BG5 ���%�8۬8ր�@`|�}0K�ijݭ$��{%��|�\r�U���T5Ā?d	�*MhhD&�qu�#J�K�ᑬ�0�R#؇�H���n)�S���%Y#Z��$�<�iſQ�\Z�|�K�������KaG %�\nI�Z���쇑ZG�j����\\�a��+24(!3CuA!�H%�?�\Z�Pb�%�@D�[�h���zV&Z�Q1�I@/:[���<x��&�H��c5hM�Q�;\n9/�\\\np&ᤕ���E\rp,�	�ʍq-C��T��|�48���J|Z�����I-� ]��}8�U$Y�$��\0KM�s>#!S�M��e��n�B�( ~��A�臢57hr�|���+M�	)�٥���&+d��(`��n��8\0��/�8��b�&�Y�$��SE��PgQ�E���Cd�!��}88��LD���8F��B��!!\0Q�<3���;�9ȭi.S��녪�6M,��$\'�nx\0*��6C$��. ��|yގF/�v�X�$�é�����G!�a��\0$�+Ζ�:G�G>T MӦ���u(P�4�!aε���4qR�Ik،�A�\Z���S��%�	�	V;\n�H�JJg��T }��K��h���<8�H��P��$����i�`H��j�$od�j�.[���\0�s�ka�D����$��lG��h5��)��k��yd<U�~Sd�,ύ�ġ!�E(�Rp�W�ؾ���!i,:����\08qei)$���\0K\r��s�\riCdݑ}���\Z���~��q�_D�f]Ey�~�V����TJ�$�d	�\0V��$�L,�����A���8q�0/V)�,26H�-�4_N`cd�\n�CYi�N������O��+H���O��Ys�o`���hJ9�*�����Ej/�,�K�)���<�]���e|`9	\0)D�?�_ }��|`���龠9& R�1��:Pk�\0���p��υ\\`MM�\Z϶�@�\rIDEs¶�/�OD������\\V��cd��Q��yxy%:�)�C�Y�JJ%��h\0��+�c{d��SE��P�@���YPJ\r|�_�m���3¨D��\'L�Z�\Z(@-�µ�/�z!8�\n��?u�ka�A�4�\0���)��Td�!!��_֟ �1u��|@���/�09qJ�-eJ5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!K���y^�+G�B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1����KHT\0|*��-���Ĵ�3�J8����$X�WQ��M]䒳(]*�5P��v�� d��+Q����#?\n�țY)�|�\0�h��C�:�b.(�u�9@xj��\0	�0�PS��@A�b?��=�\"�ܜB���F8�BuBg�\Z���B�N>u��	#�-T�J�CNk�#�X�D�ɳw���D\0w���w�X�\0��\"�H�j��\Z�UZB�/��O��\ntZZQH!\\�o\'�A�I��8�C�.QF8��:��}��\"�5��؁�g)�[eZ���C]�>�=�\\yL�P ��{$A��SE�}@�Y�{$@6[c�(j��\0_����^*�iiĴ\"xZߵ\Z�!�KE��b�S+���VdW�UOtj-R\0\Z��ǝ�9L�$�\\��o������ǔ�����$ j��YG�@�G1�e��7Ph$��U����s�X�I��.hD��� �*�1�\nO�4}.p$��<V����\nI�y��J��\0a�U���R���$�Q�9����Ձ��QdY:7�\Z�L�F [�J\\�[)\"�s%hpj�H�d\"��b�$�\n��C|?��\n�\Z�QJkM�\"����� ܤ����CCTa�#ʲ��H�ˡ/�PC}\r9�Dx�YM��l{�\0;���,q�&B�2�ɂ��[!�����)#P�$\0?��,���*Qp\\��\ZLnBmأ��j�CU��³$��2Q�IA\r\Z\Z~���\n�&�O�d� �{�<Nu.E�\Z\'�hl��� ��E�;ެI�h�7rb�@ �����,��KJ����ԡ��3u�\Z�@K~�)�3�=��j1�\"�H��ʥɲ\Z\"�KI���jH�|�0H���Nlޭ+�!P\"\\��h�I�&�BxZ�\0ʬpn��	S���Z�,M�I|�Kn\0\n�\0�8p���t*c{��KM��#�\n`�k*d�$�\0�n���L/d�#\rZT�B��3ƶ��-�RmP8ܖ��ֽ�	�Z\0ne(�B�l-s�Ձ�Mg|����\0n�(0�Jf@��0���%7��9�y�:*H����4%��s\\@�\'!{*<}�i�i\n@\0���0��@vKr���BxZˀε�A�Q7pP|.H\\�֬t�,ϔj-R\0n�@�	�Y�%�	��2>I���a�?Q9-!\"me@h��H���}X��W�#\".��E�B�\n�!��[�`I��in��\'����V��x�\'K$9l\\y���6�\0�����E�I���\0\n1�)��&��0\Z��$���ZF?Q^c\n\\�6�V}RD\0w���0/ZFd^�ЗE�F�U\ZVȗ8y�r#0}�1Kz�-\0yX��V��A0�N�T�f��\n�+*Y����B�c�\n�pO\0��$���\ZB/�W�Q�M�\0C�\0�\0[E�|�e�V$E��>�u���\\P/�{�mM#D�f�<8rJ�]㢤�� �O+��Zu~b�Y��\r\rT(��s[E@,�t��i��#�*9������\"\0?��9���5bD^�&6P���\0_Ǎj$�Dͨ��?K�\'�h��!	�8�A<����Wa)�$���ᡪ�\0�8^�s[DⳗI(F�Zs��§��YR���\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������28�M!��V�\'$�2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��jja|O�\n~Z��ε��\'�Mѷ�xUD�{)DrE�@��S2M��P5&j�	�G.5�yT�)�t0�����RKA	���\0-��R�DpL	u5�/s�r5\'䨺���9�5!k���#�b�IfH���9�P�\0~�r�2LXR!OMI��*���s�$y�QP�dpjX\"��PK\'pɬ�=ũl�\Z��-�D-V�p�|8\Z���)�[a{�j--r�^�&#\Z�8�N{ݦ�\0\n�V�Iz�#�F�H�T����x�����\Z\'	CBXX��<�90,��J$.j[#Ƴ�Z2{H�ji\0�{��jƱ��Эн�t ��m��X#_*������o�%�*29����J�NB��s5�?5M�݉�`�\Z�M���������HH҄)����A�mS��ZQȗ��c��?-E��n������Х>���l����D��6Q`�ʣ#�O*TZD�\\A(�˂�k�~j����M285\n�%���ts		jzH!~6�z��\Z���!\n�{<�)yj.�l��\0jB	��TU�ʤ�bk�H(@h88&r(�$�\ZD�l��Oް Χ̄�#!���PiD�F�D��-����oDh�!\n�TE7\'ύI�I���A�M�!r���U�I\0��yC��4d�r�jf�R� Ä�(�,m�sY1�M�vDf!�dǇ\n�B�\r�6Q!sSҖ<~�h�\n-B�HT���娺MT��z ��{�:�./d�RY�Ih\0�PN^T�[Y��f�{�r\"�a��75M���`����~TQ6*��˚�\r�\nb�C5�A-7�M��*�1��;�c{�jBMb?z�/d�O��:H\r�	��%T��3&\0YK��W!r\"�����+�-��-e><25n�O�X��4J�aT+D2S���ׇ\n�9j.�(�Sԅ��\0�5�9��P�S=�-\0[$���K&�H�+�.B{��5M�Y\"IDd5= cM�ʅ;��G���U\n�D��D!Z@(��ÅX�j.��cވt��l�M�+������gs��-kA���O�*�E,�{�\"D���#M�3Ɛ��uB�J#pj �b��&9�Ҙ���V+D�Ԥ���sH~\\\rh>J����� B�I �~����VɤN�!B�ڔX\n�d�<�����%j��@E��d>j���H|��4�f~jު�$������@x�ƴL$�\"j�\0��\0N�%E�8�c܄�-$���	�\\�n\0*i9�P�4_�o�\n�E<��n\"f�r\".�s5#橺�\"��0������n�M,I��d����������Z}Dr���j�1�E�&��B��7�dLs�D	�����+��\0�\',|iȒ(�&d$L�N����RW�`1`��d4����{�[�ae|ġ��Kc�ƨ,�%�!j��HK�V��T%��7Gpo�I������H��.h�W9���m��DƜ�\"��Ym0W!r\"�Xx�HyT�P��H�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE���%�H*֩<��*$^M�j�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�����v�6�@��D�5��Z�\'��<��u�h�\"s���-�¦T��(�N4�I8C�fj���}.K�8>T���qx:�L��M�&F���v��D�4�h����Y\0Z˜�viS*ɴHO{��i̦�eY��-M�im�ğ�qZ��ָB�p�ϑ�4�MT�^\\��!ÝEH�������k���֔KI�)���@�U�Cb�<-YΥ�	i�9�,h�\0\0��R��F�in��!ƢUI=��w�#?\n�҉j�B��u\0�~³��)ѼE i(��d��M��O�%�H*�\\�.��9*[E\"�S��ƍ-\Zs<9VRqd�\"�HȮ�?aƠ�I�׈�`n><�.;��h��x:�L����\"*��2h%#x\ZW�v	�\Z�B�Hp�^%�4k1�]��D�b�%�k���[>B��,��	�h��q5���]9�7Ĩ��Z�V�^dX\ZN8�HV�=BloI���k�J�r�\01m��I�kT��\'ޕ��h�k�X�4�xr����2�ba�a�#C�IG��� �b\Z�j�G�:\'�@u�\0S�j@{���c��	F���y@�m6tfF�&�U�Rxa�*R[DU��G0\r i���T�I��P�N4���!�jjJL��������ƕ�܎\'�@K�#ƀ�4Q���J1��r��ӈb�\"�(�����<����r������Й�T�k ����-�ĸ��qZ.S��k4�_ϑ�(�=��GH��T�{�̀=�ɠ�k�U���� ��Ր��Y4��j�7g�R�m�%{�H\0f}�t\ZY7�$��p��ĸ�\01�\0��\0�^!���ƨ�W�^�4�\Z���c╬F�$��N���!Bɥ�A$�AV�W5v�QŴOD��cH	���Y05+3�\',)#�i߽RY���;�j�d^�M{��+c��H��҃�Rh.F�\0���i\n�&J��Yt	w7f<��U<D���\0X\0}ɒ�YP�=�q�����5a�zd������s�������K�4�-Z7N��\"�I(�`�Ð5�([D�$x�M ����U3�&�8�I��`\Z@L�\n,�]f{��Kp��\n�T�Is�#K����#D��������ʮ5�m�Px�M�.�9[B��)���=�Ykq�O��%Y6�0fy`\Z@A�/*u=Vw�0��ˎ\\\0�5B����\rGn��u@Ǻ@u\0�[\Z��IHZJ1�*����V����2)�?H*ւ���Ǖ��Y\0��K��`\Z@L���k*!�N4�O�֨U\Z�B\\!\Z]���¨Q0�烨����n�P���c�#�x\Z�RM�l��#�b��VM�H�0\r ��rZf�T��8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj���\\B���p$g�)��m(�DO�5�2`	ϐ��b�!�#{K�\r���D�k)L� 9��|*d\\&4	Ƨ@���~���1���8\n�k��1�I&���W�W�R�2Ud���\0�v)�r��\Z��<�)��9���\ru�#�:̱�C�z`���p9����c\0���.�jMj��|M,j8�aaSk�{S�W�!Z�\r\\	��\n���薜St���c�L��|���� S���pL�c �-S}0�o%���\nS���N�\0\\��d:\n�\\��6x\n�d���%~���W�<���}��)�\"�P�b���Ҙb�)�Op/M.��G\Z�A�)��jo%�γ!���i�jv@\0���j>)L!у��ˏ�C5싦�,����W�>���R�@�M`#]�\0�r�sx$��dM.	���ʳ�%+w�B/1PCY\"���]�\Z��Y��M(�\n�q�C�K5���2ɬݭM+�p���*]\"5	֍��F���|�f����+��p���j�A�d�-�+O\"ӟ1RA�.��J���3ƥ�����V�N���J�ț�Y5��j\"�\\3����T\n#)���v)���Ґi>��zipLJ��D��\Z�H�(�1�Cw���l�\\S���x�.ROT#�c[._ކj��J�Id�n�٪�]�ʜC��\n��Ś��|\r)E�苩*�<i�\"פC��@��F���\0!z|�w�[!Q0S�Ap�3LEߵ\rUl0C� �J`5Jz����B��*�H�ʪ!��B$Rk��0>�E�芔��lǾ�{\'d��Q��j�ϒUr�N�~��s�&�9�5@(�+��d�Z���N�,$��B��(8�)�V�_D�bK�)55�1�UJ��R�*ȁ���8�bSIy\r@���Ψ�N�I$L��\0`���P�����\n�\Z���(,��+f��y�Z�9��L�E&����\"��ud1}I�\0��p\\y�U3�*���0\r@��ά;��&ӍN� \0p�x��d\ri��zF�H��T;RJ�d+[f�n�|\0� ��=�2�\0�w̘b����X�hU�n)�<\r$^�[�M��P�C��5�9�`5�-8��hß:�4\r��:�����!�w)%~���\\	�|k�s�*=�O\r�M@#�p9���Ц,� 2I��q<���^ �8��b�-8.v\0��5b��P%�����m��Vi!�W�!Zߕp._W\n���KxI�k�d�;�%�!�6�ո�������U^�PHrA�i�A�ǒU3w��-8.q�\0���Z��;%�����mʮ?-J�+��oʸ��\n�T�h������F��\n��h�T/izipL��aH�ɡ Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}�#\\���^�E� R�:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�-4�R��\nY?aZ�+e&��rzP��7�~�\nY�]�j8\0Qm��\n��CtkD϶C��q��$9t��5�W-����3H�\"f�B���\06�RG5��\\A�P\0~�a���&�S�6@��ZP+�b<�&�]�B�!��k��bA�ct]7���N5%\"HMla��d=��fA$��&Х>\\37���Sk���5 h)�)`?j��E|�h\'<8H������5�@@���SH��\\\0(�1�u� ƅ;����!k��q�Y��JtlkJ���I\rT��hW%x�Y��P)�[aA�A7iK� �_*G�sÓ҄�؅浜���r���4�F���^�7EӾؑ����?ޠ�tR��[d2\Z�\Z�3\'&j5��f��Y�5�ح�� դ4���~ת�I�F��ҍ�A(���pΣ$H򤁮5����\\r9hn�\ni`{���T�,�C\\X>5&-])��f�@.@H<�q��栺�]k�9�\r���i�\Z�&Mxpj7Ii(	����fd�e���!B_��X��ޒah{��PFX<�L^�6�McC	r�\np��j��F��ЧӇ\Z�2����� եOJ�\'�W�+@���Cĭ����d+ ������$r����=��b�<�4�^�&�0��,>9R�j���&Ю\0��N41���h�Q\08\0�qiK\n�1$V�QI5\0�\0��RVƔ�@��D�B\Z��!P_8!�c\n��S�Z��p��ˠA����`�>9Sj���3Q�jE�#�3M��.�&1PjD���p�VЌ��mڗ.�:t�<J؏�ӔH�B�H�#��m��R�7N�K{��\"�W+�RXhc����>5B-Sd��]��k.�J�8�\nj�栺5} A-��|�hE|�nԙ����ZJ)��mƪ`��Sv����Q@��5���;�*F��<���b/ܨ	A���[&\n�N��N\"v�hȼ\r�fj���dl�5��G���W�F8�+�M\"`�:t���V�/�\\��t�j�\\ n�|Ƞ�x\Z�塺w)20=���R8�*�z�g�J�#.r�!�X\Z�j$8���\nq+��f���ꬭ��ԁ��k`8e[@�RojL��:H9���Z�<��ܬnp�#�Pk�8!���N�<� ��#���D��s��\n���&j6��q�\"9�B��G�\0֨�Ko\n����\rT���:t����؅� SʫVYD#K�T��5\r�t�d�F��lF�U�����e�[d8��Kș�[�-�j�2�vGqPhkl����\"�J��3��-\'�+d��T��UU��QȨ���\ZLaCuN����z؀�k�3���#%�d��TL�%ZV�B�oo�W��&�\\G�44����k\0H��R�k��-6\nVȼ֪@�K\n�е��m�_⢰��������#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]��C��L�J�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X����	����\n�v*lU�����J%�������\nQl�)g���s\0cY��d���ʅ��������&�L�kdcP7\rDPs~��/�R��T�2�<4�� ����Co��*Mة(�7Q(H#J�K��j����%�$@�z�.���q����^�ѶI@/:XP�1�j9	���w�����(\rj( a�S���R�h�4���)���E�)�u�\\H\0���JVdhtA�ta�$�A��K���k9@�����,:�>�H��a,dZ��66�(�������xTr{)�k-��5\\4\r%-�{\nL�\nMV���I[���X��Awh�-ZJ�J��l�=\r&Lhq(K\\��SƠ��\'�QD	a��t��ˊVFw\"鱇�y�Òz��ൟ$�rEnc�\nF�\"[n�����O�H8�r��A���\'U�%,�3�\0T\Z�S@(�7Qrn�_/z�c\0�ݨ@[$M%�S�=@\n����j��P�-7L	/��2��4[Y.�5�J�G��(�`��#T��Z�J�����x�!�,�SC�����\'�T�\'�T	kUe�.MM ��ÍI���\"qY�`���f|k3,�����q����G�\rA�>d�Z���B�\0�D����/�UMՋA%N6�����0p�����)p)2� 8��F�(����0\0��UJ?r K�L\\$�+3,���u������K����=�n�n��al9ڬcr�$�Q�$���TSm)��9�� O$6�8 s[��A�����0b�\"��%���麁ˊTrk!����%\0�0q�\\� M�O�7@.[�Y\0Q��+H���������C��m�)�X4�c�y���ɲK�5�pE�^�4r\0_D�,��Zu0_O�8��R#ʘo��P�)�����@��`�v��1�Z_D��*�I�\nm���,j��,����od`X�*��Ƈ!-pҥ�8q�j��VLQb�I%����.�4�md�t�Jy��Q�{��@��;w��m���h�dEc|+h���BJ�\n��j2��o�\Z��$����go$�H���cu\\�\r*S<p�W��/VT=��� K���z��Ɨ!ʇjHJy��tDq�-\\`M�Z�\n\Z�B\0�ڶ�&�n7-G���@�����HC��g�U��	貾6�b�\0R�|p�Zr\0_B���#d��SqK�\0p�.B-eQ ���P5�,�H���\n��&�ʙ�\Z�(\0%�=8s������HV����Z�Ad�iJ\'\0�B�<�~��C� ��J{�/z�@蛕�F�%�SF_P�K���*���\0_�i�j\\�|\\`M읻�hڂ�Y\0Q�;\n�@�\0t!и�-i\'Q�~<�Ջ�M(��J!�d��]�l��ƥ��\0)B/�Ɵ �)��o���������\"�ʂ|��Z~�	�\\��I�D��#\Z�(\0%�x�ը���&�	+�{~�j��j�T��k�!�k&x%_���рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B���	�V�%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B���7-#R\0��X��I4������/g8	�{p8�>%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɪk�ަ�����b/d-\r�j�r�5 \0��Չ\0[D�qsAyZˀ�)�Dձp$��\0��J��Y����*c�VR��ѓj%��H�֜��>c\nϘ��I�6���О���qJ�i5��2Q�5Ii�K���\0��Y<RЉ�b�2�����#j�\\A �WP�f�\'������E�\0�>���I�qA�IAkQ�9��#�PfH�����>H@G�[P]@s\\R����#w[�+u\0.T���鉀[�#M�qsA\0xX�� �:������AC�(��Bj�Y�j\"�4*��\n���t�Q|��j1�5�>u��#j5#|�\0�kl�P/\Z�b/d����n�\nZ歑����\0��C�I4�V��,��(�#D�~RZP�W)��j��D#��KT��,0�Z����,��#}\r9�G���22���D�=�\0�g�X�k£�B��k&n�Ф&��*Z9�,|�I�-\0��\07�r�J�.cFJ��&ĂA6�m��\rA�wS�#8-�\rn��[cj�J$�yP�u�0!��O�r���JD#d�D\0��=C�/��\"�J��ls���V��\0#Շ�O�;h����sAn���p�ԑ��ZO���\".��Z�+�C���Y���T����\"�*%0��H��Y{�=\r?R��%KX�J^[\"ɍ��\0�`���8~����$C�jd�Pj�i����Ā-�VN�BxX��d�4�P� nA��{s�*Sd2�q��} *c��2A-`d�#�4hi��#�aP�6�6I\"\08�h����i9A\0�\r�jҪTE�5b@�&LSrЀ�߲Pڄ�E6$X��ߺ�ڔ2[�hq\n�B�JFN[D�gt�Ji��e���rl(�(\n���\0�[E�fJ��0d/dQӛ8ե}$*\"�<j�\0��\Z���\\	�K�yՁ��!.��J�W���SdQ%�\rD*5�P�[�K&j���Jo���&�x��&�L�_�|H�h���x�LJB�O�4L�ZnZB�B/�<kX��E��B�h!+	�,�lk!@�u�� ���)��(��Z�56N�N5�\rP�\0ӊs����g����(!�����#�q��ek+oj_ܖ �q��#�TdB\0����Pj�P���do���rЉ��,��d\0�A8	�RO�\Z�\n� ��!�7Q@\rP,\0��ڨ��t*b��Jo��U��#�%��M��O�|@z�,�P�\\j�#�Q\Zj��Ҥ��5���o���,������<�@�h��J$�q�-�s�j��6T*Vy&\Z�n\Z���,yګ��2���Pt�\Zl�Q9R摠�T�ޒ����g��ւR�`Q���Ii`�>f���-�-ʥ�\'���\05��	�ĳ� �O%$��C������*\Z��\0��q\0b�F@��*b���j1����<8R�&�L]\'\\���h����)V&E���L�Ph�!J\\z�Ǌ��LX� 	�ؒ�@i�b�m�V�jK\'A �\"����b�U$>P���R�[Ӆ3\'-�ds��>����<���M���a�5z�,�P�\Z�i����Q�N-E(�_⵬dm\n\0��ve��<��xY*�� v����H\'����\\J�B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���!��\ni\r굑9%)�E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋${��@h?U���D�\"��j!	3U�\\�kz²��B�V�j���H�,,���%�dǍI/D���~l/��E�j�Qt�B�\'�*P^�،j�H�2�c�1�v�i\rڭd�Σ!&�ERv�����%���StY�F�����MNd�B@�(x���A	�L-V���>*ơMJ��\ZIi*�����Đ+e&��=�X�4l~�#�O*L����%p������St�4���@���{&�(y !��E���&�J���QXV7Su���%m{\'�W�U.�{�(Z\Z�/�*�#�K$;4�B���˞&��空��e!�`���*_��H���%��Li\Z�+��!�9����?-EԲ��\Z	�ZN\r����W@��#ؚ���AQ�\"e�Q�ȥ�K-\"f���[ܚ㟚���߽��֥�n�mj�!�Md�W��\nc|jbD#@�*\';��i\ZT]Oz��@�Z�I\r\Z�Bb1Qp+e${S$��-\rڽ6?��r9�8j�%j��D�I��k�G5M��ތ��԰O���_l�<��Q3Φ�A	�������I�+�޵E#�ԅ���-��� KV�H�E$�C��\rZ�܊P\"�����.D�����ʦ買LCJ��#B�QDٵ��=)��J�Ch��V�8)��\0�\r�Qtr����NM��J�$��K)#Γ�Hh6�k\"Q76�#P�+��|0�Z͌�MS��:`�\Z�Loo�,m�md�`����ތ���V��syZ`r�]$��r\rE�Jٷ��\0Z�/d��Y�I��U��2Z�ɵR�3AqW\"[$�k&3��b�K|��4�/�ƪœd\r�<��Y\n4�E_.p�+H���Z���L���Zn�\nP��o�ڶE��T�8�������\'����R�ڲ(���Q0��G����0���zl	��R�)_{�7O�\np>>5B�M�KqZ����ԃZ����Q2G%д�:ob8�+�����nۤ���-\r�ֲ\'�U2H����+U�\\�k\'�f�|�7O��$��1\nfR�b�U�D���,�)�7r�&�.\" KH�N7�\rP�*gDǸ\0���>��#��rq��A�J�� �h\0�U�D���O*���+��F6�x�?5et�d�1����b��z$��!s@��,��{�ķV�\n\"��8U��P�5Eܞ�%��\0�O�0p+�S~����\n���ZȆ�NE<���Rf���N�3P�U*���O�1����T�	?tH�\0=)c��U\n���\"�ỏ|�>F�|�N����NMbη�\"�@K���P�굇���&��>)IZ�*�K[9�����0��FCRȋ�����b��Kl��,�����蚢��[�\"_>c��>Z���owԅ�&��~��	��f\nH�4���ZȜ���E�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE���%�H*֩<��*$^M�j�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!1�s\0�\0텪%KYKUYp�ibO��Iy&�8@�C�ǅ*�&��9��2���\n.��ɤ�K��ȟ��h��9�M ���g>V��K\'�c��д\r9�^�R�&�p�in��5�Lɬx��]|H c��4�WO��@&D�~5\nM\nloI��k�\0��(�\Z���5�$�\n�����S��-�HY���[>U��d�Su	�kr�qː�Y�\ZָBߨ��Z�_�>���I�j.�����	F�\\���h�hR#T�bIAV7��\\��Td��hN{�\0�-���V%�h�8Ly��yqZ�M����C� ���-Z\"y�z�C�&&�3�� �M�]���|iF��S�4�%�H ���g�D�b�$ɯ��H\Zs<9rZ�@�����\'\Z[�%�.C�A��ޚ׈@�$5�CO�GJ�\0Q�q�d�Dq��JXJ1�*�r�F���\nax�P��kq�]��L�b�$�F��0E�9 ��O����p��]� �$Ɂ�����P�ޓU6\'��-�:W�G�ؤ�J5ȋ�<9N4-�DP��	$Һ�ۛ��<Ҕ�i6�ȟ)`\Z�{�\"Ȧ������.C#J��GV$�9�3��C#�B�udS�LV��Q���^C]�N�S��$�GH$�48��P��h��!���X�l�엤KY6@��\rē� ��w�C*��AN ��x%�(�K�/B2�?�0���D\rx�M$�p�D�\rT>R�\"�] �M �[��]�Z��b� \n!��`\Z@L�\\���Ʉ�<N4��O�)�����\rb���{p�\0�*d,{�P	��\\Gj|����#��	���P�I��x�]\0�X��gU*�	�!�GF�3��|mw�nN\\�\Z�PK/\r.�a��<��$t���#�~�`=�d��\"�K�1�*��Ð5�(Y6)rH%�H ���\"s�Kh��^���-��ʝGr�e���-��d8���1۪Yx�#����S��r8�B�\n��U�5�����yָ�I�(��=�Y4��n<ݟ+Uʥ�J��`�\'�xr�j�Y��8A���8�]��z�\0�x�3�j�(�T��<@!6�W\Z�U����	F��8�<\rk���(6t��K&�U�U�]��Uʥ�LY.g�04���\n*Vw�L�-�N\\�\Z�UVJ� \Z]̃���S�c� :�L�_��!�h�׈��J1�*���֑�m58���it��n<	w�5,�\\�,M\r\ZF\'�N�V(�8A����q�RuF�|H<o�Px�0S^���\Z���j�����wʸp�q,[EJ�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D\"x/M.	�_l*d�+)\0��>|�Y�*�ٚ��\0<xԱ$��M�4�d8qI��KT�����D\\	��C��#ڍo�5ئG�S0���\0��@]l���Yʵ��Z�o��Ϙ��1J�)�I���(Ùⴙ�T��ci.pL�q�j[B�T���Md+\Z�W7qNT�/��9uMsD2k�S\0��S0��J�1����1>��`�F��N#�A��$�S��4y\\��X�Du���bj]:0%~���p$g�)F.\\�T��iH��1�\02}.�|�2E��v�����1��t�Z��.<�k%t�$�Q�\0^<j{�j\'�m:�/\nQ�����0	_��kSJ�q�!��$Y2�?P�b�)S�-\'�$�������J�@��.�[\0��A�9���!�D�S��\rgƤ��J��:��.U,�Eꍉ,����W3ǘF.\\%ޘ�\"�X��ɓ�^KQ0���ߩ�\\4�=�\n��+$BiQ`Z�¥��&F�&\npɠ���Գ�*�ĬQ�W��\"E싢jK&�v5p$g�Dc�_D3\":b~����\0iN-\'�*�z�\0c�YG�\n�	K�S��f�|�1EՂ&\nI����Z�\"�T`�u��Z�\Z�B��\0��EZ=*�w\0)�<�}\\w�����5ئN��\Z%���꟪@_l�H����B�rP���\n��*\Zf\ny��<V�&貸�`:�!�S��itL��B��(83��^O�uT�����b��NQi>�gA\"��ϟ��ěY0��B�0-��9S�k]>�!&\Z�P\\\0�\Z���� �ӕP\rt��\Z���oʹ���U�9C%�\"�[B1�2d����J,\\�4�VD��N|��PΘIy5[���`7z.���jqA�.g��\0Oz`2�C��>5�\ruB�v���V��x�V���\'�	O\'�\Z�T�;�%��i>��J�:@\\T�*%�;�!對C�΀\Zʸ%Za���.�:�; `su����N��PY5����T����V����x\\�=\"~���L��W(�qeBͪL���8�SgT.�HF��9��`2.�H����\0e��Z�;Q-��N�9\n�4\rh�B��D\\��Z@9}R�u\0�w̘g�j�/�z6�r� �\ZsE�T(��!ip�9��l�2.Rѳ4���Z�\Z`UZ��Hs��*��\"�-��B��*��>@��sI�L��O�5�)�\'�\n���T��4�i�P�h��I B50N<����4 	�s�\08s<i���h����Xaz�ҥ�Q\n����wiU\Z��5E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}�#\\���^�E� R�:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N��bBM�(�RC�Sdl�0���p�R�R��$��7�siy�<�-�4؝!���k\'%TA\"�E�9\Z�= ���#��� R�P�\"\08\0q�?+(n�ј���d���IT���d�!R�R��5Li\r-Bq�^�I��.�V�C�i\r=6�2��2�������\ZZl�+d^kQ�)dqKi7K�lm��XHС0�=�z�0�PC����K��a����Y+�40��p�Dᙩ��N�B@\'H\0�6����$Wʤ�<9= ����Σ$H��B4�%���^�1塺7@{��mkq�Y��J�	�`a.�!ơ��+�5�L�(��xq��3��G����K�\r��pʵ��Z1��R�H%%l��K,d,��\\!\Z^���g����Z��L1���l�\rIP�L������{T�tH����3Q��I�2j[���l�ũ��\nzmd���E|�P�~�=:P��\\!3�K$H�C�=��K�7���1\\rhQtF0���I�����l��4�Z��E�L�bX�m�7���At�j�R\ra���t���Cή$pS܊M@!����V�.ђ$�\'P����[\\��XcCt�U���;U�U?jF/T7b&��\\!G+U\"\n�_y��.E��i75��\'Ũ��44:JX�Z��I�LT�RzCKI@\\Vȴ�,�)\Z��Q�\n-�><<�塺l���\"�W�`�\0�]���� �CP�hW\"�#�q���E��ԃV��P�(PX��El��C.�!����؏ޜ�@������\rG��Q���c\Z����#5\\�TЈ�	r���0t͝�Z�	[\'�T���c5 Ԁ���ʷ�E|�g��r��SI��b*�,���@���Ƞ��\Z�塺w�K���&����U�Uؔ\\�XdX�U6�8L�-\0�+��f�k]LK�\0V�ɐ����c_*m�d��i!�t�����`�J�wX˄MG 8��>9�˗����it��=���0��3�	ZC�-�<j�@E�d�3t����5q�=vD���Z�Z�W\'$V�3Z�3!#Ii��VȾur���Pu��D\\.B����7-\n�J{�r��6�j�����qrۆ@V�2`{P8�Z�����P�=5��v��44[k�K�\"\0�[!&`�!�KIEq[\'���V�cq�K�R�\'�����V����k�Ҙq�g��a�.���\0�)�,�0F�6>�KT5�U���~`A\"�,0�V�R�iC�M���pΪ@�K*!\"!�آ��\0�\nA�C�O��A&�qƛ=SB#��������L�]�1�ƪ���vO��@�\Z�R�y%kH��u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]I\Z�-�����/�\nY�hZ�MH�į�Y�7N�:0�-�Ï=P�c%�d��Ɔj��Zf�P��8�\Z+*����A�JX$�b	�WRF�i-6���D��C�Z��R-�+�Vu�\rӺ��=��b0���T(��	r�,=���������.y�)Ɗʂ�|mr@�~���+X�El�ԑ��KM�{\"��0@������ԋlJ�\0�aCtpr،8�)3�\n60�\\�Klhf�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���i��B���h��.�\'�� T\r�)`<���$V�]��C��L�J�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0脂$�é��āˊTk ��	%\0���CR�s�S�M쓵���	+@	ds�1/�Jɠ��_�O���\nB�ZJ�������	PF�j�F��H%�	D�<�Y�y�@[$@�z�/���β1\"�(��\r~�����\0�\\)R���20�p\0K �vg�IO���{~�G�6BkJ�\\HC�~�@*��I\r܋��8�	�Q/��j��� ��� K}L}@q��V&Z�߽1��@�,(t�|W\0jD�l���8ƠP�\0B�ka�	O��\0u\"��A��eb�U%ݣd�&5�@%\0<�	�	PC�Td�G����K\\O<p��0褹�@D�[�`�09d@�%��� ����(�Kq\rK�Τc&�ʑ���0h\n�0�L�\0u+�����O+��\n�G�I�A�@��&x%\'>Y\Z$\"����P������) ?rK=ML\\.5���k&�|��,9\'��k�G$�rKc5p��*,����Lc��S���	p\'.�Z�bRd��M��n��$DM\0C�����[�J%��j%����Y���Xu0_I�m�dq�܄L��\0^t0�3><��d�\"�[#��C@E0D��c�)d�qhq*xb� �R#�ƨG�\0N�JLI�%�J����8\"���ƃ��!�R$��sE�.�*VF6��I(����#%\\����AZZ��-hH ]�cz���\"��|�i$8���B�P��6�U*���k���� ��1v6EP9�8�	ih\nHK��ƃ��Ufp� K=MK��EA�ck&SD��_�i�����@��=�n�}@\0��eX���	��Z�\0���$U��1�]B\\�������)�~S@Ks\0s�A-pӨ�_֙�z�cy�K��`r�*~�ʨ�}ـ/:Xn\Z9�Z����w&�\rZ��\Z�a�դq�_Dw�.ŭ*	��쇕������ᤐĥ��U3�h�j��Q7!�5K��\Z���\'U�A$@�MO�x&\"����A(}�@��iB�8��2od#\Z��\0\"�\0��[G2}�BI�A76���b�Vxĺ.�\\l�H\0�Qo�%0,����.cC��%�i\nA����/�M�b܈é��~�9)}2-d��\0]�i�}^|�0&�ɒ���cP!C@BB\"�1��u�q�^��P9īA$/�b<\n֠5�t�����3�*��\0�����$�Q/�?:�@�Sر�I%����P�K�Ƣɸ%,5�]�aB��WUSeN���`�B��%�~��`	}\n�qh*	�M�Z�\0�cdpJ.88�xpO\0��D�K;�.BC��J|p�H�	?�B��$@��4Ҟ�9&4���^��\Z�%\n�\0K���pZ�n�g�\Z�\0���-�kj�0r�.&��G���h.�05K$٤�xZ�䂬\n�l�I,h%�H-E)���_D,�F	g���QH�J�B-d�j�	%Y��t��B��T��5v��0�ڴ���+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������A<�n��C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�,���jy����-L�j�r[���\0��#T�QH��{6�))�U!W��QnT���:`�\\\0\ne���Y�[E,��IZ��4�~�琬��Y01�F�SB\\|�d�jL���Kk%�rR\0	4s\0[E$\'�ZZ�ʍ\\YJkIP��p8���HL�\"37QiPַR��8Vr�%�\n@�-ϒPCF���G������{Sc|�\0�h�v`s\\jy���!�.��a�J�[!���\0Z�R;tZ7sA	��p\0T��d�d�~RB��׷;�j��8Fa��!�*Xa���g)[@�!/�PC},9�D{�JF�H�⍏|@��-�.�⸊�i�[c�j\rUi�K����\0��!���h!<-c���I�	Q]p�	S��\\���d��#3\"��B�c��a��<��Jo��3�1�fdek&�B��� �ў$|R��Q��!ld��\Z���!����m�N�@���\Z�	<ѰR�:��[�W�<A�bo ��[�����c�T&�%ʖd�PC},?R�����u�$��2G�\0������!)�\n�ٚ�Ij�%ꄃ��Rɚ��r9���	H���0��Bx��|�Rb�F��S�n�� 5����Bcj� KU�Β�%��ß�G�C³2&�C{Tl�B\0��ڱ y�H;�nš��Ph$��l��:�H��mQ�Ā@�C��Ƃ�D0�)��I��m�|�f<Ҩ(@�ۨ�]�5R�lG\Z�-��w�,�44��㗕g�Orl��K��jU ~�)�E�t�;u���Q�������eeؖ�c�؟$�b^B�C�ظX�!M�<V�-� �rS�Ť�ַRӍ��3 ����|���i�� �-G1���\"Ia\0;��mX���ƨ.�h�&\Z���\0E�oz�H�t���\\��o�yձ��*BN��O��ʘy�P�C�n�� \0�`-��Td	mY�%�0澢<���2��ږ$|@z�,�P�qJ�#�6�]�jLZB�C���ð�\"�ιp!�kp�T�T���H\'����P�4�&\Z�U\0\n�&?�W0\'�Bl�X��$7���}D)sJV����\"\0;��m_P��UFD^���F&\Z��,-T\0W���[�@�CU	?1\0��C��+@�\r�Q$�Sl.QF8�*���0$�j-������6����	�,�:Ik}\r!� �\0<�ځP\0WT��H���[P����*Ĉ��g���y�􋴅8+[FLx$h�˚��Sa`�cRD�IBA �W����&��%�HR\0\n�b<�9m2��I(:}\r+��&sk*�\Z��ѯ��e�Å��^ɞ�(Ԋ� ��	�l$��&T�R����v�V	D�	S��8f\r[jRd���H\0*\"a�Pd	m\0�=�Ho�����S�M��R���\0w��1���\"�T�6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B���H\'������:H5�45P��/j�0Kh���%�KNQ�Tsk&��|@z�30�9����6A�M�HԀ/�V$mE��!�k.��!K���y^�+O�C�t�Qm�CU\n1���3��H.�P������G16�j���\0w��1���Cd\Z�ܴ�H\0\"�5b@�$\\\\�BV��0J|B��4���ZȜ���\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O��ɬ��l��~?5Be�\n�tK��s��T]H�֘���� �؊��/�)�s��-\0j	�Ƨ!&�	j��J�\\n��8d��/*���� ����@	�%��6JHҘ�~j&j��jj)	ğb���Qu�\'9.���/b8�*�H��#ڍ�v�������{�L��)��3Ar�kx.f�/*���1҆80� ���M��K��%���˕M�4�j����Q/�p5Z��]k��\0*J�B�+H�򩥴L�� �-\0gZ���FG\"�T�H�jr\"~���9��n��7�85=6S�� �H�5Ld�� dx�މɡ��Ps�S�n����AiS�d�\\\\\n�T��d�$-\rڭd��dr)�H �u݂�X/\Z㟞��f�a�1��Z�xT�$��l�=Š��h~j��!j�N%y�G娺�ָ�pR��������[)!����pu���s�Д�)B�Ol�`~j�����75��-�Hj!�FɄ��Ej<|joD�#��Z�(Q/���\r/-E�b��#��HA���#�u�\n�]���\0?R�\"xcK\'1�D��3C���(�\'�X��{���V�n\r�@������cem��6�Rĭ�7��+�!j��@/��M�j.�h�W��ZZo�b8�ZA���RY_��-\rڭd��Y>�3U�\"(�\Zɹ�n�S����鲛��+SfM��	���BBbp>4^�ceE��5DS�_�r���N�G\'�� �F��E�m����-P�#���\0?U���NnE<��̢f��.D��$�~j��:�#!��\0x.	OT�\0�H\\�		c���L�}�	A\0���c䨺67�ѫIi[6� �m�tP%�+�:H\rڂr򪛑���e.�!r\"�\\��橺�\Z�O�1����<i��Sk%��˚�Ǎ5M�,�D	jj�O>�P�*bQ������-�Er1���sH��A��Y�U7#A�X˄��J\"�\0\\I�Q橺vK|��\0�fxpJ�j&�w�5=)�\Z�T�ڔ�\"�Ù��c�n��7��J��q�W\"|�2\\�8���mV��nE<��X��q�(�\n��y�n�S�.It81,�M����t�(ys\0���T*��Kq�a�%���j�1�H�6��nZZn��X�9��&\"�F��T�q@�,i̒)e@,�����3��St�d��\Z�԰��jߖ��K	��\n�P/D.\"�7D�\'Á�-E�^���B؄󭱒<�J��v�Ah\0�J95S$�P&.�5�j���-l?sQ橺d���(c��/��v�`{U6Md�,���z&��\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,w,�AV�I���Q\"�mW#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB�,�AV�I���D�ɴB���\03>�KH��BH� �\'ΕIJ�!;�<�Q�h�s��/lҁ[��(�#~�Q��W\0���%�h�N\"Y4��j���҉�h�r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G���D�HxdS��u\'�6<E&�Q��r%-Dh[Dۘ#sĒi�)��?j�VL�\n#s��4���w�L�[Y�W�n\0h.?��PjPh]1��.���S�H\'D��C�L�ot��I��k�U88�9@�m߽x�M\0����#��u�!�:k�s\0\0����Q �H\"�\'���!�jJF�Mk�#K�C��|*,��\'D�<`&GۅJF�Lc�rh%\Z�E���tF��)�L�%�H*�\\�v`T�mM{�\0�\0�<�d\\!�^�0F���\n�Z%{����W�#PCP�ES�{��[*��Lc�Rh%�e��TN@�\ZФS5�$\rS��.��NO�M�I�^��4��3ÒVE�+e5	�3\'��Rj�j��! ��f�H���烨[.\Z@�l��l��I��k�\0��(idFdl�iZ˞n����� #�H\Zs>�C2��q�����q5$�z �t��8f)3!6)�K� �s�Ԁ{��[$I��-~�w�iƅ�Cv�2	d�sX��.�,R�4�E,I#�����U$�T^\'�P1.9r	�&~��I�[��q!�c��JLȪ8�t��4&\\�\rڑ��l�fM�ǡ����D1����>���s����Q:���Idt`�&g��n��@�Ɩ�b\\r�8���]U	\r!��1�x%6d����	sANb�t2���X�\0�R��\Z�P��`��6W�SX��.��T�i6�T����ߗ�:D5�b�\\\'\Z[�$�<�i�6U�@4����0ʙ#�P\Zr$\nqt����\\�v�wZA�[D2�$�H*����ũΥ��,�+��4�f}�H����^�3PXfO�8��P��k8�{�P\rD��,yx:�Ӏ<}�XT�%����c�\\�r^u�:I�C{R��,�A����?AW*ɴ	�W��-���(��	x� �̟�q5@=\0�Yx�#��*�j*�z<���*Ô�(8E&�Q�D\\��rZ�b�#�K{ĒiZ�W���*��� \n%��0\r &g�Xs��Is��K|I9r�MUӵJ^�t�����B���@!��{��\"�A(����W\Z��K{ĲhZ��.�k&�;(%{�\0h	�!�Ν�e@$��a��$�b�^b�t:�\0���3�(�T{�	p	�>Uq�L�\rp�M$�_�\0�D�\r\\h[D��ɤcxgU*�Le{�@\0fx|�w T�(�8A�N�:���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF�:��_�@�싣h���kp\\�~TD9}�Q\'�\Z�x*�Ja�6��Q<\"f8�\0j�k)Gh@sOy�7z.��\'\Z�y���5,��Y6&�|<?�!���7F�%~��M+�9*Q\'�IGh��k����3_D\\&<\0����ˏ�A���QQ�A���D5�t�$�]�4\Z���N����vv�U,��pJc\0���+Z�����r�$h���\0�v)�*��jgR�������γ�{%n�d�@s|9��!1�L5d\0>�u$=�N�X\n��e�jY�l�	�Id�G����ϘF.\\�R.̌���F�z�\0q_S8��R�LrȚ\\�G|�\"pE�!�����RCY&�LjL�\0>�u,�M�X�[�T���6$��F�54��|8E��FR7�\Z�2+��\r)�>�7�1��\\>b���Iʊ!\Z�s�Z��Z覈�D�S� 8|jY�ɑj�f���D�2ɬ���A��<���x%ޭ�E&����\'.)Δ�I�@dO��$._Ҥ�H��.\r@�0N<�r���P;u.�>4�^�F�Qı�A^�S�d+hɬ�c~U����8���!G��Q���\'c�\r\r\'�\n���B�RC�K�P�1G+Z�T�j&�\0p���^�C+��u�d�]0*��K&���W7qLҪ�<x�~���5�2d�u9E���R�����/�T�]	n\"�\0�<�Sf�l�0�p���\Z��Ӧ���S���T���\0W�w�ߔ��UC�/�l|Rܑ?P�.����\r9Ť�&�Eziu����	N-�(�D�z�k&���x����,X��|���M,,�����v+�+Lqr�$_DH�ֈ�b\0�L���X���d�VDG[0���%�Bx�\n�\Zʭd��\rN�\0e��\0�Z����p������`	��ZЍTB�W�V���M�Kx?X��|*�/�w�\\�Ț]l��aC8��`��ۍM���U\0�2U�\Z��\0�T�d,0u:�B��.�\0���V�\r3�\0����r�*�d����z�d�>uR\r\'�A /I��3[Y7��9 \Z��9��M�Ai�s� V�qZ�; `-Q�C�W�tw�\r?Q\n֋s8��T*y�M����F;�L<������	�4�م��PC�1D$B�8�Qn��\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/��k����k�Ⱦus\nY\'H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH����5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtYh�\Z�4)k\0����$V�MB9\Z���i J�΢`�K qK�MG\0\n-��X\Z��CtW�9��n�#j�{Bs#qz�0�Q��(�D�x#�\0J�٥�R��Se� ��\0�$��1&�T]Óӥ	̮KS0@��\"�p����P{(�0��<��a�9l�ZL��Jɑ��%ʈ,8s�b��MN�h�\r�mÍO/5�)[!-������$9�EoӤ�@��R�<��\0D@ (�����rТ����l�q��&/T�ܜƆ�:�d���\r-\n@^�8����\'Z� j@鵽׭\"	�Bd�����@�Ⱦu9\"@�����\0�X����u�#���^��8�	�Ԙ�P�Ɔ�}<8Tr�F&\ZYwbA��f�/5��j�QP\0M�R�~դ\"H��*\"�P�Zs%l���H�)�Cd�&��QPb|s��<�4)]h{��ַ\ZL�D�8%�C�@`j� �0F���\Z��A=�LZ�j\r\0���~׭aE|�Q��Ji<J�ΖH�\r��A�\0e��T^g�1X�Ct2�4H��l�Gr�Relh��d��.V�j	��\n�NG�q�G���WU�\"�\Z�4���U� H�2JJ\\��-%q[%�FL$k�K����Y���4.h��� QG+�%\Z�.�m��T�	��EE�<34�y�.�&ƨ5&�~���V����2l�UC�4��\0�V�/�9�@RΊ,���آ�5���M�Ct��@�	r�S\n(�ְ�j�B�7M��	�CQQy��1zYz�\n\0\0�-a�V��\"�ʛ=�˨7Ӥ�QM�E9āO*R�@xG\"�L��5��)����O��>t�]0�%���X�T���\0�m�7�.&�z��q� .��E��xD�ZE.�u\0t� ��!|��<��+)p��z�[{�\Zϔƅ7K{�r؀�\Z�t�V���C��j�� )(!�(��	�Ձ�@��ǩ�\0$YE���o\0d+�J��e\rF���+�b��N$[ʝ�����B�?e�k>^Z���R0<����n<<��~�B�A���[&\nl��BH��Ч��`P];\"`r+�\0~��ڷ�I�/D�i:t��7�Nq\"�Ue�~�G���8dRܔ7J�@�	��\n*�^����8�mÇƨE�Qz���F�(�m�ƫ�At�ck�jD�Z�~լ\"�A���Dn��P-�kU @��(����R-�+�TV7Uu{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH����5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�f��V�g�Up(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\4�\rq!\r�Y<���\n�5\n�`8�	\"�/�j\0/p��Js_%����	�����z��&	$\0��҅3#��\rO!7I�+[#\Z� ���`-�<)�_D�r�KA%q��X�P��\0�TOp�T��d��`]@Ip��\0^�b�D��Y�hũq���0\"�N��1�|��\ZP�\nG�\0��e$򕱌ir�\0Բl1�V 	{EJpqR�IS����i$CU0F��V�g�Tj�Ⱥ�6���\0���R`}d�%�����<��8�j,��$��K\n7R9��@ʦ�Ib����:�%�Ka�\n��	{�{Ӕݭ%��^�p�K�BUL\0I\0e���J�ZTd]B�\\�\0�|25\'͊L�g\\`�z�/��<-z��mP��Q�>D/�4��\\�&�Rie��n�n\Z(D��T1�^�.���7kN�O�\"���&ðk�!�-���R�$AVZ��H$\Z����Π�\0��	NF�u�_O���VG�tV�$�zZo��#�\0i{%e��\Z�\\\0�	o��L��\\5\\�T��hch�$�î\Z\\�y{�J�Ve@qrE8_8ԘD��wk��SE��@rLEA�4L���^t0�M�\0� M�x-\rh�P\0E�[T�U�q2sd��=f�U<�d+�ZmxƩx)�\0\\�ypA��5@�\0G�ւIRҧ�[�8��Qܳ�� K��龠9d@�01�������\0KM��G�p�od�)း:�!DŸs���/�U��\\�S˅��U_(�V���B_%4�`d��\"�\0�����/p�Y�$�7��}9�ː��2-dдI(�C\r��Dy�*�	�����Ɨ(P��P@\n�1��q�^�\n��h*��ϕ��6N�55�H��%eLl�	Nku���|yޟ�b�,��ӭ��u�b*~��k*@��\0/���4bG5�UG�읬���ր�Aq�7�m`�����������QUW�t	d�4�\r��Sd�BQT�����+HE(q�ߍW �AN�Y$��S��P�*N3\Z������r5��̎k��2�����\n\0��Q��Z�`��R�r���UO������&�]�ID?��l�@hK\0�~�������P��ᑧ�\'��� KQ�\nt�P�*9H��0y�\0$�?�ӃF%x��@����`�U�,�1��A\0K��Q��l}�� ��\Z�d�\0�\0���*�ء!��QZB)C�?���0��>0K=MӘ��.B-d��\Z����a�f|W#U�M���.�hY\0��δr�\'`ڨ�ZIS��+VX$� ���yZɞ	U��!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���H\'����q(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���){9��O+ہ�i�(t.�j-�hj�A�8^�&`��	�J�������&�MS\\���4f>`=�s{!hl�V����\0_ƬH�$���C��\\	O�B���	�V��B��ۆ��c��Rf	m�]$��i��?\n�bmd�5ψ\0�SFc��G1���5i�i\Z�\0E�jĀ-�H����<�e�`���)u �O+�����+3-$�\Z�a��fd	m��J.�@C},9����fdM���&�H��4Y~�⸥O1��=�[%\Z���%��j��-�H?�p7P��\\����(BA �8��QH�JJ[��!���ߺ��Rr�5K.�PC=\r*��#ܵ��6���D�SFc�+��r/d����F��pB��}P�)o�T��x*�O\0��-aM�(�	�%ApU<����\"��I����ZT�R�lyڳ����E�Ҝ�%4ha��\"�2&�M���$�\0�`��@�S�E�\0����j\0ZB�B��:� h���M�sAo�Ap	H��dp)��\\\r�\n/���5�!C3u�CZ*%��*e\'-�ER���zZs����k)P!�$� �l�h��*y���oj�ɛ�5I* K�\Z� ^)�\n)\0�?��`�t���D�\\9��O.�Wʥ�J�Ƣ�F��l-��T�[@�I/�PC}\r9�D{�#\"md3Y%� ��/�X�*\\��\"���A� �(�)<�ւLZ�B`8�����x�j��+�p�	S�\\���*\Z����\rD\\\0�Ia��Rd	o�d�I$��ӝ���d�ځ6����=�5R> R\"�C?z��ƭ8�*�/�{ւ@��H���\07�Qp%\rr4E�l�l.q���J(�Ӆ-�\0�m�<�H��t �gt�Jj1�5��Z�dmdۅU6G�\0q��e\n�{��%(�8M��<L5iR�B��W�h$o��+\\\\	�b���x�5Ȳ	88�T�����\n��m�Kt��EѡP��9�d�Y�$���a�� ��ʡɵ���\0�[�]@�@�\"�L�Nl�t�������b�2��%���5My�J	S���֨bl�J|��Z�\0-�8p�����ڲ�I%7�Ú����jL�md�ږ׾ �MV`e�-P���Q7�7V�u�_khɋ}�*\'&V�~*���d2Y%C�alQF8�P%;Z�O�I\rkU\n?zf@��!�����(!����3�B���YS\0{J�$@z�-�|�e�BD^ɳ�����4]�)D\"�c{�ѓ���Јy[?Uy$ݩd�C�O+�F6+V�����5UU\no��2�1kD!�Y�$KM��#�\"T�岠\0K�05��(ţ,q�\"�߽4J5iUi�^���-�,���A\0�ܬ��\r@B��A+�(��j���I|�Kn\0j�A�<�G0%�L�,�t�\Z�i�G�aK��Y�ަ.c��\"�T��`���\0��i\0[E7*�%�!�kp�W�*���A<�n�ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Ms�\0;�ј�����E셡�\rZnZF�\0\Z� h�..h!+Yp%>!\n^�p$���qZ|J�\Z�n\Z\Z�Pa��I�%�BAt��o��?��*9���T�> �M��}�^�Z զ�j@�\0��\"����S����A<�n�ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Ms�\0;�ј�����E셡�\rZnZF�\0\Z� h�..h!+Yp%>!\n^�p$���qZ|J�\Z�n\Z\Z�Pa��I�%�BAt��o��?��*9���T�> �M��}�^�Z զ�j@�\0��\"����S����A<�n�ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Ms�\0;�ј�����E셡�\rZnZF�\0\Z� h�..h!+Yp%>!\n^�p$���qZ|J�\Z�n\Z\Z�Pa��I�%�BAt��o��?��*9���T�> �M��}�^�Z զ�j@�\0��\"����S��G)�4��D䔦I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�IP���~�Y�Q2H�\0��L�u܉�|k*ʤ�Q�85,\0S�j\'�Fɬ������P�D)hB��/���O�Qt����P���؏޴� U�\nH�4���ZȜ���E$Zf���Nc�YVU&����1��`�n;Q>\n6Md�,���z!KB��|O�\n~Z��t���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BHIF�|ȋ���U���fFe!�`���U$�d�[eqjY,x�w�l�D#SJ���T��S{�Q=�7@������2O�9�\00�\0�U3r(̂5@��Z�*�K[���\'空U���5,��*Ij*��Q#�@�c��R�E$�bj��I_�T��EҹZbyA��ScZ@�7�\"�L|��b�\Z�`\ZS<�\\5KL�^T�Z��`~j��̍��jzS\Z����(ys@��9\ZWA	���>�K�|S����)����^PjB�U\Z��kH��!�G�(Z\Z\r��\'�S�ȥ�;Ä�qR���]�橺`#2���>?�I��L�<��@Lx�ވ�S�!Z���}/-cu&.�E#�\n���؎5�\n�)!�\nփ���,�E�\0%�%j��Q-c�Ƹ�橺�Y�FCn�)E|6`�[�Ҙ��\0�&z!{aj��Q/�\\\r&1��u�)�V��U\0[\"b1�`�Wʤ�%��P��m����L(ܨb�%j���8~�k�T�8V�\Z������d��6P�Zl�G�ҺYp�+q���V��jO��Hԅ�l/b8�z���K!�P�4�Y>4��R�M�@\"V���N�f�/*��ʝ(a\r ���Nɺ��\\�!Bp>4]�p�������>Z�����r\\�Ҷm�s��ʓ2������\0�L��S���)��^&hsʔKr��LeSt�d�0��D�0�N�4\"o�KrLr<i�B�D!Z��~�\Zc娺��\0�J�F�ǅr �U�PBdr-kA��d��/N`�O*e.�r&>�5�eSu@2�CJ�� ��c�W\0�J$.jzP��J�K�-V�(�QO�T5M�S�%д����q���7�ʑ��yB�����X�ƪnE)�+U��L�qW\"Z��.d���)ځ-�����cUb�\r5B�D��҅_ҘA�zD!Xn�|O�`����Lc�}$�}VD�:��|�j�+܅@�Q���3)Z�LT��%n�(�������Uk%�P��`\0&���S�lM	~�-Ҙ��2V��_.�|�J鑽�]q%\0T	�:�|�d��B����S��FRȢa���n�R>j�2,�҆85-e?�Sv��T%.jzP��L�L����D�\'��%E�d���\n��&��~��I�ȰRG)�4��D�L�(�!\"�5]w\"s\Zʲ�5E�t��\rK\0�p�ډ�Q�k%�d7��;�\nZ�@�K�|8S��]+��� T-96�#��\"HfE��8�M!��V�\'$�d�F	������U�I�,��pjX\0�ۅ�O���Y-K!���ވRЅj\"_����]>79�iɷ��i@�2,��\ni\r굑9%$�0H��W]Ȝ�Ʋ��MQe c�R�>�(v�|l��jY\r���B��+P9����J���NM����H�Y�`��(SHh?U���(�$Q�BE�j��D�>5�eRj�(�\Z�\0)��C��d�KR�o{�(w��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$qB�CA��dNID�\"�-3U�r\'1�*�TYGH�԰O�\n��&�Z�C{��C���\n�D�\'Å?-EҺ|nrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�*��{�֑$\n�\"�gqɤkT�n��/&�5r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-�8�d�\n��O7J$^M���0\r ��rZF�BD��8xt�JVP!� ��ʏ-E��u\0�{f�\n��F����wʸp�Q,[D*qɤkT�n��H��D+��`\Z@3�䴍,�$��2p��T���\"C�A�˕Z&�79��2��(�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$LXbN^�#����!� ��C�S�H�s��l�\\�\n�#c�ri%�e���\Z�\"�,�UZ˞n��)N�m8�=�`���Vr��B��p\Z�1q?�LjM{Ҳ0�C��q�/-\nwM��@u\0�d�������I��\Z�rv	�Dh[D�ތ�K&���O���Y2L��t` ����9�ʈ�D\\\'�1$��q�5B6�@4��1��̕]6\'�@u\0�OەJh��I��\Z�\'`��S�h���$�H:��\\���T��h�\"{����\n����\\}�5$=�P��-G_0៍K5�dOs�Ql�t�L��6)48�\\��:�9N!�hQ�7H�d�s\Z������Y6�\r�D��4�PC#�B�;t�3w�eR�e6D�Z��1�i3Q�=�@L�\Z]�2�Hؤ�J1Ȝ�OU\n�en�K&�C��y�4�0�m��+�4\"�25���قl��Z�bF�˙�Rf��!x%�d��(\0�QSdloө\Z��U�NKU\nI�I�t��M:������Js���!��)`\Zp���J�N�#g�#B�Z�)�Bd�6j(��K�%�P�\n� �M.pu���D�5p�m��GH%�H:��^n���R�� U�s\0�fxT�Y4�=�\r-�}Îؔ��B�<�6j3�d�x:�#/텪�6�^�ߤ�,v�����h�{P�F�&��kUH�.Μ���%�^�\0�ٟrR��Js���%�.A1�Ν���6���3���`5]���l����!��J5Ȝ���5p�m\n@��d�\n��M�]歹d�  ��\r\"ٜS�RV��8��1$�\0��2Ut\Z�-��1g��-1D�ک�9�\Zr<x�D=Ж׈�Ш��.\rr�y�F��C=P9�I4��\\�|*�9�h��A+��4���|�*\r-d�R��8A�g�8�USAtِ�A�x�;�L|�躌yx:�#\"ETC�0ÄO�J5�.N\'KW\n�9�I4��h$�v���d� \n!�ŀi���A���[��in��8S�(�\rB ���1���烨��4�+t�b�\"7�%\Z�p��j�X��T�%�H*֩<��(�y6�W#��4�g��i\ZYI�d��9ҩ)Y@D �x�Ǘ*<�Mns��e�P+t�\ZDo�J5�*�Ò�D�m��K&�U�Ry��Q\"�m�G9�i\0ϻ��4��\'<���s�RR���A��.Tyh�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S��M �Z��w��E��!\\�s\0�\0�w%�id!$Ny����J��e��\\���4Q��P	��i@��{i�I(�|��wKUŴB�,�AV�I���D�ɴB���\03>�KH��BH� �\'ΕIJ�!;�<�Q�h�s��/lҁ[��(�#~�Q��W\0���%�h�N\"Y4��j���҉�h�r9�H\0f}ܖ�����8A�N�*���Bw�<yr��D�F�<@&^٥�A�Q�F�$�]��9-TK�\n�D�iZ�\'���/&�\n�s��\0���-#K!	\"p�̜<:U%+(��x��G�����x:�L��Jn�أH��IF��\\�rZ��-����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!Qh���F���|�b�![�^�\\0��T��H�q���P0$�\02��hg��b�6��ۂ�z.�TkD��B��*�]ǚUF��B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`I>\0e���{��m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�[Ra��d\\<hnn�l@���\n�k��D�$�S���j�N+�(�r� ��I�k�L��4���\n�(��iu��ud�VH�<9��!�B6��S��\r�4��Ҳl`�<��*E/dJ�d+Z�W�>TD9}���I���L���0��E� 2&��Ǿ�5��@57��q�C!t���49�4�4职n���Ɠ)\"��%�[���(9����1r�$�ctn)5��~)�w�Jqb�!��� \0b�Y��@��[QuE�I�ȿz&��I�9�t��R!6%`:���S��URY5�SZ�WF|���s`�x�:b~����\0O�����)1F�^\0k�P�J̇C�-�(> �y�f�B D�Q���K�&{���J�U��\nL@��\"����Y�\Z�W�>�\"�͐��O�\Z�w̖\0�\r�B�@4�YE�] �Ű�M<�+~b�2�3q	�\0๟\Z��E,S�eqoҀI[@���V��q_*�G���\n�Hߨ\0\Z�2+�%�q�/��x��n*Ht!ql!AU��ϕ�MP-�+��\0-����Ģ���\0�F�{q4�HB���Q\n֦���g�\n�E˛\'UN�\0��ǥ���XWΉŋ苡�^��f�8�\0@H�(�	�)�Y6cT �n\0��S�Qk+`,Q\0]*`2�,��f�jix�i�_DW��\'�K]�&\0���8�}\nt���4����K����\"j�,\\|<*���{U\r36�\0��\"�z�\Z*�c9�2םP	�@�B�c~U��r�\n�/�b�RkhF?�L��ΪQb�!��� �\Zl��\0�&LqJv��ys�8U3Y4��w0\0�ǉ4�~�)1���2�b�BXId/Ekl���|i\0�͕X2���̙WΜ��C 2\":��r𠇲vJzB�ٴ�ߒU3w��-8$�\02�x��t�Q���l��T]����5��hF��8��\\j]����M@z]�&E}��c͢b��dD�������}���n�2i�-uL@	�$���kM��N�m,Q����\n]\Z�։_��k~U���4��K�E�\'�\Z�S\'q�A��oizipL��aRkd! Bx�ʋw�@��|\0��5���E�(�X�na���5Q��Q\n����wiU\Z��\n�DO�5ئN��D��\n��������¤��B@�(�#���B�	�$���kC=�Q��F����)tj�Z%~���W�<Ҫ5/����k�L��Ή/�����3�I����Q�G*-ޅ\0I�/,ֆ{�(�i`:��-���R��F�J�D+[��y�Tj_D*-?P�b�;��_D+{K�K�f�\n�[!	���>T[�\n\0&��^Y���,QF��up[�@�Ѫ�h���V��\\��J�Ծ�TZ\"~���2w:$��V�����/�&�B!G�|��z\0L	\'���Z�tX�����6�ށK�U\Z�+��oʸq�Q�}��D�@#]�d�>tH1}��/M.	�_l*Ml�$B�8�Qn�(\0�O�yf�3��EK�m�l?��F�5�W�!Zߕp.��*�R�!>F�i-6���W0@��t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH����5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH�������^����\r��m�;X�6�q3�8�hR� +�M��^�a��[�}?��]�i���D�?N��^<y2�b��H��ȽG�7T�w�J�ty�;~���`��\0�^�����a���!�K���݀ֿXt��~��}����x�z�.	�9X�q�4a�D;i�H��/i��a�ӧ�щ/������_��^�8�+����Tla��l���f�*��j5�^c�q����,�\\�P4����J� �[%u$k����k�ȾtL)d:E�j95\"���gXP�;�����#?\nL�B��0�-���\Z���J�N<��Cs�]\"�D@�\Z\Z����WZ�R�\0�������jg,�\ruJQB\0(���0���7H��#���\\|9\ZF/T;SD�0FK��Pp��r�PB5���	^\\/|i75��j�Q�\0����U�&��V�@��ә+d_:S���k��QȨ�3�V$r��+�1��K��E�&�#%ʃ�����8L�N7�{� 9�.����H$zlrʵ�$V�I�Dn�%=ElEL�@���Z�[���k��\r`A�\nn���r�#�\"���J�,2��j�]\"`�\nq#��h��K�j�8��Hh8����\"	�#�\\��\r-&ڊ؅�:S\nYޖ!j:�k��5��-\nn����d��¤��h��k����I�Qj��K�!+�����J�i�Y\0844�,�Z�$��%$դ������@����B�r��ޱ1�N��[���T&|֑��kC	v_���VH��Х����C\'Ĥ\04���藭�	nT�IT���\0��Ή�@Sʆ)�&��[\\��LLhSgT懸8��.>yPb�M�kC	r����G+U%Z��\Z���#�q�#�@�x�Ǩ��\Z\nX����E|�*�X���Q\\VƉāO*m_e�=EAϏY��ЧR��!���=�C=S\0�kDd�]\n|�Tw�.5r��ۇ\Z�jEɱ	\04ZR�p���\"�H�jC�:t�����E�i�)�@�u��B4�!EA��k61��� {��\n?�6z�`a.[p��P\0U?�D�Fp��\Zb<�%������G�����[��R\\��9\ni�m꽑pΪ@�K&�\\!n���lO`�Dr��RF$pq*>t����e�[d8S��\"v�j.<�\0�09�.��#@�\0Ͷ���G�d�{��Po�I��b(�H��*����p�Rܔ7E��89l@Q�5\\�U@ ��C�1�C�~�As�~�j��dY:0�\n����X9V��\"�C��)���l�N@�K&�՗P��\\��lO�\n�䡺b��{���a��C=SQ���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH����5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[��&z�F�K��a��ET��F�p�qN4VTE��k�*����IZ�+d���p�Zm{�Ή�,�H�-G&�[bW���\n�u{���a��I��Q���X{cC5QU-3Q�\\�S���d���\n���%,�V���+�#\\���^�E�`�K!�-Qɩؕ�+:��GF��q�Rg�la��l����TUKL�j\0���EeAtY>6��h?IK䕬A\"�J�H�m%�׽�|� R�t�B�rjE�%�ΰ��wQч�9lF~��a.[%��43UR�5\Z��/1�8�YP]O��@�\Z�R�y%kH���+ٮ(������\\\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!Kٮ(������p(!�\0���\0R�_25&\0�;���-�4_N`r�$Zɨ־P�-(t�G>@�>k!hlcP7h,�1���/�WE{���<�d��EW\0�/f��V�g�Q���.�JJ|p�Ԙ\0_D,�k����}9�ˊT�k&�Z�@.���ә�-$������@ݠ�0�����]�֒T�+\\���yZɞ	G��0	(H (E��#R`}�����SE��.)PbE���k�\0��҇Nds�����5v��0�ڬ@�%tW�ZIS��L�TUpR�k�!�k&x%\nB��$� ����I��B�� K}MӘ��A��j5���KJ9�ς�\"O��Z�\r�\0K �oj�\0K��^�i%O+�2�QU�!~~�����n����-���c�\0��\Z\'M��5�A�x	i��^�%��ס��oMt�Y�~<[����!�Α�yDl�m^�}\'��ݞ�e�FY/�j|��|���w=�Й���m�O��A���wr�Y��w4�ސ�B�Mw���o����K��ɟ-��c����9]�X;�r7��\r�C�&YH\0T���WP���=,����=��{��vASa$q\\��a������ K���E����\\���q�>�����@�/��]��{�o��6]pmГ������1�\r�\0-�1�;J\0�WO�OAuJ�����?U�\0�Ǟ3�p�a�<V���f4��v	}���1��\0�A����D/����kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�5 ��H\'��\0K���&�I@�nx%M]����I��S�/z�\0苎).k���t�I���H���tlH���bG5�\Z\\��\'b�21�9h	��� %�5M\\Z�J�)�-z+`�85��������Q�VX���H\"��Ơ�� ��	\"��4_O�.5���3\\�=-7\rK��\0�§���k-m�j(h�\0Q�1\0K�M�by^��A���T)��0��\'�A8�&�ѐ��.MM (E�8�0\0���~�@�M�q�DVR�E�L`�P��)���c&�C������ZYFpC%͔��nU��\'�Z\Z���Mج8�ZJ\0Tad	��Rm\r\n48��A\0)#>	{Ԝ`С!��Xu4_M�x%���!j�^�D�$��Xo����\0iSd�,���P(@J�F�*�0K�(~�zʖ����[~�E6�Y�XyP�C�-����1��ȭ $4�0�P��%�����>5��EEBl�u�y����9�d��\"�����\Z*����V1�_�ȕ�r���!��E66Cz�k��x[,�AChtC�1��� ��_8��`С�wk�é�$��^��j,�(�r�_�n!�����d��6Ok�9h	��c´�/�Mڬ�ݭ*	�_СQT�\"���5�!+%�����%��8�$8\"�\"��\Z>��C��D	g��龠9& TdZ�д>@Ζ�3�\0� M읬�5(�\rC����Z`�����\\n�T��L�V���l	D��\'�ScFC:Q��ĐK\\��(�Rp�A��O�ex� K=LO���S�ȵ�8�@>��-?H����8ɩ��.Bր� a��+A\0K�Ԕ.Š��^�x_�,��9Â\nu�:S�5\\�4�L��z�\0�*Y� K=mӘ�Lirk*�Ё$�SΖ�:~�9�Z�od0M�4�l9ڴ��e	ŭ*����_*��(=�\0����)�ء)�Eȭ!�x�Ɵ �\0�+����ЧI�\\@��\"�C���J�������)7C��DcP!C@BB\"�1��u���6F�U��A%N<~+WWa��$��@ܙ�U@hSj t`P�@\nP��F���Mgs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�qD<�d���A]�$�\"�ᑩ0\0��Y���	o���s��1\"�MF��]�iC�29�ZI�YCc\Z��@	da��V 	}�+ݭ$��{&V**�){5��<�!t`P�@\nP��F���!gs_%�����\\R�ċY5\Z��w������h\'�d-\r�j�\0%�a�7�X�%�J�v�����X������C��L�J8�рIBA\0)B/�\Z�\0腝�|@���/�09qJ�-d�k_(ޖ�:s#��D�5��61��\0�A���b\0��+����J�W�eb���B��\\Q+Y3�(�PBF%	\0��8djL\0/�w5�[�h�����*H��Q�|�zZP�̎|�|�B��Ơn�Yc{U�_D���kI*y^ɕ���\n^�p$���qZ8�:H5�45P��/j�0Kh���%�KNQ�Tsk&��u��5�\"�\0]O L�}8�O�u�ó�Ou�<�qĒx��qMd�P.Z���\'�kQ0��XN9!�����>.h!+Yp%>!R���	�V��Zv;]�T�;>���M��n��-��&9�O��Lͼ�mt��I�hk@$��I�%�N12��jI�俒�wg������=+�;G�M������a�D��!�h`��$R��%�V��	��[n6�v���,�;\\���4f>`=�s{,V��5iU��\0E�Ā-�H����<�e�`���)�K�!Ǖ���ġкA��ᡪ��{T��[D,��J=>����~D�ɨ�> �M��}�^�Z զ�j@�\0��\"����S����A<�n�ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Ms�\0;�ј�����E셡��ZUZB�\n�Չ\0[D�qsAyZˀ�)�R�s� �W����P�] �[p��B�p��L�-���#}-9�G�Q�M�����\0�h�|�{��\"�B��F�*�!l�\0��\"����S��/}������OkE�}D�\"�m��0�|�k\Zѹ�7Q��}E���Q\r����u=wm�=N};��Ӝ�~�@����\'�S���{��$w��qbz�i�v>+ν��p�V�u�n߶zc�\0�ͮ��]� f}��H�@�q�����.�����J��N���Ժ���i����Ә�2:�DF:P�6��vp�[W˕�ĸ~�u�{��\0�����$��x��Toz���܏�\0�%o؅8���z��S����ź��Џ���\0J\'���K�D/9�����˒dG�4�v5@ֱ�h\rn��\Z0\0|�䙗6G$�ܮ���Z[ զ�j@�\0��\"��\0<�S�IU�\"�^�p$���qZ8�:H5�45P��/j�0Kh���IA��i[�G#�PdM���s�\0;�ј�����E셡��ZUAn�\0z� h�..h!+Yp%>!\nA �\"����{JE�Q�5Kn\Z\Z�@b*���\n%I !���$r�Y�eL5�D\0r9����T�{)#]V��ָ6�;H\0!�pkG�S3��g\\]���m=�r�`��j�SA	�d�Y)ޢ˓��H.��8�� ��*3�D_H\n���*	��LR�#��CNRx�j��md�tM{�\0?�ј���W\ZO!qD7b���v�%�jD	|pZ��)!88SAD���V	K��!&E�ؐH�Sa��\rQ\"�U_}�B�!���zqU&nX�$�(��A\r\Z\Zm��>c\0j�E,���D�$��;��e#�+HH��#+c\'\n}%�B/��U�aP�Ŭ��h(+��.Z�\n2�tZ�%�Bȓ��֑�\0t&v�sT�kC��l��*R�\'��R]$��\Z44�_���k2dh(\"Ǌ�J���:�>��-�I�/P�z�3pJ��\0[���X �I��3U�ZC���$���!��pKI�(��&4&���;u�5�T��3�#\'-�@��Y�,���Ӟ.>c\n̙\Z\n�YF�$`j!�	�����@��\rBV��5ܴ��	\Z�@-p�un�5���ч�A(�N4�L/�?ǽqs�0��b���\0W4�b5,��OگQ��	�JI\0�lWʩ�	\\���\Z�}A�j�\0-�\nD�x1e��I !�Ɯ��yY��J�O�Sd�4��f>a��@������Xj�KuY�h$ŴS�Y՗����b��O:ljF��5K�$�\\���1�C%?p͸k[��O\n	��+3�|��zZs[�y�RL���*��� �m]�e�����W�Z�եIin�\"_�xV�,Z�*�\0������ع�tI�j��c�2�梘�	/�5Kn\0n� b���M��	�u��I(!���da�����������[P����*��<�L�N������D��/V&ŴRSV%��n��3���	�.�7��p�9U1pH�)�Kn\Z\Z��\"A�����D�Y^��o����X�yYP[#�\0?��e����t�B≐ɢa�M�HTE��kH�h���hD����%[�Dؠ[�믁���k�[�ŷ\r\rT��.4����Uf{���kH��>c\n�bmd� �0�LQ��\\i�{&���6f����(_�Z�\0[D�U����+\\2J�5	�\n�g8	�{p8�>%7B��ۆ��c��Rf	m��I(!����+Σ��Y>\n>!��4f>`=�	H^�Z զ�j@�\0��\"����S����(\'����ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Ms�\0;�ј�����E셡�\rZnZF�\0\Z� h�..h!+Yp%>!\nPH.[�/��rӨ���#!DK�;|[�n��w�0�1mr˛����r;ڭ�bH5�45P��/j�-��I(F�Zs��£��Y5Ms�\0;�ј�����E셡�\rZnZF�\0\Z� h�..h!+Yp%>!\nf���{p8�O�C�t�Qm�CU\n1���3��Yˤ�#}\r9������ɨ�> �M��}�^�Z զ�j@�\0��\"����S����A<�n�ġкA��ᡪ��{T��[D$I(F�Zs��£��Y5Aψ\0�SE�b�ψ����Cd\Z�ܴ�H\0\"�5b@�$\\\\ЈyX��������	�V�%��\rE�\r\rT(0�ڤ��! �IB7�ӟ�~��ɮU�}����n��-���7k������7Tt��.��v�9��C�\"���7r_�[uiMC\Z�k�s��,g8�����L��K	Hie�O��[����\0�gZ�K�;�u��v�^�ڝӵ�I���7nuN�}�o��0J����I\'ږ3� ��߯�l���R�g<�nh�\nJ&��{�gR��:n���V7�v���.h!+Yp%t�B�Խ��H\'������:�\n����Y��8)�0xVV2��v������y�.�&�|؄L�3��`��GjAt��o��?��)sk.Z���\0�h�|�{��\"�B���7-#R\0��X��I4�����E��\'��4�%�9%�fI�-3U�r\'1�*�TYGH�԰O�\n��݋P��\'�A���a~�LQ�>�UQf��T�j3L�k�8�\0��R����/��a���P�@����c���\\��C t~�\"P�5�U�!�V�jT�N	B�b�[v��y\"�����P���؏޷� U�k`�]�\0�����Kѿ)�-�\0`?	u��W�pI�^�sz^�\0m#㓣�m�=]�N� 2C.͎`{M�C��1�����Oq��\r��q�BZ|��KP�e�?\Z����~�\0j��\0*_�z��������q���v�����\\��˼�����To�{�z�;_CN&�\r\"^WQ���\0S��M��q��G���Z�,��\0�%�G�?�^������{W����R���������KсC�H�G���\0G��b�!}��*�&�Z�C{ߗ*�z/.�HZ�@�K�\'�S��]+��� T-94-���Hl�$qB�CA��dNID�\"�-3U�r\'1�*�TYGI���`.o�jn�O���Y-K!����D/N��\0M�\0?�=��ߐ?v�����y�7=JY�M��۪����=�ّ�o��ҧ�y��F�l{f�@��?Q�c�s��WI���u\"s#i�B\\���D�G����0�\'�>��[�M�����`F.gW  ���`c�~^s�L|��>Hg��I��<F��h^覂h�\r�)����c�s\\ E{�a�sc�g�q��D�� �ćA8 �^\'.,�2Kx�a\"% �A� ����6{�ߵ�nc�FDgF��3f�j��8oؑ����Η21�(Z@�eÞ�IG�,�=�b��W�k�˓��\\D	��yI�k�\Z�Y>�5\\����������GI����\no�S%��d�KR�P��?�\'z!KB��|O�\n~Z��t���\Z���\Z�~��I�E��9��-\r�	dNIz&I�-3U�r\'1�*�TYGI������yxS%��d�KR�o{�);�\nZ�j*\'|T��J��9�t-\'��x�-i@�2,��C��\0m�&Iʉ�E,��L�ẅ��5�eStYGHCR������j\'�Fɬ������Rw��!Z�ȗ��p�娺WO��@�Zrm�G�ZD�*̋$s��hh6P�D�D�\"�H	3Uɩ?O��U�I�,��pjX\0�ۅ�O���YsR�P���ވRЅj\"_����]>79�i84-�<�Z@�+dX)#��\Z�k\"rJ&I`��)#P	lGⵕgY]��CQ\0@O�*F��I�&ˬ��d���ʓ�_G�m���6J���ͱ��c����.�/���/�ºT7�^��[��|��,��$*����jz��ۉ�����Wc�?O)�?ӡ�\0�q���z�B�)�͉�H��P�\'����,���{^��$Q�z���\0?u���D�=�nj����@�\Z�	t䖤KIF�KSӑ��C�QS���`���\r/%E� -1��z����m�c�\\	�LȞ��:H\r@u�d3����0	Q���#R\'��McYT����0��dC�qƇj\0��&�ZD��mq�\'r�\"���-MH��^Q��*�E!@I\ZI+�JY1[�U�\n�*��W�I�憏��`Ɣ�;\"�\rRTL5<��KY8s5�yT�D��d5-� [��*U�Q#�t�QV��I=�sH���?(x�����)k�n�b����k�T�\n�{�š�6�B`�+jS���\rس�}֫��E�X(BI���R���[�pi���_�#D1�Vل�������>J�I��W�B��apO�kCr�\"��N��z�����}��\0 ��:���K�S �jy`�������\074�� �ǐ�/�o:����o��\0����߷<r�-�r��iZQ�4F�\n\0�4����肆�>�(W;ԉ�)��k2�N�GL�;Jzl�Y	����T&8�^�����M���\0%�(���Θ�jA��Dnxj�%���\'(kXP1�=�T�r.�����I#JX��(�E,�4:�۩�dp!-s��eYT���|�75��3~��Sf��s@F�Q�G���ꋄ!XB��q��\\�ơMӣ��5�q\'�5d��o[@+�I��f{��-\0��8S��O*`:����.�0G:����Ӡ@�\ZAӟ��`�HB�C�\0 �ʕQzn�(e	\rM�g�E�Qt�tl���q&�l�\n�Y�`���ik@*5(�%9�nTV�2�B�G/I�Pu7T��p	k]?�֛���[ y-K!BoMܲJ�DAZ��|O�\nc䨺`&1��-7��&7Z�l��JI4���((���9��f��u�u�%��QY��4.�C�S�e?�Sv�M��C˚�B��1Z$�	\" �MH���N����tnrBӓob?z�$�VdX)#��\Z�k\"rJ&I`�i����9��eYT���:@���\n}�P�D�(�5�Բ��\0\n�-V�r%�>)�j.���s�jBӈh[�x֑$\n�\nH�4���ZȜ���E$Z`�B��<V���n�(�4԰M���L��O���<���,o�\'z!KB�\n%�<P�O�Qt����P���؏޴� U�	�@�:OX�4��\0U�warþ���N�ɉ�\n���{�\0�\0�&x�0���_>���}<�7��O�SD@��$���\\��B�G�+@?Ps��زG.(��^���!��S�pjX\0�ۅ�ZpQ�k%�Y\n���B��+P9����J���NM����H�Y�`��r�\Z�l���E(�iZ�R%������:�TYGI���`.oC��d���������D)hB�5a|O��O�Qt���s��ZJ�B؄�\"H�,��\ni\r굑9%$�0H��W!r\'��\Zʲ�5E�t��\rK�Mډ�Q�k.jY\r��w��!Z��_�T��J���t-96� ���I�E��8�@�\Z���$�P!\"�rjD\\Ǐ\Zʲ�5E�|�8�\0X?ؿ˻v�~��ޝ4�[�:/jui�SϨS~�-����2!\r��t^����f����{�3�{���;@-���=_�/�\0q;�������d�n�{����6���:�{W��71�7I�o~ȆH�R\0�rrzw�;Vɓg��~Ij�k>�԰��Ð7��_���7����\0��\0���孏hu���\r�=�������]1�>��S�C�\0[�ݛ<���;i�������?|D�Y��g�K�~�ÿ�9��4C4��*�bqn��w�3ֺ>=�����j�(c�p��m�O�]��=cc��K�n���w�i����k#��m7�Y�������-{��B�¹rb�ǔ4�b�=�}��R��yd\"�a��4�kX۫���\n��E,�r���DOpLB�Һ��q�g�̮Mc�}��(ǥg�۵<�e�\0{�n|���(�y_>�.���Q�L��r�c�O8��\0,��1��`�n���8(�5�������ވRзSPK�x�ʟ���]>79.��&��V�$^ȰY�D�iZ�.��<ҢE��\'ܮG9�i3>�:F�BD��8xt�JV_w������FۻHnåwP/ �h�d͜o~\'��\nr^5��s8:�w��1c�\"�������>����ڿ�ɷ���/|�����y�x�?q��\0�S\r�kM���\Z�9EF�_b��Oc�B����%�F�$�]��9-mŴ\\���G����+�\'G�^��m��?W���������c�E�WW��5�C��zN����8HZ�FC��4̏3h�����t�ؘ�Y&�^�;F������\0�����\0��\0p�g����6Rt�v����S��r����F\"�t���u��:���}�ʁ�۲7@\0�� ��n��Mñ��X�7�\"jO`\Z�MW�����\0���\0ܯ����\r�[ޛ���{�u{�7!���nAҺ�ͳt���E$={6�x��O�\0m6��5�t��u�:�[��m��F����%�h�$��>!�y-K�*�U�Ϸ��[u����v�x>�c|�\0r��G�Y,r��C�4�5�%j�>�h�,Ґ�N��mB�o�\069�ߍ�S�ns�Gq��\\{�:��������n��c�d��2ϳ�L��;sŷ�w���wYZƴ};�-\0s7�a������p%vrKc!���y�\0Hu��Z鳏Q�X�f�\r�@a�!��sID���P.d�	d�\n��O7WU�h�Z���\0��.�\0\\�\0�?�=g�? m���gkw�Q�N��6��G�m���M�\\�{�zoM��ا��u���v�kJ��������I��/C��;n�v�s�pc�^Y�㘜��Le�b���� 3/�����_��>��v�2�D��Y&!�h `@0������\0��>�����~�2��=��s�=�ߣ�8��M����sdo�B����;?50f;�}{~3F��Diێ8F#�1�\Z/�a���\0�p����<	��x����\0�@�\0�����n��[�$�X~4��F����wu?Va�n��{����:��z��~НГq�ݶ�;�6/п�p�\0ԧT��\0Y�z�K\'�㷖}�|q�#�� �����7��bq��&/�~�?�L����Uӽ==k����s�e�&C4���˖�!\"H$jD��ݭ�?~4�?�ݧ�o����}��ӳ�bݷiӶ�q՜6�lrn���ɻ�[�Y�s�%ğͿ�\0���>N�����i��I/�2��@�_��8��#\0� /ѻ>��e�Ŵ�0c�!\0|��)@��&����\0�o�]�؟�;C�In��G�/M���ƻHٳ��zv�{]�y�i��2�z�e���v}������,��C7�/�*z�7��wU����K8r������32�D\Z8�%��1���(~4�\0��@�~��1zs$pn:��̢>lx��r�$3&1ѧ�� H|�_��x^e�}���o�i���af�9b\r��i����=/����l�D4\0K�9ߧ79�y�)�;vz�N�&�:���|�����F��a�\r�5$��#朎����\0\0\0�#�����P[ k�KP.ϔ���\'����ҹSez�%�\ZƇqt��օ�+tH\'\0HO�.Ss������8�cÒB9r�\"5$,8SohE��u\0�{f��n�=��Do�J5�\0*��y�D�m���M*�j���\0J$^M���0\r &g��H��BH� �\'ΕIJ�!�ăǅ�Z&�79��2���1[��*c��ˏ�3$eA<+o��A�67Z!!�b4$x����a����c9pHJF%�1,A�eD�iZ�\'����^M��\\�s\0�\0�w�#KYI�̓��L�T���\"A��ˀ��n�(�烨��4�V�=�4�ߤ�k�U�;�%��b�!S�%�H*֩<�~)D�&�\n�s��\0���-#K!	\"p�\"bN\\iT��Bw�<yr��D�F�<@&G��V�=���A(�\")�w�\Z��-�s��iZ�\'���(�d�!\\�s\0�\0�w%�id!$L[2}Ý*ȥވ<Bp���*^T��r�.��:0-Pj���ӱ��\0�N��W��_�?��󞯟\'���_����6����ݽ5ކm���h\'�s�z��uǺ\0� »!��mv��rma����\0���s,[͡>\\���X���G<I&�AkB��0+9VL��>G0\r &g�\n���ej\'\07�����ArY=QA�`o�/-dq��I2�<����Y�#c�C�5ȋd\'�Z\"9Kh�\'<H� �Z�Fg�\n���I�LUId{[fG���&t������4�\r)�@���\"@��\0I�	<�:�V��:|����R�i��OdA(��>7H�u��ai\00���o������0#$A� 6�cP�k�dt3��J��}#-���\"{g�3h\0,�Mx��;��5�O�Wlj�\':E%4�O���)+�͆G0��0F��xxӉ ��숼K h*��q�1�R�y1@p�+����L���d�LbR������rl��j�ܾ\'\0J�3���y�G�߬<�q�������>��2�P�Ÿ?�3u�D=��H��4D��8?�pAS�pK�∴0�����y��85|�I\"l��M�r\"����-�L{j��%�4X�%0.��P0�u-؊��R��\r \"�$�g�u�_ca۽��:_W�=\'���R轺ͼ���6+}��-�����\0o�^��ܭ,����#Tփ\\��HFGn@,;̓�V!31b.@���__�\Z\\��p\\8bQ�`8z\"��+�E���\n-��A��Y�\0��}7b����[�W2Y��h���d!����e?��R!��𞏻;�[\rď��̭��0=�\'�٤\rcE�9�U*��/��*�y�\r#ҷ�	�#ST�%��p�ؒE��F42,j�_�\Z\\9��[�<(���\\O/�zr8xqʝ�K�*l�4�p�j���T([D���N�K.�U��L�ᕩ�9m�[�R=�\0���nqNI���)����Ɛ�����M�(u�Z���8c����KA/�J`=�EM��I��c�ҿI���Ā���YE��^��0	NNK�a�T�s\0-�	�L-�b[�ـh�\'%\\8-dQeZ��KH�g��L|�N����u\0rӈQײl�B$lr���>���]#V�\\�#\\�CI��J*p,H��\0���0�`�i�� scn`/j���v�1�(���ҡ��\Z��!U �ce����9xr��ɔ�8N4��C��E�\0U�Bw2ϑ�L<S��烨2�?j��k�~�Lp�M$���*��\rTh[D��IX��Z^��[dpcZ�\0��\0\\��>Pز͛���a�y`;O��R��M!e0�\nf��� �)��-��֘�L\rJBC�0m~X�Jc墮�Q��P	���)LV�=��Dri%\Z�\'p�\r8�-�qɤkT�n��H��D+��`\Z@3�䴍,�$��3��RR��� �8�x�Sa@�SE��u\0�Y=��[��(�#~�Q��W\0���%�h�N\"Y4��j���҉�h�r9�M\"����H���\'0���iT���\"C�A�˕Z&�79��2��(�b����ri\\�rZ��-�;�,�[?�^�ߛ6�Z�G�h8�N�2F4%ˁb��\04�s��7T���;��Ā~-�[��!�vx�e�������{�ͱ��\Z\0l�\0�d��6\0\0hc�K�!1�g���,#�H���z�\0HnN��{<�/�a=��O��Z��n�˝er��B�!�|r?*h�.x:�L��(��n�أH��IF��\\�rZq,[D*qɤkT�n��H��D+��`\Z\03��Kw!	\"p�̜<:U%+#��Yb`C�]̓ӷ۴���8���H��i���&y dm���a�yDF�����:�L;��D�I�����\"����@�$n�E�j8(v%-s���u�b�����wʸp��X��T�%~�Z�����TH��\n�.`\Z\0\r�$L��BD��8xt�JVQDM-vP�����������G(M��x$P�<i��~�\03G<nl�\0��\0�b<�2��=��n�%�-R	^K����z��o��;Y�H��3����n\nSH��IF��\\�rZ�%�h�j�,�AV�V���D�ɴB���\03>�T�,������\0�o�C��{���.���\0�?l�����?n��B���1c�_��cmл�o�i\Z�1m�siK�~��?27�3\r�U�ʹ��Gph�p��_N�F�.-��(�a�/���\r�����%~ �����/P�t�%����Cg�v%��m7�3v��J�#Ku���j���:WV�����6���T1hA�^�g����}�|nݞ��O�Aۉ�n���[ie�nz�t���\0�~�h��G��[#��/q��fu��m�2l��Q�\"�Q��:9�7�������T�|��I�r�-Q ��C��D��P�*L��=����_��\0�\0\"���\0����g�_��#�v����/u�/����Η6׿v�~�r�[y��ug�G��BCg��Ϩ����:�K��Lu�C�c !�b�Ɨ\"�x����wCu�&Q������>7����r��m�ȹ��&D�Pb��V5��l��/)�Ho�x�T�e����4O�H�|��W0��):gh�<��+�\0�a�W%��������L�|k�������Qc��p2�7匾m�>���5ŉ�d��9�:����@D �x�Ǘ*<�Mns��e�P+t�Mp��IF�4��q�rZ�ж��P��\0�v)�w��A��oi�4�&a}��kd! Bx�ʕ�йg�i��\0�>�S���������Ǚ�\'�\"c��s�}�| ����frz�t4�<c���+�u?��]B\"@k7����\0cD�@ri�26�I[鏀��OG���-��o�6�\'[@?ڰ���cSA���p-B��xȟ�<��ǒ�����p{A����\0�v)���ӕ�[�dM$&cd�l����{�m�v>�t-gG�����J�I��G�v�p6�8�&�k�#�X�X�sKR�8�]��}�d3c9�����	 ?y����	�$���kC=D�h ��B�nt��R�WTl�gI�vƚ!�����iV��w�\"�}5᪁�~�{������)��_�;Z�R�&?{�^�D���M�sп5w=>_.Ϫ���#�,�`\'��~�.�-?P�_��\r����B�/����\0�\'�ڿ�_��߀!ozoi�{ۺ6��؝پ1��OW뻍�ۣ��C��������Hd���wt�b�M�;\'���\0��C�������H���0y�j1Js��8��[r2J;�@e���18�Y���1����Lo�0���}^~W���#��>X������7�@���ʿ�����LdK���\r�\"�пH��WO�g�������?�V��~t�\0k�a�1ۖ�Ԣ,�ov%�cc�]/��-���>��5�k�}�z��z���J9�&��.�XJP���\0����9H\Z��J��z>���.\\R�p�៼i����������;7���G�_�=�z?fG���\0��M���gE�����|ؒi�^�m.�7��ܾS����}��\04o�B7s�Ӻ��\06��\0%�9�se��^��NP�!||���k莓�y�ŷ�$\r��c�o�dj\0�	LiM���Y�RE�Qw?|�*�C�������:Ǩw_n�כ�;y���Q��x��;C��L�LȆ�S�/�H<����n����\r��&a�6�q��!s���<���P+�Oս/�u��Q����P�/��/8�\\��&��@���^���	�\0Y�#lzwp�_�����\0y�n�����[�����$�M�����:7��D�О����nv��w{�;i��c�.1?77$�(��/���\0Ct��Qɶ����X���8��@�������\0����}�?�7?�?v�㮍���wX���]��]�G���\0��z�K�s�g�?m�\0�l��.�	��w;���f��Ԏ���W���qYu<����m��,2-��3ǚBE��1�bC�R�$H�#�����n�_�k�b�.�q�,��nYD���\\s5�h��)>�iR�\r!Iw�J�!�j�㤈�)\"Iӿ����t�:��0�-�\0P��A�g���m�E=gs��H�rdv]E#%7Cni��9v����?����_(_:���^��N~��M�.LC��G1���a��L`�6��ƴ��>�5�W�!Zߕp.��)ƥ�B���\0�v)���� ��B���4�&a}��5��!\n<��E�Р`\\|�2�ɠ5�,QF��up[�@�ѪѸ�1�n������w�0@���?��\Z-��ۧ�� %֌�X}�\\�=�<��ܐoݐzE|�Q=�y�vR�?{(οw,�\0�11?�tY�I�c�L���ֲ_E����F����R5��!G�|�[�\n\0&\nO�FC�:�Q��F����)tj��?Q\n����?U\Z�m�h���F���|�b�![�^�\\0��T��H�A�FG��4�Рa����k�΋Q��N����R��F�J�D+[��y�Tj_D/��{w����Ѻ���w7ga��VM�e0�w���O��é�tn�l�9�	0����aYG69���A�kP��\Z�\n��4�4�م��ke� �d��\"⺡@0��5��kU\0.\'�53�b���n1mq�\\�Fy%��������\'��֋�&�Ca�\0��N8W]�Ɇ�o�޼����?M����f����/��B��L�I_�!\Z޿�h:SEr��c����(�l�����?-�r���/��D�%���O�1�2dN|�� ���}��>��	e���P�T�#Sp��ly�	H��H�Kg������\'�G��0�z#�V�2ے�\\�+31	�4�ݩ�.,��c�����	J�Dj{�m{9�}���7�;�j�kԷ�G�u�-ӷ�{\'�]��e1�6�{���h�1,��Ո�c�أ�y�hCKc!�I�.@�ڀ!���\'YW �}2�}^ہ�����Qv�����q�d�gy��mС*\02@�.���Z�1���\07w�a�b@�=Ĵ{hW�=e�eպ�.������I��\0K>��|��m����ە�}��\"!(�O��\'��pM����3b�\'���&n6�h��s��	Z�8Y�p!A�$	q.U@�\n��8\'\Z�̑����$��+G� �ap)�s�n\n�F�`�|�Y��RiH1}޴�6�����:)c�n�����=�n>Ú��9�����5�IG4�K	7�l������ާۡ�3��N�\0o�:\r��n���&k�Sw�Hű$W.q�σq�(q�|�1%|��l2t�[��c�#�r�x���3t����s�a�p6�s\n���Y�7�5��lђ�\0Ev���n���xE�Ol$9�_Z~�Wu��z�F�<��X�L��?����P2E�^�5�hR�8�ZրIq9\n���ӓ�\\˽�Tv�q�� �]�K�n���=CyӠ�n���]��Y�[��}X���2�s\0Xsx����]n�2짽& ̀.D	�@\\%�F��)����A	d6�d<�����1n�Gq��c�A��A�r(��6�C�迦�\0�\"?�=���\'D��u���|�A�����\0����?m����pC�t����j:���Emv�z&\\y\"%�2HLC�E�z,9:|� 4���~b�\0��q�E�\0^{��{���C�������a�F3o����G6~��;}���K��r�u��_�d����]�ۮ��Y���N�+�s�Zӵ�IԺ>m��L12���8�����ak��A$YZ���גbˠ�y1J}�\'�!�vF��p�����7Yܽ�B9��mf*��P�����(�����a��<��_Of8���)�\0�?�_�q��&�k[!�r���Z,��Jr�r��A�W�|��8R������]R��M�[�&�:�\n�@� �<\Z�ǎ\n�SfM�P�0W�A��p_u�f��}_�u>ڛk���o��tݗU�o����P���۹�{m���7\0��4�E1�Tb��A�GxYb͏<L�b$b�<Kaw����d�A-j\"��j���r��Gn�/Hd��u���9� qd>\n�/�N�zV�\0W</�H�l�i�/+�qN��ȩTv�p���������ktYaу��\n��s��T�B��&�|��F:������_EUS�954#\\����6^�E��*�Ex���ǀ��@@Kb\n�3�6��=��U��;���`s?jh�>���u7�8#/���(��@d�G4f�\n��r�<�,>�x\0��u}k�c��7.�\0%e��3H��߰t[��>]���=һs��k�S����hw;��-�i�`�hu� c�&<�l_�HG�$������Z�t�ǒ}.}K9��n��r=ǐ�i����؟�k�L�5���E샩 2&��{p�H�������y�JlBN�]iߝSu�����@�\0��_��Ci��HnlT!�ҟ�~��={gտ�m�n0��	�$��/J�.(h�W�6�7���F���ع7l��un��D�ds�ɏv�\rk����pd��\"�*���?��z/ԧ����t��Ϸ52 �0-yB_/i\'U�uN�-���A�)V?��[���^���O��v��ͼ�\0����D�@a-&g�\0����w��������<6�����j�ٲ�p1�%��	F^�=����d������86\'��k�H.k�,.P���_8�]�Ƌ��m��e�O˓��������Gu�/��\0i�]�rL�d�e��v�\0c)�[�NE���X�3`Ǹ�0�e���~a�2�����s��F���{ZG�8��ǒ@��1YH�`Zp#®�����	�.�\02(�hg�E�(�X�na���5T�%���kSJ���U�D(Z#~���2wKD�_D+{K�K�f�\n�[!	���>T[�\n\0&����d��{��m,Q�����R��SZ%�Y\n������Tj_D(Z\"~���2w:$��N�n���}�O���h�k�����J����ic�6�+��E�&2 \rRv_C�t>���Sw���o��=��\"u1�&O�=pn6�H��1�ԂJ%�g�6=�8��y��P��\0�+�4�ቧS޵�GK�m�l?��F��l��P���&�#mn~\"�g�#���,e����H�\0Z`�g>���\0�6��\0��K?�K���m���\0��ڼ�\0]��\0~�?���YO�vx����#�]ۏv���qH�0�(2��4�A�k+��F\0W���:�a�7��~��z?ˬ�~��7�l�����!\n<��\\w�t�`I>\0e���{��m,Q�(�P)tj���Y\n������F��B8~�e�g�v�̕�P�_�2(hi.c��\\�?�%�@� ��!p���[��\n�3�\'C&���x��s�=�/hw.磶GK�t;]�\0N�D���d�9�\02@��a댥�qe񌑣�;$xF�v7�h�f�pGa� �h\\47햆b���T��5r<��6o�6=���[\"dO`��/l��������G\\�e����}9а�����U�P��h:�zG�<];]�)d��\0#_� D{ǽ-��]����k�G`�<c�24���n�i����mۭ������首B�c�(��$���I8W\"1�,.�ͪCZ%�Q\n�٫�w*\"�-?P�b�;��_D+{K�K�f�\n�[!	�`[�����N�k<R��v���l�y�tR�\\Ƹ6X�h{\\Z�P�j�dMđb���k)��ַ[�O��\0��_D�2\r�qhq-�oa�bH:x\Z�l���>�hw8���.2y{���.�9���辮��p��9� �q�޾Y�T�B#(Ӌ\\V�i��\"����������W�6ی[��7XK��!�C���{�_�=��:^�6�Ɍ�Gr�um�q�wr��$tm��2��:��O��v~QnӠ�+-��lv�ܐ�\"����x��v�ds\nF�Z�7$5��v��=��K�����#�Ȱ�BC��;�[C���9f \rH�C�,�ږ@�jq��Un��]��o�����y�:���=���n���������G��_��{��:n�X�!��\"��@ \Z�wW�}.r�Oϓ	��Mx��.N�{��ȝ�IA��>Z2�\0�_��\0�]�K��l���ߐd�QKF������;�l�v�\r���5�#��\0�\0��X�VQ�R�<���4�0Ou���d�$��{{F��W�!Zߕp\'�4��5/�⯉ܯ�\0�u7� �i,$a��;��ι�;?S�4�W�^/�O���x����w�AۯB���#�h�Qc�v���\0�}�?����t��7\"��^����\0�<��N^�����`�M�\0�\0��-�N�[�%�<\rzq��������Q�b���A��b$G��\0&��^Y�[=EK�Bb�azb�F���N��;���OJ�?y��L �@���\rs���8bc��Z�r����e�J�6l{|R͘��rO`X�k���i?Q[�u���V�A!a/UhTh���E�R�kV�V��\"|��W�\\�wԶ�]�\r���w�E�R=���>\0N�=��b0��g��)�8\Z�ȝ�0#��s�\0���W��9��\0���W�X��\0���߱����0}���p����S��yN�7:%\rҰ����q�9O���6__�H�}/��F#ǔ���	��w{9O�e0\r?.���2�O�\Z\r��\\���=�Ai{���?�w�7H�^{y˕���C	��[�k����k�Ⱦu̘ R�׺\\Q�Tp1��J�60jt����h���Vu�\r��U�_�}�o~%�����������kZ%�tΉӠ�H�5�n�n�R�7���mw[��\0����=��ڼwI�8���\rĄpF1��<��v�]p^��^�޿���lv-�\0����ۮ���I��Gi�黹��m����;���p��0��{���\"ÚYA��^#ǖC��½�{�\\�#6��`����,A�G�$�@�(=ű�	s�\Z^�\0.����`�x�sr��&d�x�\0����[e,x�3�嘌\".N��%u~�揩�І��o�g�0��W���:�LvN~��GʽO�˂2��_lf+�ľK���ҷ}#�x�v��5ȦP��H�\0ڽ?xީ��J\0�P�m���6=�ݓ�T���+���n���Yb�Rf5�o~��_������#NQHiy@:��n����^�v�\0J���R��kyI�6\r�����{�ql]?l�{+ac�@�]4�����1�2nw��=�s�R��@�朚1��R%�)h�Su���Oy��-�U��m�/͗q�B�\Z��y��������\0E��\0���g�-�W�n�ڿ����k�ﷶ�޹Һl���ˣ��6͂`v�nv�m�1�6:��Տ�\0L�:��lv�KqײI������|�e#��iR>y���I���R��;�?ҿ���@���mg	\0~�|l6��e����d�T@W��ov��M�k��w�u��ww��r7���l����з\Z����m��crϵ�\r�G#�V�����z��uޙ��a��)!�,w��,x�FE�c�BW�>�=��GW8����X�cቔ�8���W޳��n����O��N��Gv�����%���6W���k�R9��Q�Z�=s���m��f�lP�p儈\"R� h\\�{M��~���t��圴��r�� \ZQ�����]��]�0�bv�(��LZ1c@�^�K�~��}�b��YN,x�I�\nY���S@*�]бu#��\09e3f��n�_����\0�������ƽ��S�;W��C���O�:n�շ}@O�\0a�㢳k���է��ϼ�F�7[%;6�`�K^��\0L����?U���G���t���>��$Bx9�&�,�7c2!-����1��XB_$�\0��S�~�1��e=�HC�cX���%�&I��7�A���_�����W��#xڵ�h�Z]�=��$|Q`s�m\n\0+�� �>�D�gQ�s��5,,�U����o6���I�[���j#tF6Y\\�\0�/��L�\r]O��]ǧF�%����m`v��F����/o�s��o�E���\"dG�������wC8p�Ϲ���A2o\0��s�����w]\'�6� 펃Ӻ~���73E�f�V�#��F\'����f��Y��V��f���w\rY�m��}3>�L��G���d�T����\\�f�(lny,cTy�sZ˘�n\\����R����p\0��]G���o,�~&O�#�2w8c��.]�;c}պ_�W��m�9����k�_��n \rR��߷&K\0��ĄC���a6ā�sr�a�.<3�R@���;.9#\\���^�E� R�wH�-G&�[bW���\n�u{���a��I��\\���[wڻ���$gy��;.�,\ra�\r�|��g2i?}����\0\Z��b3�����H?\r>+��y�&	������{�|\Zcۺ��cP���+�k�toh 9\r�b��M���n%�ˍҷ��A����.Q�(,�g=����7���{G��N٤u.�ú�#ۉ��y��\Z\0cy�H?��Y4��K4v]_o��߄�%�\'�N����c����7�m�)�1J�((�D���W�p���� }��QK��]ޅ�}�������.,�e,3c(���X�����zw��\0w�7ď�(4�z$�^��+^�e��j��ͼdO�\r��Zw�&=����\"ǽs��yn�\rp�<{l��w�9�2��>S!��*\Z���>��\\���ș�\\C62~R�C�M��8+��,���&��#K��=��He��>)�{K^�W\'&,��yG.A���\"�����ϭl�ٟ�����!x��EB{c%�d��ơ��������.y�)Ɗʂ�|Mr@�H����+X�El��J����pΉ�,�IQQ�\n/��\nΰ����+��ŤTeʤ4��KĨŗlc.	�pAp{����G l?Sʂ�B��Jq�)@sL����m��?s׷�.���v��w��6[v5$�y>�m��&�>��A��k��3�鏜�;�\0Ǳq6=C�\0l7XKF�@�$y�.�?�e��{[�vl}��zn�#�Y۲�>�գ�b�����\r�0�a|�G݌�9�`�v�Vji~�;���m��-�ɕF�H��t`@Е�שcͲ�P�D6�R �B%��y��!��:���ѷ�%�m������Eꛎ�3���.�-Ɛ��iA�c�\'���o��?4��@�\0j�e�����,\\S���}�hV6�+�WeXP�z�����#?\nL�B�]�\0�Qm�Q�x$�n�CK���8����G8�ӕp�,���<>i{\0��껿����I�|x�\'1�@�\0�\0�+�?F\'�H&\08�6��J�߻��lO�����r��k)�u~��]�VnN�.�&�><�Rohqn��\0��y��:��Kaq8]P*�M���zPLl��s{9ד����r��	���\0�iK&�@S�����8�>Z����8�K4( �jB�����tr76������pzwR�uL_li��Q,bG�Vcs\\M�\nl�\\�m�0�n\nM���\09�Xvr�/P��c��l�!ٵ�w��IA���@x��,�y�����a��W���yu.����HG�\\��\0���eHgQ�\0[�;�F��:�콭r��:�Ŧ\"�CZ�m��ц������+��m��\0��i�̹�p��rg����@�XD|X��+̳rH�Lc�{ϫLLa{ܖ]-��q�4�Xq&�ڻ����c�{?&,r��8&�r�وt��޷(M�y�q�.hG������!����R���B�u�`�OPb���g�C��L�{���V����Ǔ�z�o�5drO<��	H��|>��:�F�\r�V�M�ܝ��t!�\0]��A�m+��>9��8OA�1s�4��	�a�\\G�,}�����Cw~~���ڈ�띅��������7I�m��l!�9���w�����C���,�y��s��\'������>���m���e?��h~��7{�W������=�0D��n�O�,BS,,�����g�2@\"�#d@�5��k�re��w#JP���%���v�n?#���P���I�*��k���_���y�\0�?��;�7fǴC���t��|{�;k�v�L2������A���۱m���Nܶ\r��hڳY�)_�z��Bz/_�\'�ex�F3˚m��Ƥ4��Y#�#�K))���^��=g���uL5�c�yb����Ih� JR���/ן���\0��\0�?��.��+�:��{�[�ӿ+3�f�|{�a��ci��\0&��a{:G^���X��N�N��>&�r��n~�o�m�P�F>��sc˲�Lb@o�e!����䈛�R$e!����0,v]/�\'���(���̦.2c�isk�\0�8a �D�n����ߝ;�m۟���>�ڿ�zn߲�]h���u�:^�նO�>���l7�V\'uh�\0Ȋ�)y��6�/��Z~qzГ���F�z�\\�\r�8�.���IK1#\0@�����$��5�Bz��;��nlY$dg9@=DA�e�PyA��S����\0�}���W���Si����{[�t���[��]W}����wۉڂ�.�5����Ӯ���m�ɏ$�o��<��q�[�A�s}k�#����nv�6p͜�J\"q��\"L�\Z���x��:4ݣ�;��oy���O.�qԤ�ۘd��v=R	������ ���m���cc#e��9�W�:^�Z��˭m��y>��.%>���(J�Pݫ�!��勺>����y(��ɞq�%�bN�\'����z�N�]g�3�t���oV��	��o��8�(��e�W@�1�{��ւH|xg����)�h��	gӾ��_K껈m:n}�B#b�$��];�]���w��=���\0M��������T��M����F�m*n�O�z9�{C��j�M���\0��ě�N@ۈ��.��y1n:&,�Ȟ)�1�25��;�tn�ܑ�׻{m�]��y�����\0��.���=&`�ۿ�t�v�Gb\Z��� �,A ��	f��6 ) �i]�n���������\0H�� ?�$�a �\0�ؿQ��7�\0_��\0�蟐�\0�W�\0^:���z�Eﾷ޽��Tc�.�wU�[X�!Pd�cY�>�װ�e��{�9���fQ��#�W�pϡ�>\\�Ɇ]�D��������\'�_�wi~H��\0��m�\0�^�Ӻ��.׫��R=������P�zw�\r���\r��k���\08D�5	�w����a�,�fs��2<K85H�e��^�m��3��r�vqB>������\0)�Cݟ�w=��������l�����o��7g���_���7����D�I��/l�#{^x�S��;h2mN<����#�WI9~����qꮛ���/g=�(D�3��FD�v�\Zj������~����m�L��������F�;\\&��w]B.��~��ò�p\"a��kpW�3d�Fy���-���w/�$e�6@�3�௧��!?�>�*�:�t0��#�U�X����_O�љ�0��c�m�[\\�ܛ�/8���L�M��}����G$����}$F�\nV��ˏ�_�e�����x��H�8�\'��.H.<e�oc��v���D��-C��k������ir�K�b�d���gH��\0s�c��f�쐡ڎ-N`y&ɇ��U��.ʹ\\���C��wJ�x���i7�����I��$�\0���zKw��8=JK��I�G1�\\���&�&q�a�h=�s_�o�7�\'t���s����>N���O#Ȼ�m��iL\0�N�s�L�R�/�>����+��9�b��1e�r�\'(�M\"d|5=ݩ���[�}��=���g���>�qm6��Hbޓ�������N�[��7q�ilp��X:p���g2\"\0�$@�g�`_�j�û�e�O�H�<a ��\'��$xs䅎k�ct�Q%��m�#�$������Ф\0[��rW��8�}���¤!�1d�a�sN��/�I��Kl#K�9҅x.`�1��[!{#���a�N6��,��\\_W�sG�r�r�Y�۱���CC�\n�3�j��d��k���^T�@*�q��t�%�bkhFD|�	�T��SIi(�����8�)d쐿h#�^8�a�CrP���qI��u��\r����M���Ku\"�mҶe����M���L0�K��H`��G�f�)r�6I��^�}��[���Փ�nGF��d꒐�72�C75�\"�h��1�v�8ӫN� #uhkZKZ�\0��@���ޫ�l6���1��9d��ӑ$�F�5�.��P-ݷӣ�~��Όo���/_�Np�:_ؓi�B>��F�Q�\'\Z����:V��1���d~r;���/�~cuIK{��D�\0G?�!�3�\"p������M��<\r��}�k�H�J�=�x �4�F!*v;s�k%�1\0�ۯ�U�΁��E��e�������K�y�p�?���F���iK0hϏfSN2�P��}	�\0�]@�����na��%��!���=[����v�\0]�̛���s.�X���}��m��k>-l��۫�%\0@�c3����͆�L�0�1��H8?�ӣpq6L8֌�\\����]_��ٰ�v�DƵ�F1�W0#�pF���*�ʿQ�O�cz;�>��M�^��4�O$�s	�x�򏕋\0\0k�]����k�8��L�D؞g��,�WA����=��;/����s�]�ܽ���p�\\�����0\Z��o[z?�t\\���b�.����\r�($��(㉨��,9pN���un�\r���p?���\0v��q]�F���w+h��Q���m�o���;�d���\0$�@���_�=c�ΧꞫ���I�E����-�^QrMI�Y|��]w$0K�e�i�GG�\0�\0u��(7�v�Y�t��@<�\"B:ɇ0�c6�v��sm����]����}�֚�S�����&y�s���\0�dш+���ɓyҤ��?���Ԉ�#�����w���n#L0�9��eig1�+��l�d�hpL A�EsL\\���(�ɴٞ��	ztSG���\Z����\\6���X�Oܸ���/�k��Y��\0�!����uz���?xyX���u׷^��\'e�L��lǟ�e��yF2�.DH 訤�\Z�ȿ���X���_@Ǘlq͈�b�PA���\\�P4����J� �[+��5�[Ii��d_:&�\"е��m�_ⳬ(n��ta�[-�Å�B�E��pR\0%�q�T��dC,��ł<٥��r@rK]I��L�j\0���N����ɍ\"6%sY�K���.������.Q��O$��H��0���{*ˁ��G����\'n$�����m@,���v���w�s�zi�C��ϋs�$`!�ٝ�h���������=�eU��R�U�c	n(p�\r��P�Ig쮈�o���R��Xr֒2�F�����w�:Nӽ{������^�m:v�o$���i�~�#��<�)>Ơ^�V&�9�<�v��C��-�ǌ�ÞQ����r���]���v���.�!ϋ�u�B_�6�u~��9�J�w�M�����k:n���a�e�\\���C{o�ڼߥ�D��_̀��@� }��͌1��d���{�h�U�*��\r-B�y�4�\"DG4��Ӥ;���6�۴�\0jó����ss;�Z֏����\0Spft����{��^;��T�������\"��`|x���k�t��9�\0�ܷp��WӴ�۷���n���7����@}��)��^�8��<Xo��D1�����{[�������J�X \rN7[�>�־^������W���s��?�\0���+���8�J}-.]�v0]�É#��6��ݽ�:U{>����v��g�A����M���V#��l�~�V�{EʆH�Ɍ�c�b\rA�3Q�\\�S����IfM�ۙ\0,����i-29�:#�d�����31��	,<u����\0�wM˺��zT����\r�R3i���>O����>i��)=K\"��\Z�\0#<G�);��ˇ�\'E�)y�L�\0&���I�g�;o��4\r�J�g��Jh�k��m���\\�{0g��\0ȸ����v��>A�|Ňǽq�1����1��%��y?�:Vm4�����K�4��Qw�і�V�6��,�A�����������1��#�>��\'e�N�lۙ�c�o?u<WxwOon������ݜ���O�.��v;`߹��N�hi#�L�l�r�2Ey���{���f?>I�tw��n_g�?-�C���q�\'@9�/+�[t~����_�u}�1o�?P�u�!���p��\\/�\"�\Z���1(��_Y�p��.�����n��#�>�l���;~�p��6{Σ�v�T:W��f1��ܺv��:&f�$e*pd��b_�b�a>�X˺qiw����[�g�����L�\\Gݗ�x+�dk����k�Ⱦu���]��Z��R-�+�Vu�\rӺ�?��������!dݵ��\0s���S;���g��b#!��C���ݸ����sb��Y�����2d�!�� ���p�u]Wy=�����B��� �{.��>���.���ż��n��V�=VwH�˿�˹v��b�* 2��L�fu��<,�8��(;��.�蛘7���Ǳ�e���o:v���m۹�2�,j\\�΍�N\rr�@\"��Yɓm�o��L���4�����W�N(�ǳ��c��p$j$��t�F3�&�r�w=#u?G݅!훦����J���\"�\0��z��\"7&0�2��=�>jwIǇ�~_u�蟂���\\��I�}�G�^��\0Wz?�=�����g�lş}��ݼ��9�\0!R�/��Q�a�lrDm_���W���1c�l��o�B����\0�2=���o��ﹷv�qg��j��s�#�!i{���u��&�t\\�>h1�$�vA��������9�94���N1H�$ܑW��Q���\'���|W\'�o�Q�x�2/����\Zm�S�a.[d/�[5WmU-0�Юǘ��E�r��8�g2\0rM�t���\0��)�\r-p���ꌭ�`r�x��y�h��ogu�z������͸?��<���	�Ċ=[ظ�yރ�#�.�Ԫ�X\'���n��,]��+�~b�=5.ϭ��W��\"F�ڽ��m�= ����\Z�(,�\Z4櫀5󾏓������<D����U�?/�}?SO��	���k��}����ۧ�۷����R9,��x��C�^��9���1��\0+<A�q쾃�-̺_R��8�/�	�	�9��-��0�-��?U+\\�>���		DJ$������j5�^c�q����v^��\0X�]�K�e������o��zlA�C�H�t��Z5&���:����HZR >�H{ǽy?Un�6����\0�I���Oi��5Dv�1%\0I6\0\n�Io5����cÊY�����\0r|�������N�����������#��tΒ&�yh��#�\nj1�2��!\r��`�͐�2L?�\0��GU��Nu��M���Il8H����a�LD�O��G,�Gz���{J9��-\"�\Zߔ�-���u��\0Nb��<�\0kڽF�@d�nSG���AI�g͋y{�O�~z��oS�#��>X��;�m����kg�g8r�Nմ����ѐ\0U�t/�b��������_�y�_N���Lw9��:�ޣ,}?�m7-qn�wv[���X��\0���Ec�\0��\n���bO����7�\0)���ܞ���f�lr���܀�\\�\0�v�T�=+��n��m������1�A�K��	 ���a!a�y&H\\J�\Z�!=�H���<�#ھ�ز�x�^X��Hv�3�:�]������mC<?��U�nw18kl�]����FZ%��n�L��Τ2���l���\\r>��o�jٻG�Oxi�\0��	5k2\r�Ric�CHw���_����J��~��[\'���/��m���m [��?v3��%��\0X̯��B�J�9ݱ��.��7J�[O���*4�7-p��4@�۪�Q�������b�;	��M}O�9�>-��B^\rOh])��]�;Ӫ�6�!��l�}��h�젔��ݜ\r$��u��\0�CЀ\0;����S���/�2���߼W_��nz�S�շ���!�	�;@�i�_�7b��n�����Hݖרt����:s��s��v~�E,�[�������/�$$H��:v�2��6\'��ć\Z��wx���*G鞣Ӳ����x�BQ���� ����GS�[�3�7i�7�	�a���x�\0�fk�l�z~�\'�W�O\\�p@�[fƼ�,$��7�v�u�ʼ�_.-�A�y���\'������\0�o�ͱ��_��خ���	�\0��s�m���l;���&�z��o,n�ozg@�l����LM�R�`����}�-����A���烏�ļvp�\\�2��2BA��b��Y�\0S��c��:��x�-��0���%���\r�(d����x�W�.���\\]������%ĵG�~X�~��H�^�/�X:�܀ӃiQ�W^u���y��\'s��g�������m�����m�댆G��C,$HϾ�v_�}c�v���G.�,O �b��$�>^X	�������78%͒r�!Ƥ�� \\�*�\0��E����\\}>fǹg�p�	#c��I)s�s�st9�{���ƾ]����(�\"y��\r){�p��G?�.NgP��b*�uWn�������ǎ��Q~C�We�gh���0�F�w�v_���;>����\'v��yu6-�n��=�ִ�����\0F��=o���y>��4�\r�LyNb�!���9�37\0���\n�u?\\Cs�=2{�g6H�OL�\"�\\�H��4�﫞{����k~o�m�ߌ{�k(��ϰ�-�R�&��۽n�N��=iX����P�<.�$\rtRE#��zwe�����W���[i�LS�	!��f\'�Þ�4A�$�\"q���KѺO��.�uXG6�q��qp�j��(�%��-F_�/�_�=��7�7s~2�S�rv�Q��΢��;I��u��1�\r�Z��C�۪���Ǩ���鎹��7B�uݜ%��\'�2Œ$�.)5�d���)#h�H\'�g\\��==ճ�|��	��@0�H\r��.\rA\\�vg��I�[$2�z�}�;�s4;wA�˅�-�s����u26~��n�g�pǵ��w�=������r;Q�����S��[��p����nW8�gP�isw�FĐ��i;{\n���&?؎o�<��W�=��?�vݳ����2���$��Z��æ\0?����@L�h�V�@d� ��K����Y��t\\�^K�S�%w���a��w��pd~�{��<7��lOa��9�l��g,�R����=O9Ƿ�0~h�\"����.���n��~��3E�\0z\"B^��}O��:WR�t�ۚ73{���cv����g��tnpn��FKJ\\^��mZ/o	G&8䏖@�j�:0	(H (E��#R`}�Mؽ�c�:.�i|��\0��d���;~���,�wޏlX�s�8��)L\0�}Kpv���i�������\0a]<����I&��кKU�{���t�J�ZWL,!��@�\0�]n� =/YyL����o�x���?Ib��3�|9����]qX���\r1}��ip-�\0�zl�� �`�a�\"N�5����������0kQ~�s����~�dW�{���ZSK����\\�	0�\\�Fu�����N\'�1�=�{���������n��GŗX���������Xޑ�7�l#6�N�f.�4�giE��ziLn��n�\r3��7��r�Ɓuߖ��n�\\�#!�#��//�s^�۽_s���t��G��t����<�X�䛃�&1�:��?p�-�]~�,�8ryrD�w�>�}S�w��Lݖ���:;?�\\q�w�K���\0���4��!�=ϵۀ�t��8ll�1G\Z��$��p��`��n���z.r?�m��2?� �D�l	�s��>��w^��͌���3D�q�a��%ݡ+�5��\\߶�-,!���9������+�fӆ����}���m\r��\\�2DJ\'��B4)�$uÚ\Z�Y4����1��_е��sc\"P��(mƋ<����۹����(d�\r�\Z�����2		?0#1X�$��1\'�f#�A�ubx:�]R{��k�?�[�c��f$G�O{ժ�\ZJ!�ks�rx��G���ֺWH���2�����/���~�nZ��\0�DL�؇��Xnd6�l��ǊZ��Zm\\���$j�{�޹=��t���s��2\"����;��Yu��=����[�F	>�4X5��,p�1�;�|.���v�;x�8�F>Ȁ�C{��?��/\\�a����t��D�_:N�g\'U�3�q��m>�F�{���kr�_����� 	�&��$}���~wN{<?���]�&��~4�_O��nH��dblc��2\0�Z�����e&�_}�צ����1�Z\ra��Śv��L{�70�&���xέ\r�I�yံ�w#�\'�����&���~h��5���6���t\0�}�J�`�ţ�\0���q�{n����߇����v{�6�����Kk/�\0�\0�]��Ko��?��l��1�6ǯ�N���1#��<���A�p{�Ȑn�Z\n;J!�odpz����4�>+�tޣ=�0n&^xF8��D�^�m���X��\\�k��8��SI(�Xר0�_m����!��݌��Y�_�\'���M��7k��BǷ��̰��V3?O_�Kp�=�q��0m̆R҆3����׽p���=K��N���i��۴���a��@֋��y�	KyFЁ2���=���|�ҙ\'���w�+#	��\0��O��w���U����fܦۍ�:��.�-�]g��#�x��\r����G0�>�o����?�{�Wu��wߓ?!�Z���ݔg\'G���i@(��s�S����ޛ�S�R?�A��ˡ��\r��;v�\04\0�W��;}���˥t�$�ﷻ���]�A_$�֋٭h�q�@$�-g)��h���>I�3�!C������d};xZ÷��o�o�M����m�w�?tdo��w�s������r�.��ϟj���#��Lܟ��eھW�}=�<ز:~�p%���c��due�N��,:�/��Í�������f�k���-� m�z�ۨu.��Y��o����t��tnct�F\n�d�������3�i+�N.��q~���-�w[b[�\0�gQ)<H�\0�qv.��;s�lˆ67p&]n~��0���(p ����)�:��\0o��,}�C��ˬ�7�c�u���7��	��u��v��7�:�@��I��ǵ�A�͌�֑u��f_`��N\r\n��\\����(�B��JR�<Ar�GW�������1�9��,�\n�C�@}A�K�SKIv���g�eG�d��8�\r2�������b{؜���g�!�/�zv���Z{���|o/h�.�｜]��S��kD{(���V����;��\Zd��H�py�W��Y��:�}��>i��q^7��\0��2�p��~2�b4��˹�����\0��V�\\��O�}��%�����Ѩ������PL�e��g��\rc����2���;��u)m�K���_��9��H#��>���\0Խ�\0i���}��3�M�@����������R�\0����}u���9�QB^��	a��Y&qD+���q��&=K��~��0��)r�C\'�\'$�,u���Ca�w�k`:��[^�3�d��8�(����\"h|���\0���]յ�=����s�]���_qtR�7{��E�8�����(;�-��v����8n |_�~yn���\0�D��rd�$�Le	C����������v��W���Cw��e;I�G�	86\"T�b>[u��\0�\0�ݿ��~q�=����_W��ڝ�ڻ��������{ú��i���z�Ӭ�v\'u�ߴ0���\0?� :\\�F/���Y?2:M\r�(�^����7��\0�X�a�9�J|�@�q�Fq�S��G������_RT�{�o=���ɏ4,�%��0�i��d]�(���ݻ����vߏ�t���������:v�7k������c�wjxcܳ�m�wB�M4� yi�+���k�l�_��^�ś��t�os��q9a��ɚ8�^@�)U��d�����n�7���ﻇ��o��9Aj�1������Y��\Zv\'n�?o�1ӻg#�2:�X��&�]��[��1�;��n��Ɣh�r�\0Ƶ��ٽm�}{���\0���~���R� �q,1a���o�C1���y��`��G��=�9v�1FK�&��$��R���WU�^���=���K��ι����N���WL�˻�u=��R���m����N5��\0O�4��!9g�>�8�Ny2|��㈬�NdF� ��u[Y��!l\\�\0���$�\0I�_�G��៫v�{mw����v�������Co��kg��0����{�%2����#�	%k���w��Yz�ş��8�h�x�!8@�x�9Aj�_���0�כ����,�sճLd!�<y2���Q&��t�rna��-�Av��}��h��M� ;�oa��$5���L��>�t�\0�~ɠ\\׳�LA�\0�\'�S\'�{&{����Pǵ��Nf�v���?����q+���n�w/N����⃳�6���������o��N����{[��i�o�cJD��ןٴ�s�bbs�h�\'�\'��^��<��ѕ#��\\��\"��r{�t��i6�z?N۽���gI|�5��&�I�zW�\0�D�\n�@�%(J��2�?�����I�nL�a����8��2���]���wn:M���Ӻ_E�P�����mw�K�\"�s ݍd\09\n������\'�9osx���+q�u���7�fG�Ň����\0�6~H��~��i��_�u���f�k�:�Q�m���(fۤum�O�m���\r|o(����g�ro6��Kg�X��K�Edd8\0�\Z���2zo�Ϩa-�q-)�I�wO�/����Cܰw��}�i��v7n�������3������\r�S�wԺ���Q�?n�L��7�a��Y�C�o��2�9C���R��Nq�_�u��:�U���e�G����I/�Em`�������B\0��\\q�+�4�܃-�H���+�~���wqt�u�\0�}׹d��?��;�(B�k���0g��e��\0j��I^-��vY���Ś\0���Z���DD�a	`D�FGɵ<����h�L�7����z)�\\;���O{����qMӠcuI;�nn�Xc��r�#S�y�K���a�{�G�^x�Fo���.�e��<ㄣI{E|:��}�=Wѷ���l��v����0���6�\Z�����,�E�kA�Q/\0Gq=��sCq�9�\\rh6]���l��u\r��5�z?M۝.���Qn�g�����K�21\"J�oIǳ�=D���y�T���C��G��d���1��n�]��Nb��WPdQ9�j:uG���θ=#��)΃&l����K�2�}�J~��md��d�r�r\'���K����~��N#s��~ߓ�c�������\Z=M��K�R�т�s�#����?�ͷ��D����z���.êCw����e	�EA�^D�=.>���>�ܰM�n�z�N��}������	��k�z62�Ʒ\'?��@�H��O������wc�oҎl��393$��\"�����\"v<ݓץ٫�3t��Nݸ(sa��>�W�\Zw;R��|RE.��Z*v�#���xq��v�+����(<��d��\r��R�f+�u\r�]$�jެX��l���R��F�WL��\n�5�Ŷ�a��	��g����������7J��z���hJq#IE��O��\"wd�x0H���ˉ�x�\0�sn9UrJӤ���q�W��n�o����r�r@Hx�w�.�w<[=�۹Gx7�KYM��4�k3Tb�v���\0$���0�͜�yj��F��X9L��:0d��:Fz@�AX����*M˔ѷ2� Irj���A����w9�n,����G��\0$�\0��{j�EKl��A�l��I��FH�`�0!��n,X�,�GU�˶�\0g��;��珧t}��}������l���o�5���\\�ɚF,P��?Ո�~Ԭ<Oc��Y��]j6{3�\0������~��.t�gt����[п�E�����q��ݹ�w[�]�g����l�����G\Z�V�/ƞ���P�~��qC�`���u$��=��[��[u0a��5���ɍK��W�m��s�|��ݾ�h~�Z�s}��f���ңP\r������Z/��0�����\\��1�� w�\0t��&/nפlߺ��<*��� Z�\\TÖ[�(L~��\0{,�C�Dڿ5�sK�u��7�n�G�G�ߡq���Y3�&9��͛�\Z�Ҁr�`���\r�����)Z��&tM{��(�n>��<닐��H�L}�z�2^#�٥���ϩ�����YIzgѝ��\0���d���7^�7���68�n�g��(]ace��I\0++�R��Jq�Y�ZKm����~�ɸ�M\0C.�Ƴ1�/5�I%����$@Y+��\"�^�ƨ@|��-7\rq�-1n�r�?���엯u���b/�Α����4n���n�����\0j�]�\0��ѾV�!Eq���p6Xv3�3��D`I1Y\"	vs�6^wԛ�;}�18�$�HiĐ��<�N�z�������@����i��%�F%t�8�5,H5{���!W��.�@\0���u�ߎ�&ϥ��,R���rŏ	/�{5��<��\n�D.�����\0�]���~�e�bQ�n�([��:\Z_�]��ƺ	�;��m��\0є���\'��_����z�̏�6�><��.��{��:v�x���&�/h�)j\'��4��0�C��Kk��h��.=̾�������|�/��r�+�����w�6��պ�{M�jw��u��R]�v��;q����<;�.@J���t�K��e˺��N$\\��hGj��s��o�N\\�����N�x�|�~an1]Ժ������K��L�w�}NG(�l\Z}}.w�H�t�\0ķ���l;�]_j:�#�$Gq�fm�~���5�W��7���q�������r?rg�a4kA)�$���Q�$�,V���_h��y�ɠ���F�@��16A�=X�\"�$Ok��@U��}�jr,�H�#�!�Y��@��5�8����20�Y��ƣ��PF���E��ns����\0���LZ�=��7tE��é��q r�[��k/H��ݻ��ۮ��\0�����aT5�W������\'Oa)��3]�Ea��!�����\"8c�.xsN��>�_1�uSֽi�阤��Riid�%\"O�.է�t��V�;>���|����m6а��I�xcs�ll���\Z�	$\0k����ྗ�p��e���U�?#v�J��C�����C�:��Y$,�n����\"ڐ�A���67��b�mq�d��o)��)�����\'�;�S��:��)�m��1\r^QG<Is��@���Lv�W������s����8o�E��N�y4�Z�\0��,�Ƕ�\ZO.�C����Em�؅�Kx\'��nK��5{C9�����K��]VVŵ��n�ԭal��ӄ�\"Bv�=@�\n����Xq}�\'�@��e���}-��n [&=����\"D/w�\0�;&M�[��x:Wo��e��=�˩E��\'P$�߲�	�%�a_J/霒������D���J���ߪD��\"_�ڿ>� �KJzp\'ǂת&�_I_C��/R�ݴ_�&��:N�{�\'�L����z�]�X$\0j0�׵�,�+P��##�-�ǸT���//�>��G�,���qqv����=*��M�n~�s�%�pkAw�\Z	�\0�\'�c����?Zl<\0�_���VN�<�K)�D�u�]�#�_㾹�}�I�M��[`v�p<uƞU����O^ǃS�=ௗz�0�������\0.1���^n�(;����9L��q�P5!1���z�Ꙉ���>��?�g�\0ˎu�O���3������[��&M�D�3}ԧy\r�o����1�r5��f�1���]]>X<N0k @���=G��{,�>xJ\0v���=Gl6]cu�@1md��z�Ho�\'G�	��F�q�����n��Km3��bݛ˚3�`Z_�\ZC����Y��>��?��	��`Zq�\Zv\Z\"��l�yh,an�����.B����@�%�_K5��?�;Gm�]��zwLkY�{�uX�����~̒��KǒB�1J5�i\'ҧ��_�ۜ���@��b=���W�}G�%������\0^9dg�A�Kqw X��v�K���6��d�x!��4�{���l��7F ��Gv�ݏ(�5og�}g�XzF,�.A�\0nǖ����#�C���7a���^�=W�����I)���v�j�C�+�G>ĈQ�=��OEڜP˖36��)FB��.�C��=���wC6�\0s�D}h��������e���飭~J�N���6�9�w���t���5����\'�w{̿����t?��#�=�5o�1w�[�a��=�#3���\0`�v˺����)��;Gd�X��~�x�K�X���ڃ�\Z�}+�Gɒ4q���>_s껿D`��1�,��c��X���uOx�{��{	�w7[�5������Nm!����\0�\np�N����t�\'�-�D�.�\0�}N[ݾ]�Ye� 7����w\0����N��/���x�g������������w]c�o�mxkc܎�ݑ�ŧF�g! ����?�N���D�\0����Y�s��_�Ka��w��\0�B\'������(to��c���{=.k������k��-*2�$%��V��4f��Kާ�	=�B��G���zmgۉ7rt�{{v[���u����.n�)���r�ӆ��~��v�x�\'O�\'����c?&��~C��^g�.�v<���&%��o��I�>ȯ�˄����#�w/E�㤲7�bt�:��\0���B�<���,&r�x�-�[��#�}N[�6���͟Q�>.�]��;?��air��:�Ln�@��d��+N���\r	�Ӡ1V����,�y��c\'ţ���t^o��>���e�\0�qK��G����t?x�GE����ۣo֙���n���a܆��;3TӖ~��f��ӛ\\�L&Xe�$���ڼ�\0����ưR����ߵ\n�q��O���c�G��A�v��u^�:OC��x������=�ziv�/�2?s1��J�=O\0��{lr�!<���bS&��&�S\'`5b�_��C}�0_$�ycǚ/#� T����v���\r�R45��0H#k�1͚F=���R��@�Mv����q?4�HzT����s�^�<eϖX&�G���ro���v����F���!w[��ˋN��{�s�����r��Ar���~���k.X��\'�x�\Z�|�ӝb[-�}��ħӛ�nW�g�G�#��=̍�F֎\r\0ڻ.RMh�E�6;V����!�1I��T}����;������N*�E�F� ��roO���e�h,^G�hJ����ܰa�E�����4���я�ʜ@mW��}+��cԦ�3a�[��t��C���n_��A���0��������aw�@���r{W��Xqm68�~29�c�$8����\\�X�:���汥�*֟a)��mҧ�԰��\0a^c�/錇A�ҽ՞:��΅�hׯ��kxۣ��l�s���\0�@ξ}�?��&\\R������g�a�����6�����.��f�����!�\Z(�L��E�~�w�W��	��y\"h2�����g������X��Ah_[�:/U�8]���#/I���V�W��v�>��.�n�2\0�\Z�1�@:��m��!?)��29}�2�L�He���\0/���1q$�������\r�h�b1c{W$@�/Uu���a߷��6\"ɷ^��$��w;�t͹q��P��BZC^S�rl�,g\Z��νU�K�r��b��D�p��C�ލ�Hٔ��P�t]�.��\0��\'ݫH-n��� \n�8�s;����9e�F��H��Z�a�9mzLzv�wRc��c/ms���{��kwwiC�|�l�Ki���yc��v����G�%۸]���ɼŹ���ϒD���\0�w����9�V�4��͗���c���������\0��ާӢ�.�ܐ�\0�Bv����4����0�v2C�!T:g\0�W;�ىKό�K�4s�ǽ������>p�ɧ�xȟՈ��� ��+��3w.���b�+�o��M�y,;���\0��k~��l��op�?�z�@��$${�bXw1�u𾷺��:亖P�܃��\0�\0�/���_�T�k���Γ}����&��\06��!�����#���\Z\\���{1��$r���r�Ҭ\\�u�=�1�n��3�4qN�u���L�+���ٻ��v�C۸�/W�l�/\n��\r���$Th��7\0��DCz�g��80\\�Q�.M�,��9�`�95���^ܠ]z����m&����e!�]�����Dǵ�}�w�ۿt�\"�b�6)\0��/�t��_l���&���oq^���i3���y��KF/޺��D��\0Т{Ls���y`8�7}��ysJ4:4s�\\����K\'>9Hy3\"H�\0�v�����n�� ���ɊMo�M�Qc��zG���6��۰ris���4]$=8!o��^S�c���J�9*�C�\Z��\r>���e��\0�w����{�ٌ�Ǹ�}����n�o��nv[pUL�n!c��-e�Bs�YN~�2O���;�%Opg�<��u��tm���\r�%����h���E���JM�h�~�I4+:gut�u��[Ӷ�ts%�0H�����?L2=�bO(��?������I�Be����ȑv\'�W����k����)����T��]h�϶����3k��������:g�����n��;�,��T�~�9�\\Y��c<�i��!��h�fGr�w�=�GV��1�\rwP�]�\0u��j�e	ҕ35��hs��d�d��	|dW����~3��ӧ���\r�\'�H��rM�}wOH�\0b��c�}��}�˷��O�zGru~�ҷ=N��]��Y�v�{�Y��u;�����L=����s�6[M�|X�<�q�q���ZR��\Z `�~Zz����Z����n��?p͒�\\�ɓ��2�1����]��?\'�F��;l���A��i���뮏^��Äg�hca�S�Pu�e�ߦ�^sӶ<�̥�1;\n���a��/����^�������o�\\��\r�(ay�vS�����\0\r�\0����\0�~��o����;w�H�ݯڳ������۩z�.�n�&�܏����iq����\0��\0��z���O��c��s��\0�6���0�����x#,�H��<�rđ��\0����v���讣9H�v�q	�D��#�D��ېb���\0�~����_m�����}.]�U���{W��{rv��۷:l��Ӧ���phtc�t��ݖ��u}�N��;������)sz��K�qt��Ks�3�y�U�\0_,l@#՛��Ǘ���g�$=�39z�љō�H��kB?xП,K�a���&�?ȟ�7�w�Q�;��{��w�]����^��m�S�n�-d[H���N��{�>8b��A+�X�߿��>���Nc�t0;x`�b��\0&V�\ZR��k\"I_��Rz˫����{���|@�$���jf��D8^��?���\0�]���#�~���]���Do�oz������������.��Υ�t[h�[�`�P����׉��i���˽�[lr�����D�I�\0Ȓ~c���$�q�?E�`�c�.��}��g��!��K4E�aǒ�����\0)	պO�����_�?5�_��Q��f�t�ܻ�/F~ߩwF�^�Է]8t^��6�>��vٻ��.�����D�&|znO��x�;&��\'�˖�&91�@ØNS/�ȑ�3.Xz^�����T�~2Y�o�cǓ&Q�����Q�>�����\Z�\'�+lf��;�F�$�����.�1���&b�]�0Ew~��q��t�9f��\"��_�����z��zo�p@���\0��{#gٿ���o�ŵ��w{c�x/�d�3����R+[c�\Z�\\�t��gi�1��kXb�L�G�XqԲ��N�����sj�m��Dv�X}I򃠰$֋�K�I��![�&��.3�n$�\'P`W�갎��2%	��T���Ww�\0�Lw�v��{c|[��t}Gs�R�1����@�]Y��\0H���\0W����_0�ۑ.��i#X�1�?�-���)�Kd��}���!�v������N���è\rRF�އ���\\��	����}7�e��\'����A�.�2���kba\n�Ä�-Un�i-r��(�\'1r~�Ҍ����yΟ����6Iҷ9��	b�ِ�5��˼�\0�ޛ\'Q�7��C��m�J��\0���m@dl�ڎ@θ�W/\'O�;4\n�}Q����\re�#�_�p_Ϗ3~t������X��kC�\0�[6�?�������\\9A���8��x�qc�Ҭ��>���S7�e��@�8b�d�W��\\��6�$����N$�^�LD���;��ߧ�e���Cm�.O`�&����N��n�{��������l���m��\0�-�Cu������1�,耸��T����Cq���v����([ă��e�/Su9o�.��J8�1����c1	7�o�%�B~W�G�?$�ޢ\0l]��;��iv�N�����F(�W%�Mv�����M��/�\0I�?ː?į!����z�k�d9a,rr�ƥ�����c�=�׷������Ƿ����w~�lK�􉛻�FǶ�[L{Ht�yh:	���oa�1��a���ĂXh��z޿�eַi���pu���F�5w=��:?I�l7����}��l�ݞ�)�.�t\rˌ0����X���y�[c�8WI�a=��P�<r|��z��r5\"�+�zǦ��Y6�Og]��A����ĂOh+Ͻ�u���{���\"g3��&�3�1�\0ӻv�����%ٖ�3���d��7��릎���rC憿[�#K<�-yC��\\.��^�Ӻnn��s�H䞰��Dx��vM���lOU��\0�������ͼotM~�ۖ�l�?u��$(:��5���F8�&����(���Gc�Ų�A�����&���?����/td�6S��ܸ��t�?}��m ~��\'���#S��E��꡺��8�\Z�(O���N��n+�ޢ��\0r���&���x�u�|��6{����]�T�qr�����:���Ĵ�\0�,Ev��#���Ũ�7��p���7�\0�z^Կ�1i~�hO�⹇㍻7����Y.Γ���4��I$Ro:�� K��B��Q�8��M���3�]�!���7��z�&h��-�1��c!{?����7����l�Q��w;�uH��$�l6E�˲��\'�2�ه�Qq\\��y1�\n\0)ߧ�߂��U�~a�<���Ƒ���]����b��/�^�K�;λ�7!�mߺ�;�aa�����=J�I[��z.�dş?.L��X��|I4�u�};��a��;�61:���\'�ȚjWg~#�ȶ}�ڌs\0��\0����}-.;���OG�#I$����bR=*�b��G��eqv�c�Ȓ}�+��.�;��L\\`D��;��(<W�7�:��N�q�ێ��{�_��Iv[>�6�6h��F�bXN$\n]S\'���\0I�K080���rӁ���l��y�fB>�rb�xØK�\"�!z�{�6O���N�:_�~�n��9�����/���N	Yux��i�B��㔿����2���d?W�����\0r�<Q������!f�G���ia.-kKDm\0���K^�s1�D�Z��%�\Z?��ɟ�Gm�v]&#�>�Hȟ���l�h�Z��/�^П��C�����e��;���ɹ����:�K�&oX����sܵ�)e^�w�c�[a/���<H�#����_#)c�2bq� �1>څ侍��m�i��Ż�\0��n-\'�4��.A.�G4*A��V��&I0\0\n�i�{���;��+��z�(	�ؙp;$�k���\0��H7;���q�ٷQ�\'n���Ӹ�u������q�v�pQ���.��v�o!-���Q�\0�$I~-���殅��}�{�������\r��ؽ�O����qd�@�˴����(mql��d�� �r����s.��;��z��da��?�2t3$���c^�X~��\0����ߑ��kc�}��\0պF�H��[V���d�����z��ڲF����9=6�G10lǟ6@�\0��|)Y�_^�[�����͜e?����I��mWX�^�;���öĎn�x��Sa#�����e;3v�6��Íq�����km�#�-�!�Бi�Ö_��̭��R��`!���$����u��x�����CD/�%�C�m�,{�����S�惉��ا��=��a&�h�1��H~.��\0�:���AÛ)}�ӟB�x������]׳꿇����7��ޒ����$b���t���i;ޭ��9ݼl.��@=^x~u�B�xL!��s���1a/�i���Zu�Τ6�2Q�X�J����R(�b#�\r\ZZ�H߾�l���knvشp��JG��k@\0^�\0�8>�A�\\�L�D��\">\0/|m�J�?�wm�~�^���:}�{���n�[���\\�#y���F�~����\\.c����˘��q<T�qE���P�Ī�@Z�x�R���nDi�9!�uF-^-������ܿ��#���l��\0Q���ܱ�m��Nd�����\0ztn!����<�+���c��uL���@�4�%�&��*��[��Cg��7;s.r~�4�i����\0�7���ؒ[$[�����̐�\ZW���HK\r<Px�N��o�c�����^���6]��ݡi���x���c���o�}:Uh�_�{Wj�]3�ߙ�(p\r�)\r&#Nȓ�w!��L��o|k�p��y������`{��W��Ԥ��P��\\}g�����Q/v�\'�-�L��$v����**�:�3��� +�#!�d�D����_�e�4���%���h�\0f{��_rt��Sv�r��fw�\0un�/fm;km�\0gܝ�׻�-�X;��f��o7}V=���fM�%�3��\0������}�����;>���F�C�\r�G��@-��Ō1�q�<�i���\0���7u��`��W�M�O��2��A\"@W�� �\'�\"��9Uz/���׻Ku��MǪE�|.ܽ�.�w	p�9���#�<)�!��^��H��o7Q�Lô� 4d���ޯ�=OR#o\"�H��j\"��]o�}F>��u�����U~�h6���c�����n@drF�$���Ih�\n�~��נa�eꙡ���G���/�0>Z\\�zn��so:>�/S�F�8�~b�bAw���n�~I���+�zM���N����7�����\0��b��#�����:F�o���:};��0u���Yt�Iu�����\0R��m��#�C��yBR$sGlr��rH7b���z��vh���N�P�Ռ��	\r�2��_�����C���\0p?�~����_��~?���i�\0��=�к�SwL�=Ge,#m/w�z�N�{�����ky��E+�k�|����F~V�Zt��}C鞡�װ��N0��G40��)�����,�#�	�Z�5�\02�ޣ���o���:F�m�3)c�89b�3�0��93�!��_>~M��O���e�v�Ya͒F�ܒҒ����9\r������q!��_�w��������2M�\0����Goo7�7u��u��q��~ܐ�^�o��)�F��,1�/W�t��C]^˫c�ǧf�Ĵ����nG��DD���\r��Q걹�?��;8����r�Gk�z�����������lt�j�h;]�S�4�Hp�^U}N9XxoLJr�a����}�7��_��OO�M��M�?W�\\?���{��f�y�7�7��?�sb�w��o�������&��C�R�i,���TL��T��3j��\n�����Ͷ�Gu��䄥fq�CU�c~F������z�\0N��vN�t���t��ål6{͞�&9c�mݤ�Y#�.k�:m�����m�c!QiF��o4N�����2����.�ұ�o sc�N:���B(t.��h�����}/j��흻{�|\n�~�I���W�ן�L�X\n7۟��lۛe�K�C��,��WͿ0:�⺰���\0��!V�Ԙ�\"�����K���w�qt}�f�i�=;�v�mf%�n��N���k�ZY�\'S����s96}3Fc�@��ia.��-�M���s�M����*����7mWW�gK����V�k�췒m�o|zF�)e���Mi��\0��E��\n��	s@�9��9>ǧme���=�A�㉎\\��;rN�	rt�_��R3}�#�n��_RA�ø�m$s�!�jr���~��qS�({Dd�]~x�R��y�����}�k׺��(��\0��Ϲx�dI��{x�=Ns��7Mdy�z�\0Eq�3����H��Oc7b�WG�ܽ3�t�m-��\"�`�H��\"\r�ˑ~���\0ʟ��z�}�&/V�}��\0r���(Q#t��\0�.M�����41�#�e�c�Xz�A���\Z]���+��T����w����N����3u�gYv���HX3�����.\0%k��\\�X�lb�~ZxN_O˿7��y�	��2��\"ǰ����\0Z%���˃Đ����l� ��E֘Z\\P�\\���Td;4d�K�?ں�Pn�ov{=��2�ø���W���#:����0\Z�vó��P\r���c�9�*�e��8�Z�Ĝ��4��Yw�X���V�r6ާǹ�h�w����+��{����}�҈c�~Ӹw{\r�ns��i7ۋ�`�}�C]�71O��82�s��)R��N�*}�/g����FY��&P���|n���d�����[�}�o�C�����=\'���v�s�$��ΧW)陻�-��^������GT�v�]�c�\\��bt��F~��ڲ����w����P�ỗ���Q��[�z�C�i�N���~�^�l%{@���j\0���l��.��ع�9��	[�fH�].�pzw�2��l2������$��y{�\\��[�\0s~�{��m���\0K�y#����y��2�pG>:N�q�/�l�qxn#�d[t���_�:�/��������m���2��^֎\Zk��2O��[�1�8JT��`O|�_�;�a��̼��?�7-�A?İ������ޗ~��[� �A�gN���l\r��&��\\zHn*S��9NQ��=�O\n���\\=i��m�>��ˈs�)P?p��A�����mz�W��wS�\r�%��\r��6��ۭ�-ۦ��&ɯ�M,)��Жy��yqB=�\03��D���]���q�;=��\0\'�C�dl����uO��Ͱ�[��&�m]��,M{������\r6t�ٹҰ�dS\\�h�u�9i��a\"�����pG���~������&Q\'H�8�D�4�N���?t�T�O�/V�2&:n���H\0��^�\0�FJ\0�D�^1s܆���f��m��m��[.r;~�s;h\0�_�]K?U��ꛇ���DG��h8\0��\\�u��W������ٝC{�;��������jǱ�Η������16P[����C���\"�i����~�s�) lI#�	`xu�7]+I�,P��R�G&B?h�ǴĖ������\0��)�{Ͷ�Ζ\']��\"9�s��؇��r��A�s�Ǆ���`���F�[���3���M�ԡ���3DJ=�X��oHvkn$�[�=��{6���ӟ���ɄM�[���G�\0��-js�As^�n?���O�x���A�į�t)c��6r����&[R`x��d��к_io�o�zn�$��3{��5�����ۘ��k�8k�n#�@e|�\0`\rge���+�<���x�_c��Op_m�}r9w#o�&9��������?h;��R4�:�}��pR���8ip��`����<gW�2�ǗA/��u���.m�,�G+4H�>ٟ������@%a�s�[����?�	w=3����f(D��y�K���T����}wmo�b[�I���=݋����~r�\0<p㌎�$�K�j�>Y%g�5��� z���k�C9��⾇�w��_NͿ�Q���+Dx��\"�cO�ƴ�Deŭ\r:Ai7�]I:������2mM�_��B�}7�wy��N�r�9$M>hd�4O�E�U�/�{	6��ܻ�$zw}�7�w�������rFв�3���j��@l䮟�J#s���� O������+��A.���c��3w�{��zQlۮ��i/c���o���\0$;Y�1��\0��{XSHssҧ}��%/m>{��zA��n]��%�C�L{���q۳m`��&�\0m�hz���v���ùڶF�wÁf���Ġ<܄��94��\0�q^��,;,p�I;�Ĺ1�%�dAyp26��z�^ŏ����7h�;��)v���qѶ|.���\0�s��nv��8���`�ճ����>~YG����~���X��\0v{����P�(Cĉǫ�\r���3���vt)������B������c\\�$ZCZ�m�����w;]�Q�s��@�2��S�ܻBu��K�o���c�g.y�0\Z����]��ݓݟ�{;�������{8uX�7�4�5��4꒴2��J[��q�0��իϝ����MrHmC���/�r���m�k�CuԠ�S�4� �������_C��7~I�u{G4�Ko��H�X�23�Fѯ$���hN.J�z^�z���>���4�s��>W~ׂ�=4�έ��b�9	��y��n��_����7�>l?��2@ַq�w+$��h���2^ҩ$�Qk�����w�i�BFr2�\Zc���E�:�#�=�C��S�3t�������	����D���Ɲ�ӻ����P�ie�t^�\'L|����mD;������E(��\0I\\�qw��\0�;�ybA=Ā}��2��V������Qpu�C�{���{ǣo�G����-@٣�7t��ȷ�3w1�l�̋�s#���!�D��7�,�?+s�$���S�h�o��0�z�=SlOБ��5�q=�7��}�����ܼ��m�yO��X�\n��nUψ�b1��L����n��#ӺN}��1;�#�!s�����}\nYA�\0;�z������q��IiB ���s��oS�?�}�?�\0�$��~_�Y=Gβ��?�#�����{��:��fb�e�\0��<���g������\0���ۗ5��:�����s����]�$�_I�V���������İ�u�?$n�W�޷�ضX��{�^��{y������l�L#����2�!���|\r��n����O��Wa����v�i��O��\"5%��ORJ��Y۳�v�|������t�����C����[��ӡv��m�h\r8�ƺm�����I\"�3��\0�|�}�����b?�9�0{|��������S��0ú�?�U�O��I���>9�kl�i�]����^����dϘ1#�}hB�=o��տ	(��R�9H?��!{����Ž/t�{��m3�ߗK�ѦR�Hk��:�\rt�Oy��l72����},_y�\"򄽜���e��������˾;��m��e�v�G�a��.��AW��Mz���F3�\0�^���8>�{��Zſ��6�a�i(D��\"$d^���ٗ��4vs��������{����&N����Iя�s2@d�D�K�Y�v%I��ns��|ќH�%��u��R��h�~�����+�U潳]�H&(ٵk�P�˼p���&�F�}d����@By�v��Ż+�}H꣤���l�\r��d�� ��I�Y����w\'tH:G�N�WK��ݶ݁�s_׺�S:7bD�������<e��~���\0s)�q,{�|��n��R.�2��<9@n��}�7�t��!FͲF[��..L��^\Zr�s5����n?��������]��_��Ӄm.����l\\bO,�x�ؽ9�\rݑ�_��eH:�z��7[�\Z��o��:~�}��n\\	M�Mޝ�DNT�{�V:8�;���|�||�~�������M����b�v�0�c�4�{ć�WSwn�Iٝ���o8t������	d\"�?yr����tl�Cw�ϛ19q�>�>`?���|k�\'B�^m�*Ko�3a�&y�|c&�p��ߍ��s����W���5��9�ZւNB�x�8�:w�x�v��O{�Ŵ�vI�;NA.bXr�����\n�u�c��=����ܛX7[-�Ӷ:/F��?u���-���u�A ׵��o��	\Z%�3Z��&HGg�7�,Ӝ�?.3+AǚQ����W�7[�պ��<�3��j�iPpw�o�:�u^�Ѷ[�]:�V��Y��k����QI;&�Ƽ��Ew��	�8��q��sE�ܧ�m%�<��W�R���?A���6=R6ǳ�m�1���u��{�Bݒ�V�V���ڔ�@J��Lnۧ��$�NV��Z���j5�#��!,����Y�����(;o٫�_E��\0�1��{w�U�\'���� �͎f�	��裞\'�葃l��^�|e������F%��T/9�z������11��\r��o]�ٟ��z��1O��ᵒ���J���^������V��t	��������:��z{����e��7������?s�7��2��u�4��Ac]�ꛨA�t��#�^OK?Oo�2�_lAow�u�z?q,]s��9q�\'�H|\n����(�݇��X��N����X�\\-�5�G��#kw�\'o��$�/�>�і�~GiD�\0��Iz�U�|�|�Ǟň����˽(��������?��6����A��bkv�Rw��%d\n��K<��fq��E}����+�����o7��ryyE�Q���F>�@�l��:cz�}�h�k���	ܛȜ����;�ܶ�9���f\"n�+�C*p�Y���	��8ć�\n��ݼF�o��l<�Q!�N=�&��1��?��O/K�a�}���q�;�>��{��4���\'~%t>�$c���)�ć�R�_���ͼ�ߚq�<��\0º�Jb\'>|�s�ü���e�n��K���͗��Ӻ�I���It�Om\r�A\ZQ�W�:��-�H�G/���;�=���c���7��]��*I6����~��{�\r��i�\Z��mw���$-�\09�F\r`�-?N�6��>1�~��������A�~��2��\0��Y~sa��Wb����v�o�T������M�;x��=opܵ��z8��\'�p��� z\0��(]|w�u/�=Gk�d	�)�.EA �X�\0�=��������i�$;���l�Qmd����6ť΅�?Iܸ\0d��4�O�;��)a?��#D��9CDi5%�(ͻꛜ�g��H�`|���7+���wt����\r�wZ���1�v��w,9��ֺ@�X^�_��2�\0�\r��]}�g/���)\\���/����v}��=[�70I{{����6q	7�}��)%��x��Wn��;t�ya�����\0Et���<[\0D2G69D����A���)7�O�\"���ˤu�w-��Ϩ�G\Z\Z��O:cs^ɢ�4�,ok��?�{$i,|n�.����gp�C\\j}��i��\r����Û�Y�s�ڃQ�\\ǲ6�olw�zL�z�s��I(X������O4z���\0��7��3º޵��/gуsBQ͐_���{y |�~��V<�+���H��p8�c�{�z ��}����ջS�IԺ~��.�7�>}��a�������Dc\0�4�q\Z�Lَ۪bǸ���D�|~b;���wۏ��gr[x}9v8��{�����=�	ÞW�bȣYm�H8��ja��/���x�xj|;W�����Ѷ�g(�\\�!O�Ê�>Ŕu_���}g�<��?�n���.kZ�з)�yP��}]�6><��B/���_K��~���\ne�� w�t̿sq���n�$n�6�n�e���F�\0���$��»���E(\"[��G�@�B�/Wꃪè�0D��]��߳\0=�פ�v��?���=��n����\0�#���3��cA(��HSծ}�f�`ie/�F2#�^gӢC{�$��,ѓh�\Z��y�u��w;m��m��m�\0��a��Y�,1��H��	���hA�\0�5݌��0�s-8jGuvЯ������x��o��a��Y�{���B�A�ӱ�{S�^��N\Z�D=G�ʖ%\ZC�<ּ���6]�\Z�^#��W��4��?���������N_���z�v���n�SI�:�����3m��F\n���S:�����oL�S#�X�	RQ�R��cG�_8�k{ֲG&�BS���yϙ��z�b�޲��s�p�\'o;6`�\0�C�,���\Z\0t�H}痴��������0�c���N~ٟ������r�!�I�r�uN�����!d���-�����]gGӧ6V=,�8�<����@�B9Ga��F>2/��x�T��t�ۭ��s#?`�s���B�_ߍ�p��_��dl��@H���f���ۊ%�H�zދ��z~�β�Ҽd��$�]O��_�g� �!ژ���dI�u�~�s:�~7ek�ݛ��7N�WP��goAۿ�\0!�@�Nh��zh�/C��n2n�c���A)+�#����0\'�Љ�S�~�$Y#�oK�\0?���׳����?P����\'4�psw�YB�*�wO�G�$�o���Y���a�����\'{�f��jo\"d�;��\0˰�GSa3��716V�<�.�$V�[�r��zFib�2���������y��l2K�6\\�Kg��c�p��C��y��t�{s��A�W��&��b���a\'o緎�6��o�c\Z̛�zM��~�<����{FO�y��x�\0Oud�;�3`7xsH�9�ʞ��v��\0����\0��q�����w���\0�򶭊&�/2J-������������8d�~�������ظ��>��?�ѵ�\0�+��C{.���;m�[yC�_�{s�κ�y���e�+����A��z儱\0L�I<0�\0g���������N���6ס�vȇ_��p����pf�b\\���m�p859ޚ�<�Y��11���#����.�u�=+r7%��s��,�����\Z���\0�[��7��3|�,st�Z�%Ľ:s6�8�N�IUxw�\0L�}~dlp���Ǟ2(\\0���?�q����7�{q�S�i�݋��&ۻ7;6�1��[1(y k�}E�x�n��o�\r{���lr�����//�I�����w�ɻ�h�ؐY.��}�=�ݧz�������7�kl#iE�t(�2BU��%ҥ�43��c�1�㐯��Ķ���uC�{���\0��D���Wmnc�{�zV�q!�a�����T�&>�����ۆ�N���<��\0���>��?�\Z��0%��7��G�7?_�b�sG.btNI�P<p~!�u-�K���{97+�=������S��t�����u�v�8w�\0��e��:��-!�j�G����m�#�e����9\0c,#����q�,�j\ryO�\r�q��Ƿ2���E~�L�{@�C�+��f����?����޽R^�������	�e���G���v0��\0��.�힑\n����N/�������z@�n��3;o�Fy&y�N�6L�\0s��nX<�E���̯Xn2mw=g{(�u��x�僂фI%��IyVF�����6^���{�\r����=�Ǫw.�����M�K��E�������#v��k�ro:�G�[�1m���\'�L��ޓ)~7bĂ����\0R$������~a��Г|���;�ftǠ�~_J�Q�����D��/X�>&D�ǵ�<u�����Пn/�Қ�4#Dp�r�����z!�\'��5�*�^o�_k�[S��.ǥ8R�0D�~i��u�1���\0���w�Za���9[�6[���������@�\Z���Gg��;�F%����\\��]7Z��zwX�>h�1����n�N�;��\0_v/�\0؝1͍Η��gQ�\0=r}�v{8�V�������1a����l e8�e9�yw��\Z��;K�v�(�n۹�+ĘO&ߧ��3eA��+�!�o]OH�w���ϐ@���/?/���}����m�61��a�f�\03{\n�WU�3�����$~�n����u�:Q.�l��t�0��l��UrSߊ��{���Ă4�X�&8I�!�(�/Xɼ�e�y��q��O���?�#O�=�]�����˽bq��#w\"��C��6��KHdg�΅W��^c�^�a��b>���m��g�)|��m�o�0L�����m�}_~.��:l%�KuF���`z}���b�KE��\r�}�u�S�N�l�-�Nx��ӕ����{��ý��.^�������\'D����un����}f�Xs}X��H�3en��G�I��y���}ӷ�>\\��?R\'�������/���Է;���E��]\'l���\"�u}�\Z�Qqa-��i8\nǯ���+�7��W�w��t����,~��䷃��c�H�p���{u���a\0hif���m#h:�N�n7 �\0��\r�3�m0�\0��Ţ|W��О���nsA�������d7�����{o�K�:�_D�׵��]��ԢM�39�\nD҆ƻm�O��q��y�(v�>��p<��e.���˩Ϫ��>�����d\0?�%����ě#�?\nt��C�w���˙�:��G����!�\n��G7��\'�9�#�����ެ�%��m�>_�D��,�o�����}��N���V��v�ٵ��+��uz?C�8�����C�<���Q�.y5�O�Ws��>8�ϸ�I����:�\rl�O�G�B\0Ȃ����s���Ǥ�̿Ԗh��S�-���}w�`��[���[�їt9O,��m����oo~S����\0{�x�\0ؿ�f���g.\ZA��^\\�>2pJ�w���\"q(�����L��[/��˴�)։y��eԽO��^����&@fR�m�;�\Z��L��͌���n��Zsv�8���ח�\'>c�ԜI��`��㸳��{�e�����˄��ɶ�w�p-�(�ِ��&h�W:q���H��(��~��GV�ط��� ��+Hx�W��\0�~���_km����m��L�d��;]�\0����c��Pn}\Z��	׏�Y���R�՜���_���� \',��9�;�1ob����~�[�ۦ�z/T�G;pq�@7��\00�@	f�z�BY\Z ���\\��x���]B[^���)7Є�?��?��Cm��]�M�7}��#�5�3i�b����y��Nv��<Ìp����gK�P�?�Y�Oy���\0����\0#p���Cw�K�0�{>�۪�C���l�c|\\�|����\0\rӥ-d�>\'ؾ�����������]O�����?.nzd��?D駨�V�\0��Y�d\0��u��X�������1rdp\0��G���gQ�x��3�d��_.Vך_,}�{��^��\0_v]Gy�S�]��\0k�\"�}:\r��G��O�:GN�2IX�����\\N\0��;��<pc ��d}�E�)ws8���yz���M�2f�#�cH����yå���O�]f]m~Ǭ��$���������l��A\\��Y0ڵ���\"��Xq���@���]���3�#w�\\Oq�V�.��o�rCTq���\\f05\Z�z��jǄ�O��\0�+��be��ϱ�\0B��\0����o��ެ���\0�t�Z���x����\r�4��ϻ6�\0#�8O�n���6B9�͔��$~Įf��䇬��؏҉5.#{����X~1��\0�w��k�:�ǦmUΕ�=6�����o���D��T��\Z�z�>�>S�\0V$	�D]�Ȼ���=jG�m\"~��L�^U/Đ_�����h:䞯$q������ZLF\r��ߝ-�ƝO�Hp*����p�!���0�\'�6�SӽO�dGk�N=�.Kۛ�v���}�\0��=o���ꓤu�����P��\'�\n��OS�ӷѯ�>�\'�\0�� \'��޾7�$�D��s�a��t㮟�mv��C:��ݤ�%dݶM��!B�mw/d��& x׵�Fyb��$\0#q��+(�d�H=�E{����ѝCp����\0K�^%{q�6�_�ohv�G�um�l�˘%��WW�o��O,Sd�y�t������\n�ٱN^�:�Ŷ�6#%���}t^��{��g�C{�<ٱ␗��{��]t��-�g]�5/O�C���g�@�.P��V����C$�\'������3�Ӷ۝a�#��O�+���}J_����{M�zoOBNᗪ���lz������������%�\n�:��zwiֳ��e�_K��<�$s�@���\0��Ͷ�s}�v�����&\r���٫��-#v\r�_}�O��ޙ�6cc�znǸ��H����`�ǻ�k:���3e��\rD���uB;��&�}#=�cbth����\\�}#�GqM�L<��	�{�\0[��ީ���wnٙ#���j�Y��m�LkI�\0N9�W4[�]�}0�.LA�o��_j��:6�1.>�?�_�z���;��7��.0�o���w/�k�z�y�F)����v�����X��;ב�2�}����s�a��f<y0�Bߒ@��QK�����y���?�Ǽy6�����2�/bK/Y���#p�IB�=JHC�\"�k�޺ �h|�8Xc]�V�6~��A����������8���N�`\rL�g1�2n�I�+�~H\"~�9��\0��t��	���\0�7��FI�s\\qp\0e]B�����YxPa�ҽ���p蹲�-����\'�?���2�Nt�Γ�;CeZ�,��c�܀\Z��>�>�V}(	H���&S�I⺔���<�^G������]�cuy�v�o����͹����o!f黇0�#��sfm��.i���9��M~��&?j�o�;��1��&�0�\0j�����½#�����O����=2}�I�uYv�(;G��ϨMN;�뢋i����n��61�!!�l��\0~do�^��C�����<��A�q�˓;jq�,8hLG��e\r�_�7ћ_J�sY�?��x�)x@����KC2?P������\0V����{m����zw/W��m{S�oz����\0��Y��7=`��Ndw{��5����_��w��t-�X��˨c��<��B3���W#H��r@��̈���W����]�n�tܽGn&dЄ�2|�c0�\0>PKR��;m�����m��m���k f�!<%��L��B��*�J���y�.7���ig\r�fe+C������������\'!����@�n�E��\0�Y?����v\'p�K�.�ﮛ�n����ݽ����[��7{y�ϩ�Οo>�F���\\n(��z/Й�}:N=�6�!���?�� Zq�Q�Lh�\\���G�n�\0=��r�sǟ���?8�U�?���\0_?�/�����!�%�����Lv�Y�����vzmv�y���ҷ/��t��J�m�s�-����jk�?|��O��]���{	}=�� �}Hƹ0I��͏��\\|��	\0G���Nz��f��O�O�.bώQ �(�,�&���b~Y�n���3��67q���s&�t�M�:��R���C<R�g��c�K�s���1��=�ܟ�=�\"��b4,A�A����=�ݏ�}aԺt��<�eIhȱ,K8�b�[�P�����;�v]O�v\'J�]/�mˆ�a�D�>���B�m{w;���g��\0�4W����Sˌre��M�x��+��\r��z7���|��D�qM(�	?��_�}���轓�z��-�s��w7l���&id]�n�q�H@�e��ob��2f���N������n��Bxμ��<��K��/��{��iɆh�]�.��n<F����ӝ�\0G�߇:��(�,�]���.}Ik=�B�j�|��y4%���u���\0uR�XH��u�w�?o�=e�:O���wL���7\Z������H���u����੎A��Ma�n�yt��)�!-�Ӎ��!׌�-零mz��Dm�@������lN��h��b)c�N��)?Y�;�v�xPݗol�tq�\09�s��Ăk?X����<K�����S� �=�>N��9��&�pI��!`�������ڛ���Ƕ�0K$�@v��c���G�^�W�떪�+>/�m�jN��2�-���?&�X�1�.���\0��\0��ö�=��}4n�]hz�p��e�x;��K���]�s@@�+�Ӳdk��\0W<�k�\0Oy�Ra�_\"������Ǥ��\\9�B8���Fߴ{WG�\'���g���tG�{orFA��;��0W:)�j�=E�����o�n�e(��u�?C���X����������-�uw�4���x��{�9�)�c��Ƹ�S�;Vi]g\'��m:Q���K4�\0��X�.���3�u�R�IÒC�4@���{ר�\0�~�����]���F��t{.���2\\�k\'ܾ�n+��s�z^C����c�y������V|�>�\0�|��OFﭧT���_�z�W����v�|�6�m�����w�=�\n�6���\\��c�o`��v�����N�\'!�Wa�M��tH�1����)vV��k���\0[g�a��ޛ+�E�=�?k�\0Ҷ=���H[�b�=J6�w�V#>ߞ-ɟf;��{d�\0�t�����X$k����;�dV���C��\0b�9���zWk�v�/f�dݼ�o�Q��xWE������������:�97ۘ���\\��H�g���\0{m��G�;�-��G�?�\rx2�G���l<k��N}��yJGǔ5W�釛=���?�z�<�;^�Ѻ����zf�}�:�g]����7P�ʮ�g���6ݥKc�9�+Ezm���:~<�H���$��	�a�b:�M��ѦH�{���� ��1���_�:�����w�q��8o�\Z\n�)�~���a�����8�F#�J��ɝ��qd491�������������2d�	���E�\"�c��M�]�g��GfA��ѿqӞ�$&�h�#]�Y��q1?��Wo댱�zJ�|��/h?�u�z@ޙ�_�6�	[�+���m�6���SĊ�:d����l����ɋ����?������϶�ŏ�W)��l��������;r]�]>4�9z��ݿOk�Q�N[�\0�\Z��XD̞�>��-wyN�\0���\Z�e w��������;w��c����W��v�M����d��8�r���==��sn��󏱏(��W���sn[NA������>�܌���\'5����\'m�lpQ��m>�Ѽn��!0^�w������ģ��?��B�_�}g�b��O��$�<��O��{~����w�`K3�t=�om���\0A�_ssbO��R7P���I��r�ϭ@Su���10�?��z�ޜ�ǩu�6|<�g�@|�6nҽ��\'�����0�f�n��&����z�Zf�RZZtB6���������\0���4<\'�&���3�j@�a<Pn���/˞�6�L�˹���8�Ď����$xkZ�4�o�F=d�\0Ҏ3>槴�+�z�l��c\r��.h��h��_���E�ע�:�H�2!�}���0hn�ǵ�l����l�+P^��i�����ޑ�ǌ�@�.���K���ǎG�\0�?:l�[�������wڻt��N��{]�����6H�]�J�6�\'k��|0��>8�9	7#�Qu�z�	��{n������%��9����rx��o?���\'E+����ɯk�l�m��T҆��sAj�z�)G��J%�\0Z,d?xG��m��߽\Z7����2���ZM��C�j�h��0~\r�l@�w�X��ZZt�n��as���؀�5�1�<�ki-e��Q�/)���$4\0��徣�w�\\�$,}\'qܻ�ƐCF;�� $�r\"�z]�NM��y`?{$�G�<�+�z�}��{.�\\��8sF1�$���kOI����W��H$\r[���l���.����ֹ\n�g�u�����0��\0p�\0]Cs��ט2�c�c(��8��c�W����V�!���	�B.��:�\\׽�8�\Z8W��Ǜ}�����V>��9uҍ����W�wm�=>�|�d���h���U�ܶ�&�u��/�ɘ�\"=Ć�r����q�3�1���Ǳ�/�R��Kۖ􈻆P\0�^>����zTڷ[�\0�վ��[�L�\0V�����=�o�&Oߐ�O֜�>��d������\0�Êg�X��2R6��B�\0&l�N۪��f�m���4�:\n�Ю��׀ß�]��.s1�H?b�~��6�d���A���~j�E�2/����4oY��[1e�@�J@\\�rg����-����[YB�1�?��~��x��:�=��s��E�Ğ������o�s�d����{�K�{Y&�n�ؘkH���#�0U�y]�`��hD���<ӯ�b�_X�c雜{L��$�d$I�y!ו�4�;����wԤ�HO�wP�o��6�v�@2�-�\'\n��}\"]O�m��4s���I�B�1�d��[���D��74I��=ˊwd�6�{[rC�}Wo�:�^ܾ�N��%�I4�\"a)1�]-�>����Wl1��<7���������t�|$���b����G�B\r2?����G߆��.�\r@bH�Ҹ�k��Y���R�/����l�~��he���dG��]S�m������]��\09�{(v����V���]I܍��YVP<��~�K��\'~ؿ��=wvw���hwRgN�\r\n\Z�N�Y#\Z���N\"�wE���3.1s��\0,��]ש����\'m\'ɚq��<����K�D����D�5����k�cB�m�|,:G�\0�	>5�.in7�3γ��\'����a0H{%\0�k�;��mv�R�t����n#qkw=N(��R\0�iqڶ&;�CO�K����a������1��z��u\\���N8�����W�/�}��{������������.��wLLf�a�{��=���^��;�������\Z1���9�N��rz���:�.���{���4q�B&�s�,]�H��M�>�o=m�6�2�m�6LW�\0#,�71�13��ط���3���;j7�u����z���d�ӹ;/���IwR�.�� ���S�]?k��o�=C)i��\05<��\Z�D\r~%x��;}��m\"Ny���21�I\0*����g��\0uͬs�7]p@�0ͫ��(Y�A��Lq(�q�WB���Vm�y1�]K׼�W����ϟpa1����t{V����\03}����>�$v�.���l�$�F���u�3\\\\��vٮi�Q\\^�����>M�R=�~��~��;Csa�m)ׄI����%�v�;�Խ���_X�=�����7�C�\0cQ�m��LrkyC�����5��n\0�68����\r�0����]O�7��\'�\\�qNcS��2�oux�z_����ې������P\\[3z�p9���t�01�u$\"e�����a%�8��Qܻ~�(���Lk�G���}���c��iIz�@��\\-$]_i$Of����0� �ʻq��\r��\'�!�J&��ڟ�0�K���%�K��b_�h���ë~���_�O���K�n!o�E7E���t$}\"=�Z�*�z_���y�ʰ�b���#������,���S\0�.I+��x60m���Z_��Ρ�z�����u�\0]ա\rpI#��r�V�9�G,�uğ�`L�8���!}\'���gѺ��������g>�\Z����c�=����6h6=����F�#&��oe#z����6lsARZ���^�\'��n&�M��q������0vyw�2S�\0>.��v#��?A8�\"��?n8O�ߨ�\\Eۗ&�u�����<s=�a/p+��ی^���\0���\"Q�\0�uG`t�:�o;�{�C�D��Ik����so,,�Q�	��)C_��+�\\㥖�=wq��~v1�\0��	�����C�/�\ZF��[���Q�g��g��Ј�w�?܃���[el���?�B�$��ɱ��;c�:4�h�#�&M�!�/�U��<Ce-��2�_��U��6xpuHlq��7BnZ@x�u�?�6o�]����C������=��ק��{���=0���G����]��l�l�����qɇi4�\0b�7Y�\'s�dG��$����ܝO�;��L�B}��C��o���ݪ7tN��E�d���f�����w/�Ə���vx6زt�dKo�<���L�p$�6�|��C.�6�c��9M�.Gyw:�.��\0^�;���X��_Q�t�_�����qRl�0$O�g��\0o��ض�-�叽���O.�R~q�X�\\��>�n?/t���#�����/ڕ�\'��\n������>�\0]+�c��� a�DS���_�2�m=�H mq�Ʈ\"��^v����1�U;���䀤�>��$��\n���[��Le�D{����wjc��<d����wע��o���n{U�JV�+���=����]���\0Iۭ�N�w��#D&P>cXz�]�I8�9�3� �����W�=]�7�qe���Q����N������%O��m�;���0�}��)һsk��݀i�\0�wQ���%�l�8\"�8@�p6�%�c�0��sL<���(�+��˪u��T�?�����	\0�~�����g��W�\0����]�״;�a�\0c��@��u��^���Tś\r�{���%5]���ms\\�K���|r�\07)� ���]3�����d����}2	�2���{��[�]�Ν����jn������Ӹ������`&!���6���wE@٢��O�˴��Ø6_�dq�ǖS�{Gr���B�˔��\0�/\Z�r`��![� 黀\n���!��T�m\\��͌>�#�x?T�ˮne-9��^����ɻΫ���}�D������K?k����m2O��Mָ�61�H�2@��&ÖR���^�c�}!,S D��E̓s</���B!静�cp^����D��&�o���-���� z��S9w;ݬ��dq�w0_���ډ�o�\\�\0�;����bm&�ϻ�=3�u=�t��K�^�=Gk��[�H��B\0�m��#%b�����>=\')��<���9���\'��}3Ւ}?>ʛx�#^�H^4pn��\0,O����.��FMҺ��>����f�uM�ר�l��o6���Ә}r6�sa�cŸ�� ����Ժhg��l��0���G���pfG\'m~D�vktw��#��>��Y\\�@�\\ƻ~��-��m���N� �]�q�A�v���|�L��GtA#G������m�woK�=�E��O����z\'Zܹ����87i���π|�!�F��c��}�+�?�q1�\\q�d�����x��\r�n7�[���t)I�lD��!���,j)ٽk`���_۽��E���\0��\0#s��u�Ӊ�Ӻ�5����n����6�ZS�(��?�\\.g���\'�pķ�qN^\"\">ߟܻ�`߁����g��m��n�;\\_��n:v�k#7a���	�yB4��5��r\r�=�C�xH5�yǙ}W�x��C9�<���O�.��l���u\r��w\\뻝�\0\Z%�m��:61�Lpn_�F���BZ�|�\'\r������_<�x#�{���`�װ��������x\0	\r��J����Yѿwt�����.B%Vر�X@Tw��4�����Kw�ͮ<t����1�����x���\Z�����:&ߵ��w��èo܇[��U��\r��ČQ�0I\\	n����/����8F1����F`3��S�\\呔\\�ˈK��99^߃������C&����f�I�-��:@�H�{��H������\0���ğX��Go��R#4GںG��D�u��0���]�]���D]#�wHn�w����~����\"���Զ6�k����[�_�߳�c�\0�]�l���4���>L������w�Y�ꝗ�v�x�.���kf?���S�ZBJݴ̷1\\?P�P�,��y��\"�v�Gp:������1ȷo(b��)\'ꛏȽ��x�{�z�H��J>R��R�;c#O�z���o�#\r�����\0K�sm~b\0~,�c��1�oÃ�s����$9�k��:�]S��M����O}��\rL�m��nZ�t.�-p9�;m�ɳ��Ő18�!�D�0#�����=�v��N�ŀ�\0W\0�{�q=����`��|wJ��A�w��?�έҶ�g9͊m�vo7]O��簱�K�\0V�C��9�\0��X�9C�&���p%\'���`x�P�}Y���ռ��0�(@�$a�M�S�����&t�t�������WX����v���b.\0��n\Zp�B�/B����Lr��	�t}���e�����0�xd�0�\0t.��w�w}w�~C���I�:4MM_�t~�Oh�����5��G�ñϱ��������_2�?��;s*	��Wj�дw/R{��i�Ѱ�2f��4��$ �P��꺘��� ��H{�_k�dϷ��|��ܻK�R��~}�W�c����-�S��K#��n:gP���5��i�݈7+j��?����&�#�Z�WM�H�-�؟>�G�������.�ޙ���Z��o?R�m��G���MԌ��x-w~����蟻���=�u��OWۿ��e�4%Oi\\�������װ:{��p��[�����/æ6���0|�X�q�ޛ��\']܉�\0�����<d�{Yr�BDv�d|��}�s���*v�^���.���\"HK��u��63˫v�T���C^+n�����\0���b~ů�Nd����n��j���������un�M��ٶ{Ν��r���ӿl�\0O��ʣ�:y0�np3a�	��?�+~�n��\'�d�\Z�/�ӭ���\0:����$�w��݃Ԟ����1��}˃�����\0�\Z�����sӧ��?���A�<|���� })\ZĘ�^+�ݍ�s��\0�J�k:~Ӹ$nM�cT����^�{�t����I����vSS��2,g�!�\'��������g�N���\0�/厝q#��a�.�\\�}.A�W:ӥ�\0vǵ��g����W��r����\\su)�#C��ع��0����I���6a�-f�K��o�ZWS7O�õx�sX��Fb[���I$��$G��i�HŸ�I�\\���\r��?�#:�H^��=�ô��.������y���X�A��ԧ�:��7hǖ���Kk��|-T�9.-n�<��,���ŵ���@�G��Ot��P�~��g���L��}<8�g����\0\n�\0H^޷��n�������������z�=��c��7�C.۰z<�C����9�F��e��q��t��O\'�8!)Dd����\"44�yy����~��c�l�#\r�#�C�r���c�Ô\\c�֟�z&�ߏ��ۧ�����zn�\0��0���RA���a�͓k)qN�Jn��\0|���L�|�nr0�Ң�c���g������]���K�OF���2u��wR�n������\0��������1]��s�Y��\'����P�u��:�-��I�e6�����N���~��;�ǲN��:>�i.#�\0#g��?�2x�CG����1J�z?��m�ݓ?9�s�\0b�um�����bC��}���a~�W>��Z;k�f�ѹ�t�\0�%��s���{��A�\0�0W��FnQo�~�F�X\0�W����i��Q>��O�/�}/�3e��s�\0��T�\0��&���}-��/p�\Zݦ�r7:��3^�O��4���&�m�������!��%jc��o1h�N��m}I.��͋e��o�b4��,�RK�\"�v^Y�n���l��vCԷ�I����Os�cc��`�v�.n�i�j@�w���s��w�2��o7]6X�\\�.8��x�;�YJ&�\0(�\0���>�z�;��q�p�\04��l���J\n+��ԍ��\0�N✱F˵�k�Nk�Cb#�j�=�`�|k�u��������\0ػ�����\Zf��D���{����_������n���h�v������{5!/�x��*Z�<�C��7\"�;q��b�����\0/Nð9�O,����^�	���s7����������ND��7`�踥\nr�r,B�]k���ص#�o/k{.���Uڿd:��W\r}7�z�K{O��vq��	�.��9>Q�s}Nc�e�q���	��r��g^���6�w�ye�tI2����R�\0�qG���ޓ=�n�:�˕�C:~��f��]�]��\n��r��F� ��<���N��^�\r��1�C�0�<m�\\��=�?�z����w�ݺ;�c���V�nɗ�3����ݴlf�9�FK�k���Q\\�����-�1��m�y^>q&���V�eX��B\n��\'\'S�֏U�@d�ǟq(����5��+���?׎��w��a���xt��{�w�d{���۝��oպQt]O���n�<�xa:G���,w��H��g䍞&���%_)���g�1u���#���)� �$<N���B���w����?��v��łh7[b��z�ծ��s���.M�ǲ@��3m��r�.��\0O������295�����%�~��Figg�hYd��9�T�&��\0WN�%����\0,f��_R�~\'�]6d�)����֣�p/��p6.黨�(�϶c�A:c����#l���W�^\\\\�Q�zw�a�m�&���/�\'�qr����P#�IL�=�b#�|콮��=�����mաY��\0�oU�e)�\0+�nҼ��Ϭe��?��a�s_�o�Gw-WȄc-�����G{_ڼ�؛�7[gt�����m��\0���K�*~��p�+�wo���Xf����G�}O�Ǫ�#!���\\�F@{����=�j�\n5�lf���\Zͼ��5�_C\Z�������=t�i��=���ş�2n\r�r?�+�����>�����Q�v0u�X�e�;8]�	�J�?P�W�6X��;h�%0�����E��q�m�Q���ځ��F��E���~���P�	:��qTRTμ��~oWn���\0,��#��lE����\0����3g�:I{t����8��\0�޻p�v�vZؖ�@1�FI�!�$@��J�����O5~XB1�%x;��c��������.���K�A�m���Ȣ����۵�\"��w��zGH��y��c��\\�ዕ����c�s#�\ZD}�����_BtLhc��mX�5�v�H���.�xN��X����~�I\'�.��t\\Q���{�U�Ȼ����ܱ9����ܳl�`�����t���>��U�W�aԽO���)f���r��z�&	u��p�P���+�~�}\'�\0����[B濶����^a�_�\0bf�>`\nhl�5�`λn��&_To7g�?����Wi�	��أ�9��E��\0�Z;7���\'_�\0�N�ݶG����6��f�Ʀ�6���c����\\OUa����jO�v�߀��?��)}~�	��ɾ�xJm�+�?�\rĝG��I�ۉ�n����\0(=ڵ�_��s�w���:T77^&�OTȜ�4<�������	���hF�\0+���?�t��!6P�ϴ�ۖ��/�\"���Z����\"�b�S��������X���u�_P���.����=W����\0��{N��*Aװ�1N^J�xk����/�x1o��Ǔϳތ������\\��!c�z]W���H���.ѻW���,a���7CS��#b2��Zt�V�Բ���B�e*Q����/��o6~��I�Na���3?N?\0��|O�z\'Z�NĐ�t��q�@��Q�c{��7���CCrn����pArk���~��1�lo���?M����/�}�pu�?/��q�I5��H��#�~|���0�����\\�$�w����!�Y$s�Z�CB�O�a�6�2�왠?���R=��jO��3:��N�Ӥ_w�,ddC�=�\Z��A�^i�O�n�����p�d];u $k����4i�H�5�*��_N���9�����Lދ�����~���/�vwlFD6�@K��ŵooY���^H���\0�ѣ�@\nY���ۀ\0�$�C�ʌn���\0x���J�����z�f���}��I]��JQ�{����26m�g@m�]�;��I�\0kk���Hf��ƴ�����;����\0���ƠkB[E�r�_����4�0����yc������W`�&���~�exn彻ַ�Gw����t\r�R����\0 x��ؚr�8WM��~?�f݊aa�p-��%|�����r��,\"����|O�y���m��^�4ݟjn�A�T{���d.$�I�]���a�=�#y���Jg�.�����s����G�\0�b=�s������٢}Rt>��=�m����Q����ى%16�\r.�U��^���p����/�sle)�e�U������q螽��u�o�_�[� g$c��/��\\�f��O�~J�K��-���C6���\"\0���F6�H���/�����Yf,2H�%�&��m����]�c7[m����h�[$r>7��	T�{�Œy1�g�\"��+�{���\n[��n;<�@�L�zOt�c��۝�����dB����������S��z\\}wg����l�R��cѷ�ggf�nX&w�|�xs<�D�t�ַ1`ǘc�>\\�f9e#hF\0㉜�b\0<�9���_���}PL��c�8��rf;x�F~I���^\\�\0I\",�]S�O�n��;Ǥ�}�[~���Ϗg;�I�;�����N�l��܎�բwHc���O��ǭ�]��H�zޥ�v������c�DVZ� X�1py�:��9t�О۫�<��1��dŐ74y�kID�Q�_�����\0 =���ε�����t���o��;׷��K�O�ݍ����w}��:��#���}��:�s�~�Y�;�[�7RI����Xzw7Z蘄�^]�q!��<�pa���$�0�1O�E�,!~�����>��_ؽE6���fm�1�e:	@W(�\0�����C�S�\0`?<���������u���O��#ܿ�l{^x{!�*i�?a���_L鳻��\\w!@$���_���_Cl=9�#�s�o3�$A�mĥ���אJy!�@;���������T˽h����\0.�x�􃚒Й��E�D��0n��_�1nN��]\'z���\0��Bb�eL�M���X���J+��x�d���b,����[73ӱ����p��:��4�6�e�ky䉌@��GY{kw\'N�\0S�\r�q�~����B\0٭����/omv��\0�meh���3��}_���!,YCrJ^2��m��MBr2�vBd�^c��״\Z�����n�wV�\"\\��M��5���qN3k�7���䑦Dis\Z֒�\"�X��1�Ѝ�#�͓���s�{�\0��z6��Ð��m���8�Q�����{��4�m�?��oK�m�]-�]��z�L�\0/�=d7q�\0�)��:$�i�d�=�W�y��lݜ�v���F]\'�Q�2�3L��c����%�/Eƻ�\0�����!���1��S���:+D\04zct�bJ��5p\"��V\rp>��=j_��p?�����c���7� �o\'�|=;}��l���\0.-�m7��t�u�m\0k�÷��}3���H�����rOo���<w�D{c>q�}�b׉=����������Ƿ�W�)�O.�[�ds�Tk.kǍy���S��8۟&�/o�\0��]�<6���\\���0��	�]e�}������x�a7��#^��\n�+������\r�{3v�~�Ki>�z�9	m>���g���\Z.���?u�����\0�bt�W�:���b+&��v�s:tL�e�m�b�=.��k@Z�8��?���&�n1�����Ga���5_�N��c�����@���ڼ��z�뵻��wͩ&�a�vѭ����x�W�\0b����OӶx��F�ṫ�9�.�1#����6~�ɖ\"�q�~&&���s���\0�O���;�ſ�6�97����7X�o^/&h��K��(��;���v��P�H�j}��_�Dm��vN��ɵ�R�������i`%-�9�Mu��(F6����]�[�c�w v���WLt.������s����u)5�\'Pgu�,n%����gp���7\r�WP���x���2���!�+�פ2�\'�Ǹ1��Ǽ{�C�n��掌��I��Oi\00��=���H�\0�A�z>^n���]���$Gں.�]����){�W�;�z^����\r���\0�v_N�^�\'���s��nቿ�\"a<W_\r��\0�.lS����\"	�bWOֹOV�c��{�ע�\0�6[.��4��u�];��h�8�\0���\rs�\'�\"JF��޼��b]/oY�����e��VL��hc�\0Z9�s{G/�H]K���?�n��7���������jq=9�������i�\n�,qn����m������.�Ɉ]7�q�De��P~�?؟��wC��\0 vV�[�߳��le	=?��]卲��;�����d���������.�ʇ�.ӥg�H7��\n���ݑ��G�{�1T����)�ލ!c��MP��=����4�usͰ�C����+��~��$~l{��bG���\0�nF��W���K\'�����]ZX7R52R������\0�3�5�7�#ŇڼG�7Gi�6��q�M�䘩�\0^��\0V�K�\'t���z��y��{�-E.H�;�5��3}�Y�LM�/CӢ�yȮ��\0h����no^�������cf㧺h�e:d;W���OJ�˸����A�\0�^��Y#���B1���9�����\0t���w�cy�aڛ-������Ke�%��?]�!k�z�?��J�e����� ������|w�o��z���\"D�i��5���u���Z5�h�����\0�.�w����6�E�I�\0�/]7���~�����L��<�,��!��k����uݞc圎wO������o����VCӻSl���2]��O��a�gd�iB\\�8�\\��^���ᷙ��?��>{>�1.��\'�\0��\0}��s�6-wq��!�ܻM�22�.��6�	�/�N��[m_N�3�87{�r�o2;E>�;���e�97{��L%&�yD{��+���0�����4�-�MsF�Ixݺ�,�<�8�l0�\\H\rM|Y�v��L�b\n�v�r��B��f��q����\0(�\'O��Ȭ�N�ꯇ�:c6.�djz�Y��\'|�\0�V9�F�i�,~��v�\rp�+�`�zwI�M��O}��N�ē\'�!� G�!z)���T���J�\'�C$�d6��x���r�#U�}��_����̖iv]Sap���e3I���>��& 9��{����%��|��z|n�ئqd`�\n��W��]_�7c�{�$~M��L���}��j����m�����N�u��s�P\'�B�$84�E��5�����~�a��v;G�-�Oؼɹع������:s�J�EP\'���\0��������@(��k�u9��;a|���\0�\r�ט�����=[��c�M�(�\0>��qW�ߺ�q�q������ZH+��GK����$�Qp0��_O�hʑ�	c?���v�����ώ�>�#������{q	-����ٶ=~�S���1�.��#�WA׉Ǽڙ^9���U��G{�&�re1�8���7�P��d��:�}b֯�;���to�\0��:u-�J[\Z�}\"�͓p߆�NI�rØ��Px���vv]{��1��Zpw]���~��zOI���W����}��ސ�&��H�;|{~G��f׷2����\0����Q������x#�Y���I�FA^Z�CU���R��wN�#/Kɐb����O1g�ej^����]���wܝ����t��vE$n-�t��w�N�i�e�6wD�H�8�Z����e�����p0����H�%X��K6=�F˟	x�<Cȸ#B~v�h�m�\0&�m�QQ�=��-\n���,ph��1�F%�Ҿ��i}_J�0��{�݃�����u����P��⏒���|$���Ok��@��xn�o�B}J�������po��X4�U��Mx��.oQ��/�?��I}+Ԓ�98`�����;�c�\0y��>ۓL�]�rmz�� �<[8��S��Q�~؂Jk��@6�{-��zN멏�q��b{%�\"i�q]?�z�rtޛ���>���P<K������}�sA\Zo{w�F��cQ�uP˄!�}�ZG���[Ӷ����78H��_|I_/��9���������f�u��]��~��vgs.\0E�oF�G���Y��ƹ����]��݄$X�_r��o�Y��})V�x�A�^������;8���r.��z�I��\0!�ɥ�gH\r�Z�ϦrsG.a(�m>���y���*�S�[��݃�t�wDYC���M�aaQ�!s_H�a�n�E#��x��ܮ��n�6�hm\r�_%�I^�����][��\'�\0Ļ�� c��>�hM�-��\Z�����//��b����u��B�Go2{�ཱི�{\'�ou~+�)?~:�>����^�t��iv�W�;a���ޟ��~��ڻ�lQϬ�4H�ڼ�\0�=K�ޛ�q���m��1���+��<�n�^�c�Y��	�t����K���j|�>~���{��?�y�?�:�c��z|}��?&���-��N��]��e�m���g>��&�;}�8d��������V�?~f�`��Ԟ��}_��GE�h�Y����0Ё��1*�G�r.\n���Q��z[�ߦt�WFX7�v�L�R���4C�8rE΋��o���������d�<���]�t��wl:6��h춍�G�O۝#��?Of��_y�I�4E�ho��>O��}�Ӧzc��zv��e��s���L\\y�	�8����C�����Z������V�\0�P�9���<q�m���\0�9�s��XJO���\0ȿ���\0j�����7������_�W�u���=��év�O�ϸ��M�B���#u��{\r�I�m�tp?q;�+��#le߭%=y��C����3e��_��k-�,��I����K$1䙓�9A��攄%~zt�T~da��/�&�7������}3�f�(��0��<��G� �\"Dix����q�����O���F�;(�c�/������+[,R6M�[&�״��W�F�Ǹ��X��rO�J$J2��$	b���So�c����Bx���q�2J2-$^�\Z��w]@�\'�����۽��sIk67;�Ft��y��dS���rz�u���&b8�6�s.\'���2�v�^ �%z���d_��	^���>��!./�=��V54��b��\Z�6�#�� �$�}��}S�n���\"W�;$�g�/����^���\\϶��i-�\nZ���\0:d`41oa�^�ְ�}��찷���>�y_��$�N�߽k�m�qs:��n�5�fHK�^���G�˯F�st�D���ŗ��%�p6��d�a��G�6�-�q�n���6��N�zTr$�c��r������C\r��[\rx��)m6��b��d��u����ٽ`�{}�0�\0L���D\rx�]QԺ�V�(�k:�2u��{���U��۳���l?�v��\'�ZUMv��9��\0a�#�9~w��v����s�c��m��%�X��h+�?u(]?Y��x{�f���:|��Ƽ�((\\\0w1�\'�M�HG�c��	��$?s�v�b�ǯz��y�\r�y`�a#�0�p;��])��~�������=�v���;p��/��HiF2	#Ү���=��8��6}ZC�����$a`<{�˨��iD~\'��O�\"��� �>�w���w\"6͸��.�ߩx��n�ӷ΋u��G.�v���ı��� �K���������\0����c.n��$�N�H�\00��������ms��Uޖo���c�{h���n.k��6��(�D��Ev��v�l�KM�7��<��P�!��1������8�sy��,;�.?u�	^���c韌�VѢ8D�w���v4>�ί ���\0n���Z�O���:N�	~^r�i��%y��e����p�?�N_��\0\0������=���}��BG����0A��iq����~������s#˶�r?\0������\\��b��;O��so ��?��X�����\0P�����XBHؐo��9�V�u�����7�N$�:�đ��`���:�����6�D�p����R��y�l����9Kb�H\\���#B\nj��j�j�=��=�V���=wkw\'��\\���G�����4�K�g�\0mn�vs�_R�&uH>�!щ6mqq���v�i�m�̭�6��B���3n.��~bu��a�a���#��#�X?���QM���v0����=�M���@��ޥH���4z������sJ�z�P��OH�ÖS/�)����BO�2�����_K<�h7��u]��⮇���M���߸�Q��[�:����ik��\0�n��!@1$������)i�iG������Ǘ��?�8��b_���[��(7����sI3�.I:N2z��Ef�w��1���6�-\\Z@��g�7x�o���b���缮���}^���L�m�G�O��8ķ-�����t���*��k>�*�(L�j�� �5�r{���ި��]�D���������\'P�~���]�����@���͝#y�v�O�9�	�gHs�YR�] aŰ��7����s$�eX@k�JA�,ˍ��߅����$۬���g��+5l��y�K�ɒ4�\r�pti��B�mw[R�#]��q���Ԁ��|��7���3Ͷ�����]��U�u�}[gd��u9c|46&�&��de�E�u/N��\r$�4kX�u�o����x�Qc�]�Ѻі��;���d<N\"�,�/3u������۬�\0�������wJް�z��W��s��\r\Z[�-�vx�Ky��Ե���H|������P.��۩����2#e��ʓ�d����\'~\\��.�f�6�i�{�����ӛ&�G�ϖM�\'Yo��\n,Ep0�w������E�z���{��Q���ƫ�uIw[��nv�qN�ݝ]����x�C#.kK��>�r8�kr]�N�1b��@?��e���c�wf��]��/������$��\Z\'ŉ�`%w�徧�ۻ�t��4�N���n�N����P9�j4b�R�O�v��rn\0x���~r�\r{l��\0����e�A�����(D�JR�?���.����;U�Cq�K�Ժ�Hꝱ�����ձ���X�}qþ{�!�z����1�\0���\'�8�w�1\rŗ�=w�����1���(�<������S�/f�{���}�g�wE�M�M3m��)�|r0�ăt�V|��WEu7,�x��f��sJr:���F�O�~]��[������}LH��|��sڼ�ۓ�e뻎ǌ&ߺ�׷7[�B#6;�w�K�jl�����e�!��v.�:��l2��(�_�S�|{&#�y=�0�b?������\0 �n{��\Z�Fɑ9�N��,k*�d��:4��&���\0��OB�2����O&W�@4^��VO�G��9%dn���J���(6��u8>H��.o]N��͊������;���}��������ᝏO���ݏ|���:1�ߵ�{�i�6�qu�5��s��\'Z�g����&k�#س��iu�#i�ě�E��s�_�6��;����r!����7��#�2\r��a�hhu�(�Juq���{I�ɹ��1��� i�U�\"]+e�^S�P��ȏr�_��}����V�\0���ϐܻ�]�lR������O�a�[����/�L�톟4��.�C��kwǺz{=�ݎ��-oe����3�C\"�1��ܫ������H�L�_�l�����>^��{8���]z~��CN�P���a\Z=qq����ۆ^�?S���u��_�3��&��N�P�V�H�B)�W��>P?��G1���ȟb:L���>G2<��3���WF�s�.gq�X��L�x�\Z�ٷ�&�w���t���vns����\"W����Yqn^������%}#������������/��{�ؙ�ol\'�V��o��=�i�L�a�\"A`ƺ/Z���f�L���_ǚ[x��4\'����]���[�S=R	z�RQ����q�\"�\\���v��(K���ת\'����哟\"G��������^��Y��9g����>ހΩӷ�X���nB�/�3r����}�{\\w/�r6x��	g�f���`�y��^��o�\'⾇�qn�^��[;�I���2lt�2]�ݍ�\rz�Gc\'����g�> ?����H��<ʑ�G��ظ\'�䇿��X��6^�һj!R�u��gU��	~�}8����a\\Ͷ�lr��\r��y��.�ԘA�n��&)ɼ$~��?�ǹ��vP���ӟ��]�ԏc��tf�=.�X�q�^c�{3����0�,��F@���y�-��,%�K��}�zo�n�q�ڴ+��7�T)-V<�>���W�@Ϧ�i��:�?��\'�_��.�9�\0%�������7����{���\0�f��\r��>�C.�[���.qJ���>�d��J�{,ܛ�rzN!��Yu�bm�w��\0�+��;��9�7��=����8�o�pQ�)]���d�5������m�i�bD���)»YᎧ1Pw�\0�����k��/.V�sZ�������!�\\��3�O�\0M�-\'��/�\0b�̾�G�nz�qufl��~�Զ��e\Z�Ȝ�Ǳ��P49�m�7r�H�����r��=�>��6IwV@x��5�o��kiү\0#)��9{1D72��}���\0�g[�����۽��\"轉�x?�H���]S�>�֩~�c�v��jI_�~�I�\r�����\\9��R?����S7?4���!�\0l֘�v�gy��\0����/O� r�V�a9э�#���4�J�/����]�Sk���v�Ǫ�3��#��o�{��}��@_��nw����\0Xr}i��L��ʙ�9 \Z<��\0�\\HO�dϊ\"a!h�,@��5^��h��CN�o:T��%H|�>y\"\\��D\r|�c�[m�\r��3㗲A��\r�?X�i�����s��>�H�\0�z��F�z̯�m��|��,{(�d*���q��9�q ��t���t��)8#<~H�p�Ko�sC��{c����P�U��Y��/t{R��\r�qZ�@>C��\Z3�Om9���R㼭=C�oH`�\Z��w�2#���x�C��ֶ�ڐ��UwA�M펋ˬ��n�wp5ۭ��75�ۡ���+Y�\Z�[��~��n����#�I1 ���|�\0&Y`���a8���q�_��{G��T�C�oݿ��ОGK�&�s��\0�:�Y�HL�Ω�2}���t���>���u��xD�!F,*ch�;S[��{轾�Tü��2D��T���H�sg�#���{�zcȒm�è�6��rt������@cu�\\��_�z�m��9�0c/\n��p}R�CG.8�w����Wh�\0�������6\'���B�..�q<�jb��޸^���\\�ڛGp@�gt���@n2y�C��,�vvu?�[�K���ci���N����(]��o�N��=5�\"��xǎ��>����V� \0�.WJvۤ=�ҤqG��~���#_a`[��R��?و�b1E�������G��ch�p7�m�^��!;6�{���Ʒqջs�����z�L�lwzZ\\�R��ާ|��!�pos��n=�|���#q��ь������	6ߒ����z?n�j+��V���_P����N1�x2��<0ɐ�\0$\'ճ�?������%��ޛ۽�=�\r�0\0\0���6�H��Z��)��\\Eug6�6�)��D񜌉�zo˜q=Wu��x�����{\n�.���s/bvGut����wWF�};�m����u~��R�$�9�g����wG#n���>�vS>8F3�J@d�!��\r,$/\\/9�1C\'T���lrP���`7\"ղ�_̌�o?u���d������\r1˻;�G��&�,��\0�J�zC(��(8�1���^[���%\"� ��]���m��K�W�����I�ɣgS�v�����m�\Z�����G�Fo`$A�Gz���\0[�=.�\' ?�2������\0h��\0eտt�K�W�=�\0��5�o6��\r�r6&UV�5�<�͸���Ǒ�����l��3����]�4샫F�V��sZ�,����YW�D~�Y}��W���ܜ�B���\0��Խv��m�@�}��U���\0\0�X{w�����i�}���/Gm�湰Dsv��b��{��}A�w�\0(���H�}���������)hv�Qb58�� 8�O��5�>����r����a��rK���~^�������kX�{e$�K��B�\ZA��\'+\n��O�n�����[�&9�ހڹ�a����=�O�Ӻ��.\Z�ե!HT`s��U�=EOWn�>3���7�)�(ˏ�\0���z;O�|uU,=���cdzC$������\nt��%�z�N���u�O�~��N���q��rrq+��I;������S�t��۸ܶ]����\r.BC����w^��Ǵ�t��\0�2�.6�=į�f��,�zb��\0�?�R�vfI-�\'U�i\0\0�j�@#Z�.¼�_�N�����f#�e�A��?�^�\0az��t}�L���\0#���ۗ������:O�\\��L�G���~�����S-q�v�.ZA��(+���O0ɚe�e����~�����	����\r��\rp$?{շ���66����u?�l}1��W?��bϒ�%��~?�_H�:�<3�8@��bO�}�Ð�{K��<.sFӽ��e�D�-��X6�xե��u���&_k�yN����R\'��x�$G�q�^��\0U��~/����ܝfF�B��t��$�%����ga�=A?���c@>ف�����u���������\0��Ϳ�6n�~G���7N��B�iӧpJ�ջ�B2h�^�<�6fjѐ��}�+�����7���!�x�\"#�<W�\0`6��m;	�a.���m�c���-b�Û[z0�=��~X��?�&����\0��=���o�Ӣ�׷�Q��Rtޏ����lg}�;����K�ǧ����v\nǨf�-�����I<H|y�+�=K�ޟ�t�s\\�\0��bW�?��;���u���w!`Wt��n���-�S�\0��\\Je�|y�}�2�O�i{`H_*�o�\0�u�\0ǞcY̋\\�w�]i������}��F��K�h�v�2=˿��-����cv%�ܫ��\r�pC�����˓9{!�=�#�u�g��껜�Or��c�~�\0`�����=_�� 2n:�Ks�.�jC\r����cZz2O���Bc�_r}?7��{M�����(���upc�\0�����g�C\'�M�`�5��~��*8�R��?X�G�{�{N�.n������0�<j����.���tçk��]#�oa]A���.Ǩ�4�\0�8�7�҄	P!����=�P�2Cn!#F>,i�V�������?�g4�\0�\0���z{����\0\Z��Ԙnzqnf;���{M-�H���\\Y�W���#�˧?�$�B�C�Ϸ��\0��r>\0��y�CL������1t����o���2�ͧ�c�w��x���Й9���xL����9	s)��ȓN+������=��6��.��7�}��c��e�=�ӷ9�c�\r1���W����~��{/�%��i,S<���\n�6��x�ą�:��g��s;����.�=��n�~��Ҫ\rmxs���{���v�q���~N1���ݗ���<Q�Id#���uȺ�g���t���\0�����t0i!���Z��@#t-x(8%v=6C�n��\0����.Cw/�~cn��J��a|�C���y��\"�����{�u�ci�:6�lZ״��9��������z��|ϥ��3��Fd���\0��O(���L@��.�����=���>��7���������{ zgM�.�=V8����uM�{Z�M�v���E��&�d��1͂Q3�CW�bj�� \Z�) bH_F�F(u\r��ɎIC�3�\'	4ZQ>5!�W��-uM��m���Ǯv�{M�f�}�}�{����u�զdqG.���nv{��6uN�#ghl������p��m�O �7[RLE��D�(����c�ї�6���L�,gɿ��N\\�8;JQ���q4�CPt�tD6Ǭ�2���z_xA��K��7�wU�@��wn�4-v�`7[(���X�\0�?<<O7/����v���uXSk�6���\Z���h�]���&^���.�,�;�:C�w/\\�0����lw~��m�#7S�h8����.���,7���>�\0A�!�O�7��m�(�\0OH�����=�}���e�S�m�;>�\'�ꛭ;��	�N5�v���2�\0���\0,y>��N)��+��;yDv���&?��˞�\0�S9�@�ɫw/_c�;��}�o�>V�K��s�w����L38{b?�_U�K�oqH�6��\"O����~���\0j����~���ѵq�_��{}��������Z�OA��=Q/�,�x��`��@�N�%��e�t�G$Od��Z.���u�k�7Q�\0���Q��+WOޗ��L��9K\"��4�ua�ǩ��7�\"��s��^�\0Ի��-�k�xHpwq��tOP�cn�Z��M�M\n��H��mO�!���A\"�C��X��V���\0`]&�\0s��ܸ���nߐ���^��t������Cn������zv�h���{>�w���	na�_-��3qͺ�#ߊ��.�&X�8^s!����Yy/�t~�ڝg���~��I�����n�u��;i�\0L�C9��2���϶��0u��Y��Y���F>�u^�i��N�����<�\'��8�?��W�_hv��e��}�ŝKm��OiIӶ��7%X[+�3ev�!Vƾk���W���3	����/Ӓ8q����3D����������������n��K�#�;c1sT����S�r&&�������b������?����ۉOg�#������e�����h����Z[�\0]�誘6���rB�\0�G��I�k�;+uYLן&O|��K����W����|b��/J�\0�.��zSI�����%IPΣ#���(��V���}X���u��\0�M�ӔtO����Kv�����o��Ry�n�<O$`����g��%�6���b}��>�������C�w��j�L|����7�M�����ۻ�:wG�\r�L����y���m�C�TQ�\0T��ďmB��F~�d<I?U�NI���Wx�w���^n�u���M�G;����:�7�ݻ���ղ5���¹}7�s�?G��y���qj|W��\'�to�}�}��7�Q�i�����H�g[��C��K��Ъt�йWȳG$1s~lR �#�?\0����>M�?�$H.��|�򍛭�U��k�ǮM��4�b�D���p�K��4�»��g���<\"<YǼ.�͋8��G���n�N�����I�{͇tv�b��ҧ�\0?b,\nA#�zOYDo:<:����e�!��\\���pp����p����du������͛�U�o�\0��0㡳�qMN�]_Q��M����^��f��lG�\0�A���\0��O��/��10v~̞\0���Q`I=w��xz3<�[tވ^C�u�C� =����ߴ?\Z��1�;|ep\'�.���[T]o_�6�<E� }�׾�Ԏ0,_����\'�_������~�u�N�i���u_I,~�-�l��~?�uO�ח ��D�G��s�OM黸�L��1���\0��y{�|��vOX�R5&�.�ݤN���t����.���wߘ��ֱl��6�\\��C�\0���˵�O�?ڵ~r���J��w����V���⑳E#A�d|-��D���M��m�ǌH�Ok�X!ѦLY!1��?���R0���D����� v�:�c5�揷h$*޼�\0�ǐy���Oо���7\'.�Zr��e���{�^�П��e�}�e�\0a��uɠl�f�kl/�\0ɩ\\QM}N_Ou=�\0G�k7#����]G�3�Qb�9c�7e��ЯMu~������ۨ����Sp����l�t���y�&�iԷ1�>��qt��(�E|�����<P{(����ZQ�@t��x%�&Im����<�.H��.}��{�(;Ky�0lC?�oE���c!�7}��8}�v�\rlPC���\0\0\"�Ok���s�,��$�\'&�TI7/\'=�}���}���͎�$^E��f p�6�!u�憴�ǽ��C����(����O�v�K���ʹ��(�=6W��L��#�/��&M�q!Ib�(����b��\r���_��޿�n�N�%�.as�lӦ���=/��8���W��0�fQ���[-��}���ʍ2w\'zun�\\	:���>����������|ֽY����?��#��<��Yt~�����FU���G�L��S�,�P�WO��\0���d[��w��5��Y%�s��D�Л�r���3��c.є�/W���տ\Zt���>}�F�\0��}G_H��W�jqi,`%R�p��|K}�b��Nq�b2^s�HϥD���	xg����:wL{A���>��2Ɗ�\'N~�w:����w��z_{���NGq �ܺ>����6�\0s4�Ho�.�w���c�#���=���tEڻ|�\\1����c]^��H2�������N�uW��;\r��Г;��P�<��L\"?����^�����=k�:��t���l��o�ou��8��uM�i�{�L�:-��!&�|ZY:d�;�����D�Xd��_�B���U��\r�O2��F�9��_�.#Cu�o�\rd=���x��R�w�9��7�27��	l[�B)�z���<��b����?ز×���f�G�Y����l�������z�v����U�x�[�}�ZJ3^;v~���\Z|�<m�j���e��w$5\"?v!x��\r��-�{�����s�����i��8���ԔG�\r$:k��ɜ^��Ϲ��\0�ܼ�7��-x����>\'�%�]_�E�}���\n���z�-���`���GO�A���l�Ga�6����f��q-/q^k�8�i�>����_鞽�~n��:d�;����r5��ݷ���!K700��\n��1�o���3�1񌄃���^��H��n�\\�\0�Hw��/ho`^�燎�ۈ��~�g0��:FDK�Hk�5�=4>m��lڽq�I_��q���^�\0ض�\0�7�cA�cgQd��e_P�/,��c]�����[!����V=����C�GP雾�Զ�m���\"���߹�N���9�������`��`sC��+�]m�y/��y�\0,m.Y�88�� �Hv+�z�e�=ow��!����\"e.Re\0%i���@+�G���\0(���7f~���f�1��\0(wf���H���+�z�}I�Eݿ�wI��lb�g����h�]�DF��\Z���~c~Pt���:^��{\'7.@r@DC�d>wp�\0=l4_�/�\0?��\0�v=�l���n�C�&���D\\ļH<���C�zWY�tޯ����l��7���9�;m��ϼ����������w����W�K����}\'k>��7I�fyc�����e/*�(.C��a��̛|�ݜw2ǌ\0e9@�\0�G�&:Q͊����?��g�uoˬ�t����M�]K�Y��V����o��u��|��?H�v�3zȤd������o��\'�}�ɴ�1������b��nG/՛i�2��`�\"LA�s��\0M�:ǩ9���x��ÀJ��`F8�4D���pW:�)��ɱ=F_��k6����ۇ~Y�s�oM�Ҳ6��n���C�c��\n����(�I���u	ϳ܊�f�7z7k��z��0�w���[sg�lF$3��r�Av����\0�������N�z��݆���a�t��w}�mz}����힗���J��t�6�e�=q�o���.�(����t���<zG�����ޠ�#��a,YD��9����H�w8d! O�rb?	��ފ�f-���X�}�X���D����W�����x�� #%�����?���5s�{{tZ��2]�a�Z?�3j�A��\r�)P�|��y>�g�7ck�W���\"����^��\0>�����t��8:Wj��,\0����M�hz4C�Fu�l��=A��Xr�Q��#��������\0�ݬ��wX�nN�vO�2b\Z�ۙw2E#�I^�M�\Z�:��<a�3��\0j�?1�C���A�`�hA��\00�������d!;x�\"�~�A\0v�q}��^��g��n�\Z�r������ׁ�����ag�<f{�9�����������Xc��t��s��$�N�#�[i{��d48\0}n\n�~���x���\"<��+螱��w9�H�	�=�ß�����=tm�yp��][��59�Oq�\0���C��#r%�J�ޝ��M���-��,����� �D�&~���������f	G�)-ŗw�iG�}e��;�����;��Էl�hbb��<F\Z�\Z��{����68���8���k�����r�^\\���N��n�НǶs?/~Bٱ��w7�}��.l����4�!����½��G/�6��N�������ܜ=[w�969<Z1�����~,u��%��������c�z�����f-}�N��-k�9��\05�后�rh`\n��-zH\'�m�W�E�|����v\r�=���eх�;}�om��{���swND���m�Nh�ꬿC��vq-��K,��\0\";��z���{��K���<9|��N�����m;ki�k�\0�]S쫜��3�la���V���Q���Lbr��i��2��0=1�:G(x�ǋ2���v_�v[��Z7�Ǽ�f-qN�������>h��x��W�W�#�,0ni���?�������G��:�=�G����\\�6���o�\r ࣅi�y��z{9�h������v������̉�2�,���B�N�D�ww+KL0l≮@�?C���%�.z�&�c�\'p�%�\"Gc8��kU}+����\'\Z�����\0.��m��v�G���u8�H�݄+a+%�P29����Lͨw�c��υ�S���;��,�m��\0�c�1��}u.�;7��gcL;��=���s�\"���o�\0ɗRٹ���1�+��ԉ�<`�\0���c�4�_H>�s\"?��\0HI����2}�-��m�v�ۺ2�b�����T�n\"�n7s��XIΫԲ1�d�\0��q��־�|�7�7�DW��\0(D:�h�m��l�����5���7N����H���t�ޛ�5��u(�\0@\'�pî��;Ӷ�,d�\0Os�P<L~h�\0�x׽u�Rv����9s�,.(\0i\0�r\"����l\0�03Œ�Hﱩ�]���]s�J���c�s.��A��޳�}Zw�[}�mv؜�ޟ�:k߻�h\r�n�v��ƺ�\0S�������#.V�,���诈�_2��n��s�,�`;\"�ü�U�i���!�ۖ5��������X\ZOD���{��F�&�\'�O�X���.�#s�1�Q�����y�8�L�C��)R53}V����7������|�3�ܙ���!}+o��N�MA9���&��uO���qvY�������ޝ7�M��V��i&��\\_J���7y�?����9e��+��G{���m2H�C�]Ӡ~D?r��CY��b�C=���\0�Kö�~���j �,����\\�s��O�y~������ �����~����j��A��\'�3ٹ�Z��ש�\')\"�,�:C}Ne�r��]��qzW�d>�?}���v���t�r��(�\'����z3��N��C��C:�-=O���m���GIZ�l[�N�KNU�zU�F�P�J�B92�Ic�	�Ǌ�|��Ƈ���j�/Ƃn��	���W��y���t��g���\0~�p��R�Ǩ!�����_x�\"�ri���z~��\\�kc���9����?�*˽�������w���m�K�齹�z�u0�b�tyw�\rc�ց���]�\0[�\'���2��\\�x��?��6؝����\00^�ͣ�����u6m��u�g.�c? �0�r8�^Ǩ�G�1������xOT���[�v��f	�o�?�}���.��[�N�n��&��� ���ײ�6<k�t��&3���#��⽿���t���V���t���z��{h������}��ϸv�����R}���)�-]/Q���6�\rI�~f?��6\0\rd�w���a�ϭ������%\0��>�!�����g���݃����\Z���><�����>��=b�Ck��cs�+�v�_we�\0�{����{����=�!�l��u>��=/�67&�6�-�RbN���ͧ���D�bG������{Wk��?�n�,�r��\0���?1��W��\"^��r�� 9�!n.�x�\0[O����g!�%xcǥe�\\g�:�{�\0�o����7qҺvɒ��\0w��]3y\rþ����Qp������v���h��&�X���б����F=3�}\\1m�� ǰJ�ü\Z���G��v���ڬ����hl#����a>��{�U����z�;��~�7����O���[��_�00=�r��������N�N����d�uN�ѝ0p�Y!�u\r�\Zl\Z�_.ෛ��g���6q�������/�l2?����L`1̷�@��.��\"G�\0�.��ms��0�D|o\\/\\�ɔ��X��_����~+�4���ａlL�[��aC����E���h\Zc��X��5��_a����)�7_[���~��IyB����D}�?�z/�J������d+�O\\|�F�]C���Q��&��\0HμOO�,X�^�G����z�Ya��1�����b�s���vfɒ9���q��c\'ۚ^���< Ө�\Z	6_M��3����K6�Dw��.��G�m�?4C��?�t�z6�N�����\0����G\r$�n��������-]~�\\�0�bOy5���͗!��dɔ��$�⻗�zN������?����\0��u�;�l��v�7��\0t�-�P|�4�Q(�.������)�ã��x�+��d˷��w�^��=n.���T���e����T��.ߣ�-��#�HKJq�������2L�r����҈�6���\0S������(5�����N���B\">8wp��L$Wg������!�wđ�̟�L}̄x.��~��\0_����v���J���`�ٶ�ux��$���\0�»��ۧJQ����ie�������S�k�Y\Z~��_�&\\��/�?t�$���}cuh�w��o�6�XK[�w���\Z���5��x���l�-�؞�s�$��D�OCŒe�Kq��4��I>���+������6�\Zg���|���if��%�f�\0�u�$���P��ick��`0�1h�@����Z\r�,\\:�������:���P�><_��/�$�gӀ� [B/n~=�,�/��\0�?2n�l}o��w{�;[�1��\0��{����M�b4C/pn��U�]�[am&�F�\0q>�ꝷC�0�3��8�o�3བྷN釡�t�2\07���o��;�e-y� _�.��\0\\�H�v�ru�4�:�X���\\B�m�n�O08�n\'�1Y~a���U���ń��̰����ښVs�G���;cvw��ܱ:�7w�ر�6������8׎�c�[,Y�K�%�7�8�zoM�\\�$��NQ��BW����\0�����S�~C��}���܍���KA�w-����Ų�A�����&=Q�p�w��պ$�k�t]��)��L�:����?m��?Lf�Ls��1u\\��x���m�c���1�.nB~�����z�}��Kw��!���.�˳�J!���\0�,�ݻ�w0	K��tݳ�f�s��^Gm�;���d�N\\�ǚM�W[�Ǐ7U��D�v����\'侖����=:�^�ڻ����D���l��$F��q�$B�q����m��(�~��˺O��^�t$2��|}��W�?��=�m�i�\0;o+\'��G6�����@h�sFZ�`�]�Z3ùŒG���G�M�����w��6èH�y����\0z���������v�}��;����ӥ�H\Z~��\r̯�G�;S��We��\"z�)��c?hp}4�,f���\\[�$f���.��}���=&\"@����c#�\0�|M_����zv�>_��G��t�V\\۝̫��{\"WT��twwEc��\0���M���H�(�/G��?b�_���&C����\"�ĕ��O�\\��;d�4\'�}�RtmW8?�q������6�&��3� ��t7Q��	¾G�K������n@��N������.p��#n�֞��0�k��Ǜ	����ֈ;�����\0�p�ʅ�K�:G��~��vj�ּ��VFK k�����8��5��z�r��\0M����9�mq+����[.��0?��n#�v�3�$�+�w��tn��`hoO�1t؁�v���5��9�\0�8�y��;�	��L�G���2����?8x�G}x�&�o���������m��sH-1�����X�	^��F8}[��<�<��1����3χ�<�w	.��\0J��C�\0�}�ң���\0��f��>�Ӝt�[��x����]���c����QZz�g������2��i�L\\��������Kdۙ8�\"d��b������?t�IlO�������u	%����;L�E���|>�ꙇ�!�o�uj|�CM��Wٟ|�ö��{��AP�G��pO5�k��-��ṋ�_� �D�0:�|�xa�,`�G�tO�������Vn��8�=#���߇�K�)0��U��������K��G�rF��,Ĉb�<�7�K��_�}j.�����ZY܌�I�k�6�-��J��1�׀�;Ya�q�}1��m�Q�b3~�/�Ͻ~r�}����]CiA��v�o6�,��r�lP2V�\Z��I��k+��Į��C�G$j���ʺ埆g��=)��캯\\ۑ�?oq��x�C�J���C�Yg�S���œ���Bo��z+�v����V�7Ln��kd�:�\r��l���23���?X���#�ҽ�Q��ϸЗ5^{�b�ݏ��󽰳}�[�����OCɱH�D5��A�_Ua���b�s��ؼF�7[����\0����нy�:��\'��͑7S�gt����>��w��J˒�\Z]�����deœ�y�O��^���\0Ӳ��,����}�x��;�ʿ���B�����\0Ɲ��z����i�]��Mۛ�uԧld��a�]��Q���M�P�\0;y]��C������`�L�}�4\\C���m���Ǟ���n]�V��W�\r�-#c �@5;y>�qv1.�^�g�&=�<��,�dqq\\��$�k�?�z��`��h���/c:��m3�ۀs�+I	�k�F[n�����|�ڼ���^\Z���!{��K���\0�6\0?�o^߸�ZL�K�:8�-���\0�\n�\\�w�6��Q�y�zfig��4��H�|��]�\0��_��4t~��n�Q����o�H\Zd�}�nr[P<k��L��C��0�~r��̻>����[K6�vD	��Xx��_���la\"O�˾,\"�=�h����C��7с�ԉ���_7�1� ��֋�O�\0��,���N�������U{ۄ�t�#��V<��Y9n_�θ���(t���\0�)1�\0t/���/6�?��	?�H�\0�.�������^��]�I�\r�c��躇L�A�1iš͉�S+�\\OOJ;�t�űda/�x�c��~��w������i�\0����\0��=����M鬋o��l��]�\"���ل�U��vgP&�6�.-��.�d��cs\'//\0��\0���w�u����m(c���)�#�_��Se��pov�	�9ǧ��	��|���7ϓ���m���yA\"!	j3~����ݑ~J��U?n�ۻN�� �tͩ@۹��h\0�N|�{|9.���z����2�\ry�\n�M��w���ި��zWW�lC��i�N��tD���u	�, �\\�P����1|��~>���^��rc������$}�+�(�ޛ��]�.�tN�����h�M�V������1����J���t}\n-���������u����&�Q�0J~�\'���/�M^��\"LGL�C��.\0kw^��O�p�#�H����Yv�|I]���?�竲Vǳ�un��������w��\08��ѷ�����M���xbzN�$��yG�\'�������u��3�����\0�1���9�|$~�^n�.�gC���=>&��}���j�ݿW����{��ÐJ����͞�u�8�2H\'�D��!��xp���!��t7�ܷv�ɻ��=��w��\0dz��$��ӣ�H�Zl�����O��k�f�q�;���\r�\n�1�G/]����������J�,�=��2�2��V�u��.�8C<1�M?.��_7؞^��G���L��Y$o\"}̾��e����Y�	�=7g�7�H�}���(�����9�m�\0�Is�׫�ٌ�STm�x�E�s����Ŀ�����\0�y��페��xw.�ff�m�}1�ϳۙ���|п��l��\0勭���o�����V�=R4����w�ztO˘�O���Z��@9$\r�����m�y�8��|f� <N�1F4v���Q!IӶ}Bhw�m/F�o���u���f}�����\"}��m���2\"1�.��Öb\0�>p?Vp���#��P@�}k{�տ���T�s��c��5��O�k���t&��Kzw���T�=�����f �����������?r�ƜĀW����e��6�G.��<%��H��Vo�^�\'<�5�HI���ؼ�Є�O�}S�L\Zٺw捎�t��Bc��A!����I�w����1Pv� �\0����>�b�{�Qsg�F>�����v�ϼoN꽱�x$��ãkW�MNh��i�C�ѡy�{oUB\\���{(��&�_K���3�}������\0	���޿@�#t�o�0ڽ\\��s���Fv��KdO�\\}\'�\0� ����v�j;���O��WY�`?�c���X�sмm�}G����}����G�\r�,q�C���u&J/`fߥ����E��~��{�J>YH��_�w|�\0����ʲ×&3��.��у���n?&nv��\'I�H���W;�Hu��]�����껃��m4;�o��gޒ˲�ݬ�ys�Go��,|[X�\n�D�_1鰆�za?,���\\�Lmpo�E��>���\0�K�q��:��.�����÷�ɳ�u���N��ק:F3a&f(��%��\0�\"�W{��n��z��\"�\ZsM���`�m��q�z��;��pW�8npGz����=k�_�o#��c��nq\"-����/�2l�ɭ�3o�y��m���LA���8�1^��b�:v����e�oQ������ؿg�:��`��K���X�(s��;ܺ�?��%3_T�w�e&��s�\0p���Z��\'�� �>�C�4d�w�V�;�t)��\rt���b��3�����l��U� Ż6�R|˯�l���xw���FG�O��k�[����Q�?���ޚ�s�u��o\Z���\0������J{�扉�7�_S��O��fb\Z���W�N���S�� �=;��3-\0��4[��mZI7&��זN���!!�d[�s����[�\0>$��+�}���\\�y���m����Ji7�m�l��&�s0���6�bp���\\?G�b�!�;Z\"�N��$a��2G<yO]���Ǔ�DgY�����v]�׻�=\0���mN�g�r�Cw;�\ZH¼�>��Sǽ��x�yJ�u�;�����7���z+�l�M�;3{��D�w/i���vm�609�m+M�o*�}_��^���\"2G���H.�a���nM��e��}˹��z��O[�ҵ�wݻ����;���^ˣ�Mb�P:��<�����\rĖ�/o�p�s�6�<d�~��>�?�?��o��28z�st�Ʃ5h���<�yT\r*�[�5�fmנqN^lpɌ�\0�����uh��q��_������8�H]�Z��q�+�������h��\"u����������������\0��{�0z�÷��R�tt���V������?C@�}M�?�!����}]�<�\0}�%z��>���L�\0o���\0_���e~�_,�>�,�q\0�R)�/���F\\5���{M��ǎZ�����Oq;g����4u���뻘�Q��t�Cv�t��E���ӟu�y!䀀=��t��a(��^F_���l�Gk�9�͙j?���������I�dQc��F��}[rz�\\�nn\'�1��>��g&l[X��c�#�����7ou�uK�a�\'�����\\��%w^��\0���\ny���/Pm����ͬ)I�po��g��Do�K�fs����=ϖP�2�#��C�J���k��v	DJ 9��C�����/A�I��`�\0��м%�z�E����ۻ���D�������0�]�Gu���,���5��q�!�e<���wx�Q0ܜq扸$@W�h��T��=Xe�X���~�����O�o֡�S��M��nI�m��XZM��7\'<+�\'o�\'>f|��|\0 ���s�/��e� �yyA�=;��\0k�E����Ǡ��r���!�c�u�>���K�m�s�	\n�]���Ϸ�\\��I��c���=��n��y#0%�&��{v/6~H�o?�v�����2�Xݾ�}�-K��p��L�b���w�h�0��u�q�T�B�s {D�d�Az󵤏��\0��s���S��(�N�s�r&\0��6S��o]6Q���F99}����~�,���9�2�OA����>�)��M�wm&q\'\0Jλ�?��L���b;���H����_��E��z:�Vͯ��0���w0+�\rp�J\Z�[\'�+�~hH��Z}O�5��\0�,�����H_�����4#Hn�N��km���p����d�����O	�A���M�<��L���魇���cgGwS�A�X���æ�#Ís���?I��q���f|\"[�^su\'�n&�{G�\\�������ֶ4�.�p�6��\rxd�k��\"/kU�s�r9W�I�]v�gm�\'\"�Go������]ԇM�����g&�iտ�y^����$�M���k7/�o�~��v��ᩯ~��1T�5�v��\r��>Xb\r��������aœ��F�@�������i�Ow,\n���m]M�l�đ^��?6>�����\0,��.K�g�+��z�B�߅{Oqۻ�w�>}�D�FH�.��`gS��cw���v����A�%����Gu	�2�}b@�:��ྑ\r�z��P�^9Z��xe�nɗ���澪���p��8��Q���H�\0t��ʽ7�A��z^֔�}�������q3���\0�.c�]E��}[�݌	X$�HЇ#�	^?����y���C|B�z��l7;i�0ɴ����	{⺫���ߏ�\0�I�&����]W�t�zX��W�]�O !��&U��z��,p�^0�e�]~�\'Ằo$����&�>��,k��c���\0���ԭ*t��cP����l\'��O)��e\"\"5\"+��\0��#qV�q���w�R�Gu�m|�JƮa�h_J�M.���m��o�x����Ԑ�W�:�W=;���ch|����lo��\0�t!��h?K߽ܱ��z��� X�	G<�/݌���Eo�w�����y���g���;��e�����~L�ޅ��÷o���_M�.؏b:�q����㮖f��c�g�]�쥒h���\"��8%{�+�����i���=�����<�1�1���x�Q�yVQg_E�_�z7���ï����=��Y1�JS���̥� �Lȟ����G:O�\0*���(w�D�_�}�����jN̛������ڳu7X�s����m:^ɛ\r��������;N��g�C�\0M��-��\r��u�1��(BX��dI���e�2}IZ0��d�@�_�Vuޫ�\'��l#����\0�<���\0I�1�*s�1 4g\'$G�?��!�����M�_��=Ŵꧼ{W}�=�7�m6]����\0y���th��G޻�m�e�<�I����Iv{W���$lw��_�;��띖-�c��m�x�Ķ!8����R��(�<��G�o��a~iz;�~Uo����m��X�\ns}i�CL\rD�02rɈ̜�	俳;m�߅��)��f�^���:d2������M��}��6�i�;�5����\n-~��F�{����m�L�`�X=FR����q�����DCm����F VR,,�R��^�\0�7ݕ�ke�=	�����GY�N�]2�]�ll�oR�\r�I����:m�A��6��s�pX�-C���0:d+�.��������|���0a�8���� C�Wq�!��u�ƽ\"]�W�Sy�5t\'m�[��t�v^���lK۳��>Q+�J5���=U���&\\1ǎ�8�x�	L�<�M�\\\0�\0.MW[�4�e��E0\Z�=�9������N��>���;fl�34?�ϵҶP������ZE���z�۝�r�A�\04��/}���ϰ�oǛ`:S�\04n���n��\0ko�Hג��p���f���Yw0�ۘD�y��p0��q�6�bk�o��槀�;�[�\0/�@�>��#x�9��B�-�ް+����\0��Ε�NV�\02=���0��ɸ|��~�~<�E����XXc��N����-��t�I��!�t��% _S�u��A�M���r����!�����{�	��y_�\0�)�N�nz��^�tP�_��wҋ�:�{:��?Iݸ�8Ǻ`{uYEw=(�>���L\'���t-�05�_/�}8e�۞lX��D��Ȍ���t���\0s�e�ɴ�t���s����\'s�\n.�2��v����L�d��=�A�=�GY���}3�˚-��e������G�Sĕ��r����\\P�Y��?*�\0��v;��	�d�ҽ�N��\0�V�zGy!픇ں���;n��9�ҏ�E�����[���BZa�}�-���5���\'�F�K!lqI�iqR\0T�∉u>S@���e�:$z����G� ��v7�Ѵ���\0e({]����ԩ��\0b!ſk��&���1��\'�\0������<fI?b�1��g�L���&G���_S���-�t��!v�>�����������Gk�\"�*��:$[{��g��i~��>�=%���3a���оw�p�?\n��=t;�w4�C��s�m���2�?�z�rEı��ζ����~h�\0���}�����Ԥ�F�GA��k	���M���4�\\\\��\r���Y�K_���z_[������HxƧ������������<�<%!_x�+ʝ���l7�q�t�����%���$!1�u��G����e�d�vBM?�z�\\�q�~|M5$���.��!�.뿑w���}/��r��&�nw[�1�Y��N�]\'��7K�E�s�=�Kw2��Z��S��	s�=4�Ah�\0�E�\0J��{G���n�n�6�?r���X^ͫ\'�� ����8iB[pk�zn|��ƿ.Lra�Z/y�?��k!NL��R��v;q��]�ٺ��7tݼr���$1DZ\0�-cX�\0h�U�\\�Y�\Z�٧/{-:��H��ן$����\'�M��\0��y�o�������A,�\0�����h��C�`8-�w���?��F����^<��wҷgc��oE>���8����t�x@��`�0ݷk�`[ɿa��ns�h�]�I��R?PH@�G�2�������ra��sϛb>�j�D��/K�o\'nt�#�^��]��u^��l�$�+O�o����Aj^�F��n��{��&Y�>H�D8�^?��l[�Sm�e�\0O�q�C��W�/���K�O��������f�N\0Z�3��:L}W�\'\\��3]Q���d�\0�\n��&�B��Ͷ~�t��ʠ�\0���cZog?o�a�|O��Б�d�}I��@�c�/{�D�z?k3l{����e�Q�{�{s�� /����o�&\"��?��v���\0f�y�\0DLy��^\\�L�=�b>����;|��?6,�C�D��u���]F.��ī7�^��ݎ���t���%�@���%��J\r���@G��������u��/P�hyr���DI/����\0,�\0�t���V�}He軩\\��\Z��ލ����>�D//�wGsԱ̗���?��Wm�ζz7utI�ݬ�E�\0��R�k&���k���3����/c�@>XGsTx��v���\0x�����0d�8v������ /�ڟ೻?.�p���o�6=��tëh�n����I=n�bMv�H����z^Be9D�=�2�,�]����a)	g<��\"G� �i{*���{h{��{ti2�z�O=1$��:�F�8�\"��nG��\0����/��=�yF@���c�_Q�J;]�#��q�\"퉣������ɷ���Qʠ�>��w���ȗb����y})������Q��?�;�T��q~FىzV�{d�u6��p���4��$�.>�:S�y(��%�Ua�w��?Xͷ�\0��`w�s�p+�_�w1�v�Z2Y�~�}�W�b�;w��a�jg��ՈE��bq��g\0�a.���R�c��� �����b�k���4F��N��嶯��T�t���v�����!~,�&�4�gϞZ=�#�Xw�K����z�����\'DY���7q��	h.-Ĉp!��z�F��r����z\r��i�`\'�<�L��\0���g⎌\n_r��\n�ă<�W������\0�����baqJ��.����.�����t�q(���Lw�Z,c\r���N�����C��g����{���\01g��ag��Op�+�!z۰������L�t��ڽ��.��>�g�A�t���Ա؍W��=�_H�2�x�b�8��KwX���%��*�&���j�����z��,l{����;:�K��\Z����$\nUW_\"���.~�����ᖞ#ؾ���N�}�\\�9�H��y�����0�E��7�w�c�G:=�;��X�?�i�r=o�K�pw�Ƀ{����_\"��s�BF)��$h�z�;�e�������rF��g�uM��G:\'x�1:�\rA��5\Z��Fv����lO��!(91�$\\in����J�tX�^\\�˄�$��<��|��\Z\n��~��oE�~��\Z㺃���CP0;�À6q�^Cq���������⼗��)dÀ\nJ\"_����7���}��n���m ���i���zDk�������_P�ӽ5Ӻu�e�w���W��9:�L�\\p?dW_����O���Ɔ��?QF9t�rͻ⑮)���k����E3,ۘ����S�zޓ�9���S�������t�\0�}��&����{�c��Cc��͸�W�\r�#}��-���~�}��e�#����\'E�t��Hc�qͅ��`9�\Z~[�����x��>�����Y�����W�/M�M�;.��Hww��tM���X���u����R9�7n\\@}I^oӹ��Ґ\'��@v	G��q>�\\��J]S�s�Fs���>�}�y��S��{Wu�.��~��u\r3ts�s���c\ns7�o�u��4ɵ�<D�x-�3������ ����#���&n�N��GS��|�����3�i����DE�z-����1��?���t\n鲟����?(���_�8�>��6����H��캏x�N䢇��>�Ӂ�?���J�U�Z��rCs1��X�>|��H�K������a��Fc�NY�G��\"xM�4�K����~���H��;�u��u�#zGKٙ�ٵ�|n����vMp!�;�<��۽�v�g�זöE�|6���>�:�V���i��	�\0�\",c5^��\0d��>��K����D#�w��L\0���:^�ۧDȘZ������+����Y�Jz��܊ߘɟؾ��<���929I��~���4ط�~5�(%hc��n���X;V�w�����\0�E��]��}E��\Z�98�@7�y��B�Dy��\0��~3�z�Vs�t�A�q��N�Ap*T,�ʯ����aA=�}�[!���/ˏ���u����{���6�v>n�z���{�Qoz�}Nv����u}�8b�����w3�N�<�����\"�����o#�ǹ&�̇ ����G�ީӻw��t�C�����rnw����ؖ�&c �,�\0mi�:��\0XͶ؁���Ɉ�D�R��u�3��#�q\'2<N�\Z�stM�bj�\r�B��n,#���$)�j����=@���϶Ew6]^�F_�Hv��=�o��${_�◧nZ\\.�X�7��+�꘥��\\|�$|k�^�?1�2V���;�K�_��\0(v��6.��1�6`Y��o�{� |j���0J�>�������|���`~+��Q��2��D��G�a�\0�����殎\\�c��{�`���;w�4�?l�]����������?�\\�M����6��=�<C�\'�cp�M�`RU�F�$9H�:�֐}�N�E����m蔳�����Gnm~�y욺�۩J�Q��C�H]8#M��w�����<�����7�2�^��\0��}��f��+�;ks�~�9����N�\'�z�	P	-^>�J��\0�N����^�\0�Q�S\0j}3�+��}ܳ���3؇����\\�I!�nA`(�����7E���P�/� ��!OW���~\\g�_��+��������ɰ�>�;�r\\�����Ͱ$XH��ho�p����s�2H��i\\��2N~HH���x/f�����(�����G�5�n���v����1��Ӹ��#\\X���/W!�&��\0x]yC���E����I,��\0 ݲ�g�.+��\'�6�Oŏx+����7cy�]y��c띧ڽ��w�d��s��K�w?Oc�b�]���F�E}L�9%4��V���{������Lv��I���DE��������ɓm/�m�g��h�Q�\n��P���\0u��_�]��>�GA���n_��龃��Xx�����ɴ��QÚ���bx�ѷ*�\r���y�\\��Q�X�_o�o�����(GO�Aś��\\���A�y���d=�$��o�6?����|�8�3��\0g���$����GP��߀���0�!	nӪ����c�������{����mϗq���(�W����^3�Ю��S������Γ^�t��D�9]��;�Q*6��\0���ݏ���+|�g;�Ͻ{N����8a��@�\Z{��{۩���V���&�I��.�F�g{8^�@�F��u�rq9�2>����ї+��s�����ǖ�+��\0�ۍ]��6O:]������7w�hw2����\0�`u�9�l�Q�YҾ~�;PZ�>��������GP�)c\r|r�$�%�<*�\n���Wg��t��b~�^èH���u$�7���ވm�tHHj��\'p�Ii�\0�{���!�\0�8�T)u�}oZg����}��˃�hz���F@�?�ѽ�ԙ��=����������~�s;��Pn��fC]$�ˮ�����s;���C�!��RTs`#�˕�,�v{	r��9zș3w0^:��{�b�ﻯi�{o��D;����;v�w;��z��-�=B-��\rt[��p�B\\�K�+�o3m7Ńa8��m�}(�nh�m��W���蒆�sԷp.c�n\0~n�$��~ن�B�wF���N�+\Z�]w���Ƌ0�*�-y��1�*��[���c�,;�␮)�$Sؾ��l���\0g�����v���N�7H��K�AԠ!�\r/\'q�p\\�J�:�����g������+��quL�j��`���kua��k.���.ۮC�\0��F��cI�c|+�t�<�OFqr>\"��ށ3>�����xר�i���z�\"ڷw��q�/g&��\0��g?�$���=�ۀ\Z�\rK؊�;I�c)�b81�=��n��.�]?^�˓,qt���)P��rD�\04n|\\c�:��m�Rd�Vb�?t	6�\r.:�u�Bl�FD��S��ЄG�|�k,�xE���,8�@���\0��e�;o!���;��=�7�u8��\0�\0y[��եm�t����1�K��=�s�+�~���:�r<��`=����/=m`��>���ַs	:tw�\\�t���.Ϥ�&��܆� B�N�����߯���;g����1JD~���w�Oz�6�K���<�-�/7vr�\"�\0���6CQ�Y���\ZUc�y_��>��wS���e��/��_Z�ӎO˼�f0ǚ\'���|?��5tN�B�w�>�qm��`TWU��o�i�\0_�?���>��72�m�/��2�\'������\0��\0��A&�M�����3�&�M��W��c&q��^#����\0��ߔz��.q�a�t��\\�&�G��{����-윫��ׇF�;NI��]W��z��%X琫�	K^�q�u����M�7�F��wm۫�ط���v��n��r:�6ck}d8�t������o�{ȕ\\�[�_d��IϷ��?q�#V1�e������?�Y̓��Hm�s���v�O�)���i����fX�8�W&�N�\'mtNۏPf��E��ͼ��������n����P�N�zC�i�N �I�rl��Q��Rg�\0/�{����N�C�l�6\ZJU��޸��M���.��>M�C��/a���fŪ1$J@�+���S���\r����<Gu%���=��uM��c��$}��=�����X�R�\0��HTAl3���A���ˬ	b������/�]߮\')z�s���ҿL{2���X���]�Ϫ�X�5�̕�}�-����_�4�@����=So��ǉ/�#�x�vq�c#9s0\0�:7zoD����޿����X��i{K���\'�F���\0�u����<N�([��S���ne����f�a�Xt�aP!ɴ<��\0���~����q���11\"�Z�kp6z:����x揾`kn{2w�pݖ=�~�р�o^o����[,�m�?�o�|��@��6����Y��{�\0�d�<�=�ӤK��mӝ����l�Ꝿdz\0v��\"�l�Ld�@������������~�ix�S�A��W����[�\'����qnhL���\0LjH�G:����=q��n�gI�p�=�i��,��`�>f�\r�g^�}6���I팟����\0���yw9zt�7�D��$�}�/��Y��;�x�Ѷ�_����H«\"wF�I���Cg����`k�0OQ���;I��\0����u=+�m��{��>9�0=�m�}��m&{>��M��=�&�F\"��KH�9ѥ��\nw>���%�\0���o�K����v�>�/�=�pt��������{y��Z#	\r�y�~�WO���Ԙ7Q����tns~M�p�Ù��y(t<��s�=��ޙ�雽�<����\"�*=�\Zx�����^����}�)��v{���,�#b�V�EG��y�Sϓ_��lg��r�t��Iψ�ɹ��4d����,�݃��@���oھ��:<��%��֧�W���\0�\'��\0�	��uh�#!o�G�z��;�;už�\'�A\0�v�BqA��~�	������}�^2C\02��.��N_?|u���+���\0~��.��\\�Q�p��8\'�����X���������¡?^�O���ǎ\'�`O��������aӿ.��R������Ν,���\'F����s]#\\��\Z��E�}�H�`�b�s\Z�b����p�41eۙ�4�^V�\0h6Ϗ�M�\rM�n�����zWS�tiu��\0Jw��uB\'�B�I?@���@69{��#�/C�\"r�;\r��n�=�L���=G�����l�fA�=�ǡø���ﵸ�WJ�pak��T����;�u,�S.IFyX��l��\0r�����%���O/є�\"~R(X�qP��˚�\0��b$��~�=3�6;���+v�Sk}M�\0��[�8%v��S��.�u�$�j�>���D7�胸�a	�!�	jS����������@��\0u����v;g���\0�b]�ܟ:��\'hw[ݦɟ�e���_������i�c���{�gn:��Sq0��/wH#{���͖����F�9�¾��\rٟZ�8Ta����z:|�A��ϸ.���}6X���u���6���6s�o��D��,Nl�\nсLk��br��<H>\'��{�Dmc�q�͒ �bb�\0��l~3����.��]��=F>��N����둴n��m��K�D��\0���1Ҕ�0�@!TU��.�y��d�H���?O$~�$��\\E\"ig���\\���^�\0s��?��̡!PƠp<�P�.��n��~7��wܝs}�R>�����*9�O,��}���7��Yr�x���W=�z��;�C�7o�D��M=��M�b�?�o��t�f��\0kJ�ǥ����çPB����W3a�OAn�+c�O�@��x-�:�ؗ�$y�}�C��`p�\']�� >���SM�65���6�a�\0��m�^c�;�g���߹\'�\0;��}��6=��eK�l��n^��N�+�8�rzC���LD�sH�dzshw]k,Z��e���a� x�E�@�;�tw������m��-{J�h��,���������\Z��dI۰��\\���/�����0��3���k����U���(�h?d�p�»L`��w�|��|���z��竌a�1��J�n��ǵ��R(����L�B68�ZEŎ�l���_3�؎]�1<����˛�}��O�����cC���A7?���0C��N����\0���-�,G\Z�����_�\0&?����RoC^��D�7��\0\"uy�v\'���n`�����Α�w�q`��4��-��b�{�s��BӁp�a�o��ow�g��m�D��<�=�f�x.�[�:v�ԑ�P#!�\\p��w��۝�v��n������?��l�B��KE�ɸݻ\0��&qph�Z������u����9�}H��\0��0� �1�&�\\��jv���g�X�UjB�\0��9\n\n�xW��xFm�|&�q�e�61�!�H�c�h�����>��h�]�D��t�Hv���G�v�}N�df�^��[N���	>9x��{��#)��������U����Ϩ��l:�H$b��S��\0��g�#����h\Z/�3��7;����/Pv�T����IKOdov2�ǒ~��o�\"cZ��KK\Z�T�8�02Ċ��yW�ؼ�I�G�yϷd�\0\'�?B ���~pGlz�^�B�����P���N?Yg�\0����O�6<L�N���I��C�(�ME��mq�u	�����֒�$��I����+���L�[�/i��y�{,a�Fg�(~���\0��w?���5�{���N݇n斏�c]������pc�\0uy��	������_�7M�?��\08��D�wݟn9U΍�C�Iw���*�VC�t����	lb>��9��\\��v���Ѥx������?���t=�ʵ����e�r�lc87�mt�����;m�ui�Oy^�`2#,ܙ����F���:c^�ݏJs�\'�|2o%$�(\0T�|<�#6R�\0{�?�BGe<MQ��Hu����Ɲ�I��u6�\0����\n�����o`]����A|�`��o�?\0��lu�\nwn�k4��~)��6Ө�Ff��s3l�4�[1�2�$��	RŮ^�qQtٜ�|��ĝrbr�{+�!�v�/y�,����?V@_�\\w/��Q������ٻ��Ddr��۝����g(�k���m�1��y�G�pr�c�$k���R��`o��G�B_�n�7��b\\���[�gk��X9p��TC���W�={����7v�6���c!�\0��/M\'k~_���+>�;o�:F�\0�����A�1��\rz�\0FHo}3���cɒ#�q揽��2�Fx�݁�e�/�]�6���p�;~��7�7	ո�v-o��7\0$מ�`;=�-����rWѲ��ո�*���A#�7x�sw�ܩ�\\�x��>5�:���M%w7غ����47��r�q��{W�:�[���O�]����C�t-ܯ|������\0�\'A;�F���?���#�α�?�z|v�g{��LX� 8��w���f�����Z���\"H�ӈ����̸g�N��wZ�Ѻ�z7@�];�����\0�����Q�Y�#�]{c�n�j~}��\\�D���>����[��b�|�f.�\0c�XH	K��k���{��m�qc�����.X�LG��g�saX��=��[��#�;\'�ߥo��=�p��۸��=�������W����K�$��qw�\rO��<o����������\0��3�\Z��{I�)G����u�;N������%�<P�9r���c��&h�s�S�;>��_Ľ?��J���\r�w���c.�M�t�os��if�iNq��Iwt��D�\0�3�c�\\qɛ�c��c&<=?jL��r\02a{H�13-��18nw[�������H�y��	3se�G,H�Ŏ$�?(\\^oƝS��w�����o��t�ѿϓsӺt�ݼo��\0L&}��|��Ͷ�WF��˪��3ͅ�#!#&k~�rŘ	)�a0/�c�-����uL��u8F9#LK�~� Lyطՙ�BԐ^����u.��>�c��ſ�}9����\r�_�2���q��W����3���}k ��a9���Vp#���\0���X�[�:+ݧs�]����\\���8� \r���5^����6��ys����Ixx����#��/�}���N�,�?�;{���\Z���W�Ѫ3�?Q���x��<�͕�p�^�\0YKe�6�7��b��\0cu�0������\r��u��J}rn���&4����5Iqr-�Cg8����D�[��,=�T�,�؏P�����<c\"-�C\"Z�DP�.���_�>u��������ܑ�#��$�3f%�5q�;��A�{~�=/����y${���_�Ԓ�\'�ǵ�=�G���^��GM�?�#�D�I�Gu��	^�w7���D�F��\0��W��1��^�j�K���r\'�j�o�1�����L��Ҽ%�y�\n�}�����m��{�Lh�ùf���m�����0��+��[�[�Wg͈6�r7�LKW�����\0�Oe$wU�~3{��7�~�$�n �I�m���V��9W�?C���v/��d������̑��?�j�����d�����\0仨�^U�X�������������z�Q��v������;[~��z������hnv�s	c��}�참C��Tf@�>8�N�!��@�������g�㴛7i�j�����zohv>�Y�ڰn:�\0U|�:8b���}#��$ld{}�s��KZ�I\0W[�mǫ3� �%�!�D�\0�yΕ�.n��Ŋ$�3pk��.����[���7]2C���:S�S7��Żs��]�Տc%f���\Z�j!�����}�Ǿ�es�F�A�}C��?\'M�^L9K�|r-g2��_�\\ӳ�#	���O/EܘX���\'Y{��&�HƖ��3�#�>Xg&ߊ�����J��T�BC��؟�������1���^�ڝ��,��j.��zn�w��dz�:��t�8Y�%�Ƹ�[���j~��|G�� �����;���{O.cx��tW\\َ�߽�ӚL{WnYܛF�}R4�D!#E{]�A��?u/�F9a�����w_�����7R���s���+��\01�m��u�F��6Ѕ:L�dR;N�k�?z�}h�7N����{�_<yd�dEg�ڿE{�����ku����z�N��=����m6�}�� F�M�������fsHcM���\\�������O�SaU�~��Ϻ8���e(�$�\0\0�:��U�]O�u�wOpt}�C��޷��t��͏s���J`s&ds�wp�+D���Kp.j�~�;�q�!� Ո2?F����>�sǸ���vH1�:�A�_�_�ck:_k�4 ���c�v�Jׂ��\n}�8\Z�=�}��۟e1�+��ņ\\��2?u\n�>��wqw���*�m��뻶�m�d�Gqr�ws�v�o-�8F(��,G����˿��������#ڽ\n��7��_@�F\r�_���ېⰍ�w���Ӧ>O��i������0;*�#��P�\"�yI�H�?�I��RŽ4\'0��4?�U`��g�~��Om�۶�`\\׻^߫���K��I�b\rs:g����-����+�֠Z��O�����^��=�nozn���6��/N�t��+vgpͱ�u����6�)aO��F�K�׹�7{.����d5q��~��I�\'Խ0c-�ng �$pw�ػ���0u>����A�c�}��>�X��V�t��,rı��H�5C��U\ryMs��[�����%��F_��:��X×S�a���C��loe�^��v�\0��\\���h�d�ylfS�4�?m��d `�\Z��0�}Zp�\\����brl��K��Ee��/���\0�������\0�ǧ�������@�rz�0�N�=�ό���o��#��柑��t�8tƅ\ZB��%�9�G���\0K,����/��Z�a��!A8��#%��zN�~!�-��V���_Q��\"|��\0ɹ���D�I�L�n��H������i����ۂ�>�r�K�X�G(��E,��2�/i�C��!�۬������^}�/9祆�w[i�u�l�8�W2��s�;oW�q��\0Jff$[�`��{��)���F\'�Q~{n6g�~|�Κ����O\\�RnKwf�u���i�m~�t�M���\"2zg���H��p�\0�O�����sG˓k;�C�b��^v��ޅ.�n �t���o�������\Z�FU�4;op4��\\+�t��b;�RP��Wp{�Q�>��6����X�6�,�� X����CR$CŮ��\0wڝ?��,i/bC�y%�{�ǡ��B��\0�\\)��?_o�M�����.A�F�&cq��ؼU��uIft��ӫu����_:���l|��=��]砰}N��w!��ۚ����%��bH<Ә�\'�Wc~j�\r迍�_�#\\�ٟ���S��\';�2��p,��ʞM���y��\"}�+���g�V�����','#587d1e',NULL,NULL,NULL);
/*!40000 ALTER TABLE `gambarlatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indikator`
--

DROP TABLE IF EXISTS `indikator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indikator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `indikator` varchar(255) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `pemilik` varchar(30) CHARACTER SET utf8 NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_indikator_pegawai` (`pemilik`),
  KEY `FK_indikator_pelajaran` (`idpelajaran`),
  CONSTRAINT `FK_indikator_pegawai` FOREIGN KEY (`pemilik`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_indikator_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indikator`
--

LOCK TABLES `indikator` WRITE;
/*!40000 ALTER TABLE `indikator` DISABLE KEYS */;
/*!40000 ALTER TABLE `indikator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwalujian`
--

DROP TABLE IF EXISTS `jadwalujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwalujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jamawal` varchar(5) NOT NULL,
  `jamakhir` varchar(5) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jadwalujian_ujian` (`idujian`),
  CONSTRAINT `FK_jadwalujian_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwalujian`
--

LOCK TABLES `jadwalujian` WRITE;
/*!40000 ALTER TABLE `jadwalujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `jadwalujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jawabanesai`
--

DROP TABLE IF EXISTS `jawabanesai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jawabanesai` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `jawaban` mediumtext,
  `jawabanim` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jawabanesai_soal` (`idsoal`),
  CONSTRAINT `FK_jawabanesai_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jawabanesai`
--

LOCK TABLES `jawabanesai` WRITE;
/*!40000 ALTER TABLE `jawabanesai` DISABLE KEYS */;
/*!40000 ALTER TABLE `jawabanesai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rootid` int(10) unsigned NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `kode` varchar(10) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `deskripsi` varchar(1000) DEFAULT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kategori_pegawai` (`nip`),
  KEY `FK_kategori_departemen` (`departemen`),
  KEY `FK_kategori_pelajaran` (`idpelajaran`),
  CONSTRAINT `FK_kategori_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_kategori_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_kategori_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompokpeserta`
--

DROP TABLE IF EXISTS `kelompokpeserta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompokpeserta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(2555) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_kelompokpeserta_departemen` (`departemen`),
  CONSTRAINT `FK_kelompokpeserta_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompokpeserta`
--

LOCK TABLES `kelompokpeserta` WRITE;
/*!40000 ALTER TABLE `kelompokpeserta` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompokpeserta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laporakad`
--

DROP TABLE IF EXISTS `laporakad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laporakad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujiancbe` int(10) unsigned NOT NULL,
  `idujianakad` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `idaturan` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `ndata` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_laporakad_ujian` (`idujiancbe`),
  KEY `FK_laporakad_ujianakad` (`idujianakad`),
  KEY `FK_laporakad_semester` (`idsemester`),
  KEY `FK_laporakad_kelas` (`idkelas`),
  KEY `FK_laporakad_aturannhb` (`idaturan`),
  CONSTRAINT `FK_laporakad_aturannhb` FOREIGN KEY (`idaturan`) REFERENCES `jbsakad`.`aturannhb` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_laporakad_kelas` FOREIGN KEY (`idkelas`) REFERENCES `jbsakad`.`kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_laporakad_semester` FOREIGN KEY (`idsemester`) REFERENCES `jbsakad`.`semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_laporakad_ujian` FOREIGN KEY (`idujiancbe`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_laporakad_ujianakad` FOREIGN KEY (`idujianakad`) REFERENCES `jbsakad`.`ujian` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporakad`
--

LOCK TABLES `laporakad` WRITE;
/*!40000 ALTER TABLE `laporakad` DISABLE KEYS */;
/*!40000 ALTER TABLE `laporakad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loghistory`
--

DROP TABLE IF EXISTS `loghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loghistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logtime` datetime NOT NULL,
  `userid` varchar(45) NOT NULL,
  `username` varchar(255) NOT NULL,
  `sessionid` varchar(45) NOT NULL,
  `application` varchar(10) NOT NULL,
  `localip` varchar(255) NOT NULL,
  `deviceinfo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_loghistory` (`logtime`,`userid`,`application`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loghistory`
--

LOCK TABLES `loghistory` WRITE;
/*!40000 ALTER TABLE `loghistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `loghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logosekolah`
--

DROP TABLE IF EXISTS `logosekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logosekolah` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logo` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logosekolah`
--

LOCK TABLES `logosekolah` WRITE;
/*!40000 ALTER TABLE `logosekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `logosekolah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msghistory`
--

DROP TABLE IF EXISTS `msghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msghistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sessionid` varchar(45) DEFAULT NULL,
  `msgtime` datetime NOT NULL,
  `fromid` varchar(45) NOT NULL,
  `fromname` varchar(255) NOT NULL,
  `toid` varchar(45) NOT NULL,
  `toname` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `msgtype` varchar(2) NOT NULL COMMENT 'BC CH',
  PRIMARY KEY (`id`),
  KEY `IX_msghistory` (`sessionid`,`msgtime`,`msgtype`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msghistory`
--

LOCK TABLES `msghistory` WRITE;
/*!40000 ALTER TABLE `msghistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `msghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other`
--

DROP TABLE IF EXISTS `other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other` (
  `nouser` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nouser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other`
--

LOCK TABLES `other` WRITE;
/*!40000 ALTER TABLE `other` DISABLE KEYS */;
/*!40000 ALTER TABLE `other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengujian`
--

DROP TABLE IF EXISTS `pengujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggalbuat` datetime NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `idtahunajaran` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL COMMENT '0 Departemen, 1 Tingkat, 2 Kelas, 3 Kelompok, 4 KelompokCs',
  `idtingkat` int(10) unsigned DEFAULT NULL,
  `idsemester` int(10) unsigned DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal1` date DEFAULT NULL,
  `tanggal2` date DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 Umum 1 Tertutup',
  `pemilik` varchar(30) CHARACTER SET utf8 NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pengujian_departemen` (`departemen`),
  KEY `FK_pengujian_pelajaran` (`idpelajaran`),
  KEY `FK_pengujian_tingkat` (`idtingkat`),
  KEY `FK_pengujian_pegawai` (`pemilik`),
  KEY `FK_pengujian_tahunajaran` (`idtahunajaran`),
  KEY `FK_pengujian_semester` (`idsemester`),
  KEY `IX_pengujian_tanggalbuat` (`tanggalbuat`),
  CONSTRAINT `FK_pengujian_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujian_pegawai` FOREIGN KEY (`pemilik`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujian_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujian_semester` FOREIGN KEY (`idsemester`) REFERENCES `jbsakad`.`semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujian_tahunajaran` FOREIGN KEY (`idtahunajaran`) REFERENCES `jbsakad`.`tahunajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujian_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengujian`
--

LOCK TABLES `pengujian` WRITE;
/*!40000 ALTER TABLE `pengujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengujiankelas`
--

DROP TABLE IF EXISTS `pengujiankelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengujiankelas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengujian` int(10) unsigned NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pengujiankelas_pengujian` (`idpengujian`),
  KEY `FK_pengujiankelas_kelas` (`idkelas`),
  CONSTRAINT `FK_pengujiankelas_kelas` FOREIGN KEY (`idkelas`) REFERENCES `jbsakad`.`kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujiankelas_pengujian` FOREIGN KEY (`idpengujian`) REFERENCES `pengujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengujiankelas`
--

LOCK TABLES `pengujiankelas` WRITE;
/*!40000 ALTER TABLE `pengujiankelas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengujiankelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengujiankelompok`
--

DROP TABLE IF EXISTS `pengujiankelompok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengujiankelompok` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengujian` int(10) unsigned NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pengujiankelompok_pengujian` (`idpengujian`),
  KEY `FK_pengujiankelompok_kelompokpeserta` (`idkelompok`),
  CONSTRAINT `FK_pengujiankelompok_kelompokpeserta` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokpeserta` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujiankelompok_pengujian` FOREIGN KEY (`idpengujian`) REFERENCES `pengujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengujiankelompok`
--

LOCK TABLES `pengujiankelompok` WRITE;
/*!40000 ALTER TABLE `pengujiankelompok` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengujiankelompok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengujiankelompokcs`
--

DROP TABLE IF EXISTS `pengujiankelompokcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengujiankelompokcs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengujian` int(10) unsigned NOT NULL,
  `idkelompokcs` int(10) unsigned NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pengujiankelompokcs_pengujian` (`idpengujian`),
  KEY `FK_pengujiankelompokcs_kelompokcs` (`idkelompokcs`),
  CONSTRAINT `FK_pengujiankelompokcs_kelompokcs` FOREIGN KEY (`idkelompokcs`) REFERENCES `jbsakad`.`kelompokcalonsiswa` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujiankelompokcs_pengujian` FOREIGN KEY (`idpengujian`) REFERENCES `pengujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengujiankelompokcs`
--

LOCK TABLES `pengujiankelompokcs` WRITE;
/*!40000 ALTER TABLE `pengujiankelompokcs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengujiankelompokcs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesertaremed`
--

DROP TABLE IF EXISTS `pesertaremed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesertaremed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujianremed` int(10) unsigned NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL COMMENT '1 Pegawai 2 Siswa 3 Calon Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pesertaremed_siswa` (`nis`),
  KEY `FK_pesertaremed_pegawai` (`nip`),
  KEY `FK_pesertaremed_ujian` (`idujianremed`),
  KEY `FK_pesertaremed_calonsiswa` (`nic`),
  CONSTRAINT `FK_pesertaremed_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pesertaremed_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pesertaremed_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pesertaremed_ujian` FOREIGN KEY (`idujianremed`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesertaremed`
--

LOCK TABLES `pesertaremed` WRITE;
/*!40000 ALTER TABLE `pesertaremed` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesertaremed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayatsms`
--

DROP TABLE IF EXISTS `riwayatsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayatsms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujianserta` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `sms` varchar(1000) NOT NULL,
  `nomor` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_riwayatsms_ujianserta` (`idujianserta`),
  KEY `IX_riwayatsms_tanggal` (`tanggal`),
  CONSTRAINT `FK_riwayatsms_ujianserta` FOREIGN KEY (`idujianserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayatsms`
--

LOCK TABLES `riwayatsms` WRITE;
/*!40000 ALTER TABLE `riwayatsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `riwayatsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruangan`
--

DROP TABLE IF EXISTS `ruangan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruangan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruangan` varchar(45) NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruangan`
--

LOCK TABLES `ruangan` WRITE;
/*!40000 ALTER TABLE `ruangan` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruangan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nilais` varchar(255) DEFAULT NULL,
  `nilaib` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soal`
--

DROP TABLE IF EXISTS `soal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `pemilik` varchar(30) CHARACTER SET utf8 NOT NULL,
  `penyusun` varchar(30) CHARACTER SET utf8 NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `idtingkat` int(10) unsigned DEFAULT NULL,
  `idsemester` int(10) unsigned DEFAULT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `idkategori` int(10) unsigned DEFAULT NULL,
  `idtema` int(10) unsigned DEFAULT NULL,
  `idindikator` int(10) unsigned DEFAULT NULL,
  `katakunci` varchar(255) NOT NULL,
  `deskripsi` varchar(1000) DEFAULT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Ganda, 1 Kompleks, 2 Sebab Akibat, 3 Essay',
  `sifat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Public 1 Private 2 Draft',
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `bobot` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '0 Sangat Mudah 1 Mudah 2 Normal 3 Sulit 4 Sangat Sulit',
  `infojawaban` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Terpisaj 1 Menyatu',
  `approved` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 approved',
  `filemedia` varchar(255) DEFAULT NULL,
  `namefilemedia` varchar(255) DEFAULT NULL,
  `waktu` int(10) unsigned NOT NULL DEFAULT '1',
  `persis` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soal_pegawai` (`pemilik`),
  KEY `FK_soal_pegawai_penyusun` (`penyusun`),
  KEY `FK_soal_kategori` (`idkategori`),
  KEY `FK_soal_tema` (`idtema`),
  KEY `FK_soal_departemen` (`departemen`),
  KEY `FK_soal_tingkat` (`idtingkat`),
  KEY `FK_soal_semester` (`idsemester`),
  KEY `FK_soal_pelajaran` (`idpelajaran`),
  CONSTRAINT `FK_soal_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_kategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_pegawai` FOREIGN KEY (`pemilik`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_pegawai_penyusun` FOREIGN KEY (`penyusun`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_semester` FOREIGN KEY (`idsemester`) REFERENCES `jbsakad`.`semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_tema` FOREIGN KEY (`idtema`) REFERENCES `tema` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soal`
--

LOCK TABLES `soal` WRITE;
/*!40000 ALTER TABLE `soal` DISABLE KEYS */;
/*!40000 ALTER TABLE `soal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalakses`
--

DROP TABLE IF EXISTS `soalakses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalakses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `pengakses` varchar(30) CHARACTER SET utf8 NOT NULL,
  `pemberi` varchar(30) CHARACTER SET utf8 NOT NULL,
  `tanggal` datetime NOT NULL,
  `pengontrol` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soalakses_soal` (`idsoal`),
  KEY `FK_soalakses_pegawai` (`pengakses`),
  KEY `FK_soalakses_pemberi_pegawai` (`pemberi`),
  KEY `IX_soalakses` (`idsoal`,`pengakses`,`pemberi`),
  CONSTRAINT `FK_soalakses_pegawai` FOREIGN KEY (`pengakses`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soalakses_pemberi_pegawai` FOREIGN KEY (`pemberi`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soalakses_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalakses`
--

LOCK TABLES `soalakses` WRITE;
/*!40000 ALTER TABLE `soalakses` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalakses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalesai`
--

DROP TABLE IF EXISTS `soalesai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalesai` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `soaldata` mediumblob NOT NULL,
  `soal` mediumblob NOT NULL,
  `penjelasandata` mediumblob,
  `penjelasan` mediumblob,
  `jenisjawaban` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Text 1 Image',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_soalesai` (`idsoal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalesai`
--

LOCK TABLES `soalesai` WRITE;
/*!40000 ALTER TABLE `soalesai` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalesai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalganda`
--

DROP TABLE IF EXISTS `soalganda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalganda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `soaldata` mediumblob NOT NULL,
  `soal` mediumblob NOT NULL,
  `adata` mediumblob,
  `a` mediumblob,
  `bdata` mediumblob,
  `b` mediumblob,
  `cdata` mediumblob,
  `c` mediumblob,
  `ddata` mediumblob,
  `d` mediumblob,
  `edata` mediumblob,
  `e` mediumblob,
  `npilihan` tinyint(3) unsigned NOT NULL,
  `jawaban` varchar(1000) NOT NULL,
  `penjelasandata` mediumblob,
  `penjelasan` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_soalganda` (`idsoal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalganda`
--

LOCK TABLES `soalganda` WRITE;
/*!40000 ALTER TABLE `soalganda` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalganda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalkompleks`
--

DROP TABLE IF EXISTS `soalkompleks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalkompleks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `soaldata` mediumblob NOT NULL,
  `soal` mediumblob NOT NULL,
  `adata` mediumblob,
  `a` mediumblob,
  `bdata` mediumblob,
  `b` mediumblob,
  `cdata` mediumblob,
  `c` mediumblob,
  `ddata` mediumblob,
  `d` mediumblob,
  `jawaban` varchar(1000) NOT NULL,
  `penjelasandata` mediumblob,
  `penjelasan` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_soalkompleks` (`idsoal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalkompleks`
--

LOCK TABLES `soalkompleks` WRITE;
/*!40000 ALTER TABLE `soalkompleks` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalkompleks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalmultiganda`
--

DROP TABLE IF EXISTS `soalmultiganda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalmultiganda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `soaldata` mediumblob NOT NULL,
  `soal` mediumblob NOT NULL,
  `adata` mediumblob,
  `a` mediumblob,
  `bdata` mediumblob,
  `b` mediumblob,
  `cdata` mediumblob,
  `c` mediumblob,
  `ddata` mediumblob,
  `d` mediumblob,
  `edata` mediumblob,
  `e` mediumblob,
  `fdata` mediumblob,
  `f` mediumblob,
  `gdata` mediumblob,
  `g` mediumblob,
  `hdata` mediumblob,
  `h` mediumblob,
  `idata` mediumblob,
  `i` mediumblob,
  `jdata` mediumblob,
  `j` mediumblob,
  `npilihan` tinyint(3) unsigned NOT NULL,
  `jawaban` varchar(1000) NOT NULL,
  `penjelasandata` mediumblob,
  `penjelasan` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_soalmultiganda` (`idsoal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalmultiganda`
--

LOCK TABLES `soalmultiganda` WRITE;
/*!40000 ALTER TABLE `soalmultiganda` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalmultiganda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalsebab`
--

DROP TABLE IF EXISTS `soalsebab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalsebab` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `soaldata` mediumblob NOT NULL,
  `soal` mediumblob NOT NULL,
  `jawaban` varchar(1000) NOT NULL,
  `penjelasandata` mediumblob,
  `penjelasan` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_soalsebab` (`idsoal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalsebab`
--

LOCK TABLES `soalsebab` WRITE;
/*!40000 ALTER TABLE `soalsebab` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalsebab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalujian`
--

DROP TABLE IF EXISTS `soalujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `bobot` decimal(5,2) NOT NULL,
  `bobots` decimal(5,2) NOT NULL DEFAULT '0.00',
  `nplay` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Berkali, 1 Sekali',
  `keterangan` varchar(255) DEFAULT NULL,
  `owner` varchar(30) CHARACTER SET utf8 NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soalujian_ujian` (`idujian`),
  KEY `FK_soalujian_soal` (`idsoal`),
  KEY `FK_soalujian_pegawai` (`owner`),
  KEY `IX_soal` (`idujian`,`idsoal`),
  CONSTRAINT `FK_soalujian_pegawai` FOREIGN KEY (`owner`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soalujian_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soalujian_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalujian`
--

LOCK TABLES `soalujian` WRITE;
/*!40000 ALTER TABLE `soalujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `splang00`
--

DROP TABLE IF EXISTS `splang00`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `splang00` (
  `tipe` varchar(20) NOT NULL,
  `nilai` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `splang00`
--

LOCK TABLES `splang00` WRITE;
/*!40000 ALTER TABLE `splang00` DISABLE KEYS */;
INSERT INTO `splang00` VALUES ('DBID1','4AUG54B13SDUJ6DCX35FW6C1H13QE7X2UC5G4MREMKX61SYCMCU6XYQ6738EAVV5','Please Don\'t Change OR Delete This Value'),('DBID2','3LAGB5GLMZ3MJE8YB1DCN1E4V7JBNMDZX2DQSSAQ4JU65DX33JDJRSRBFEUCWF7A','Please Don\'t Change OR Delete This Value'),('DBID3','WCXQBTGTZXHDGH8SKQHDH3HFKBJM672YLUK2PG1JCUS3KM47FC2G63123SF8J4V2','Please Don\'t Change OR Delete This Value'),('DBID4','4S2W6FCCX7BXLP56GLF4EU1R2R76B2AH7Z81UGA88ZT72CRPWH27X1XK1K3QHFA4','Please Don\'t Change OR Delete This Value'),('DBID5','73ZUQDM8KG4PA2YZATK38BTFBX8JNU13YXA8L58S53WQ6HJ7VCPX5G55JTS1ECUZ','Please Don\'t Change OR Delete This Value'),('DBID6','PAYM2ZNDT17FPCJ3PBWKEC7S2DY2MHN2H5B5S6E5YKEDHYRFJYLCQKULCGTYAV1L','Please Don\'t Change OR Delete This Value'),('DBID7','NF6SBNKS51V374JCVTSX6KL7LY3LMQ4DT2YC18D5P2FYXZNG7QCRCDPC38GMT8FQ','Please Don\'t Change OR Delete This Value'),('DBID8','5SKEEFKWPVHDEWJULVM5MNAQNWJ121MPWZ2FQHC1FQCQ4K7FZVB7VJDRR31S6S4W','Please Don\'t Change OR Delete This Value');
/*!40000 ALTER TABLE `splang00` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `tema` varchar(255) NOT NULL,
  `deskripsi` varchar(1000) DEFAULT NULL,
  `pemilik` varchar(30) CHARACTER SET utf8 NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tema_pelajaran` (`idpelajaran`),
  KEY `FK_tema_pegawai` (`pemilik`),
  CONSTRAINT `FK_tema_pegawai` FOREIGN KEY (`pemilik`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tema_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timadmin`
--

DROP TABLE IF EXISTS `timadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timadmin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) CHARACTER SET utf8 NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_timadmin_pegawai` (`userid`),
  CONSTRAINT `FK_timadmin_pegawai` FOREIGN KEY (`userid`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timadmin`
--

LOCK TABLES `timadmin` WRITE;
/*!40000 ALTER TABLE `timadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `timadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timpengujian`
--

DROP TABLE IF EXISTS `timpengujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timpengujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengujian` int(10) unsigned NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Penguji, 1 Penilai, 2 Pengontrol',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pengujianpemilik_pengujian` (`idpengujian`),
  KEY `FK_pengujianpemilik_pegawai` (`nip`),
  CONSTRAINT `FK_pengujianpemilik_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujianpemilik_pengujian` FOREIGN KEY (`idpengujian`) REFERENCES `pengujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timpengujian`
--

LOCK TABLES `timpengujian` WRITE;
/*!40000 ALTER TABLE `timpengujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `timpengujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujian`
--

DROP TABLE IF EXISTS `ujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengujian` int(10) unsigned NOT NULL,
  `judul` varchar(255) NOT NULL,
  `clienttype` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '1 PC Android, 2 PC Only',
  `keterangan` varchar(1000) DEFAULT NULL,
  `randomsoal` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `randomjwb` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `jadwal` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0 tidak ditentukan 1 ditentukan',
  `pemilik` varchar(30) CHARACTER SET utf8 NOT NULL,
  `tanggal` datetime NOT NULL,
  `nsoal` int(10) unsigned NOT NULL,
  `nfollow` int(10) unsigned NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `durasi` int(10) unsigned NOT NULL DEFAULT '1',
  `viewkey` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `viewexp` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `viewresult` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `viewsoal` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `viewafter` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowprint` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `skalanilai` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `kkm` decimal(5,2) NOT NULL DEFAULT '0.00',
  `isremed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idremedujian` int(10) unsigned DEFAULT NULL,
  `idruangan` int(10) unsigned NOT NULL,
  `sendsms` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `formatsms` varchar(1000) DEFAULT NULL,
  `allowonline` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `allowoffline` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ujiantoken` varchar(10) NOT NULL,
  `nosubmitdate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `submitdate` datetime DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujian_pengujian` (`idpengujian`),
  KEY `FK_ujian_pegawai` (`pemilik`),
  KEY `FK_ujian_ruangan` (`idruangan`),
  KEY `FK_ujian_remedujian` (`idremedujian`),
  CONSTRAINT `FK_ujian_pegawai` FOREIGN KEY (`pemilik`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_pengujian` FOREIGN KEY (`idpengujian`) REFERENCES `pengujian` (`id`),
  CONSTRAINT `FK_ujian_remedujian` FOREIGN KEY (`idremedujian`) REFERENCES `ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_ruangan` FOREIGN KEY (`idruangan`) REFERENCES `ruangan` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian`
--

LOCK TABLES `ujian` WRITE;
/*!40000 ALTER TABLE `ujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujiandata`
--

DROP TABLE IF EXISTS `ujiandata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujiandata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idserta` int(10) unsigned NOT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '''0 string 1 datatable''',
  `jawaban` mediumtext,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujiandata_soal` (`idsoal`),
  KEY `FK_ujiandata_ujianserta` (`idserta`),
  KEY `IX_ujiandata` (`idserta`,`idsoal`),
  CONSTRAINT `FK_ujiandata_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujiandata_ujianserta` FOREIGN KEY (`idserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujiandata`
--

LOCK TABLES `ujiandata` WRITE;
/*!40000 ALTER TABLE `ujiandata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujiandata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujiandataesai`
--

DROP TABLE IF EXISTS `ujiandataesai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujiandataesai` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idserta` int(10) unsigned NOT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '''0 string 1 gambar''',
  `jawaban` mediumtext,
  `jawabanim` mediumblob,
  `hasil` tinyint(3) NOT NULL DEFAULT '0' COMMENT '-1, 0 Not Veri, 1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujiandataesai_soal` (`idsoal`),
  KEY `FK_ujiandataesai_ujianserta` (`idserta`),
  KEY `IX_ujiandataesai` (`idserta`,`idsoal`),
  CONSTRAINT `FK_ujiandataesai_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujiandataesai_ujianserta` FOREIGN KEY (`idserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujiandataesai`
--

LOCK TABLES `ujiandataesai` WRITE;
/*!40000 ALTER TABLE `ujiandataesai` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujiandataesai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujianserta`
--

DROP TABLE IF EXISTS `ujianserta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujianserta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL,
  `jenispeserta` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 Pegawai 2 Siswa 3 Calon Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '-1 Pending 0 Progress 1 Finish Wait 2 Finish All',
  `elapsed` int(10) unsigned NOT NULL DEFAULT '0',
  `jbenar` int(10) unsigned NOT NULL DEFAULT '0',
  `jsalah` int(10) unsigned NOT NULL DEFAULT '0',
  `tbobot` decimal(5,2) NOT NULL DEFAULT '0.00',
  `tnilai` decimal(5,2) NOT NULL DEFAULT '0.00',
  `nilai` decimal(5,2) NOT NULL DEFAULT '0.00',
  `lastdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idujianremed` int(10) unsigned DEFAULT NULL,
  `smssent` tinyint(1) NOT NULL DEFAULT '0',
  `smssentdate` datetime DEFAULT NULL,
  `smsmsg` varchar(1500) DEFAULT NULL,
  `ujianmode` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1 Online, 2 Offline',
  `clienttype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `downloadstatus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujianserta_ujian` (`idujian`),
  KEY `FK_ujianserta_siswa` (`nis`),
  KEY `FK_ujianserta_pegawai` (`nip`),
  KEY `FK_ujianserta_ujianremed` (`idujianremed`),
  KEY `FK_ujianserta_calonsiswa` (`nic`),
  KEY `IX_ujianserta` (`idujian`,`nis`,`nip`,`nic`),
  KEY `IX_ujianserta_2` (`idujianremed`,`status`,`lastdata`,`ujianmode`,`downloadstatus`),
  CONSTRAINT `FK_ujianserta_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianserta_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianserta_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianserta_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianserta_ujianremed` FOREIGN KEY (`idujianremed`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujianserta`
--

LOCK TABLES `ujianserta` WRITE;
/*!40000 ALTER TABLE `ujianserta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujianserta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujiansertasel`
--

DROP TABLE IF EXISTS `ujiansertasel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujiansertasel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujianserta` int(10) unsigned NOT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `urutan` varchar(10) NOT NULL,
  `hasil` tinyint(3) NOT NULL DEFAULT '0' COMMENT '-1,0 Belum Veri,1',
  `bobot` decimal(5,2) NOT NULL DEFAULT '0.00',
  `nplay` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujiansertasel_soal` (`idsoal`),
  KEY `FK_ujiansertasel_ujianserta` (`idujianserta`),
  KEY `IX_ujiansertasel` (`idujianserta`,`idsoal`),
  CONSTRAINT `FK_ujiansertasel_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujiansertasel_ujianserta` FOREIGN KEY (`idujianserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujiansertasel`
--

LOCK TABLES `ujiansertasel` WRITE;
/*!40000 ALTER TABLE `ujiansertasel` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujiansertasel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujianstatindikator`
--

DROP TABLE IF EXISTS `ujianstatindikator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujianstatindikator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujianserta` int(10) unsigned NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `idindikator` int(10) unsigned DEFAULT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `hasil` tinyint(3) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 Pegawai 2 Siswa',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujianstatindikator_ujianserta` (`idujianserta`),
  KEY `FK_ujianstatindikator_indikator` (`idindikator`),
  KEY `FK_ujianstatindikator_siswa` (`nis`),
  KEY `FK_ujianstatindikator_pegawai` (`nip`),
  KEY `FK_ujianstatindikator_idsoal` (`idsoal`),
  KEY `FK_ujianstatindikator_calonsiswa` (`nic`),
  KEY `IX_ujianstatindikator` (`idujianserta`,`nip`,`nis`,`nic`,`idindikator`,`idsoal`),
  CONSTRAINT `FK_ujianstatindikator_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatindikator_idsoal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatindikator_indikator` FOREIGN KEY (`idindikator`) REFERENCES `indikator` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatindikator_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatindikator_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatindikator_ujianserta` FOREIGN KEY (`idujianserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujianstatindikator`
--

LOCK TABLES `ujianstatindikator` WRITE;
/*!40000 ALTER TABLE `ujianstatindikator` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujianstatindikator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujianstatkategori`
--

DROP TABLE IF EXISTS `ujianstatkategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujianstatkategori` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujianserta` int(10) unsigned NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `idkategori` int(10) unsigned DEFAULT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `hasil` tinyint(3) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 Pegawai 2 Siswa',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujianstatkategori_siswa` (`nis`),
  KEY `FK_ujianstatkategori_pegawai` (`nip`),
  KEY `FK_ujianstatkategori_ujianserta` (`idujianserta`),
  KEY `FK_ujianstatkategori_kategori` (`idkategori`),
  KEY `FK_ujianstatkategori_idsoal` (`idsoal`),
  KEY `FK_ujianstatkategori_calonsiswa` (`nic`),
  KEY `IX_ujianstatkategori` (`idujianserta`,`nip`,`nis`,`nic`,`idkategori`,`idsoal`),
  CONSTRAINT `FK_ujianstatkategori_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatkategori_idsoal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatkategori_kategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatkategori_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatkategori_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatkategori_ujianserta` FOREIGN KEY (`idujianserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujianstatkategori`
--

LOCK TABLES `ujianstatkategori` WRITE;
/*!40000 ALTER TABLE `ujianstatkategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujianstatkategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujianstattema`
--

DROP TABLE IF EXISTS `ujianstattema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujianstattema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujianserta` int(10) unsigned NOT NULL,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `idtema` int(10) unsigned DEFAULT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `hasil` tinyint(3) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 Pegawai 2 Siswa',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujianstattema_ujianserta` (`idujianserta`),
  KEY `FK_ujianstattema_tema` (`idtema`),
  KEY `FK_ujianstattema_siswa` (`nis`),
  KEY `FK_ujianstattema_pegawai` (`nip`),
  KEY `FK_ujianstattema_soal` (`idsoal`),
  KEY `FK_ujianstattema_calonsiswa` (`nic`),
  KEY `IX_ujianstattema` (`idujianserta`,`nis`,`nip`,`nic`,`idtema`,`idsoal`),
  CONSTRAINT `FK_ujianstattema_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstattema_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstattema_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstattema_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstattema_tema` FOREIGN KEY (`idtema`) REFERENCES `tema` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstattema_ujianserta` FOREIGN KEY (`idujianserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujianstattema`
--

LOCK TABLES `ujianstattema` WRITE;
/*!40000 ALTER TABLE `ujianstattema` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujianstattema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdepartemen`
--

DROP TABLE IF EXISTS `userdepartemen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdepartemen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) CHARACTER SET utf8 NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `grantee` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_userdepartemen_pegawai` (`userid`),
  KEY `FK_userdepartemen_departemen` (`departemen`),
  KEY `FK_userdepartemen_pegawai_2` (`grantee`),
  CONSTRAINT `FK_userdepartemen_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_userdepartemen_pegawai` FOREIGN KEY (`userid`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_userdepartemen_pegawai_2` FOREIGN KEY (`grantee`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdepartemen`
--

LOCK TABLES `userdepartemen` WRITE;
/*!40000 ALTER TABLE `userdepartemen` DISABLE KEYS */;
/*!40000 ALTER TABLE `userdepartemen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpelajaran`
--

DROP TABLE IF EXISTS `userpelajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpelajaran` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) CHARACTER SET utf8 NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `grantee` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 Guru 2 Staf',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_userpelajaran_pegawai` (`userid`),
  KEY `FK_userpelajaran_pelajaran` (`idpelajaran`),
  KEY `FK_userpelajaran_pegawai_2` (`grantee`),
  CONSTRAINT `FK_userpelajaran_pegawai` FOREIGN KEY (`userid`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_userpelajaran_pegawai_2` FOREIGN KEY (`grantee`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_userpelajaran_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpelajaran`
--

LOCK TABLES `userpelajaran` WRITE;
/*!40000 ALTER TABLE `userpelajaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpelajaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webuserinfo`
--

DROP TABLE IF EXISTS `webuserinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webuserinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `sessionid` varchar(128) NOT NULL,
  `userpict` mediumtext NOT NULL,
  `welcome` mediumtext NOT NULL,
  `logintime` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_webuserinfo` (`userid`,`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webuserinfo`
--

LOCK TABLES `webuserinfo` WRITE;
/*!40000 ALTER TABLE `webuserinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `webuserinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webuserintent`
--

DROP TABLE IF EXISTS `webuserintent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webuserintent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `sessionid` varchar(128) NOT NULL,
  `intent` mediumtext NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webuserintent` (`userid`,`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webuserintent`
--

LOCK TABLES `webuserintent` WRITE;
/*!40000 ALTER TABLE `webuserintent` DISABLE KEYS */;
/*!40000 ALTER TABLE `webuserintent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webusersoal`
--

DROP TABLE IF EXISTS `webusersoal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webusersoal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `idujianserta` int(10) unsigned NOT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `soal` varchar(10) NOT NULL,
  `soalthumb` varchar(10) NOT NULL,
  `penjelasan` varchar(10) NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL,
  `jenisessay` tinyint(3) unsigned NOT NULL,
  `njawaban` int(10) unsigned NOT NULL,
  `soalgabungjawaban` tinyint(3) unsigned NOT NULL,
  `bobot` int(10) unsigned NOT NULL DEFAULT '0',
  `departemen` varchar(100) NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `pelajaran` varchar(100) NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL DEFAULT '0',
  `tingkat` varchar(100) NOT NULL,
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `semester` varchar(100) NOT NULL,
  `idkategori` int(10) unsigned NOT NULL DEFAULT '0',
  `kategori` varchar(100) NOT NULL,
  `idindikator` int(10) unsigned NOT NULL DEFAULT '0',
  `indikator` varchar(100) NOT NULL,
  `idtema` int(10) unsigned NOT NULL DEFAULT '0',
  `tema` varchar(100) NOT NULL,
  `resdir` varchar(45) NOT NULL DEFAULT '-',
  PRIMARY KEY (`id`),
  KEY `FK_webusersoal_ujianserta` (`idujianserta`),
  KEY `FK_webusersoal_soal` (`idsoal`),
  KEY `ix_webusersoal` (`userid`,`idujianserta`,`idsoal`),
  CONSTRAINT `FK_webusersoal_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_webusersoal_ujianserta` FOREIGN KEY (`idujianserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webusersoal`
--

LOCK TABLES `webusersoal` WRITE;
/*!40000 ALTER TABLE `webusersoal` DISABLE KEYS */;
/*!40000 ALTER TABLE `webusersoal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `welcome`
--

DROP TABLE IF EXISTS `welcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `welcome` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'null untuk pegawai',
  `pesan` mediumtext NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_welcome_departemen` (`departemen`),
  CONSTRAINT `FK_welcome_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `welcome`
--

LOCK TABLES `welcome` WRITE;
/*!40000 ALTER TABLE `welcome` DISABLE KEYS */;
/*!40000 ALTER TABLE `welcome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsclient`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsclient` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsclient`;

--
-- Table structure for table `deleteddata`
--

DROP TABLE IF EXISTS `deleteddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleteddata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dbname` varchar(50) NOT NULL,
  `tablename` varchar(50) NOT NULL,
  `dataid` varchar(50) NOT NULL,
  `datatoken` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_DELETEDDATA_SYNC` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleteddata`
--

LOCK TABLES `deleteddata` WRITE;
/*!40000 ALTER TABLE `deleteddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleteddata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exporthistory`
--

DROP TABLE IF EXISTS `exporthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exporthistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transferid` varchar(15) NOT NULL,
  `synctype` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `synctime` datetime NOT NULL,
  `syncfile` varchar(255) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exporthistory`
--

LOCK TABLES `exporthistory` WRITE;
/*!40000 ALTER TABLE `exporthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `exporthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveupdate`
--

DROP TABLE IF EXISTS `liveupdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveupdate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `liveupdateid` int(10) unsigned NOT NULL,
  `info` varchar(255) NOT NULL,
  `tipe` varchar(3) NOT NULL,
  `versi` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `repl_targetfile` varchar(255) DEFAULT NULL,
  `repl_varname` varchar(255) DEFAULT NULL,
  `repl_searchstr` varchar(255) DEFAULT NULL,
  `repl_replacestr` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 Disable, 1 Enable',
  `message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`liveupdateid`),
  UNIQUE KEY `UX_liveupdate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveupdate`
--

LOCK TABLES `liveupdate` WRITE;
/*!40000 ALTER TABLE `liveupdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `liveupdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveupdateconfig`
--

DROP TABLE IF EXISTS `liveupdateconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveupdateconfig` (
  `tipe` varchar(20) NOT NULL,
  `nilai` varchar(45) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveupdateconfig`
--

LOCK TABLES `liveupdateconfig` WRITE;
/*!40000 ALTER TABLE `liveupdateconfig` DISABLE KEYS */;
INSERT INTO `liveupdateconfig` VALUES ('MIN_UPDATE_ID','898','-');
/*!40000 ALTER TABLE `liveupdateconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveupdatefile`
--

DROP TABLE IF EXISTS `liveupdatefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveupdatefile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `liveupdateid` int(10) unsigned NOT NULL,
  `berkas` varchar(255) NOT NULL,
  `targetdir` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0 Disable 1 Enable',
  `tipe` varchar(4) NOT NULL DEFAULT 'DOWN' COMMENT 'DOWN | EXEC',
  PRIMARY KEY (`liveupdateid`),
  UNIQUE KEY `UX_liveupdatefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveupdatefile`
--

LOCK TABLES `liveupdatefile` WRITE;
/*!40000 ALTER TABLE `liveupdatefile` DISABLE KEYS */;
/*!40000 ALTER TABLE `liveupdatefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveupdatefile2`
--

DROP TABLE IF EXISTS `liveupdatefile2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveupdatefile2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `liveupdateid` int(10) unsigned NOT NULL,
  `berkas` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_LIVEUPDATEID` (`liveupdateid`)
) ENGINE=MyISAM AUTO_INCREMENT=996 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveupdatefile2`
--

LOCK TABLES `liveupdatefile2` WRITE;
/*!40000 ALTER TABLE `liveupdatefile2` DISABLE KEYS */;
/*!40000 ALTER TABLE `liveupdatefile2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveupdatefiledown`
--

DROP TABLE IF EXISTS `liveupdatefiledown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveupdatefiledown` (
  `liveupdateid` int(10) unsigned NOT NULL,
  `filename` varchar(150) NOT NULL,
  `filesize` int(10) unsigned NOT NULL,
  `rectime` datetime NOT NULL,
  PRIMARY KEY (`liveupdateid`,`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveupdatefiledown`
--

LOCK TABLES `liveupdatefiledown` WRITE;
/*!40000 ALTER TABLE `liveupdatefiledown` DISABLE KEYS */;
/*!40000 ALTER TABLE `liveupdatefiledown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkchanges`
--

DROP TABLE IF EXISTS `pkchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkchanges` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dbname` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tablename` varchar(50) CHARACTER SET latin1 NOT NULL,
  `dataid` int(10) unsigned NOT NULL,
  `datatoken` smallint(5) unsigned NOT NULL,
  `newpk` varchar(100) CHARACTER SET latin1 NOT NULL,
  `oldpk` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_PKCHANGES_SYNC` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkchanges`
--

LOCK TABLES `pkchanges` WRITE;
/*!40000 ALTER TABLE `pkchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syncconfig`
--

DROP TABLE IF EXISTS `syncconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncconfig` (
  `tipe` varchar(20) NOT NULL,
  `nilai` varchar(45) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syncconfig`
--

LOCK TABLES `syncconfig` WRITE;
/*!40000 ALTER TABLE `syncconfig` DISABLE KEYS */;
INSERT INTO `syncconfig` VALUES ('DATABASE_ID','TVQvIxw7my9elIfRnUYYY6Z1Gw9cpcdau4Kc8jUikXpUn','Please Don\'t Change OR Delete This Value');
/*!40000 ALTER TABLE `syncconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synchistory`
--

DROP TABLE IF EXISTS `synchistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synchistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(15) NOT NULL,
  `transferid` varchar(15) NOT NULL,
  `synctype` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `synctime` datetime NOT NULL,
  `syncfile` varchar(255) NOT NULL,
  `repopath` varchar(700) NOT NULL,
  `appid` varchar(5) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_SYNCHISTORY` (`method`,`synctype`,`starttime`,`appid`,`synctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synchistory`
--

LOCK TABLES `synchistory` WRITE;
/*!40000 ALTER TABLE `synchistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `synchistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcontrol`
--

DROP TABLE IF EXISTS `vcontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcontrol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c` varchar(5) NOT NULL,
  `v` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcontrol`
--

LOCK TABLES `vcontrol` WRITE;
/*!40000 ALTER TABLE `vcontrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcontrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `version` varchar(10) NOT NULL,
  `builddate` datetime NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES ('29.0','2023-09-20 00:00:00');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsfina`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsfina` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsfina`;

--
-- Table structure for table `auditbesarjtt`
--

DROP TABLE IF EXISTS `auditbesarjtt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditbesarjtt` (
  `statusdata` tinyint(1) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,0) NOT NULL,
  `lunas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `pengguna` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditbesarjtt_auditinfo` (`idaudit`),
  KEY `IX_auditbesarjtt_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditbesarjtt_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditbesarjtt`
--

LOCK TABLES `auditbesarjtt` WRITE;
/*!40000 ALTER TABLE `auditbesarjtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditbesarjtt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditbesarjttcalon`
--

DROP TABLE IF EXISTS `auditbesarjttcalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditbesarjttcalon` (
  `statusdata` tinyint(1) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idcalon` int(10) unsigned NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,0) NOT NULL,
  `lunas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `pengguna` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditbesarjttcalon_auditinfo` (`idaudit`),
  KEY `IX_auditbesarjttcalon_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditbesarjttcalon_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditbesarjttcalon`
--

LOCK TABLES `auditbesarjttcalon` WRITE;
/*!40000 ALTER TABLE `auditbesarjttcalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditbesarjttcalon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditinfo`
--

DROP TABLE IF EXISTS `auditinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditinfo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sumber` varchar(100) NOT NULL,
  `idsumber` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `alasan` varchar(500) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_auditinfo_departemen` (`departemen`),
  KEY `IX_auditinfo_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditinfo_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditinfo`
--

LOCK TABLES `auditinfo` WRITE;
/*!40000 ALTER TABLE `auditinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditjurnal`
--

DROP TABLE IF EXISTS `auditjurnal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditjurnal` (
  `status` tinyint(1) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `transaksi` varchar(255) NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `nokas` varchar(100) NOT NULL,
  `idtahunbuku` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `sumber` varchar(40) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditjurnal_auditinfo` (`idaudit`),
  KEY `IX_auditjurnal_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditjurnal_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditjurnal`
--

LOCK TABLES `auditjurnal` WRITE;
/*!40000 ALTER TABLE `auditjurnal` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditjurnal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditjurnaldetail`
--

DROP TABLE IF EXISTS `auditjurnaldetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditjurnaldetail` (
  `status` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `koderek` varchar(15) NOT NULL,
  `debet` decimal(15,0) NOT NULL DEFAULT '0',
  `kredit` decimal(15,0) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_auditjurnaldetail_auditinfo` (`idaudit`),
  KEY `IX_auditjurnaldetail_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditjurnaldetail_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditjurnaldetail`
--

LOCK TABLES `auditjurnaldetail` WRITE;
/*!40000 ALTER TABLE `auditjurnaldetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditjurnaldetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditpenerimaaniuran`
--

DROP TABLE IF EXISTS `auditpenerimaaniuran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditpenerimaaniuran` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaaniuran_auditinfo` (`idaudit`),
  KEY `IX_auditpenerimaaniuran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditpenerimaaniuran_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditpenerimaaniuran`
--

LOCK TABLES `auditpenerimaaniuran` WRITE;
/*!40000 ALTER TABLE `auditpenerimaaniuran` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaaniuran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditpenerimaaniurancalon`
--

DROP TABLE IF EXISTS `auditpenerimaaniurancalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditpenerimaaniurancalon` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `idcalon` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaaniurancalon_audit` (`idaudit`),
  KEY `IX_auditpenerimaaniurancalon_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditpenerimaaniurancalon_audit` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditpenerimaaniurancalon`
--

LOCK TABLES `auditpenerimaaniurancalon` WRITE;
/*!40000 ALTER TABLE `auditpenerimaaniurancalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaaniurancalon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditpenerimaanjtt`
--

DROP TABLE IF EXISTS `auditpenerimaanjtt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditpenerimaanjtt` (
  `statusdata` tinyint(1) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idbesarjtt` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaanjtt_auditinfo` (`idaudit`),
  KEY `IX_auditpenerimaanjtt_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditpenerimaanjtt_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditpenerimaanjtt`
--

LOCK TABLES `auditpenerimaanjtt` WRITE;
/*!40000 ALTER TABLE `auditpenerimaanjtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaanjtt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditpenerimaanjttcalon`
--

DROP TABLE IF EXISTS `auditpenerimaanjttcalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditpenerimaanjttcalon` (
  `statusdata` tinyint(1) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idbesarjttcalon` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaanjttcalon_auditinfo` (`idaudit`),
  KEY `IX_auditpenerimaanjttcalon_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditpenerimaanjttcalon_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditpenerimaanjttcalon`
--

LOCK TABLES `auditpenerimaanjttcalon` WRITE;
/*!40000 ALTER TABLE `auditpenerimaanjttcalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaanjttcalon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditpenerimaanlain`
--

DROP TABLE IF EXISTS `auditpenerimaanlain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditpenerimaanlain` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `sumber` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaanlain_auditinfo` (`idaudit`),
  KEY `IX_auditpenerimaanlain_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditpenerimaanlain_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditpenerimaanlain`
--

LOCK TABLES `auditpenerimaanlain` WRITE;
/*!40000 ALTER TABLE `auditpenerimaanlain` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaanlain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditpengeluaran`
--

DROP TABLE IF EXISTS `auditpengeluaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditpengeluaran` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idpengeluaran` int(10) unsigned NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `jenispemohon` tinyint(1) unsigned NOT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `pemohonlain` int(10) unsigned DEFAULT NULL,
  `penerima` varchar(100) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `tanggalkeluar` datetime NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `petugas` varchar(45) DEFAULT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `keterangan` text,
  `namapemohon` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpengeluaran_auditinfo` (`idaudit`),
  KEY `IX_auditpengeluaran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditpengeluaran_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditpengeluaran`
--

LOCK TABLES `auditpengeluaran` WRITE;
/*!40000 ALTER TABLE `auditpengeluaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpengeluaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audittabungan`
--

DROP TABLE IF EXISTS `audittabungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audittabungan` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `idtabungan` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `nis` varchar(20) CHARACTER SET utf8 NOT NULL,
  `debet` decimal(15,0) NOT NULL,
  `kredit` decimal(15,0) NOT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_audittabungan_auditinfo` (`idaudit`),
  CONSTRAINT `FK_audittabungan_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audittabungan`
--

LOCK TABLES `audittabungan` WRITE;
/*!40000 ALTER TABLE `audittabungan` DISABLE KEYS */;
/*!40000 ALTER TABLE `audittabungan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audittabunganp`
--

DROP TABLE IF EXISTS `audittabunganp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audittabunganp` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `idtabungan` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `nip` varchar(20) CHARACTER SET utf8 NOT NULL,
  `debet` decimal(15,0) NOT NULL,
  `kredit` decimal(15,0) NOT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_audittabunganp_auditinfo` (`idaudit`),
  CONSTRAINT `FK_audittabunganp_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audittabunganp`
--

LOCK TABLES `audittabunganp` WRITE;
/*!40000 ALTER TABLE `audittabunganp` DISABLE KEYS */;
/*!40000 ALTER TABLE `audittabunganp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autotrans`
--

DROP TABLE IF EXISTS `autotrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autotrans` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `kelompok` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1 Siswa, 2 Calon Siswa',
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `urutan` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `smsinfo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_autotrans_departemen` (`departemen`),
  CONSTRAINT `FK_autotrans_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autotrans`
--

LOCK TABLES `autotrans` WRITE;
/*!40000 ALTER TABLE `autotrans` DISABLE KEYS */;
/*!40000 ALTER TABLE `autotrans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autotransdata`
--

DROP TABLE IF EXISTS `autotransdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autotransdata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idautotrans` int(10) unsigned NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,2) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) NOT NULL,
  `urutan` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_autotransdata_autotrans` (`idautotrans`),
  KEY `FK_autotransdata_datapenerimaan` (`idpenerimaan`),
  CONSTRAINT `FK_autotransdata_autotrans` FOREIGN KEY (`idautotrans`) REFERENCES `autotrans` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_autotransdata_datapenerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autotransdata`
--

LOCK TABLES `autotransdata` WRITE;
/*!40000 ALTER TABLE `autotransdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `autotransdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `bankno` varchar(50) NOT NULL,
  `bankname` varchar(255) NOT NULL,
  `bankloc` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `issync` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rekkas` varchar(15) NOT NULL,
  `rekpendapatan` varchar(15) NOT NULL,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_bank` (`bankno`,`departemen`) USING BTREE,
  KEY `FK_bank_departemen` (`departemen`),
  KEY `IX_bank` (`bankno`,`issync`) USING BTREE,
  KEY `FK_bank_rekakun` (`rekkas`),
  KEY `FK_bank_rekakun2` (`rekpendapatan`),
  CONSTRAINT `FK_bank_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_bank_rekakun` FOREIGN KEY (`rekkas`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_bank_rekakun2` FOREIGN KEY (`rekpendapatan`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_bank_ains AFTER INSERT ON jbsfina.bank
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.bank', iddata = NEW.replid, state = 'I', dataload = 1
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_bank_aupd AFTER UPDATE ON jbsfina.bank
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.bank', iddata = OLD.replid, state = 'U', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_bank_adel AFTER DELETE ON jbsfina.bank
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.bank', iddata = OLD.replid, state = 'D', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bankdeposit`
--

DROP TABLE IF EXISTS `bankdeposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankdeposit` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) DEFAULT NULL,
  `bankno` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `aktif` tinyint(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_bankdeposit_departemen` (`departemen`),
  KEY `FK_bankdeposit_bank` (`bankno`),
  KEY `IX_bankdeposit` (`aktif`),
  CONSTRAINT `FK_bankdeposit_bank` FOREIGN KEY (`bankno`) REFERENCES `bank` (`bankno`) ON UPDATE CASCADE,
  CONSTRAINT `FK_bankdeposit_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankdeposit`
--

LOCK TABLES `bankdeposit` WRITE;
/*!40000 ALTER TABLE `bankdeposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankdeposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankmutasi`
--

DROP TABLE IF EXISTS `bankmutasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankmutasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) DEFAULT NULL,
  `bankno` varchar(50) NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL COMMENT '1 Simpan, 2 Ambil',
  `tanggal` date NOT NULL,
  `waktu` datetime NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `petugas` varchar(30) DEFAULT NULL,
  `berkas` mediumtext NOT NULL,
  `adaberkas` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nomormutasi` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_bankmutasi_departemen` (`departemen`),
  KEY `FK_bankmutasi_bank` (`bankno`),
  KEY `FK_bankmutasi_pegawai` (`petugas`),
  CONSTRAINT `FK_bankmutasi_bank` FOREIGN KEY (`bankno`) REFERENCES `bank` (`bankno`) ON UPDATE CASCADE,
  CONSTRAINT `FK_bankmutasi_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_bankmutasi_pegawai` FOREIGN KEY (`petugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankmutasi`
--

LOCK TABLES `bankmutasi` WRITE;
/*!40000 ALTER TABLE `bankmutasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankmutasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankmutasidata`
--

DROP TABLE IF EXISTS `bankmutasidata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankmutasidata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` varchar(10) NOT NULL,
  `idmutasi` int(10) unsigned DEFAULT NULL,
  `idpenerimaan` int(11) unsigned NOT NULL,
  `idtabungan` int(11) unsigned NOT NULL,
  `idtabunganp` int(11) unsigned NOT NULL,
  `iddeposit` int(11) unsigned NOT NULL,
  `jumlah` int(11) unsigned NOT NULL,
  `nokas` varchar(50) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_bankmutasidata_bankmutasi` (`idmutasi`),
  CONSTRAINT `FK_bankmutasidata_bankmutasi` FOREIGN KEY (`idmutasi`) REFERENCES `bankmutasi` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankmutasidata`
--

LOCK TABLES `bankmutasidata` WRITE;
/*!40000 ALTER TABLE `bankmutasidata` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankmutasidata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banksaldo`
--

DROP TABLE IF EXISTS `banksaldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banksaldo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) DEFAULT NULL,
  `bankno` varchar(50) NOT NULL,
  `kategori` varchar(10) NOT NULL,
  `idpenerimaan` int(11) unsigned NOT NULL,
  `idtabungan` int(11) unsigned NOT NULL,
  `idtabunganp` int(11) unsigned NOT NULL,
  `iddeposit` int(11) unsigned NOT NULL,
  `kelompok` tinyint(3) unsigned NOT NULL COMMENT '1 Pembayaran 2 Deposit 3 Biaya Layanan 4 Kelebihan',
  `saldo` bigint(20) unsigned NOT NULL,
  `lasttime` datetime NOT NULL,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_banksaldo` (`departemen`,`bankno`,`kategori`,`idpenerimaan`,`idtabungan`,`idtabunganp`,`iddeposit`),
  KEY `FK_banksaldo_departemen` (`departemen`),
  KEY `FK_banksaldo_bank` (`bankno`),
  CONSTRAINT `FK_banksaldo_bank` FOREIGN KEY (`bankno`) REFERENCES `bank` (`bankno`) ON UPDATE CASCADE,
  CONSTRAINT `FK_banksaldo_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banksaldo`
--

LOCK TABLES `banksaldo` WRITE;
/*!40000 ALTER TABLE `banksaldo` DISABLE KEYS */;
/*!40000 ALTER TABLE `banksaldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banktrans`
--

DROP TABLE IF EXISTS `banktrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banktrans` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bankno` varchar(45) NOT NULL,
  `nomor` varchar(100) NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL COMMENT '1 Tagihan',
  `idtahunbuku` int(10) unsigned NOT NULL,
  `idpenerimaan` int(10) unsigned DEFAULT NULL,
  `idpenerimaanjtt` int(10) unsigned DEFAULT NULL,
  `idtabungan` int(10) unsigned DEFAULT NULL,
  `idtabunganp` int(10) unsigned DEFAULT NULL,
  `kelompok` tinyint(3) unsigned NOT NULL COMMENT '1 Iuran 2 Tabungan 3 Tabungan Pegawai 4 Service Fee 5 Kelebihan',
  `waktu` datetime NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(10) unsigned NOT NULL,
  `diskon` int(10) unsigned NOT NULL DEFAULT '0',
  `nokas` varchar(50) NOT NULL,
  `idpetugas` varchar(25) NOT NULL,
  `petugas` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_banktrans_penerimaan` (`idpenerimaan`),
  KEY `FK_banktrans_tahunbuku` (`idtahunbuku`),
  KEY `IX_banktrans` (`nomor`,`jenis`,`kelompok`,`idpetugas`) USING BTREE,
  KEY `FK_banktrans_penerimaanjtt` (`idpenerimaanjtt`),
  KEY `FK_banktrans_tabungan` (`idtabungan`),
  KEY `FK_banktrans_tabunganp` (`idtabunganp`),
  CONSTRAINT `FK_banktrans_penerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_banktrans_penerimaanjtt` FOREIGN KEY (`idpenerimaanjtt`) REFERENCES `penerimaanjtt` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_banktrans_tabungan` FOREIGN KEY (`idtabungan`) REFERENCES `datatabungan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_banktrans_tabunganp` FOREIGN KEY (`idtabunganp`) REFERENCES `datatabunganp` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_banktrans_tahunbuku` FOREIGN KEY (`idtahunbuku`) REFERENCES `tahunbuku` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banktrans`
--

LOCK TABLES `banktrans` WRITE;
/*!40000 ALTER TABLE `banktrans` DISABLE KEYS */;
/*!40000 ALTER TABLE `banktrans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelompok` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kondisi` varchar(255) DEFAULT NULL,
  `jumlah` int(10) NOT NULL DEFAULT '0',
  `tglperolehan` date NOT NULL DEFAULT '0000-00-00',
  `foto` blob,
  `keterangan` varchar(255) DEFAULT NULL,
  `satuan` varchar(20) DEFAULT 'unit',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_barang_kelompok` (`idkelompok`),
  KEY `IX_barang_ts` (`ts`,`issync`),
  CONSTRAINT `FK_barang_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokbarang` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `besarjtt`
--

DROP TABLE IF EXISTS `besarjtt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `besarjtt` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,0) NOT NULL,
  `cicilan` decimal(15,0) NOT NULL DEFAULT '0',
  `lunas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `pengguna` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pembayaranjtt_siswa` (`nis`),
  KEY `FK_pembayaranjtt_penerimaan` (`idpenerimaan`),
  KEY `IX_besarjtt_ts` (`ts`,`issync`),
  CONSTRAINT `FK_besarjtt_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pembayaranjtt_penerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `besarjtt`
--

LOCK TABLES `besarjtt` WRITE;
/*!40000 ALTER TABLE `besarjtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `besarjtt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_besarjtt_101` AFTER UPDATE ON `besarjtt` FOR EACH ROW BEGIN
    DECLARE xidaudit int;
	DECLARE xdepartemen varchar(25); 
	
	IF (@DISABLE_TRIGGERS IS NULL) AND (@DISABLE_TRIGER IS NULL) THEN
		SELECT p.departemen INTO xdepartemen
		  FROM besarjtt b, datapenerimaan p
		 WHERE b.idpenerimaan = p.replid AND b.replid = NEW.replid;
		 
		INSERT INTO auditinfo SET departemen=xdepartemen, sumber='besarjtt', idsumber=new.replid, tanggal=now(), petugas=new.pengguna, alasan=new.info3;
		
		SELECT last_insert_id() INTO xidaudit;
		
		INSERT INTO auditbesarjtt SET statusdata=0, idaudit=xidaudit, replid=OLD.replid, nis=OLD.nis, 
			idpenerimaan=OLD.idpenerimaan, besar=OLD.besar, lunas=OLD.lunas, keterangan=OLD.keterangan, pengguna=OLD.pengguna, info1=OLD.info1, info2=OLD.info2;
		
		INSERT INTO auditbesarjtt SET statusdata=1, idaudit=xidaudit, replid=NEW.replid, nis=NEW.nis, 
			idpenerimaan=NEW.idpenerimaan, besar=NEW.besar, lunas=NEW.lunas, keterangan=NEW.keterangan, pengguna=NEW.pengguna, info1=NEW.info1, info2=NEW.info2;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `besarjttcalon`
--

DROP TABLE IF EXISTS `besarjttcalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `besarjttcalon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcalon` int(10) unsigned NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,0) NOT NULL,
  `cicilan` decimal(15,0) NOT NULL DEFAULT '0',
  `lunas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `pengguna` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_besarjttcalon_penerimaan` (`idpenerimaan`),
  KEY `FK_besarjttcalon_calonsiswa` (`idcalon`),
  KEY `IX_besarjttcalon_ts` (`ts`,`issync`),
  CONSTRAINT `FK_besarjttcalon_calonsiswa` FOREIGN KEY (`idcalon`) REFERENCES `jbsakad`.`calonsiswa` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_besarjttcalon_penerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `besarjttcalon`
--

LOCK TABLES `besarjttcalon` WRITE;
/*!40000 ALTER TABLE `besarjttcalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `besarjttcalon` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_besarjttcalon_101` AFTER UPDATE ON `besarjttcalon` FOR EACH ROW BEGIN
    DECLARE xidaudit int;
	DECLARE xdepartemen varchar(25); 
	
	IF (@DISABLE_TRIGGERS IS NULL) AND (@DISABLE_TRIGER IS NULL) THEN
		SELECT p.departemen INTO xdepartemen
		FROM besarjttcalon b, datapenerimaan p
		WHERE b.idpenerimaan = p.replid AND b.replid = NEW.replid;
		 
		INSERT INTO auditinfo SET departemen=xdepartemen, sumber='besarjttcalon', idsumber=new.replid, tanggal=now(), petugas=new.pengguna, alasan=new.info3;
		
		SELECT last_insert_id() INTO xidaudit;
		
		INSERT INTO auditbesarjttcalon SET statusdata=0, idaudit=xidaudit, replid=OLD.replid, idcalon=OLD.idcalon, 
			idpenerimaan=OLD.idpenerimaan, besar=OLD.besar, lunas=OLD.lunas, keterangan=OLD.keterangan, pengguna=OLD.pengguna, info1=OLD.info1, info2=OLD.info2;
		
		INSERT INTO auditbesarjttcalon SET statusdata=1, idaudit=xidaudit, replid=NEW.replid, idcalon=NEW.idcalon, 
			idpenerimaan=NEW.idpenerimaan, besar=NEW.besar, lunas=NEW.lunas, keterangan=NEW.keterangan, pengguna=NEW.pengguna, info1=NEW.info1, info2=NEW.info2;
	END IF;		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `datadsp`
--

DROP TABLE IF EXISTS `datadsp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datadsp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `dsp` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `operator` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_datadsp_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datadsp`
--

LOCK TABLES `datadsp` WRITE;
/*!40000 ALTER TABLE `datadsp` DISABLE KEYS */;
/*!40000 ALTER TABLE `datadsp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datapenerimaan`
--

DROP TABLE IF EXISTS `datapenerimaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datapenerimaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `besar` decimal(15,0) DEFAULT NULL,
  `idkategori` varchar(15) NOT NULL,
  `rekkas` varchar(15) NOT NULL,
  `rekpendapatan` varchar(15) NOT NULL,
  `rekpiutang` varchar(15) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_datapenerimaan_rekakun_kas` (`rekkas`),
  KEY `FK_datapenerimaan_rekakun_pendapatan` (`rekpendapatan`),
  KEY `FK_datapenerimaan_rekakun_piutang` (`rekpiutang`),
  KEY `FK_datapenerimaan_kategoripenerimaan` (`idkategori`),
  KEY `FK_datapenerimaan_departemen` (`departemen`),
  KEY `IX_datapenerimaan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_datapenerimaan_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datapenerimaan_kategoripenerimaan` FOREIGN KEY (`idkategori`) REFERENCES `kategoripenerimaan` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datapenerimaan_rekakun_kas` FOREIGN KEY (`rekkas`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datapenerimaan_rekakun_pendapatan` FOREIGN KEY (`rekpendapatan`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datapenerimaan_rekakun_piutang` FOREIGN KEY (`rekpiutang`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datapenerimaan`
--

LOCK TABLES `datapenerimaan` WRITE;
/*!40000 ALTER TABLE `datapenerimaan` DISABLE KEYS */;
INSERT INTO `datapenerimaan` VALUES (9,'SPP Bulanan',NULL,'JTT','111','411','150',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA','421',NULL,NULL,'2012-01-02 00:14:49',41237,0),(11,'Dana Sumbangan Pendidikan',NULL,'CSWJB','111','412','153',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA','422',NULL,NULL,'2012-01-02 00:59:59',12756,0),(12,'Sumbangan BOS',NULL,'LNN','113','414','154',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA','424',NULL,NULL,'2012-01-02 01:01:04',5601,0),(13,'Tabungan Siswa',NULL,'SKR','112','413','150',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA','423',NULL,NULL,'2012-01-02 00:57:14',55264,0),(14,'Sumbangan Pendidikan',NULL,'CSSKR','112','415','153',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA','425',NULL,NULL,'2012-01-02 00:59:39',62929,0);
/*!40000 ALTER TABLE `datapenerimaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datapengeluaran`
--

DROP TABLE IF EXISTS `datapengeluaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datapengeluaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `rekdebet` varchar(15) NOT NULL,
  `rekkredit` varchar(15) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `besar` decimal(15,0) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_datapengeluaran_departemen` (`departemen`),
  KEY `FK_datapengeluaran_rekakun` (`rekdebet`),
  KEY `FK_datapengeluaran_rekakun2` (`rekkredit`),
  KEY `IX_datapengeluaran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_datapengeluaran_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datapengeluaran_rekakun` FOREIGN KEY (`rekdebet`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datapengeluaran_rekakun2` FOREIGN KEY (`rekkredit`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datapengeluaran`
--

LOCK TABLES `datapengeluaran` WRITE;
/*!40000 ALTER TABLE `datapengeluaran` DISABLE KEYS */;
INSERT INTO `datapengeluaran` VALUES (4,'SMA','Bayar Listrik','501','111',1,'Sekedar contoh. Menu ini mengatur setiap jenis pengeluaran yang mungkin dikeluarkan sekolah. Anda harus menentukan rekening Kas dan Beban untuk setiap transaksi pengeluaran.',0,NULL,NULL,NULL,'2010-03-02 03:06:52',17792,0);
/*!40000 ALTER TABLE `datapengeluaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datatabungan`
--

DROP TABLE IF EXISTS `datatabungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datatabungan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `rekkas` varchar(15) NOT NULL,
  `rekutang` varchar(15) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_datatabungan_rekakun_kas` (`rekkas`),
  KEY `FK_datatabungan_rekakun_utang` (`rekutang`),
  KEY `FK_datatabungan_departemen` (`departemen`),
  KEY `IX_datatabungan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_datatabungan_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datatabungan_rekakun_kas` FOREIGN KEY (`rekkas`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datatabungan_rekakun_utang` FOREIGN KEY (`rekutang`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datatabungan`
--

LOCK TABLES `datatabungan` WRITE;
/*!40000 ALTER TABLE `datatabungan` DISABLE KEYS */;
/*!40000 ALTER TABLE `datatabungan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datatabunganp`
--

DROP TABLE IF EXISTS `datatabunganp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datatabunganp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `rekkas` varchar(15) NOT NULL,
  `rekutang` varchar(15) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_datatabunganp_rekakun_kas` (`rekkas`),
  KEY `FK_datatabunganp_rekakun_utang` (`rekutang`),
  KEY `FK_datatabunganp_departemen` (`departemen`),
  KEY `IX_datatabunganp_ts` (`ts`,`issync`),
  CONSTRAINT `FK_datatabunganp_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datatabunganp_rekakun_kas` FOREIGN KEY (`rekkas`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datatabunganp_rekakun_utang` FOREIGN KEY (`rekutang`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datatabunganp`
--

LOCK TABLES `datatabunganp` WRITE;
/*!40000 ALTER TABLE `datatabunganp` DISABLE KEYS */;
/*!40000 ALTER TABLE `datatabunganp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formatnomortagihan`
--

DROP TABLE IF EXISTS `formatnomortagihan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formatnomortagihan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `awalan` varchar(5) NOT NULL,
  `issync` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_formatnomortagihan_departemen` (`departemen`),
  CONSTRAINT `FK_formatnomortagihan_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatnomortagihan`
--

LOCK TABLES `formatnomortagihan` WRITE;
/*!40000 ALTER TABLE `formatnomortagihan` DISABLE KEYS */;
/*!40000 ALTER TABLE `formatnomortagihan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formatpesanpg`
--

DROP TABLE IF EXISTS `formatpesanpg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formatpesanpg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `kelompok` varchar(25) NOT NULL,
  `pesan` varchar(1000) NOT NULL,
  `issync` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_formatpesanpg_departemen` (`departemen`),
  KEY `IX_formatpesanpg` (`kelompok`),
  CONSTRAINT `FK_formatpesanpg_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatpesanpg`
--

LOCK TABLES `formatpesanpg` WRITE;
/*!40000 ALTER TABLE `formatpesanpg` DISABLE KEYS */;
/*!40000 ALTER TABLE `formatpesanpg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formatsms`
--

DROP TABLE IF EXISTS `formatsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formatsms` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` varchar(10) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `format` varchar(255) NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`) USING BTREE,
  KEY `FK_formatsms_departemen` (`departemen`),
  KEY `IX_formatsms` (`jenis`),
  CONSTRAINT `FK_formatsms_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatsms`
--

LOCK TABLES `formatsms` WRITE;
/*!40000 ALTER TABLE `formatsms` DISABLE KEYS */;
INSERT INTO `formatsms` VALUES (1,'SISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(2,'CSISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(3,'SISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(8,'CSISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(13,'SISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(18,'CSISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(23,'SISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(24,'CSISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(25,'SISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(26,'CSISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL);
/*!40000 ALTER TABLE `formatsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupbarang`
--

DROP TABLE IF EXISTS `groupbarang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupbarang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keterangan` varchar(45) DEFAULT NULL,
  `namagroup` varchar(45) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_groupbarang_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupbarang`
--

LOCK TABLES `groupbarang` WRITE;
/*!40000 ALTER TABLE `groupbarang` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupbarang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infobayar`
--

DROP TABLE IF EXISTS `infobayar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infobayar` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `bagian` varchar(10) NOT NULL,
  `info` mediumtext NOT NULL,
  `issync` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infobayar_departemen` (`departemen`),
  KEY `IX_infobayar` (`bagian`,`issync`) USING BTREE,
  CONSTRAINT `FK_infobayar_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infobayar`
--

LOCK TABLES `infobayar` WRITE;
/*!40000 ALTER TABLE `infobayar` DISABLE KEYS */;
/*!40000 ALTER TABLE `infobayar` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_infobayar_ains AFTER INSERT ON jbsfina.infobayar
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.infobayar', iddata = NEW.replid, state = 'I', dataload = 1
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_infobayar_aupd AFTER UPDATE ON jbsfina.infobayar
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.infobayar', iddata = OLD.replid, state = 'U', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_infobayar_adel AFTER DELETE ON jbsfina.infobayar
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.infobayar', iddata = OLD.replid, state = 'D', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jurnal`
--

DROP TABLE IF EXISTS `jurnal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `transaksi` varchar(255) NOT NULL,
  `idpetugas` varchar(30) DEFAULT NULL,
  `petugas` varchar(100) NOT NULL,
  `nokas` varchar(100) NOT NULL,
  `idtahunbuku` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `sumber` varchar(40) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jurnal_tahunbuku` (`idtahunbuku`),
  KEY `IX_jurnal_tanggal` (`tanggal`),
  KEY `IX_jurnal_idtahunbuku` (`idtahunbuku`),
  KEY `IX_jurnal_ts` (`ts`,`issync`),
  KEY `FK_jurnal_pegawai` (`idpetugas`),
  KEY `IX_jurnal` (`nokas`,`sumber`),
  CONSTRAINT `FK_jurnal_pegawai` FOREIGN KEY (`idpetugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jurnal_tahunbuku` FOREIGN KEY (`idtahunbuku`) REFERENCES `tahunbuku` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurnal`
--

LOCK TABLES `jurnal` WRITE;
/*!40000 ALTER TABLE `jurnal` DISABLE KEYS */;
/*!40000 ALTER TABLE `jurnal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jurnaldetail`
--

DROP TABLE IF EXISTS `jurnaldetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jurnaldetail` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `koderek` varchar(15) NOT NULL,
  `debet` decimal(15,0) NOT NULL DEFAULT '0',
  `kredit` decimal(15,0) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jurnaldetail_jurnal` (`idjurnal`),
  KEY `IX_jurnaldetail_koderek` (`koderek`),
  KEY `IX_jurnaldetail_ts` (`ts`,`issync`),
  CONSTRAINT `FK_jurnaldetail_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_jurnaldetail_rekakun` FOREIGN KEY (`koderek`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurnaldetail`
--

LOCK TABLES `jurnaldetail` WRITE;
/*!40000 ALTER TABLE `jurnaldetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `jurnaldetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategoripenerimaan`
--

DROP TABLE IF EXISTS `kategoripenerimaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategoripenerimaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siswa` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kode`),
  UNIQUE KEY `Index_1` (`replid`),
  KEY `IX_kategoripenerimaan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategoripenerimaan`
--

LOCK TABLES `kategoripenerimaan` WRITE;
/*!40000 ALTER TABLE `kategoripenerimaan` DISABLE KEYS */;
INSERT INTO `kategoripenerimaan` VALUES (4,'CSSKR','Iuran Sukarela Calon Siswa',4,1,NULL,NULL,NULL,'2010-03-02 03:06:52',31230,0),(3,'CSWJB','Iuran Wajib Calon Siswa',3,1,NULL,NULL,NULL,'2010-03-02 03:06:52',37247,0),(1,'JTT','Iuran Wajib Siswa',1,1,NULL,NULL,NULL,'2010-03-02 03:06:52',27011,0),(5,'LNN','Penerimaan Lainnya',5,1,NULL,NULL,NULL,'2010-03-02 03:06:52',23315,0),(2,'SKR','Iuran Sukarela Siswa',2,1,NULL,NULL,NULL,'2010-03-02 03:06:52',35541,0);
/*!40000 ALTER TABLE `kategoripenerimaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `katerekakun`
--

DROP TABLE IF EXISTS `katerekakun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `katerekakun` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kategori`),
  UNIQUE KEY `Index_1` (`replid`),
  KEY `IX_katerekakun_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `katerekakun`
--

LOCK TABLES `katerekakun` WRITE;
/*!40000 ALTER TABLE `katerekakun` DISABLE KEYS */;
INSERT INTO `katerekakun` VALUES (7,'BIAYA',7,NULL,NULL,NULL,'2010-03-02 03:06:52',42231,0),(1,'HARTA',1,NULL,NULL,NULL,'2010-03-02 03:06:52',38999,0),(3,'INVENTARIS',3,NULL,NULL,NULL,'2010-03-02 03:06:52',2775,0),(5,'MODAL',5,NULL,NULL,NULL,'2010-03-02 03:06:52',27935,0),(6,'PENDAPATAN',6,NULL,NULL,NULL,'2010-03-02 03:06:52',289,0),(2,'PIUTANG',2,NULL,NULL,NULL,'2010-03-02 03:06:52',48701,0),(4,'UTANG',4,NULL,NULL,NULL,'2010-03-02 03:06:52',46047,0);
/*!40000 ALTER TABLE `katerekakun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompokbarang`
--

DROP TABLE IF EXISTS `kelompokbarang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompokbarang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(255) NOT NULL,
  `keterangan` varchar(45) DEFAULT NULL,
  `idgroup` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_kelompokbarang_group` (`idgroup`),
  KEY `IX_kelompokbarang_ts` (`ts`,`issync`),
  CONSTRAINT `FK_kelompokbarang_group` FOREIGN KEY (`idgroup`) REFERENCES `groupbarang` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompokbarang`
--

LOCK TABLES `kelompokbarang` WRITE;
/*!40000 ALTER TABLE `kelompokbarang` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompokbarang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multitransdata`
--

DROP TABLE IF EXISTS `multitransdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multitransdata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idinfo` int(10) unsigned NOT NULL,
  `notrans` varchar(100) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_multitransdata_multitransinfo` (`idinfo`),
  CONSTRAINT `FK_multitransdata_multitransinfo` FOREIGN KEY (`idinfo`) REFERENCES `multitransinfo` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multitransdata`
--

LOCK TABLES `multitransdata` WRITE;
/*!40000 ALTER TABLE `multitransdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `multitransdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multitransinfo`
--

DROP TABLE IF EXISTS `multitransinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multitransinfo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtahunbuku` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `petugas` varchar(100) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `paymentstatus` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '''0: Manual, 5: PaymentGateway''',
  `paymentdate` datetime DEFAULT NULL,
  `pgnomor` varchar(100) DEFAULT NULL,
  `pgjumlah` int(11) DEFAULT NULL,
  `pgbank` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_multitransinfo_siswa` (`nis`),
  KEY `FK_multitransinfo_calonsiswa` (`nic`),
  KEY `FK_multitransinfo_tahunbuku` (`idtahunbuku`),
  CONSTRAINT `FK_multitransinfo_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_multitransinfo_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_multitransinfo_tahunbuku` FOREIGN KEY (`idtahunbuku`) REFERENCES `tahunbuku` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multitransinfo`
--

LOCK TABLES `multitransinfo` WRITE;
/*!40000 ALTER TABLE `multitransinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `multitransinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentid`
--

DROP TABLE IF EXISTS `paymentid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentid` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` tinyint(3) unsigned NOT NULL COMMENT '1 Pegawai, 2 Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `paymentid` varchar(10) NOT NULL,
  `tanggal` datetime NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_paymentid_siswa` (`nis`),
  KEY `FK_paymentid_pegawai` (`nip`),
  CONSTRAINT `FK_paymentid_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymentid_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentid`
--

LOCK TABLES `paymentid` WRITE;
/*!40000 ALTER TABLE `paymentid` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmaxtrans`
--

DROP TABLE IF EXISTS `paymentmaxtrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentmaxtrans` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `maxtrans` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_paymentmaxtrans_siswa` (`nis`),
  KEY `FK_paymentmaxtrans_pegawai` (`nip`),
  CONSTRAINT `FK_paymentmaxtrans_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymentmaxtrans_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmaxtrans`
--

LOCK TABLES `paymentmaxtrans` WRITE;
/*!40000 ALTER TABLE `paymentmaxtrans` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentmaxtrans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymenttabungan`
--

DROP TABLE IF EXISTS `paymenttabungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymenttabungan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` tinyint(1) unsigned NOT NULL COMMENT '1 Pegawai, 2 Siswa',
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `idtabungan` int(10) unsigned DEFAULT NULL,
  `idtabunganp` int(10) unsigned DEFAULT NULL,
  `rekkasvendor` varchar(15) CHARACTER SET utf8 NOT NULL,
  `rekutangvendor` varchar(15) CHARACTER SET utf8 NOT NULL,
  `maxtransvendor` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_paymenttabungan_departemen` (`departemen`),
  KEY `FK_paymenttabungan_tabungan` (`idtabungan`),
  KEY `FK_paymenttabungan_tabunganp` (`idtabunganp`),
  KEY `FK_paymenttabungan_rekkas` (`rekkasvendor`),
  KEY `FK_paymenttabungan_rekutang` (`rekutangvendor`),
  CONSTRAINT `FK_paymenttabungan_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttabungan_rekkas` FOREIGN KEY (`rekkasvendor`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttabungan_rekutang` FOREIGN KEY (`rekutangvendor`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttabungan_tabungan` FOREIGN KEY (`idtabungan`) REFERENCES `datatabungan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttabungan_tabunganp` FOREIGN KEY (`idtabunganp`) REFERENCES `datatabunganp` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenttabungan`
--

LOCK TABLES `paymenttabungan` WRITE;
/*!40000 ALTER TABLE `paymenttabungan` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymenttabungan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymenttrans`
--

DROP TABLE IF EXISTS `paymenttrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymenttrans` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sessionid` varchar(20) NOT NULL,
  `transactionid` varchar(20) NOT NULL,
  `transactionno` int(10) unsigned NOT NULL DEFAULT '0',
  `waktu` datetime NOT NULL,
  `tanggal` date NOT NULL,
  `vendorid` varchar(5) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL COMMENT '1 Pegawai, 2 Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `valmethod` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1 PIN, 2 Check',
  `keterangan` varchar(255) NOT NULL,
  `idjurnaltabcust` int(10) unsigned NOT NULL,
  `idjurnalvendor` int(10) unsigned NOT NULL,
  `jenistrans` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Vendor, 1 Iuran Wajib, 2 Iuran Sukarela',
  `idpenerimaanjtt` int(10) unsigned DEFAULT NULL,
  `idpenerimaaniuran` int(10) unsigned DEFAULT NULL,
  `iddatapenerimaan` int(10) unsigned DEFAULT NULL,
  `idrefund` int(10) unsigned DEFAULT NULL,
  `idtabungan` int(10) unsigned DEFAULT NULL,
  `idtabunganp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_paymenttrans` (`transactionid`,`transactionno`) USING BTREE,
  KEY `FK_paymenttrans_siswa` (`nis`),
  KEY `FK_paymenttrans_pegawai` (`nip`),
  KEY `FK_paymenttrans_jurnaltabcust` (`idjurnaltabcust`),
  KEY `FK_paymenttrans_jurnalvendor` (`idjurnalvendor`),
  KEY `FK_paymenttrans_penerimaanjtt` (`idpenerimaanjtt`),
  KEY `FK_paymenttrans_penerimaaniuran` (`idpenerimaaniuran`),
  KEY `FK_paymenttrans_datapenerimaan` (`iddatapenerimaan`),
  KEY `FK_paymenttrans_vendor` (`vendorid`),
  KEY `FK_paymenttrans_refund` (`idrefund`),
  KEY `FK_paymenttrans_tabungan` (`idtabungan`),
  KEY `FK_paymenttrans_tabunganp` (`idtabunganp`),
  KEY `IX_paymenttrans` (`userid`,`waktu`,`tanggal`,`jenis`,`jenistrans`) USING BTREE,
  CONSTRAINT `FK_paymenttrans_datapenerimaan` FOREIGN KEY (`iddatapenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttrans_jurnaltabcust` FOREIGN KEY (`idjurnaltabcust`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttrans_jurnalvendor` FOREIGN KEY (`idjurnalvendor`) REFERENCES `jurnal` (`replid`),
  CONSTRAINT `FK_paymenttrans_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttrans_penerimaaniuran` FOREIGN KEY (`idpenerimaaniuran`) REFERENCES `penerimaaniuran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttrans_penerimaanjtt` FOREIGN KEY (`idpenerimaanjtt`) REFERENCES `penerimaanjtt` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttrans_refund` FOREIGN KEY (`idrefund`) REFERENCES `refund` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttrans_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttrans_tabungan` FOREIGN KEY (`idtabungan`) REFERENCES `tabungan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttrans_tabunganp` FOREIGN KEY (`idtabunganp`) REFERENCES `tabunganp` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttrans_userpos` FOREIGN KEY (`userid`) REFERENCES `userpos` (`userid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_paymenttrans_vendor` FOREIGN KEY (`vendorid`) REFERENCES `vendor` (`vendorid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenttrans`
--

LOCK TABLES `paymenttrans` WRITE;
/*!40000 ALTER TABLE `paymenttrans` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymenttrans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemohonlain`
--

DROP TABLE IF EXISTS `pemohonlain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemohonlain` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_pemohonlain_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemohonlain`
--

LOCK TABLES `pemohonlain` WRITE;
/*!40000 ALTER TABLE `pemohonlain` DISABLE KEYS */;
/*!40000 ALTER TABLE `pemohonlain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerimaaniuran`
--

DROP TABLE IF EXISTS `penerimaaniuran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerimaaniuran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `alasan` varchar(500) DEFAULT '" "',
  `paymentid` varchar(20) DEFAULT NULL,
  `isschoolpay` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pembayaraniuran_jurnal` (`idjurnal`),
  KEY `FK_pembayaraniuran_datapenerimaan` (`idpenerimaan`),
  KEY `FK_pembayaraniuran_siswa` (`nis`),
  KEY `IX_penerimaaniuran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pembayaraniuran_datapenerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pembayaraniuran_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pembayaraniuran_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaaniuran`
--

LOCK TABLES `penerimaaniuran` WRITE;
/*!40000 ALTER TABLE `penerimaaniuran` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaaniuran` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_penerimaaniuran_100` AFTER INSERT ON `penerimaaniuran` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select departemen into xdepartemen
    	from datapenerimaan
    	where replid = new.idpenerimaan; 
		
    insert into transaksilog set sumber='penerimaaniuran', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_penerimaaniuran_101` AFTER UPDATE ON `penerimaaniuran` FOR EACH ROW BEGIN
	declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan 
			from jurnal where replid = new.idjurnal;
		
		select departemen into xdepartemen
			from datapenerimaan
			where replid = new.idpenerimaan; 
			
		update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
			idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0 
			where sumber='penerimaaniuran' and idsumber=new.replid;
		
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;	
		
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaaniuran', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaaniuran set statusdata=0, idaudit=xidaudit, replid=old.replid, idjurnal=old.idjurnal, 
			tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, idpenerimaan=old.idpenerimaan,
			nis=old.nis;
		
		insert into auditpenerimaaniuran set statusdata=1, idaudit=xidaudit, replid=new.replid, idjurnal=new.idjurnal, 
			tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, idpenerimaan=new.idpenerimaan,
			nis=new.nis;
		
	END IF;
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `penerimaaniurancalon`
--

DROP TABLE IF EXISTS `penerimaaniurancalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerimaaniurancalon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `idcalon` int(10) unsigned NOT NULL,
  `alasan` varchar(500) DEFAULT '" "',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_penerimaaniurancalon_datapenerimaan` (`idpenerimaan`),
  KEY `FK_penerimaaniurancalon_calon` (`idcalon`),
  KEY `FK_penerimaaniurancalon_jurnal` (`idjurnal`),
  KEY `IX_penerimaaniurancalon_ts` (`ts`,`issync`),
  CONSTRAINT `FK_penerimaaniurancalon_calon` FOREIGN KEY (`idcalon`) REFERENCES `jbsakad`.`calonsiswa` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_penerimaaniurancalon_datapenerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_penerimaaniurancalon_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaaniurancalon`
--

LOCK TABLES `penerimaaniurancalon` WRITE;
/*!40000 ALTER TABLE `penerimaaniurancalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaaniurancalon` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_penerimaaniurancalon_100` AFTER INSERT ON `penerimaaniurancalon` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select departemen into xdepartemen
    	from datapenerimaan
    	where replid = new.idpenerimaan; 
		
    insert into transaksilog set sumber='penerimaaniurancalon', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_penerimaaniurancalon_101` AFTER UPDATE ON `penerimaaniurancalon` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan 
			from jurnal where replid = new.idjurnal;
		
		select departemen into xdepartemen
			from datapenerimaan
			where replid = new.idpenerimaan; 
			
		update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
			idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0 
			where sumber='penerimaaniurancalon' and idsumber=new.replid;
			
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;	
		
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaaniurancalon', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaaniurancalon set statusdata=0, idaudit=xidaudit, replid=old.replid, idjurnal=old.idjurnal, 
			tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, idpenerimaan=old.idpenerimaan,
			idcalon=old.idcalon;
		
		insert into auditpenerimaaniurancalon set statusdata=1, idaudit=xidaudit, replid=new.replid, idjurnal=new.idjurnal, 
			tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, idpenerimaan=new.idpenerimaan,
			idcalon=new.idcalon;
	
	END IF;	
    		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `penerimaanjtt`
--

DROP TABLE IF EXISTS `penerimaanjtt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerimaanjtt` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idbesarjtt` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT ' ',
  `paymentid` varchar(20) DEFAULT NULL,
  `isschoolpay` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pembayaranjtt_besatjtt` (`idbesarjtt`),
  KEY `FK_pembayaranjtt_jurnal` (`idjurnal`),
  KEY `IX_penerimaanjtt_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pembayaranjtt_besatjtt` FOREIGN KEY (`idbesarjtt`) REFERENCES `besarjtt` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pembayaranjtt_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaanjtt`
--

LOCK TABLES `penerimaanjtt` WRITE;
/*!40000 ALTER TABLE `penerimaanjtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaanjtt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_penerimaanjtt_100` AFTER INSERT ON `penerimaanjtt` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
    
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select p.departemen into xdepartemen
    	from besarjtt b, datapenerimaan p
    	where b.idpenerimaan = p.replid and b.replid = new.idbesarjtt;
    
    insert into transaksilog set sumber='penerimaanjtt', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER trupd_penerimaanjtt_102 AFTER UPDATE ON jbsfina.penerimaanjtt
FOR EACH ROW BEGIN 
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan
			from jurnal where replid = new.idjurnal;
			
		select p.departemen into xdepartemen
			from besarjtt b, datapenerimaan p
			where b.idpenerimaan = p.replid and b.replid = new.idbesarjtt;
			
		update transaksilog set tanggal = new.tanggal, transaksi = xinfo, petugas = new.petugas, nokas = xnokas, 
			idtahunbuku = xidtahunbuku, keterangan = xketerangan, debet = new.jumlah, kredit = 0 
			where sumber='penerimaanjtt' and idsumber=new.replid;
			
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;
			
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaanjtt', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaanjtt set statusdata=0, idaudit=xidaudit, replid=old.replid, idbesarjtt=old.idbesarjtt, 
			idjurnal=old.idjurnal, tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, info1=old.info1, info2=old.info2, info3=old.info3;
			
		insert into auditpenerimaanjtt set statusdata=1, idaudit=xidaudit, replid=new.replid, idbesarjtt=new.idbesarjtt, 
			idjurnal=new.idjurnal, tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, info1=new.info1, info2=new.info2, info3=new.info3;
		
	END IF;		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `penerimaanjttcalon`
--

DROP TABLE IF EXISTS `penerimaanjttcalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerimaanjttcalon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idbesarjttcalon` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT '" "',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_penerimaanjttcalon_jurnal` (`idjurnal`),
  KEY `FK_penerimaanjttcalon_besarjtt` (`idbesarjttcalon`),
  KEY `IX_penerimaanjttcalon_ts` (`ts`,`issync`),
  CONSTRAINT `FK_penerimaanjttcalon_besarjttcalon` FOREIGN KEY (`idbesarjttcalon`) REFERENCES `besarjttcalon` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_penerimaanjttcalon_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaanjttcalon`
--

LOCK TABLES `penerimaanjttcalon` WRITE;
/*!40000 ALTER TABLE `penerimaanjttcalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaanjttcalon` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_penerimaanjttcalon_100` AFTER INSERT ON `penerimaanjttcalon` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
    
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select p.departemen into xdepartemen
    	from besarjttcalon b, datapenerimaan p
    	where b.idpenerimaan = p.replid and b.replid = new.idbesarjttcalon;
    
    insert into transaksilog set sumber='penerimaanjttcalon', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER trupd_penerimaanjttcalon_102 AFTER UPDATE ON jbsfina.penerimaanjttcalon
FOR EACH ROW BEGIN 
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan
			from jurnal where replid = new.idjurnal;
			
		select p.departemen into xdepartemen
			from besarjttcalon b, datapenerimaan p
			where b.idpenerimaan = p.replid and b.replid = new.idbesarjttcalon;
			
		update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
			idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0 
			where sumber='penerimaanjttcalon' and idsumber=new.replid;
		
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;
			
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaanjttcalon', idsumber=new.replid, tanggal=now(), petugas=  new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaanjttcalon set statusdata=0, idaudit=xidaudit, replid=old.replid, idbesarjttcalon=old.idbesarjttcalon, idjurnal=old.idjurnal, tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, info1=old.info1, info2=old.info2, info3=old.info3;
		
		insert into auditpenerimaanjttcalon set statusdata=1, idaudit=xidaudit, replid=new.replid, idbesarjttcalon=new.idbesarjttcalon, idjurnal=new.idjurnal, tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, info1=new.info1, info2=new.info2, info3=new.info3;

	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `penerimaanlain`
--

DROP TABLE IF EXISTS `penerimaanlain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerimaanlain` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `sumber` varchar(100) NOT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pembayaranlain_jurnal` (`idjurnal`),
  KEY `FK_pembayaranlain_datapenerimaan` (`idpenerimaan`),
  KEY `IX_penerimaanlain_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pembayaranlain_datapenerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pembayaranlain_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaanlain`
--

LOCK TABLES `penerimaanlain` WRITE;
/*!40000 ALTER TABLE `penerimaanlain` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaanlain` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_penerimaanlain_100` AFTER INSERT ON `penerimaanlain` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select departemen into xdepartemen
    	from datapenerimaan
    	where replid = new.idpenerimaan; 
		
    insert into transaksilog set sumber='penerimaanlain', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_penerimaanlain_101` AFTER UPDATE ON `penerimaanlain` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan 
			from jurnal where replid = new.idjurnal;
			
		select departemen into xdepartemen
			from datapenerimaan
			where replid = new.idpenerimaan; 
			
		update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
			idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0 
			where sumber='penerimaanlain' and idsumber=new.replid;
		
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;	
		
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaanlain', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaanlain set statusdata=0, idaudit=xidaudit, replid=old.replid, idjurnal=old.idjurnal, 
			tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, idpenerimaan=old.idpenerimaan,
			sumber=old.sumber;
			
		insert into auditpenerimaanlain set statusdata=1, idaudit=xidaudit, replid=new.replid, idjurnal=new.idjurnal, 
			tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, idpenerimaan=new.idpenerimaan,
			sumber=new.sumber;
		
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pengeluaran`
--

DROP TABLE IF EXISTS `pengeluaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengeluaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengeluaran` int(10) unsigned NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `jenispemohon` tinyint(1) unsigned NOT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `pemohonlain` int(10) unsigned DEFAULT NULL,
  `penerima` varchar(100) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `tanggalkeluar` datetime NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `petugas` varchar(45) DEFAULT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `keterangan` text,
  `namapemohon` varchar(100) NOT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pengeluaran_nis` (`nis`),
  KEY `FK_pengeluaran_nip` (`nip`),
  KEY `FK_pengeluaran_jurnal` (`idjurnal`),
  KEY `FK_pengeluaran_pemohonlain` (`pemohonlain`),
  KEY `IX_pengeluaran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pengeluaran_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengeluaran_nip` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengeluaran_nis` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengeluaran_pemohonlain` FOREIGN KEY (`pemohonlain`) REFERENCES `pemohonlain` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengeluaran`
--

LOCK TABLES `pengeluaran` WRITE;
/*!40000 ALTER TABLE `pengeluaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengeluaran` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_pengeluaran_100` AFTER INSERT ON `pengeluaran` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select departemen into xdepartemen
    	from datapengeluaran
    	where replid = new.idpengeluaran;
		
    insert into transaksilog set sumber='pengeluaran', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=0, kredit=new.jumlah, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_pengeluaran_100` AFTER UPDATE ON `pengeluaran` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    	
    select departemen into xdepartemen
    	from datapengeluaran
    	where replid = new.idpengeluaran;
		
    update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=0, kredit=new.jumlah
    	where sumber='pengeluaran' and idsumber=new.replid;
	
	IF new.tanggal <> old.tanggal THEN
        update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
    END IF;	
    
    insert into auditinfo set departemen=xdepartemen, sumber='pengeluaran', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
    
    select last_insert_id() into xidaudit;
    
    insert into auditpengeluaran set statusdata=0, idaudit=xidaudit, replid=old.replid, idpengeluaran=old.idpengeluaran, 
    	keperluan=old.keperluan, jenispemohon=old.jenispemohon, nip=old.nip, nis=old.nis, pemohonlain=old.pemohonlain, 
    	penerima=old.penerima, tanggal=old.tanggal, tanggalkeluar=old.tanggalkeluar, jumlah=old.jumlah, petugas=old.petugas,
    	idjurnal=old.idjurnal, keterangan=old.keterangan, namapemohon=old.namapemohon;
    
    insert into auditpengeluaran set statusdata=1, idaudit=xidaudit, replid=new.replid, idpengeluaran=new.idpengeluaran, 
    	keperluan=new.keperluan, jenispemohon=new.jenispemohon, nip=new.nip, nis=new.nis, pemohonlain=new.pemohonlain, 
    	penerima=new.penerima, tanggal=new.tanggal, tanggalkeluar=new.tanggalkeluar, jumlah=new.jumlah, petugas=new.petugas,
    	idjurnal=new.idjurnal, keterangan=new.keterangan, namapemohon=new.namapemohon;
    		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengguna` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `departemen` varchar(50) CHARACTER SET latin1 NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pengguna_pegawai` (`nip`),
  KEY `IX_pengguna_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pengguna_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengguna`
--

LOCK TABLES `pengguna` WRITE;
/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pgtrans`
--

DROP TABLE IF EXISTS `pgtrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pgtrans` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paymentid` varchar(25) NOT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `bankno` varchar(45) NOT NULL,
  `nomor` varchar(100) NOT NULL,
  `transaksi` varchar(5000) NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL COMMENT '1 Tagihan 2 Keranjang',
  `waktu` datetime NOT NULL,
  `tanggal` date NOT NULL,
  `idpetugas` varchar(30) NOT NULL,
  `petugas` varchar(255) NOT NULL,
  `ketver` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_banktrans` (`nomor`,`jenis`,`tanggal`) USING BTREE,
  KEY `FK_pgtrans_siswa` (`nis`),
  KEY `FK_pgtrans_pegawai` (`nip`),
  KEY `FK_pgtrans_calonsiswa` (`nic`),
  KEY `FK_pgtrans_idpetugas` (`idpetugas`),
  KEY `FK_pgtrans_departemen` (`departemen`),
  CONSTRAINT `FK_pgtrans_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtrans_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtrans_idpetugas` FOREIGN KEY (`idpetugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtrans_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtrans_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pgtrans`
--

LOCK TABLES `pgtrans` WRITE;
/*!40000 ALTER TABLE `pgtrans` DISABLE KEYS */;
/*!40000 ALTER TABLE `pgtrans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pgtransdata`
--

DROP TABLE IF EXISTS `pgtransdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pgtransdata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpgtrans` int(10) unsigned NOT NULL,
  `kategori` varchar(10) NOT NULL,
  `idtahunbuku` int(10) unsigned NOT NULL,
  `idpenerimaan` int(10) unsigned DEFAULT NULL,
  `idpenerimaanjtt` int(10) unsigned DEFAULT NULL,
  `idpenerimaaniuran` int(10) unsigned DEFAULT NULL,
  `idtabungan` int(10) unsigned DEFAULT NULL,
  `idtabungantr` int(10) unsigned DEFAULT NULL,
  `idtabunganp` int(10) unsigned DEFAULT NULL,
  `idtabunganptr` int(10) unsigned DEFAULT NULL,
  `kelompok` tinyint(3) unsigned NOT NULL COMMENT '1 Iuran 2 Tabungan 3 Tabungan Pegawai 4 Service Fee 5 Kelebihan',
  `jumlah` int(10) unsigned NOT NULL,
  `diskon` int(10) unsigned NOT NULL DEFAULT '0',
  `nokas` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_pgtransdata_pgtrans` (`idpgtrans`),
  KEY `FK_pgtransdata_penerimaan` (`idpenerimaan`),
  KEY `FK_pgtransdata_tahunbuku` (`idtahunbuku`),
  KEY `FK_pgtransdata_penerimaanjtt` (`idpenerimaanjtt`),
  KEY `FK_pgtransdata_tabungan` (`idtabungan`),
  KEY `FK_pgtransdata_tabunganp` (`idtabunganp`),
  KEY `IX_pgtransdata` (`kelompok`,`kategori`) USING BTREE,
  KEY `FK_pgtransdata_penerimaaniuran` (`idpenerimaaniuran`),
  KEY `FK_pgtransdata_tabungantr` (`idtabungantr`),
  KEY `FK_pgtransdata_tabunganptr` (`idtabunganptr`),
  CONSTRAINT `FK_pgtransdata_penerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtransdata_penerimaaniuran` FOREIGN KEY (`idpenerimaaniuran`) REFERENCES `penerimaaniuran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtransdata_penerimaanjtt` FOREIGN KEY (`idpenerimaanjtt`) REFERENCES `penerimaanjtt` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtransdata_pgtrans` FOREIGN KEY (`idpgtrans`) REFERENCES `pgtrans` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtransdata_tabungan` FOREIGN KEY (`idtabungan`) REFERENCES `datatabungan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtransdata_tabunganp` FOREIGN KEY (`idtabunganp`) REFERENCES `datatabunganp` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtransdata_tabunganptr` FOREIGN KEY (`idtabunganptr`) REFERENCES `tabunganp` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtransdata_tabungantr` FOREIGN KEY (`idtabungantr`) REFERENCES `tabungan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtransdata_tahunbuku` FOREIGN KEY (`idtahunbuku`) REFERENCES `tahunbuku` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pgtransdata`
--

LOCK TABLES `pgtransdata` WRITE;
/*!40000 ALTER TABLE `pgtransdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `pgtransdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pgtranslebih`
--

DROP TABLE IF EXISTS `pgtranslebih`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pgtranslebih` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `waktu` datetime NOT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `metode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nomor` varchar(100) NOT NULL,
  `jlebihtrans` int(10) unsigned NOT NULL DEFAULT '0',
  `jlebihsisa` int(10) unsigned NOT NULL DEFAULT '0',
  `bankno` varchar(50) NOT NULL,
  `prstatus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pridmutasi` int(10) unsigned DEFAULT NULL,
  `prket` varchar(255) DEFAULT NULL,
  `prwaktu` datetime DEFAULT NULL,
  `prpetugas` varchar(50) DEFAULT NULL,
  `prmetode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prjurnalbank` varchar(50) DEFAULT NULL,
  `pridtabungan` int(11) unsigned NOT NULL DEFAULT '0',
  `prnamatabungan` varchar(50) DEFAULT NULL,
  `prjurnaltabungan` varchar(50) DEFAULT NULL,
  `prpetugastf` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_pgtranslebih` (`tanggal`,`nomor`,`prstatus`),
  KEY `FK_pgtranslebih_departemen` (`departemen`),
  KEY `FK_pgtranslebih_bank` (`bankno`),
  KEY `FK_pgtranslebih_bankmutasi` (`pridmutasi`),
  CONSTRAINT `FK_pgtranslebih_bank` FOREIGN KEY (`bankno`) REFERENCES `bank` (`bankno`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtranslebih_bankmutasi` FOREIGN KEY (`pridmutasi`) REFERENCES `bankmutasi` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pgtranslebih_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pgtranslebih`
--

LOCK TABLES `pgtranslebih` WRITE;
/*!40000 ALTER TABLE `pgtranslebih` DISABLE KEYS */;
/*!40000 ALTER TABLE `pgtranslebih` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_pgtranslebih_ains AFTER INSERT ON jbsfina.pgtranslebih
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.pgtranslebih', iddata = NEW.id, state = 'I', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_pgtranslebih_aupd AFTER UPDATE ON jbsfina.pgtranslebih
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.pgtranslebih', iddata = OLD.id, state = 'U', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_pgtranslebih_adel AFTER DELETE ON jbsfina.pgtranslebih
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.pgtranslebih', iddata = OLD.id, state = 'D', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pgtranslog`
--

DROP TABLE IF EXISTS `pgtranslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pgtranslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentid` varchar(25) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` datetime NOT NULL,
  `metode` tinyint(4) unsigned NOT NULL COMMENT '1 Tagihan 2 Keranjang',
  `nomor` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 Berhasil -1 Gagal',
  `kelompok` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '0 Rincian 1 Hasil Akhir',
  `keterangan` varchar(255) NOT NULL,
  `jsonreturn` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_pgtranslog` (`tanggal`,`metode`,`nomor`,`kelompok`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pgtranslog`
--

LOCK TABLES `pgtranslog` WRITE;
/*!40000 ALTER TABLE `pgtranslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `pgtranslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtahunbuku` int(10) unsigned NOT NULL,
  `vendorid` varchar(5) NOT NULL,
  `waktu` datetime NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `idpenerima` varchar(50) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `idjurnalsiswa` int(10) unsigned NOT NULL DEFAULT '0',
  `idjurnalpegawai` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_refund_tahunbuku` (`idtahunbuku`),
  KEY `FK_refund_vendor` (`vendorid`),
  KEY `FK_refund_pegawai` (`nip`),
  KEY `FK_refund_userpos` (`idpenerima`),
  CONSTRAINT `FK_refund_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_refund_tahunbuku` FOREIGN KEY (`idtahunbuku`) REFERENCES `tahunbuku` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_refund_userpos` FOREIGN KEY (`idpenerima`) REFERENCES `userpos` (`userid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_refund_vendor` FOREIGN KEY (`vendorid`) REFERENCES `vendor` (`vendorid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunddate`
--

DROP TABLE IF EXISTS `refunddate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refunddate` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idrefund` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_refunddate_refund` (`idrefund`),
  CONSTRAINT `FK_refunddate_refund` FOREIGN KEY (`idrefund`) REFERENCES `refund` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunddate`
--

LOCK TABLES `refunddate` WRITE;
/*!40000 ALTER TABLE `refunddate` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunddate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rekakun`
--

DROP TABLE IF EXISTS `rekakun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rekakun` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(15) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kode`),
  UNIQUE KEY `UX_rekakun` (`replid`),
  KEY `FK_rekakun_katerekakun` (`kategori`),
  KEY `IX_rekakun_ts` (`ts`,`issync`),
  CONSTRAINT `FK_rekakun_katerekakun` FOREIGN KEY (`kategori`) REFERENCES `katerekakun` (`kategori`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rekakun`
--

LOCK TABLES `rekakun` WRITE;
/*!40000 ALTER TABLE `rekakun` DISABLE KEYS */;
INSERT INTO `rekakun` VALUES (1,'111','HARTA','Kas','Kas yang ada disekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',18600,0),(2,'112','HARTA','Kas Bank','Kas yang ada di bank yang digunakan sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',20390,0),(3,'113','HARTA','Kas BOS','Kas yang diterima dari sumbangan Bantuan Operasional Sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',46147,0),(4,'150','PIUTANG','Piutang Siswa','Piutang siswa kepada sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',38508,0),(5,'151','PIUTANG','Piutang Karyawan','Piutang karyawan kepada sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',54096,0),(6,'152','PIUTANG','Piutang Usaha','Piutang yang lain kepada sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',23895,0),(24,'153','PIUTANG','Piutang Calon Siswa','',NULL,NULL,NULL,'2012-01-02 00:58:13',0,0),(27,'154','PIUTANG','Piutang BOS','',NULL,NULL,NULL,'2012-01-02 01:00:51',0,0),(7,'411','PENDAPATAN','Pendapatan SPP','Pendapatan dari pembayaran SPP siswa',NULL,NULL,NULL,'2010-03-02 03:06:53',22719,0),(8,'412','PENDAPATAN','Pendapatan DSP','Pendapatan dari pembayaran DSP siswa',NULL,NULL,NULL,'2010-03-02 03:06:53',41907,0),(9,'413','PENDAPATAN','Pendapatan Sukarela Siswa','Pendapatan dari perolehan dana sukarela',NULL,NULL,NULL,'2010-03-02 03:06:53',10317,0),(10,'414','PENDAPATAN','Pendapatan BOS','Pendaptan dari penerimaan sumbangan Bantuan Operasional Sekolah (BOS)',NULL,NULL,NULL,'2010-03-02 03:06:53',56924,0),(25,'415','PENDAPATAN','Pendapatan Sukarela Calon Siswa','',NULL,NULL,NULL,'2012-01-02 00:58:41',0,0),(20,'421','PENDAPATAN','Diskon SPP','',NULL,NULL,NULL,'2012-01-02 00:14:27',0,0),(21,'422','PENDAPATAN','Diskon DSP','',NULL,NULL,NULL,'2012-01-02 00:56:29',0,0),(22,'423','PENDAPATAN','Diskon Sukarela Siswa','',NULL,NULL,NULL,'2012-01-02 00:56:43',0,0),(23,'424','PENDAPATAN','Diskon BOS','',NULL,NULL,NULL,'2012-01-02 00:56:53',0,0),(26,'425','PENDAPATAN','Diskon Sukarela Calon Siswa','',NULL,NULL,NULL,'2012-01-02 00:59:15',0,0),(11,'500','BIAYA','Beban Transportasi','Beban yang dikeluarkan untuk pembiayaan transportasi',NULL,NULL,NULL,'2010-03-02 03:06:53',57077,0),(12,'501','BIAYA','Beban Listrik','Beban yang dikeluarkan untuk melunasi tagihan PLN',NULL,NULL,NULL,'2010-03-02 03:06:53',49084,0),(13,'502','BIAYA','Beban Telpon','Beban yang dikeluarkan untuk pembiayaan tagihan telpon',NULL,NULL,NULL,'2010-03-02 03:06:53',8658,0),(14,'503','BIAYA','Beban Internet','Beban yang dikeluarkan untuk pembiayaan taghan Internet',NULL,NULL,NULL,'2010-03-02 03:06:53',27097,0),(15,'504','BIAYA','Beban ATK','Beban yang dikeluarkan untuk pembelian rutin ATK',NULL,NULL,NULL,'2010-03-02 03:06:53',43981,0),(16,'611','INVENTARIS','Peralatan Mengajar','Inventaris alat-alat kegiatan belajar mengajar',NULL,NULL,NULL,'2010-03-02 03:06:53',7554,0),(17,'612','INVENTARIS','Kendaraan','Inventaris kendaraan sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',36888,0),(18,'700','MODAL','Modal Usaha','Modal yang ditanamkan oleh pemodal kepada sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',30715,0),(19,'900','UTANG','Utang Usaha','Utang sekolah kepada kreditur',NULL,NULL,NULL,'2010-03-02 03:06:53',42913,0);
/*!40000 ALTER TABLE `rekakun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabungan`
--

DROP TABLE IF EXISTS `tabungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabungan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtabungan` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `nis` varchar(20) CHARACTER SET utf8 NOT NULL,
  `debet` decimal(15,0) NOT NULL,
  `kredit` decimal(15,0) NOT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `ispayment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_tabungan_datatabungan` (`idtabungan`),
  KEY `FK_tabungan_jurnal` (`idjurnal`),
  KEY `FK_tabungan_siswa` (`nis`),
  CONSTRAINT `FK_tabungan_datatabungan` FOREIGN KEY (`idtabungan`) REFERENCES `datatabungan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tabungan_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tabungan_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabungan`
--

LOCK TABLES `tabungan` WRITE;
/*!40000 ALTER TABLE `tabungan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabungan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_tabungan_100` AFTER INSERT ON `tabungan` 
FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
    
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select p.departemen into xdepartemen
    	from datatabungan p
    	where p.replid = new.idtabungan;
    
    insert into transaksilog set sumber='tabungan', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.debet, kredit=new.kredit, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER trupd_tabungan_102 AFTER UPDATE ON jbsfina.tabungan
FOR EACH ROW BEGIN 
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan
			from jurnal where replid = new.idjurnal;
			
		select p.departemen into xdepartemen
			from datatabungan p
			where p.replid = new.idtabungan;
			
		update transaksilog set tanggal = new.tanggal, transaksi = xinfo, petugas = new.petugas, nokas = xnokas, 
			idtahunbuku = xidtahunbuku, keterangan = xketerangan, debet = new.debet, kredit = new.kredit
			where sumber='tabungan' and idsumber=new.replid;
			
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;
			
		insert into auditinfo set departemen=xdepartemen, sumber='tabungan', 
			idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into audittabungan set statusdata=0, idaudit=xidaudit, idtabungan=old.idtabungan, 
			idjurnal=old.idjurnal, tanggal=old.tanggal, nis=old.nis, debet=old.debet, 
			kredit=old.kredit, petugas=old.petugas, keterangan=old.keterangan,
			info1=old.info1, info2=old.info2, info3=old.info3;
		
		insert into audittabungan set statusdata=1, idaudit=xidaudit, idtabungan=new.idtabungan, 
			idjurnal=new.idjurnal, tanggal=new.tanggal, nis=new.nis, debet=new.debet, 
			kredit=new.kredit, petugas=new.petugas, keterangan=new.keterangan,
			info1=new.info1, info2=new.info2, info3=new.info3;
					
	END IF;		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tabunganp`
--

DROP TABLE IF EXISTS `tabunganp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabunganp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtabungan` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `debet` decimal(15,0) NOT NULL,
  `kredit` decimal(15,0) NOT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `ispayment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_tabunganp_jurnal` (`idjurnal`),
  KEY `FK_tabunganp_pegawai` (`nip`),
  KEY `FK_tabunganp_datatabunganp` (`idtabungan`),
  CONSTRAINT `FK_tabunganp_datatabunganp` FOREIGN KEY (`idtabungan`) REFERENCES `datatabunganp` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tabunganp_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tabunganp_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabunganp`
--

LOCK TABLES `tabunganp` WRITE;
/*!40000 ALTER TABLE `tabunganp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabunganp` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_tabunganp_100` AFTER INSERT ON `jbsfina`.`tabunganp`
FOR EACH ROW BEGIN
	declare xinfo varchar(255);
	declare xnokas varchar(100);
	declare xidtahunbuku int;
	declare xketerangan varchar(255);
	declare xdepartemen varchar(25);

	select transaksi, nokas, idtahunbuku, keterangan
	into xinfo, xnokas, xidtahunbuku, xketerangan
	from jurnal where replid = new.idjurnal;

	select p.departemen into xdepartemen
	from datatabunganp p
	where p.replid = new.idtabungan;

	insert into transaksilog set sumber='tabunganp', idsumber=new.replid,
	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas,
	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.debet, kredit=new.kredit, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER trupd_tabunganp_102 AFTER UPDATE ON `jbsfina`.`tabunganp`
FOR EACH ROW BEGIN
	declare xinfo varchar(255);
	declare xnokas varchar(100);
	declare xidtahunbuku int;
	declare xketerangan varchar(255);
	declare xidaudit int;
	declare xdepartemen varchar(25);

	IF @DISABLE_TRIGER IS NULL THEN

		select transaksi, nokas, idtahunbuku, keterangan
		into xinfo, xnokas, xidtahunbuku, xketerangan
		from jurnal where replid = new.idjurnal;

		select p.departemen into xdepartemen
		from datatabunganp p
		where p.replid = new.idtabungan;

		update transaksilog set tanggal = new.tanggal, transaksi = xinfo, petugas = new.petugas, nokas = xnokas,
		idtahunbuku = xidtahunbuku, keterangan = xketerangan, debet = new.debet, kredit = new.kredit
		where sumber='tabunganp' and idsumber=new.replid;

		IF new.tanggal <> old.tanggal THEN
		update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;

		insert into auditinfo set departemen=xdepartemen, sumber='tabunganp',
		idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;

		select last_insert_id() into xidaudit;

		insert into audittabunganp set statusdata=0, idaudit=xidaudit, idtabungan=old.idtabungan,
		idjurnal=old.idjurnal, tanggal=old.tanggal, nip=old.nip, debet=old.debet,
		kredit=old.kredit, petugas=old.petugas, keterangan=old.keterangan,
		info1=old.info1, info2=old.info2, info3=old.info3;

		insert into audittabunganp set statusdata=1, idaudit=xidaudit, idtabungan=new.idtabungan,
		idjurnal=new.idjurnal, tanggal=new.tanggal, nip=new.nip, debet=new.debet,
		kredit=new.kredit, petugas=new.petugas, keterangan=new.keterangan,
		info1=new.info1, info2=new.info2, info3=new.info3;

	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tagihancount`
--

DROP TABLE IF EXISTS `tagihancount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagihancount` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `bulan` tinyint(3) unsigned NOT NULL,
  `tahun` smallint(5) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tagihancount_idx` (`departemen`),
  KEY `IX_tagihancount` (`bulan`,`tahun`) USING BTREE,
  CONSTRAINT `FK_tagihancount` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagihancount`
--

LOCK TABLES `tagihancount` WRITE;
/*!40000 ALTER TABLE `tagihancount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagihancount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagihanset`
--

DROP TABLE IF EXISTS `tagihanset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagihanset` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nomor` varchar(15) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `idtahunbuku` int(11) unsigned NOT NULL,
  `idtingkat` int(11) unsigned DEFAULT NULL,
  `idkelas` varchar(500) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `idiuran` varchar(500) NOT NULL,
  `stiuran` varchar(500) NOT NULL,
  `petugas` varchar(30) DEFAULT NULL,
  `bulan` tinyint(3) unsigned NOT NULL,
  `tahun` smallint(5) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tanggalbuat` datetime NOT NULL,
  `issync` tinyint(3) unsigned NOT NULL,
  `token` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tagihanset_departemen` (`departemen`),
  KEY `FK_tagihanset_pegawai` (`petugas`),
  KEY `FK_tagihanset_tahunbuku` (`idtahunbuku`),
  KEY `FK_tagihanset_siswa` (`nis`),
  KEY `IX_tagihanset` (`idtahunbuku`,`bulan`,`tahun`,`issync`,`tanggalbuat`,`nomor`) USING BTREE,
  CONSTRAINT `FK_tagihanset_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tagihanset_pegawai` FOREIGN KEY (`petugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tagihanset_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tagihanset_tahunbuku` FOREIGN KEY (`idtahunbuku`) REFERENCES `tahunbuku` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagihanset`
--

LOCK TABLES `tagihanset` WRITE;
/*!40000 ALTER TABLE `tagihanset` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagihanset` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_tagihanset_ains AFTER INSERT ON jbsfina.tagihanset
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.tagihanset', iddata = NEW.replid, state = 'I', dataload = 1
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_tagihanset_aupd AFTER UPDATE ON jbsfina.tagihanset
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.tagihanset', iddata = OLD.replid, state = 'U', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_tagihanset_adel AFTER DELETE ON jbsfina.tagihanset
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.tagihanset', iddata = OLD.replid, state = 'D', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tagihansetcount`
--

DROP TABLE IF EXISTS `tagihansetcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagihansetcount` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `bulan` tinyint(3) unsigned NOT NULL,
  `tahun` smallint(5) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tagihansetcount_idx` (`departemen`),
  KEY `IX_tagihansetcount` (`bulan`,`tahun`) USING BTREE,
  CONSTRAINT `FK_tagihansetcount` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagihansetcount`
--

LOCK TABLES `tagihansetcount` WRITE;
/*!40000 ALTER TABLE `tagihansetcount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagihansetcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagihansiswadata`
--

DROP TABLE IF EXISTS `tagihansiswadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagihansiswadata` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idtagihanset` int(11) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `notagihan` varchar(100) CHARACTER SET latin1 NOT NULL,
  `bulan` tinyint(4) unsigned NOT NULL,
  `tahun` smallint(6) unsigned NOT NULL,
  `idbesarjtt` int(11) unsigned DEFAULT NULL,
  `idpenerimaan` int(11) unsigned DEFAULT NULL,
  `penerimaan` varchar(255) NOT NULL,
  `jtagihan` decimal(15,0) unsigned NOT NULL,
  `jdiskon` decimal(15,0) unsigned NOT NULL,
  `jbesar` decimal(15,0) NOT NULL,
  `jbayar` decimal(15,0) NOT NULL,
  `jsisa` decimal(15,0) NOT NULL,
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `issync` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `token` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tagihansiswadata_siswa` (`nis`),
  KEY `FK_tagihansiswadata_tagihanset` (`idtagihanset`),
  KEY `FK_tagihansiswadata_datapenerimaan` (`idpenerimaan`),
  KEY `FK_tagihansiswadata_besarjtt` (`idbesarjtt`),
  KEY `IX_tagihansiswadata` (`notagihan`,`bulan`,`tahun`,`status`,`aktif`,`issync`) USING BTREE,
  CONSTRAINT `FK_tagihansiswadata_besarjtt` FOREIGN KEY (`idbesarjtt`) REFERENCES `besarjtt` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tagihansiswadata_datapenerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tagihansiswadata_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tagihansiswadata_tagihanset` FOREIGN KEY (`idtagihanset`) REFERENCES `tagihanset` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagihansiswadata`
--

LOCK TABLES `tagihansiswadata` WRITE;
/*!40000 ALTER TABLE `tagihansiswadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagihansiswadata` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_tagihansiswadata_ains AFTER INSERT ON jbsfina.tagihansiswadata
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.tagihansiswadata', iddata = NEW.replid, state = 'I', dataload = 1
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_tagihansiswadata_aupd AFTER UPDATE ON jbsfina.tagihansiswadata
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.tagihansiswadata', iddata = OLD.replid, state = 'U', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_tagihansiswadata_adel AFTER DELETE ON jbsfina.tagihansiswadata
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.tagihansiswadata', iddata = OLD.replid, state = 'D', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tagihansiswainfo`
--

DROP TABLE IF EXISTS `tagihansiswainfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagihansiswainfo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtagihanset` int(11) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `bulan` int(11) unsigned NOT NULL,
  `tahun` int(11) unsigned NOT NULL,
  `notagihan` varchar(100) NOT NULL,
  `info` varchar(2000) NOT NULL,
  `jumlah` decimal(15,0) unsigned NOT NULL,
  `status` tinyint(4) unsigned NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `issync` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `token` smallint(5) unsigned NOT NULL,
  `ckdate` datetime DEFAULT NULL,
  `ckdesc` varchar(255) DEFAULT NULL,
  `ckjsuserid` varchar(20) DEFAULT NULL,
  `ckjsusername` varchar(255) DEFAULT NULL,
  `ckjsdevid` varchar(20) DEFAULT NULL,
  `ckjsdevname` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tagihansiswainfo_siswa` (`nis`),
  KEY `FK_tagihansiswainfo_tagihanset` (`idtagihanset`),
  KEY `IX_tagihansiswainfo` (`bulan`,`tahun`,`notagihan`,`status`,`aktif`,`issync`) USING BTREE,
  CONSTRAINT `FK_tagihansiswainfo_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tagihansiswainfo_tagihanset` FOREIGN KEY (`idtagihanset`) REFERENCES `tagihanset` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagihansiswainfo`
--

LOCK TABLES `tagihansiswainfo` WRITE;
/*!40000 ALTER TABLE `tagihansiswainfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagihansiswainfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_tagihansiswainfo_ains AFTER INSERT ON jbsfina.tagihansiswainfo
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.tagihansiswainfo', iddata = NEW.replid, state = 'I', dataload = 1
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_tagihansiswainfo_aupd AFTER UPDATE ON jbsfina.tagihansiswainfo
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.tagihansiswainfo', iddata = OLD.replid, state = 'U', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbsfina.jssync_tagihansiswainfo_adel AFTER DELETE ON jbsfina.tagihansiswainfo
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbsfina.tagihansiswainfo', iddata = OLD.replid, state = 'D', dataload = 1
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tahunbuku`
--

DROP TABLE IF EXISTS `tahunbuku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tahunbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` varchar(100) NOT NULL,
  `awalan` varchar(5) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `cacah` bigint(20) unsigned NOT NULL DEFAULT '0',
  `departemen` varchar(50) NOT NULL,
  `tanggalmulai` date NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_tahunbuku_departemen` (`departemen`),
  KEY `IX_tahunbuku_ts` (`ts`,`issync`),
  CONSTRAINT `FK_tahunbuku_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tahunbuku`
--

LOCK TABLES `tahunbuku` WRITE;
/*!40000 ALTER TABLE `tahunbuku` DISABLE KEYS */;
/*!40000 ALTER TABLE `tahunbuku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksilog`
--

DROP TABLE IF EXISTS `transaksilog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksilog` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sumber` varchar(45) NOT NULL,
  `idsumber` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `transaksi` varchar(255) NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `nokas` varchar(100) NOT NULL,
  `idtahunbuku` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `debet` decimal(15,0) NOT NULL DEFAULT '0',
  `kredit` decimal(15,0) NOT NULL DEFAULT '0',
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_transaksilog_departemen` (`departemen`),
  KEY `IX_transaksilog_ts` (`ts`,`issync`),
  CONSTRAINT `FK_transaksilog_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksilog`
--

LOCK TABLES `transaksilog` WRITE;
/*!40000 ALTER TABLE `transaksilog` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksilog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transgen`
--

DROP TABLE IF EXISTS `transgen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transgen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transactionid` varchar(20) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_transgen` (`transactionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transgen`
--

LOCK TABLES `transgen` WRITE;
/*!40000 ALTER TABLE `transgen` DISABLE KEYS */;
/*!40000 ALTER TABLE `transgen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpos`
--

DROP TABLE IF EXISTS `userpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpos` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `passlength` tinyint(3) unsigned NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `foto` mediumtext,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `UX_userpos` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpos`
--

LOCK TABLES `userpos` WRITE;
/*!40000 ALTER TABLE `userpos` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userposlog`
--

DROP TABLE IF EXISTS `userposlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userposlog` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vendorid` varchar(5) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `logtime` datetime NOT NULL,
  `sessionid` varchar(15) NOT NULL,
  `localip` varchar(15) NOT NULL,
  `device` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_userposlog_vendor` (`vendorid`),
  KEY `FK_userposlog_userpos` (`userid`),
  CONSTRAINT `FK_userposlog_userpos` FOREIGN KEY (`userid`) REFERENCES `userpos` (`userid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_userposlog_vendor` FOREIGN KEY (`vendorid`) REFERENCES `vendor` (`vendorid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userposlog`
--

LOCK TABLES `userposlog` WRITE;
/*!40000 ALTER TABLE `userposlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `userposlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vendorid` varchar(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `terimaiuran` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `valmethod` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '1 PIN Only, 2 PIN and Agreement',
  `kirimpesan` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tanggal` datetime NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `UX_vendor` (`vendorid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'KASIR','KASIR SEKOLAH',1,1,2,1,'2020-10-27 10:06:03',''),(2,'KOPSI','KOPERASI SEKOLAH',1,0,2,1,'2020-10-27 10:06:20',''),(3,'KANTN','KANTIN SEKOLAH',1,0,2,0,'2020-10-27 10:06:29','');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendoruser`
--

DROP TABLE IF EXISTS `vendoruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendoruser` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vendorid` varchar(5) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `tingkat` tinyint(3) unsigned NOT NULL COMMENT '1 Manager, 2 User',
  PRIMARY KEY (`replid`),
  KEY `FK_vendoruser_vendor` (`vendorid`),
  KEY `FK_vendoruser_userpos` (`userid`),
  CONSTRAINT `FK_vendoruser_userpos` FOREIGN KEY (`userid`) REFERENCES `userpos` (`userid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_vendoruser_vendor` FOREIGN KEY (`vendorid`) REFERENCES `vendor` (`vendorid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendoruser`
--

LOCK TABLES `vendoruser` WRITE;
/*!40000 ALTER TABLE `vendoruser` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendoruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsletter`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsletter` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsletter`;

--
-- Table structure for table `anggota`
--

DROP TABLE IF EXISTS `anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anggota` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelompok` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL COMMENT '0 Siswa, 1 Pegawai, 2 Other',
  `nis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nouser` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_anggota_kelompok` (`idkelompok`),
  KEY `FK_anggota_siswa` (`nis`),
  KEY `FK_anggota_pegawai` (`nip`),
  CONSTRAINT `FK_anggota_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `kelompok` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggota`
--

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `berkassurat`
--

DROP TABLE IF EXISTS `berkassurat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `berkassurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL COMMENT '0 Gambar, 1 File',
  `berkas` longblob NOT NULL,
  `w` int(10) unsigned DEFAULT '0',
  `h` int(10) unsigned DEFAULT '0',
  `size` int(10) unsigned DEFAULT '0',
  `sumber` varchar(5) NOT NULL COMMENT 'SCAN, FILE',
  `deskripsi` varchar(255) NOT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_gambarsurat_surat` (`idsurat`),
  CONSTRAINT `FK_gambarsurat_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berkassurat`
--

LOCK TABLES `berkassurat` WRITE;
/*!40000 ALTER TABLE `berkassurat` DISABLE KEYS */;
/*!40000 ALTER TABLE `berkassurat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cclist`
--

DROP TABLE IF EXISTS `cclist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cclist` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `jenis` varchar(3) NOT NULL COMMENT 'IN, OUT',
  `iduser` varchar(30) CHARACTER SET utf8 NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_cclist_pegawai` (`iduser`),
  KEY `FK_cclist_departemen` (`departemen`),
  CONSTRAINT `FK_cclist_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_cclist_pegawai` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cclist`
--

LOCK TABLES `cclist` WRITE;
/*!40000 ALTER TABLE `cclist` DISABLE KEYS */;
/*!40000 ALTER TABLE `cclist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `tanggal` datetime NOT NULL,
  `komen` varchar(500) NOT NULL,
  `fkomen` varchar(1500) NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_comment_surat` (`idsurat`),
  KEY `FK_comment_pegawai` (`nip`),
  CONSTRAINT `FK_comment_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_comment_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `jenis` varchar(3) NOT NULL COMMENT 'IN OUT',
  `kategori` varchar(100) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_kategori_departemen` (`departemen`),
  CONSTRAINT `FK_kategori_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompok`
--

DROP TABLE IF EXISTS `kelompok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(2555) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_kelompok_departemen` (`departemen`),
  CONSTRAINT `FK_kelompok_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompok`
--

LOCK TABLES `kelompok` WRITE;
/*!40000 ALTER TABLE `kelompok` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sumberin`
--

DROP TABLE IF EXISTS `sumberin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sumberin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `sumber` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_sumberin_departemen` (`departemen`),
  CONSTRAINT `FK_sumberin_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sumberin`
--

LOCK TABLES `sumberin` WRITE;
/*!40000 ALTER TABLE `sumberin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sumberin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surat`
--

DROP TABLE IF EXISTS `surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `nomor` varchar(100) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `idkategori` int(10) unsigned NOT NULL,
  `jenis` varchar(3) NOT NULL COMMENT 'IN, OUT',
  `sifat` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '1 Sangat Penting, 2 Penting, 3 Biasa',
  `deskripsi` varchar(2500) NOT NULL,
  `keterangan` varchar(2500) DEFAULT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastactive` datetime DEFAULT NULL,
  `idfile` varchar(1500) NOT NULL DEFAULT '[]',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_surat_departemen` (`departemen`),
  KEY `FK_surat_pegawai` (`petugas`),
  KEY `FK_surat_kategori` (`idkategori`),
  KEY `IX_surat` (`nomor`,`perihal`,`tanggal`,`deskripsi`(767),`keterangan`(767)) USING BTREE,
  KEY `IX_surat_lastactive` (`lastactive`),
  CONSTRAINT `FK_surat_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_surat_kategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_surat_pegawai` FOREIGN KEY (`petugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surat`
--

LOCK TABLES `surat` WRITE;
/*!40000 ALTER TABLE `surat` DISABLE KEYS */;
/*!40000 ALTER TABLE `surat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratindstcc`
--

DROP TABLE IF EXISTS `suratindstcc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratindstcc` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `iduser` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_suratindstcc_surat` (`idsurat`),
  KEY `FK_suratindstcc_pegawai` (`iduser`),
  CONSTRAINT `FK_suratindstcc_pegawai` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratindstcc_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratindstcc`
--

LOCK TABLES `suratindstcc` WRITE;
/*!40000 ALTER TABLE `suratindstcc` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratindstcc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratindstgroup`
--

DROP TABLE IF EXISTS `suratindstgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratindstgroup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_suratindstgroup_kelompok` (`idkelompok`),
  KEY `FK_suratindstgroup_surat` (`idsurat`),
  CONSTRAINT `FK_suratindstgroup_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `kelompok` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratindstgroup_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratindstgroup`
--

LOCK TABLES `suratindstgroup` WRITE;
/*!40000 ALTER TABLE `suratindstgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratindstgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratindstuser`
--

DROP TABLE IF EXISTS `suratindstuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratindstuser` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `iduser` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idsiswa` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `jenis` varchar(1) DEFAULT NULL COMMENT 'P,S,A',
  PRIMARY KEY (`replid`),
  KEY `FK_suratindstuser_pegawai` (`iduser`),
  KEY `FK_suratindstuser_surat` (`idsurat`),
  KEY `FK_suratindstuser_siswa` (`idsiswa`),
  CONSTRAINT `FK_suratindstuser_pegawai` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratindstuser_siswa` FOREIGN KEY (`idsiswa`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratindstuser_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratindstuser`
--

LOCK TABLES `suratindstuser` WRITE;
/*!40000 ALTER TABLE `suratindstuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratindstuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratinsrc`
--

DROP TABLE IF EXISTS `suratinsrc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratinsrc` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `idsumber` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_suratinsrc_sumber` (`idsumber`),
  KEY `FK_suratinsrc_surat` (`idsurat`),
  CONSTRAINT `FK_suratinsrc_sumber` FOREIGN KEY (`idsumber`) REFERENCES `sumberin` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratinsrc_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratinsrc`
--

LOCK TABLES `suratinsrc` WRITE;
/*!40000 ALTER TABLE `suratinsrc` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratinsrc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratoutdst`
--

DROP TABLE IF EXISTS `suratoutdst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratoutdst` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `idtujuan` int(10) unsigned DEFAULT NULL,
  `iduser` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idsiswa` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idkelompok` int(10) unsigned DEFAULT NULL,
  `jenis` varchar(1) NOT NULL COMMENT 'T,P,S,A,G',
  PRIMARY KEY (`replid`),
  KEY `FK_suratoutdst_tujuanout` (`idtujuan`),
  KEY `FK_suratoutdst_surat` (`idsurat`),
  KEY `FK_suratoutdst_pegawai` (`iduser`),
  KEY `FK_suratoutdst_siswa` (`idsiswa`),
  KEY `FK_suratoutdst_kelompok` (`idkelompok`),
  CONSTRAINT `FK_suratoutdst_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `kelompok` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutdst_pegawai` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutdst_siswa` FOREIGN KEY (`idsiswa`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutdst_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutdst_tujuanout` FOREIGN KEY (`idtujuan`) REFERENCES `tujuanout` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratoutdst`
--

LOCK TABLES `suratoutdst` WRITE;
/*!40000 ALTER TABLE `suratoutdst` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratoutdst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratoutsrccc`
--

DROP TABLE IF EXISTS `suratoutsrccc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratoutsrccc` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `iduser` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_suratoutccuser_surat` (`idsurat`),
  KEY `FK_suratoutccuser_pegawai` (`iduser`),
  CONSTRAINT `FK_suratoutccuser_pegawai` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutccuser_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratoutsrccc`
--

LOCK TABLES `suratoutsrccc` WRITE;
/*!40000 ALTER TABLE `suratoutsrccc` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratoutsrccc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratoutsrcgroup`
--

DROP TABLE IF EXISTS `suratoutsrcgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratoutsrcgroup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_suratoutsrcgroup_surat` (`idsurat`),
  KEY `FK_suratoutsrcgroup_kelompok` (`idkelompok`),
  CONSTRAINT `FK_suratoutsrcgroup_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `kelompok` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutsrcgroup_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratoutsrcgroup`
--

LOCK TABLES `suratoutsrcgroup` WRITE;
/*!40000 ALTER TABLE `suratoutsrcgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratoutsrcgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratoutsrcuser`
--

DROP TABLE IF EXISTS `suratoutsrcuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratoutsrcuser` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `iduser` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idsiswa` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `jenis` varchar(1) DEFAULT NULL COMMENT 'P,S,A',
  PRIMARY KEY (`replid`),
  KEY `FK_suratoutsrcuser_pegawai` (`iduser`),
  KEY `FK_suratoutsrcuser_surat` (`idsurat`),
  KEY `FK_suratoutsrcuser_siswa` (`idsiswa`),
  CONSTRAINT `FK_suratoutsrcuser_pegawai` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutsrcuser_siswa` FOREIGN KEY (`idsiswa`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutsrcuser_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratoutsrcuser`
--

LOCK TABLES `suratoutsrcuser` WRITE;
/*!40000 ALTER TABLE `suratoutsrcuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratoutsrcuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tujuanout`
--

DROP TABLE IF EXISTS `tujuanout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tujuanout` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tujuanout_departemen` (`departemen`),
  CONSTRAINT `FK_tujuanout_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tujuanout`
--

LOCK TABLES `tujuanout` WRITE;
/*!40000 ALTER TABLE `tujuanout` DISABLE KEYS */;
/*!40000 ALTER TABLE `tujuanout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `userlevel` tinyint(1) unsigned NOT NULL COMMENT '1 -> Manager, 2 -> Client',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_user_pegawai` (`userid`),
  CONSTRAINT `FK_user_pegawai` FOREIGN KEY (`userid`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccess`
--

DROP TABLE IF EXISTS `useraccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccess` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iduser` int(10) unsigned NOT NULL,
  `departemen` varchar(45) NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_useraccess_fruser` (`iduser`),
  KEY `FK_useraccess_departemen` (`departemen`),
  CONSTRAINT `FK_useraccess_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_useraccess_fruser` FOREIGN KEY (`iduser`) REFERENCES `user` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccess`
--

LOCK TABLES `useraccess` WRITE;
/*!40000 ALTER TABLE `useraccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `useraccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsperpus`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsperpus` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsperpus`;

--
-- Table structure for table `aktivitas`
--

DROP TABLE IF EXISTS `aktivitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aktivitas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `aktivitas` text,
  `perpustakaan` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_aktivitas_ts` (`ts`,`issync`),
  KEY `FK_aktivitas_perpustakaan2` (`perpustakaan`),
  CONSTRAINT `FK_aktivitas_perpustakaan2` FOREIGN KEY (`perpustakaan`) REFERENCES `perpustakaan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aktivitas`
--

LOCK TABLES `aktivitas` WRITE;
/*!40000 ALTER TABLE `aktivitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `aktivitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anggota`
--

DROP TABLE IF EXISTS `anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anggota` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `noregistrasi` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `alamat` varchar(255) NOT NULL,
  `kodepos` varchar(6) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telpon` varchar(100) DEFAULT NULL,
  `HP` varchar(100) DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `institusi` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tgldaftar` date NOT NULL DEFAULT '0000-00-00',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `foto` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Index_nopen` (`noregistrasi`),
  UNIQUE KEY `UX_anggota` (`noregistrasi`),
  KEY `IX_anggota_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 2020352 kB; InnoDB free: 2020352 kB; (`NoRegist';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggota`
--

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daftarpustaka`
--

DROP TABLE IF EXISTS `daftarpustaka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daftarpustaka` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pustaka` int(10) unsigned NOT NULL,
  `perpustakaan` int(10) unsigned NOT NULL,
  `kodepustaka` varchar(45) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0 dipinjam, 1 tersedia',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_daftarpustaka` (`kodepustaka`),
  KEY `FK_daftarpustaka_perpus` (`perpustakaan`),
  KEY `FK_daftarpustaka_pustaka` (`pustaka`),
  KEY `IX_daftarpustaka_ts` (`ts`,`issync`),
  KEY `IX_daftarpustaka_kode` (`kodepustaka`,`info1`),
  CONSTRAINT `FK_daftarpustaka_perpus` FOREIGN KEY (`perpustakaan`) REFERENCES `perpustakaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_daftarpustaka_pustaka` FOREIGN KEY (`pustaka`) REFERENCES `pustaka` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daftarpustaka`
--

LOCK TABLES `daftarpustaka` WRITE;
/*!40000 ALTER TABLE `daftarpustaka` DISABLE KEYS */;
/*!40000 ALTER TABLE `daftarpustaka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denda`
--

DROP TABLE IF EXISTS `denda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `denda` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpinjam` int(10) unsigned NOT NULL,
  `denda` int(10) DEFAULT '0',
  `telat` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_denda_idpeminjaman` (`idpinjam`),
  KEY `IX_denda_ts` (`ts`,`issync`),
  CONSTRAINT `FK_denda_idpeminjaman` FOREIGN KEY (`idpinjam`) REFERENCES `pinjam` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denda`
--

LOCK TABLES `denda` WRITE;
/*!40000 ALTER TABLE `denda` DISABLE KEYS */;
/*!40000 ALTER TABLE `denda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `format`
--

DROP TABLE IF EXISTS `format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `format` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Kode_U` (`kode`),
  KEY `IX_format_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `format`
--

LOCK TABLES `format` WRITE;
/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` VALUES (1,'BU','Buku','',NULL,NULL,NULL,'2010-03-08 01:40:53',0,0);
/*!40000 ALTER TABLE `format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `katalog`
--

DROP TABLE IF EXISTS `katalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `katalog` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(15) NOT NULL,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `rak` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `counter` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_IN` (`kode`),
  KEY `FK_katalog_rak` (`rak`),
  KEY `IX_katalog_ts` (`ts`,`issync`),
  CONSTRAINT `FK_katalog_rak` FOREIGN KEY (`rak`) REFERENCES `rak` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `katalog`
--

LOCK TABLES `katalog` WRITE;
/*!40000 ALTER TABLE `katalog` DISABLE KEYS */;
INSERT INTO `katalog` VALUES (1,'000','KARYA UMUM',1,'Klasifikasi pustaka dalam kelompok karya umum ',0,NULL,NULL,NULL,'2010-03-07 10:28:08',48886,0),(2,'010','Bibliografi',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',34247,0),(3,'020','Perpustakaan dan Informasi Sains',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',24576,0),(4,'030','Ensiklopedia dan Buku Pintar',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',20137,0),(5,'040','(   ...   )',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',26959,0),(6,'050','Majalah, Jurnal dan Terbitan Berkala',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',8852,0),(7,'060','Asosiasi, Organisasi dan Museum',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',28911,0),(8,'070','Media Berita, Jurnalisme dan Publikasi',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',52469,0),(9,'080','Kutipan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',44550,0),(10,'090','manuskrip dan buku-buku langka',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',65344,0),(11,'100','FILSAFAT',1,'Klasifikasi pustaka yang tergolong dalam ilmu filsafat',0,NULL,NULL,NULL,'2010-03-07 10:28:08',62009,0),(12,'110','Metafisika',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',48483,0),(13,'120','Epistemologi',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',56389,0),(14,'130','Parapsikologi dan Perdukunan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',5433,0),(15,'140','Filsafat Aliran Pemikiran',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',54588,0),(16,'150','Psikologi',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',60049,0),(17,'160','Logika',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',5421,0),(18,'170','Etika',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',43547,0),(19,'180','Filsafat kuno, pertengahan dan lanjutan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',4883,0),(20,'190','Filsafat Barat Modern',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',24833,0),(21,'200','AGAMA',1,'Klasifikasi pustaka yang berkaitan dengan keagamaan',0,NULL,NULL,NULL,'2010-03-07 10:28:08',43986,0),(22,'210','Filsafat dan Teori Agama',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',14372,0),(23,'220','Injil',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',5431,0),(24,'300','ILMU SOSIAL, SOSIOLOGI dan ANTROPOLOGI',1,'Pengelompokan Pustaka dalam kategori ilmu sosial',0,NULL,NULL,NULL,'2010-03-07 10:28:08',49567,0),(25,'310','Statistika Umum',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',34952,0),(26,'320','Ilmu Politik',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',26057,0),(27,'330','Ekonomi',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',25429,0),(28,'340','Hukum',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',48975,0),(29,'350','Administrasi Umum dan Ilmu Militer',1,'',2,NULL,NULL,NULL,'2010-03-08 01:44:43',37528,0),(30,'360','Permasalahan Sosial dan Pelayanan Sosial',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',40716,0),(31,'370','Pendidikan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',25463,0),(32,'380','Perdagangan, Komunikasi dan Perhubungan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',5165,0),(33,'390','Kewarganegaraan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',14967,0),(34,'400','BAHASA',1,'Klasifikasi pustaka dalam kelompok bahasa',0,NULL,NULL,NULL,'2010-03-07 10:28:08',59340,0),(35,'410','Linguistik',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',55207,0),(36,'420','BAHASA INGGRIS',1,'pengelompokan pustaka (bahasa) dalam kelompok bahasa inggris',0,NULL,NULL,NULL,'2010-03-07 10:28:08',32485,0),(37,'430','Bahasa Arab',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',62332,0),(38,'500','ILMU MURNI',1,'klasifikasi pustaka dalam kelompok ilmu murni',0,NULL,NULL,NULL,'2010-03-07 10:28:08',17616,0),(39,'510','Matematika',1,'pengelompokan pustaka (ilmu murni) dalam kelompok matematika',0,NULL,NULL,NULL,'2010-03-07 10:28:08',32144,0),(40,'530','Fisika',1,'pengelompokan pustaka ilmu murni berdasarkan klas fisika ',0,NULL,NULL,NULL,'2010-03-07 10:28:08',42340,0),(41,'540','Kimia',1,'klasifikasi pustaka ilmu murni dalam kelompok ilmu kimia',0,NULL,NULL,NULL,'2010-03-07 10:28:08',49740,0),(42,'570','Biologi',1,'pengelompokan pustaka ilmu murni kedalam klas biologi',0,NULL,NULL,NULL,'2010-03-07 10:28:08',56148,0),(43,'600','ILMU TERAPAN',1,'pengelompokan pustaka kedalam kategori ilmu terapan',0,NULL,NULL,NULL,'2010-03-07 10:28:08',458,0),(44,'700','KESENIAN',1,'Pengelompokan pustaka kedalam kategori kesenian',0,NULL,NULL,NULL,'2010-03-07 10:28:08',30437,0),(45,'710','Kreasi dan Ketrampilan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',19752,0),(46,'800','KESUSASTERAAN',1,'klasifikasi pustaka berdasarkan kelompok sastra',0,NULL,NULL,NULL,'2010-03-07 10:28:08',7445,0),(47,'900','GEOGRAFI dan SEJARAH ',1,'klasifikasi pustaka kedalam kelompok ilmu geografi dan sejarah',0,NULL,NULL,NULL,'2010-03-07 10:28:08',43502,0);
/*!40000 ALTER TABLE `katalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konfigurasi`
--

DROP TABLE IF EXISTS `konfigurasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konfigurasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned DEFAULT NULL,
  `pegawai` int(10) unsigned DEFAULT NULL,
  `other` int(10) unsigned DEFAULT NULL,
  `denda` int(10) unsigned DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_konfigurasi_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konfigurasi`
--

LOCK TABLES `konfigurasi` WRITE;
/*!40000 ALTER TABLE `konfigurasi` DISABLE KEYS */;
INSERT INTO `konfigurasi` VALUES (1,3,4,0,0,NULL,NULL,NULL,'2010-03-25 06:24:56',0,0);
/*!40000 ALTER TABLE `konfigurasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerbit`
--

DROP TABLE IF EXISTS `penerbit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerbit` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `alamat` varchar(255) DEFAULT NULL,
  `telpon` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `kontak` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`),
  KEY `IX_penerbit_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerbit`
--

LOCK TABLES `penerbit` WRITE;
/*!40000 ALTER TABLE `penerbit` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerbit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penulis`
--

DROP TABLE IF EXISTS `penulis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penulis` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `kontak` varchar(255) DEFAULT NULL,
  `biografi` text,
  `keterangan` varchar(255) DEFAULT NULL,
  `gelardepan` varchar(45) DEFAULT NULL,
  `gelarbelakang` varchar(45) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`),
  KEY `IX_penulis_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penulis`
--

LOCK TABLES `penulis` WRITE;
/*!40000 ALTER TABLE `penulis` DISABLE KEYS */;
/*!40000 ALTER TABLE `penulis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perpustakaan`
--

DROP TABLE IF EXISTS `perpustakaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perpustakaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Nama` (`nama`),
  KEY `IX_perpustakaan_ts` (`ts`,`issync`),
  KEY `FK_perpustakaan_departemen` (`departemen`),
  CONSTRAINT `FK_perpustakaan_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perpustakaan`
--

LOCK TABLES `perpustakaan` WRITE;
/*!40000 ALTER TABLE `perpustakaan` DISABLE KEYS */;
INSERT INTO `perpustakaan` VALUES (1,'sma','',NULL,NULL,NULL,NULL,'2010-03-08 01:40:44',0,0);
/*!40000 ALTER TABLE `perpustakaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pinjam`
--

DROP TABLE IF EXISTS `pinjam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pinjam` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodepustaka` varchar(45) NOT NULL,
  `tglpinjam` date NOT NULL DEFAULT '0000-00-00',
  `tglkembali` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `idanggota` varchar(45) NOT NULL,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idmember` varchar(20) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 belum di acc, 1 udah di acc, 2 udah dikembalikan',
  `tglditerima` date NOT NULL DEFAULT '0000-00-00',
  `petugaspinjam` varchar(50) DEFAULT NULL,
  `petugaskembali` varchar(50) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`) USING BTREE,
  KEY `IX_pinjam_ts` (`ts`,`issync`),
  KEY `FK_pinjam_daftarpustaka` (`kodepustaka`),
  KEY `FK_pinjam_siswa` (`nis`),
  KEY `FK_pinjam_pegawai` (`nip`),
  KEY `FK_pinjam_member` (`idmember`),
  CONSTRAINT `FK_pinjam_daftarpustaka` FOREIGN KEY (`kodepustaka`) REFERENCES `daftarpustaka` (`kodepustaka`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pinjam_member` FOREIGN KEY (`idmember`) REFERENCES `anggota` (`noregistrasi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pinjam_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pinjam_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pinjam`
--

LOCK TABLES `pinjam` WRITE;
/*!40000 ALTER TABLE `pinjam` DISABLE KEYS */;
/*!40000 ALTER TABLE `pinjam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pustaka`
--

DROP TABLE IF EXISTS `pustaka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pustaka` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL DEFAULT '',
  `abstraksi` text NOT NULL,
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `tahun` int(4) unsigned NOT NULL DEFAULT '0',
  `keteranganfisik` varchar(255) NOT NULL DEFAULT '',
  `penulis` int(10) unsigned NOT NULL,
  `penerbit` int(10) unsigned NOT NULL,
  `format` int(10) unsigned NOT NULL,
  `katalog` int(10) unsigned NOT NULL,
  `cover` blob,
  `keterangan` varchar(255) DEFAULT NULL,
  `harga` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pustaka_penulis` (`penulis`),
  KEY `FK_pustaka_format` (`format`),
  KEY `FK_pustaka_katalog` (`katalog`),
  KEY `FK_pustaka_penerbit` (`penerbit`),
  KEY `IX_pustaka_ts` (`ts`,`issync`),
  KEY `IX_pustaka_judul` (`judul`,`keyword`),
  CONSTRAINT `FK_pustaka_format` FOREIGN KEY (`format`) REFERENCES `format` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pustaka_katalog` FOREIGN KEY (`katalog`) REFERENCES `katalog` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pustaka_penerbit` FOREIGN KEY (`penerbit`) REFERENCES `penerbit` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pustaka_penulis` FOREIGN KEY (`penulis`) REFERENCES `penulis` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pustaka`
--

LOCK TABLES `pustaka` WRITE;
/*!40000 ALTER TABLE `pustaka` DISABLE KEYS */;
/*!40000 ALTER TABLE `pustaka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rak`
--

DROP TABLE IF EXISTS `rak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rak` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rak` varchar(25) NOT NULL,
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Kode_U` (`rak`),
  KEY `IX_rak_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rak`
--

LOCK TABLES `rak` WRITE;
/*!40000 ALTER TABLE `rak` DISABLE KEYS */;
INSERT INTO `rak` VALUES (1,'Rak','contoh data',NULL,NULL,NULL,'2010-03-07 10:25:32',0,0);
/*!40000 ALTER TABLE `rak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbssat`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbssat` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbssat`;

--
-- Table structure for table `frabsence`
--

DROP TABLE IF EXISTS `frabsence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frabsence` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(30) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `idtingkat` int(10) unsigned DEFAULT NULL,
  `idkelas` int(10) unsigned DEFAULT NULL,
  `datenop` date NOT NULL,
  `status` varchar(7) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `idreportsisfo` int(10) unsigned DEFAULT NULL,
  `idreportsisfoemp` int(10) unsigned DEFAULT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frabsence_siswa` (`nis`),
  KEY `FK_frabsence_pegawai` (`nip`),
  KEY `FK_frabsence_frsisforeport` (`idreportsisfo`),
  KEY `FK_frabsence_departemen` (`departemen`),
  KEY `FK_frabsence_frsisforeportemp` (`idreportsisfoemp`),
  KEY `FK_frabsence_tingkat` (`idtingkat`),
  KEY `FK_frabsence_kelas` (`idkelas`),
  KEY `IX_freabsence` (`datenop`,`nip`,`nis`) USING BTREE,
  CONSTRAINT `FK_frabsence_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frabsence_frsisforeport` FOREIGN KEY (`idreportsisfo`) REFERENCES `frsisforeport` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frabsence_frsisforeportemp` FOREIGN KEY (`idreportsisfoemp`) REFERENCES `frsisforeportemp` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frabsence_kelas` FOREIGN KEY (`idkelas`) REFERENCES `jbsakad`.`kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frabsence_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frabsence_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frabsence_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frabsence`
--

LOCK TABLES `frabsence` WRITE;
/*!40000 ALTER TABLE `frabsence` DISABLE KEYS */;
/*!40000 ALTER TABLE `frabsence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `franggota`
--

DROP TABLE IF EXISTS `franggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `franggota` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelompok` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL COMMENT '0 Siswa, 1 Pegawai, 2 Other',
  `nis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nouser` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_franggota_frkelompok` (`idkelompok`),
  KEY `FK_franggota_siswa` (`nis`),
  KEY `FK_franggota_pegawai` (`nip`),
  CONSTRAINT `FK_franggota_frkelompok` FOREIGN KEY (`idkelompok`) REFERENCES `frkelompok` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_franggota_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_franggota_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franggota`
--

LOCK TABLES `franggota` WRITE;
/*!40000 ALTER TABLE `franggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `franggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frconfigassms`
--

DROP TABLE IF EXISTS `frconfigassms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frconfigassms` (
  `departemen` varchar(45) NOT NULL,
  `asin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `asout` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pengirim` varchar(45) NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  KEY `FK_frconfigassms_departemen` (`departemen`),
  CONSTRAINT `FK_frconfigassms_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frconfigassms`
--

LOCK TABLES `frconfigassms` WRITE;
/*!40000 ALTER TABLE `frconfigassms` DISABLE KEYS */;
INSERT INTO `frconfigassms` VALUES ('SMA',0,0,'JIBAS SPT FGR','0','00:00',NULL);
/*!40000 ALTER TABLE `frconfigassms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frconfigassmsact`
--

DROP TABLE IF EXISTS `frconfigassmsact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frconfigassmsact` (
  `idkegiatan` int(10) unsigned NOT NULL,
  `asin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aslate` tinyint(1) unsigned NOT NULL,
  `asout` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pengirim` varchar(45) NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  KEY `FK_frconfigassmsact_kegiatan` (`idkegiatan`),
  CONSTRAINT `FK_frconfigassmsact_kegiatan` FOREIGN KEY (`idkegiatan`) REFERENCES `frkegiatan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frconfigassmsact`
--

LOCK TABLES `frconfigassmsact` WRITE;
/*!40000 ALTER TABLE `frconfigassmsact` DISABLE KEYS */;
/*!40000 ALTER TABLE `frconfigassmsact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frdata`
--

DROP TABLE IF EXISTS `frdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frdata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownertype` tinyint(1) unsigned NOT NULL COMMENT '0 = Siswa, 1 = Pegawai',
  `nis` varchar(30) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `template` blob NOT NULL,
  `image` mediumblob NOT NULL,
  `fingerpos` varchar(4) NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `lastpresence` datetime DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `verify` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frdata_siswa` (`nis`),
  KEY `FK_frdata_pegawai` (`nip`),
  KEY `FK_frdata_departemen` (`departemen`),
  KEY `IX_frdata` (`ownertype`,`nis`,`nip`,`departemen`),
  CONSTRAINT `FK_frdata_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frdata_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frdata_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frdata`
--

LOCK TABLES `frdata` WRITE;
/*!40000 ALTER TABLE `frdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `frdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frformatsms`
--

DROP TABLE IF EXISTS `frformatsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frformatsms` (
  `smstype` varchar(10) NOT NULL,
  `smsformat` varchar(500) NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`smstype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frformatsms`
--

LOCK TABLES `frformatsms` WRITE;
/*!40000 ALTER TABLE `frformatsms` DISABLE KEYS */;
INSERT INTO `frformatsms` VALUES ('MASUK','Kami informasikan presensi {NAMA} tanggal {TANGGAL}/{BULAN}/{TAHUN}, masuk jam {JAM_MASUK}',NULL,NULL,NULL),('PULANG','Kami informasikan presensi {NAMA} tanggal {TANGGAL}/{BULAN}/{TAHUN}, masuk jam {JAM_MASUK} pulang jam {JAM_PULANG}',NULL,NULL,NULL),('TAKHADIR','Kami informasikan bahwa siswa {NAMA} tidak hadir di sekolah pada tanggal {TANGGAL}/{BULAN}/{TAHUN}',NULL,NULL,NULL),('TELAT','Kami informasikan presensi {NAMA} tanggal {TANGGAL}/{BULAN}/{TAHUN}, masuk jam {JAM_MASUK}, terlambat {MENIT_TELAT} menit',NULL,NULL,NULL);
/*!40000 ALTER TABLE `frformatsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frformatsmsact`
--

DROP TABLE IF EXISTS `frformatsmsact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frformatsmsact` (
  `smstype` varchar(10) NOT NULL,
  `smsformat` varchar(500) NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`smstype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frformatsmsact`
--

LOCK TABLES `frformatsmsact` WRITE;
/*!40000 ALTER TABLE `frformatsmsact` DISABLE KEYS */;
INSERT INTO `frformatsmsact` VALUES ('MASUK','Kami informasikan presensi {NAMA} di kegiatan {KEGIATAN} tanggal {TANGGAL}/{BULAN}/{TAHUN}, masuk jam {JAM_MASUK}',NULL,NULL,NULL),('PULANG','Kami informasikan presensi {NAMA} di kegiatan {KEGIATAN} tanggal {TANGGAL}/{BULAN}/{TAHUN}, masuk jam {JAM_MASUK} pulang jam {JAM_PULANG}',NULL,NULL,NULL),('TAKHADIR','Kami informasikan bahwa siswa {NAMA} di kegiatan {KEGIATAN} tidak hadir di sekolah pada tanggal {TANGGAL}/{BULAN}/{TAHUN}',NULL,NULL,NULL),('TELAT','Kami informasikan presensi {NAMA} di kegiatan {KEGIATAN} tanggal {TANGGAL}/{BULAN}/{TAHUN}, masuk jam {JAM_MASUK}, terlambat {MENIT_TELAT} menit',NULL,NULL,NULL);
/*!40000 ALTER TABLE `frformatsmsact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frfreetime`
--

DROP TABLE IF EXISTS `frfreetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frfreetime` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `mintime` int(10) unsigned NOT NULL DEFAULT '1',
  `senin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `selasa` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rabu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kamis` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `jumat` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sabtu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minggu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `mintime0` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'mintime senin',
  `mintime1` int(10) unsigned NOT NULL DEFAULT '0',
  `mintime2` int(10) unsigned NOT NULL DEFAULT '0',
  `mintime3` int(10) unsigned NOT NULL DEFAULT '0',
  `mintime4` int(10) unsigned NOT NULL DEFAULT '0',
  `mintime5` int(10) unsigned NOT NULL DEFAULT '0',
  `mintime6` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_frfreetime_pegawai` (`nip`),
  CONSTRAINT `FK_frfreetime_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frfreetime`
--

LOCK TABLES `frfreetime` WRITE;
/*!40000 ALTER TABLE `frfreetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `frfreetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frjadwalkegiatan`
--

DROP TABLE IF EXISTS `frjadwalkegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frjadwalkegiatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkegiatan` int(10) unsigned NOT NULL,
  `hari` tinyint(1) unsigned NOT NULL COMMENT '1 Minggu 2 Senin 7 Sabtu',
  `masukaw` varchar(7) NOT NULL,
  `masukak` varchar(7) NOT NULL,
  `telat` varchar(7) NOT NULL,
  `pulangaw` varchar(7) NOT NULL,
  `pulangak` varchar(7) NOT NULL,
  `pulangstd` varchar(7) NOT NULL,
  `mmasukaw` int(10) unsigned NOT NULL,
  `mmasukak` int(10) unsigned NOT NULL,
  `mtelat` int(10) unsigned NOT NULL,
  `mpulangaw` int(10) unsigned NOT NULL,
  `mpulangak` int(10) unsigned NOT NULL,
  `mpulangstd` int(10) unsigned NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frjadwalkegiatan_kegiatan` (`idkegiatan`),
  CONSTRAINT `FK_frjadwalkegiatan_kegiatan` FOREIGN KEY (`idkegiatan`) REFERENCES `frkegiatan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frjadwalkegiatan`
--

LOCK TABLES `frjadwalkegiatan` WRITE;
/*!40000 ALTER TABLE `frjadwalkegiatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `frjadwalkegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frjadwalsekolah`
--

DROP TABLE IF EXISTS `frjadwalsekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frjadwalsekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 Siswa 1 Pegawai',
  `pos` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hari` tinyint(1) unsigned NOT NULL COMMENT '1 Minggu 2 Senin 7 Sabtu',
  `masukaw` varchar(7) NOT NULL,
  `masukak` varchar(7) NOT NULL,
  `telat` varchar(7) NOT NULL,
  `pulangaw` varchar(7) NOT NULL,
  `pulangak` varchar(7) NOT NULL,
  `pulangstd` varchar(7) NOT NULL,
  `mmasukaw` int(10) unsigned NOT NULL,
  `mmasukak` int(10) unsigned NOT NULL,
  `mtelat` int(10) unsigned NOT NULL,
  `mpulangaw` int(10) unsigned NOT NULL,
  `mpulangak` int(10) unsigned NOT NULL,
  `mpulangstd` int(10) unsigned NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frjadwalsekolah`
--

LOCK TABLES `frjadwalsekolah` WRITE;
/*!40000 ALTER TABLE `frjadwalsekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `frjadwalsekolah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frkegiatan`
--

DROP TABLE IF EXISTS `frkegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frkegiatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kegiatan` varchar(100) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `jeniswaktu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 Berbatas Waktu, 1 Tidak Berbatas Waktu',
  `tglawal` date DEFAULT NULL,
  `tglakhir` date DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `jenispeserta` tinyint(1) unsigned NOT NULL,
  `idkelompok` int(10) unsigned DEFAULT NULL,
  `iddepartemen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `idtingkat` int(10) unsigned DEFAULT NULL,
  `idkelas` int(10) unsigned DEFAULT NULL,
  `kelompokpegawai` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 Akademik, 1 Non Akademik',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frkegiatan_kelompok` (`idkelompok`),
  KEY `FK_frkegiatan_departemen` (`iddepartemen`),
  KEY `FK_frkegiatan_tingkat` (`idtingkat`),
  KEY `FK_frkegiatan_kelas` (`idkelas`),
  KEY `FK_frkegiatan_departemenowner` (`departemen`),
  CONSTRAINT `FK_frkegiatan_departemen` FOREIGN KEY (`iddepartemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frkegiatan_departemenowner` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frkegiatan_kelas` FOREIGN KEY (`idkelas`) REFERENCES `jbsakad`.`kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frkegiatan_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `frkelompok` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frkegiatan_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frkegiatan`
--

LOCK TABLES `frkegiatan` WRITE;
/*!40000 ALTER TABLE `frkegiatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `frkegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frkelompok`
--

DROP TABLE IF EXISTS `frkelompok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frkelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(2555) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frkelompok_departemen` (`departemen`),
  CONSTRAINT `FK_frkelompok_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frkelompok`
--

LOCK TABLES `frkelompok` WRITE;
/*!40000 ALTER TABLE `frkelompok` DISABLE KEYS */;
/*!40000 ALTER TABLE `frkelompok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frother`
--

DROP TABLE IF EXISTS `frother`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frother` (
  `nouser` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nouser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frother`
--

LOCK TABLES `frother` WRITE;
/*!40000 ALTER TABLE `frother` DISABLE KEYS */;
/*!40000 ALTER TABLE `frother` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frpeserta`
--

DROP TABLE IF EXISTS `frpeserta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frpeserta` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkegiatan` int(10) unsigned NOT NULL,
  `nis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nouser` varchar(10) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_frpeserta_siswa` (`nis`),
  KEY `FK_frpeserta_pegawai` (`nip`),
  KEY `FK_frpeserta_frother` (`nouser`),
  KEY `FK_frpeserta_frkegiatan` (`idkegiatan`),
  CONSTRAINT `FK_frpeserta_frkegiatan` FOREIGN KEY (`idkegiatan`) REFERENCES `frkegiatan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_frpeserta_frother` FOREIGN KEY (`nouser`) REFERENCES `frother` (`nouser`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpeserta_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpeserta_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frpeserta`
--

LOCK TABLES `frpeserta` WRITE;
/*!40000 ALTER TABLE `frpeserta` DISABLE KEYS */;
/*!40000 ALTER TABLE `frpeserta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frpresence`
--

DROP TABLE IF EXISTS `frpresence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frpresence` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(30) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `idtingkat` int(10) unsigned DEFAULT NULL,
  `idkelas` int(10) unsigned DEFAULT NULL,
  `date_in` date NOT NULL,
  `time_in` varchar(10) NOT NULL,
  `frid_in` int(10) unsigned DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `time_out` varchar(10) DEFAULT NULL,
  `frid_out` int(10) unsigned DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `smssent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `smssenthome` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `source` varchar(2) NOT NULL DEFAULT 'F' COMMENT 'F -> Fingerprint, M -< Manual',
  `reportsisfo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `idreportsisfo` int(10) unsigned DEFAULT NULL,
  `idreportsisfoemp` int(10) unsigned DEFAULT NULL,
  `idpetugas` varchar(30) DEFAULT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frpresence_frsisforeport` (`idreportsisfo`),
  KEY `FK_frpresence_pegawai` (`nip`),
  KEY `IX_frpresence_date` (`nis`,`nip`,`date_in`,`smssent`,`smssenthome`,`reportsisfo`) USING BTREE,
  KEY `FK_frpresence_departemen` (`departemen`),
  KEY `FK_frpresence_frsisforeportemp` (`idreportsisfoemp`),
  KEY `FK_frpresence_tingkat` (`idtingkat`),
  KEY `FK_frpresence_kelas` (`idkelas`),
  KEY `FK_frpresence_petugas` (`idpetugas`),
  KEY `FK_frpresence_frdata_in` (`frid_in`),
  KEY `FK_frpresence_frdata_out` (`frid_out`),
  CONSTRAINT `FK_frpresence_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_frdata_in` FOREIGN KEY (`frid_in`) REFERENCES `frdata` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_frdata_out` FOREIGN KEY (`frid_out`) REFERENCES `frdata` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_frsisforeport` FOREIGN KEY (`idreportsisfo`) REFERENCES `frsisforeport` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_frsisforeportemp` FOREIGN KEY (`idreportsisfoemp`) REFERENCES `frsisforeportemp` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_kelas` FOREIGN KEY (`idkelas`) REFERENCES `jbsakad`.`kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_petugas` FOREIGN KEY (`idpetugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frpresence`
--

LOCK TABLES `frpresence` WRITE;
/*!40000 ALTER TABLE `frpresence` DISABLE KEYS */;
/*!40000 ALTER TABLE `frpresence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frpresensikegiatan`
--

DROP TABLE IF EXISTS `frpresensikegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frpresensikegiatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkegiatan` int(10) unsigned NOT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `nouser` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `date_in` date NOT NULL,
  `time_in` varchar(10) NOT NULL,
  `frid_in` int(10) unsigned DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `time_out` varchar(10) DEFAULT NULL,
  `frid_out` int(10) unsigned DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `smssent` tinyint(1) unsigned DEFAULT '0',
  `smssenthome` tinyint(1) unsigned DEFAULT '0',
  `source` varchar(1) NOT NULL DEFAULT 'F',
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frpresensikegiatan_kegiatan` (`idkegiatan`),
  KEY `FK_frpresensikegiatan_siswa` (`nis`),
  KEY `FK_frpresensikegiatan_pegawai` (`nip`),
  KEY `FK_frpresensikegiatan_other` (`nouser`),
  KEY `FK_frpresensikegiatan_frdata_in` (`frid_in`),
  KEY `FK_frpresensikegiatan_frdata_out` (`frid_out`),
  CONSTRAINT `FK_frpresensikegiatan_frdata_in` FOREIGN KEY (`frid_in`) REFERENCES `frdata` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresensikegiatan_frdata_out` FOREIGN KEY (`frid_out`) REFERENCES `frdata` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresensikegiatan_kegiatan` FOREIGN KEY (`idkegiatan`) REFERENCES `frkegiatan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresensikegiatan_other` FOREIGN KEY (`nouser`) REFERENCES `frother` (`nouser`) ON UPDATE NO ACTION,
  CONSTRAINT `FK_frpresensikegiatan_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresensikegiatan_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frpresensikegiatan`
--

LOCK TABLES `frpresensikegiatan` WRITE;
/*!40000 ALTER TABLE `frpresensikegiatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `frpresensikegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frruntext`
--

DROP TABLE IF EXISTS `frruntext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frruntext` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frruntext`
--

LOCK TABLES `frruntext` WRITE;
/*!40000 ALTER TABLE `frruntext` DISABLE KEYS */;
INSERT INTO `frruntext` VALUES (1,'JIBAS Sistem Presensi Terpadu Fingerprint');
/*!40000 ALTER TABLE `frruntext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frsisforeport`
--

DROP TABLE IF EXISTS `frsisforeport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frsisforeport` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `startdate` tinyint(3) unsigned NOT NULL,
  `enddate` tinyint(3) unsigned NOT NULL,
  `h` int(10) unsigned NOT NULL,
  `i` int(10) unsigned NOT NULL,
  `s` int(10) unsigned NOT NULL,
  `c` int(10) unsigned NOT NULL,
  `a` int(10) unsigned NOT NULL,
  `departemen` varchar(45) NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frsisforeport_departemen` (`departemen`),
  KEY `FK_frsisforeport_tingkat` (`idtingkat`),
  CONSTRAINT `FK_frsisforeport_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frsisforeport_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frsisforeport`
--

LOCK TABLES `frsisforeport` WRITE;
/*!40000 ALTER TABLE `frsisforeport` DISABLE KEYS */;
/*!40000 ALTER TABLE `frsisforeport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frsisforeportemp`
--

DROP TABLE IF EXISTS `frsisforeportemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frsisforeportemp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `startdate` tinyint(3) unsigned NOT NULL,
  `enddate` tinyint(3) unsigned NOT NULL,
  `h` int(10) unsigned NOT NULL,
  `i` int(10) unsigned NOT NULL,
  `s` int(10) unsigned NOT NULL,
  `c` int(10) unsigned NOT NULL,
  `a` int(10) unsigned NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frsisforeportemp`
--

LOCK TABLES `frsisforeportemp` WRITE;
/*!40000 ALTER TABLE `frsisforeportemp` DISABLE KEYS */;
/*!40000 ALTER TABLE `frsisforeportemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fruser`
--

DROP TABLE IF EXISTS `fruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fruser` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `userlevel` tinyint(1) unsigned NOT NULL COMMENT '1 -> Manager, 2 -> Client',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_fruser_pegawai` (`userid`),
  CONSTRAINT `FK_fruser_pegawai` FOREIGN KEY (`userid`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fruser`
--

LOCK TABLES `fruser` WRITE;
/*!40000 ALTER TABLE `fruser` DISABLE KEYS */;
/*!40000 ALTER TABLE `fruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fruseraccess`
--

DROP TABLE IF EXISTS `fruseraccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fruseraccess` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iduser` int(10) unsigned NOT NULL,
  `departemen` varchar(45) NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_fruseraccess_fruser` (`iduser`),
  KEY `FK_fruseraccess_departemen` (`departemen`),
  CONSTRAINT `FK_fruseraccess_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_fruseraccess_fruser` FOREIGN KEY (`iduser`) REFERENCES `fruser` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fruseraccess`
--

LOCK TABLES `fruseraccess` WRITE;
/*!40000 ALTER TABLE `fruseraccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `fruseraccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbssdm`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbssdm` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbssdm`;

--
-- Table structure for table `bagianpegawai`
--

DROP TABLE IF EXISTS `bagianpegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bagianpegawai` (
  `bagian` varchar(50) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bagian`),
  KEY `UXBagianPegawai` (`replid`),
  KEY `IX_bagianpegawai_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bagianpegawai`
--

LOCK TABLES `bagianpegawai` WRITE;
/*!40000 ALTER TABLE `bagianpegawai` DISABLE KEYS */;
INSERT INTO `bagianpegawai` VALUES ('Akademik',1,1,NULL,NULL,NULL,'2010-03-02 03:08:32',53202,0),('Non Akademik',2,2,NULL,NULL,NULL,'2010-03-02 03:08:32',19723,0);
/*!40000 ALTER TABLE `bagianpegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diklat`
--

DROP TABLE IF EXISTS `diklat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diklat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rootid` int(10) unsigned NOT NULL,
  `allowselect` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `diklat` varchar(45) NOT NULL,
  `tingkat` tinyint(3) unsigned NOT NULL,
  `jenis` varchar(1) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_diklat_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diklat`
--

LOCK TABLES `diklat` WRITE;
/*!40000 ALTER TABLE `diklat` DISABLE KEYS */;
INSERT INTO `diklat` VALUES (11,0,1,'DIKLAT STRUKTURAL',0,'S',NULL,NULL,NULL,'2012-06-19 00:00:00',23097,0),(12,0,0,'DIKLAT FUNGSIONAL',0,'F',NULL,NULL,NULL,'2012-06-19 00:00:00',29220,0),(26,11,1,'Diklat Kepemimpinan',2,'',NULL,NULL,NULL,'2012-06-19 00:00:00',11276,0),(28,12,1,'Diklat Pengajaran',2,'',NULL,NULL,NULL,'2012-06-19 00:00:00',34253,0);
/*!40000 ALTER TABLE `diklat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eselon`
--

DROP TABLE IF EXISTS `eselon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eselon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eselon` varchar(15) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL,
  `isdefault` tinyint(1) DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eselon`),
  UNIQUE KEY `UX_eselon` (`replid`),
  KEY `IX_eselon_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eselon`
--

LOCK TABLES `eselon` WRITE;
/*!40000 ALTER TABLE `eselon` DISABLE KEYS */;
INSERT INTO `eselon` VALUES (5,'(Tidak Ada)',1,1,NULL,NULL,NULL,'2012-06-19 00:00:00',6374,0),(1,'Eselon I',2,0,NULL,NULL,NULL,'2012-06-19 00:00:00',60172,0),(2,'Eselon II',3,0,NULL,NULL,NULL,'2012-06-19 00:00:00',19617,0),(3,'Eselon III',4,0,NULL,NULL,NULL,'2012-06-19 00:00:00',48627,0),(4,'Eselon IV',5,0,NULL,NULL,NULL,'2012-06-19 00:00:00',53226,0);
/*!40000 ALTER TABLE `eselon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golongan`
--

DROP TABLE IF EXISTS `golongan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golongan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `golongan` varchar(14) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`golongan`),
  UNIQUE KEY `UX_golongan` (`replid`),
  KEY `IX_golongan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golongan`
--

LOCK TABLES `golongan` WRITE;
/*!40000 ALTER TABLE `golongan` DISABLE KEYS */;
INSERT INTO `golongan` VALUES (18,'(Tidak Ada)',1,1,'Tidak Ada Golongan',NULL,NULL,NULL,'2012-06-19 00:00:00',54715,0),(1,'IA',1,2,'Juru Muda',NULL,NULL,NULL,'2012-06-19 00:00:00',48370,0),(2,'IB',1,3,'Juru Muda Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',12175,0),(3,'IC',1,4,'Juru',NULL,NULL,NULL,'2012-06-19 00:00:00',46822,0),(4,'ID',1,5,'Juru Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',997,0),(5,'IIA',2,6,'Pengatur Muda',NULL,NULL,NULL,'2012-06-19 00:00:00',61109,0),(6,'IIB',2,7,'Pengatur Muda Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',40431,0),(7,'IIC',2,8,'Pengatur',NULL,NULL,NULL,'2012-06-19 00:00:00',18827,0),(8,'IID',2,9,'Pengatur Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',38373,0),(9,'IIIA',3,10,'Penata Muda',NULL,NULL,NULL,'2012-06-19 00:00:00',4324,0),(10,'IIIB',3,11,'Penata muda Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',37558,0),(11,'IIIC',3,12,'Penata',NULL,NULL,NULL,'2012-06-19 00:00:00',43759,0),(12,'IIID',3,13,'Penata Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',40589,0),(13,'IVA',4,14,'Pembina',NULL,NULL,NULL,'2012-06-19 00:00:00',6140,0),(14,'IVB',4,15,'Pembina Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',39991,0),(15,'IVC',4,16,'Pembina Utama Muda',NULL,NULL,NULL,'2012-06-19 00:00:00',50477,0),(16,'IVD',4,17,'Pembina Utama Madya',NULL,NULL,NULL,'2012-06-19 00:00:00',1348,0),(17,'IVE',4,18,'Pembuna Utama',NULL,NULL,NULL,'2012-06-19 00:00:00',51900,0);
/*!40000 ALTER TABLE `golongan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jabatan`
--

DROP TABLE IF EXISTS `jabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jabatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rootid` int(10) unsigned NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `singkatan` varchar(255) NOT NULL,
  `satker` varchar(255) DEFAULT NULL,
  `eselon` varchar(15) DEFAULT NULL,
  `isdefault` tinyint(1) DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_jabatan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jabatan`
--

LOCK TABLES `jabatan` WRITE;
/*!40000 ALTER TABLE `jabatan` DISABLE KEYS */;
INSERT INTO `jabatan` VALUES (8,0,'NA','STRUKTUR ORGANISASI SEKOLAH',NULL,'(Tidak Ada)',1,NULL,NULL,NULL,'2012-06-19 00:00:00',58865,0),(27,8,'PENGURUS SEKOLAH','SEKOLAH','(Tidak Ada)','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',7566,0),(28,27,'Kepala Sekolah','KEPSEK','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',57825,0),(29,28,'Kepala TU','KEPTU','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',4305,0),(30,27,'Ketua Komite Sekolah','K.KOMITE','(Tidak Ada)','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',44641,0),(31,28,'Wakil Kepala Sekolah Bidang Kurikulum','WK.KURIKULUM','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',13697,0),(32,28,'Wakil Kepala Sekolah Bidang Kesiswaan','WK.KESISWAAN','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',95,0),(33,28,'Wakil Kepala Sekolah Bidang Humas','WK.HUMAS','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',24911,0),(34,32,'Pembina OSIS','PB.OSIS','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',58740,0),(35,32,'Pembina Ekstrakulikuler','PB.EKSTRA','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',22378,0),(36,28,'Wakil Kepala Sekolah Bidang Sarana Prasaran','WK.SARANA','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',1198,0),(37,33,'Kordinator Rumah Tangga','KO.RT','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',4384,0),(38,28,'Koordinator BP','KO.BP','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',18328,0),(39,28,'Koordinator IT','KO.IT','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',12955,0),(40,28,'Koordinator Guru','KO.GURU','GURU','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',9791,0),(41,40,'Guru','GURU','GURU','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',10089,0),(42,8,'Komite Sekolah','KOMSEK','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:09:52',45480,0);
/*!40000 ALTER TABLE `jabatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `jenis` varchar(45) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `exec` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jadwal_pegawai` (`nip`),
  KEY `FK_jadwal_jenisagenda` (`jenis`),
  KEY `IX_jadwal_ts` (`ts`,`issync`),
  CONSTRAINT `FK_jadwal_jenisagenda` FOREIGN KEY (`jenis`) REFERENCES `jenisagenda` (`agenda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal`
--

LOCK TABLES `jadwal` WRITE;
/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenisagenda`
--

DROP TABLE IF EXISTS `jenisagenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenisagenda` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agenda` varchar(45) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `urutan` tinyint(1) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`agenda`),
  UNIQUE KEY `UX_agenda` (`replid`),
  KEY `IX_jenisagenda_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenisagenda`
--

LOCK TABLES `jenisagenda` WRITE;
/*!40000 ALTER TABLE `jenisagenda` DISABLE KEYS */;
INSERT INTO `jenisagenda` VALUES (5,'cpns','Pengangkatan CPNS',6,NULL,NULL,NULL,'2012-06-19 00:00:00',17386,0),(8,'gaji','Penyesuaian Gaji',4,NULL,NULL,NULL,'2012-06-19 00:00:00',6748,0),(2,'golongan','Kenaikan Golongan',2,NULL,NULL,NULL,'2012-06-19 00:00:00',47111,0),(3,'jabatan','Kenaikan Jabatan',1,NULL,NULL,NULL,'2012-06-19 00:00:00',18723,0),(7,'lainnya','Lainnya',9,NULL,NULL,NULL,'2012-06-19 00:00:00',17810,0),(1,'pangkat','Kenaikan Pangkat',3,NULL,NULL,NULL,'2012-06-19 00:00:00',32879,0),(4,'pensiun','Pensiun',8,NULL,NULL,NULL,'2012-06-19 00:00:00',45437,0),(6,'pns','Pengangkatan PNS',7,NULL,NULL,NULL,'2012-06-19 00:00:00',63018,0);
/*!40000 ALTER TABLE `jenisagenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenisjabatan`
--

DROP TABLE IF EXISTS `jenisjabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenisjabatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `jabatan` varchar(2) NOT NULL DEFAULT 'F',
  `isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`jenis`),
  UNIQUE KEY `Index_replid` (`replid`),
  KEY `IX_jenisjabatan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenisjabatan`
--

LOCK TABLES `jenisjabatan` WRITE;
/*!40000 ALTER TABLE `jenisjabatan` DISABLE KEYS */;
INSERT INTO `jenisjabatan` VALUES (8,'KEPALA','',2,'F',0,NULL,NULL,NULL,'2012-06-19 00:00:00',47718,0),(16,'KOORDINATOR','',4,'F',0,NULL,NULL,NULL,'2012-06-19 00:00:00',49537,0),(17,'STAF','',5,'F',0,NULL,NULL,NULL,'2012-06-19 00:00:00',38997,0),(11,'WAKIL KEPALA','',3,'F',0,NULL,NULL,NULL,'2012-06-19 00:00:00',46376,0);
/*!40000 ALTER TABLE `jenisjabatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegawai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `nrp` varchar(30) DEFAULT NULL,
  `nuptk` varchar(30) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `panggilan` varchar(50) DEFAULT NULL,
  `gelarawal` varchar(45) DEFAULT NULL,
  `gelarakhir` varchar(45) DEFAULT NULL,
  `gelar` varchar(50) DEFAULT NULL,
  `tmplahir` varchar(50) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `suku` varchar(50) DEFAULT NULL,
  `noid` varchar(50) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `handphone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `twitter` varchar(200) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `foto` blob,
  `bagian` varchar(50) NOT NULL,
  `nikah` varchar(10) NOT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `kelamin` varchar(1) NOT NULL,
  `pinpegawai` varchar(25) DEFAULT NULL,
  `mulaikerja` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `ketnonaktif` varchar(45) DEFAULT NULL,
  `pensiun` date DEFAULT NULL,
  `doaudit` tinyint(1) DEFAULT '0',
  `info1` varchar(20) DEFAULT NULL,
  `info2` varchar(20) DEFAULT NULL,
  `info3` varchar(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nip`),
  UNIQUE KEY `UX_pegawai_replid` (`replid`),
  KEY `FK_pegawai_agama` (`agama`),
  KEY `FK_pegawai_suku` (`suku`),
  KEY `FK_pegawai_bagian` (`bagian`),
  KEY `IX_pegawai_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pegawai_agama` FOREIGN KEY (`agama`) REFERENCES `jbsumum`.`agama` (`agama`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pegawai_bagian` FOREIGN KEY (`bagian`) REFERENCES `bagianpegawai` (`bagian`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pegawai_suku` FOREIGN KEY (`suku`) REFERENCES `jbsumum`.`suku` (`suku`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` VALUES (23,'101',NULL,NULL,'Pegawai','','',NULL,'','Bandung','1987-11-01','Islam','Jawa','','                                ','','','',NULL,NULL,NULL,'����\0JFIF\0\0\0\0\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 70\n��\0C\0\n\n\n\n\r\r#%$\"\"!&+7/&)4)!\"0A149;>>>%.DIC<H7=>;��\0C\n\r;(\"(;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;��\0\0P\0:\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�յ]J=b�8��Qw\n�#\0MT:Ϋ�\0A�����N��\'W������k+S���-��̣���(k�]�\0&���%bO�Xr�K�V!no�	i�?δ��\0ɭ��u\"�?�;٩��ec�mY�I��*\0�a�K�Lm���%\ZV~�e��c��w�\0��k\'S�~�n�o��t��n*����U̗v!��C�ϩ��\r׵�8�o?���z���e��f�	$䓁^0��m7�Av���?�@{��u��?��\03\\���-�ez	��q�k����\'����\0��\"�K�xd�I��R~3펼zP�z�\Z>�rE4��.jE�m%�7����pEOs��ڝ���H�`�q�jy4�3�<E�b�p=(!�c����,k\"����&��Ö����?��@z}��e���+h�$\0�{�7i\r��Q��G���>�w��(�t�_Ӹ�-��\"���u�Z��\0�k�\0\\S�\n\0�5_��s�\0-����	d�MѹV�2=*Ʃ�\0!{����\0��7�\"]�:����\0t�t��G)F�e�MP���H�u�)���F�ݜ�V��<�v6�	W�84�[���X�+\0����\0l\\�+i�6�°��Y��l\\�Q��[zĲŦ;�T<�\"*�����?�7+��S��P.9�Z��A����?��-u��R��\0�}��r_�(����TԖ �\"O\"y��͓ҳ/D�֑���\'���c��[���nu��rz�����o���v�3�Q{�;�Q��X�2��x�7����}j�	H��=�(�¸_�Ikf4hQ������ �G��e���!�V�\"cq�[�;}(��Y�V�{���eh����c���f�-�/�\\B�0Ĩ �ȪZN�ڍ�Қ7��9	���q���Vmaiׯ��r����#\Z��!��	l+�}?�U��c�4�G��tW�궒.�l����a�\r{��\0Ѭ@9g��(���#�5�3��3y�GN�����M�l� \0t*}��׬�C}�.��H�h� K��[w-��N��j�<Q0���k	!E\"6*Y?vbU�$gw|P\r�����;BA���\0f��7�C�n���~��k�R�S��.4�Av�%_-X4cpR�<�y��V�YM?J��6���cw�A�m�o���s�P�i\0	� o%Ao^M&�v_��5z�x�\"��\0c؇-��$g�e9�������O_�k�a4q�(�8_%��\0AKo\0㟜�>����\0�E���*�[#�׹i`\r&�/Ac����e�5�+w�Z�)2�c�-�G�9a�s��8\0�ʡT*�\0\0v���','Akademik','tak_ada','',1,'l','12637',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2012-06-23 04:04:49',4536,0);
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbssdm.jssync_pegawai_ains AFTER INSERT ON jbssdm.pegawai
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	 INSERT INTO jbsjs.syncdata SET tablename = 'jbssdm.pegawai', iddata = NEW.replid, state = 'I', dataload = 2
		 ON DUPLICATE KEY UPDATE state = CONCAT(state, 'I');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbssdm.jssync_pegawai_aupd AFTER UPDATE ON jbssdm.pegawai
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbssdm.pegawai', iddata = OLD.replid, state = 'U', dataload = 2
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'U');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER jbssdm.jssync_pegawai_adel AFTER DELETE ON jbssdm.pegawai
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGGER IS NULL THEN
	INSERT INTO jbsjs.syncdata SET tablename = 'jbssdm.pegawai', iddata = OLD.replid, state = 'D', dataload = 2
		ON DUPLICATE KEY UPDATE state = CONCAT(state, 'D');
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pegdiklat`
--

DROP TABLE IF EXISTS `pegdiklat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegdiklat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `iddiklat` int(10) unsigned NOT NULL,
  `tahun` int(10) unsigned NOT NULL,
  `sk` varchar(45) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terakhir` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `doaudit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pegdiklat_pegawai` (`nip`),
  KEY `FK_pegdiklat_diklat` (`iddiklat`),
  KEY `IX_pegdiklat_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pegdiklat_diklat` FOREIGN KEY (`iddiklat`) REFERENCES `diklat` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pegdiklat_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegdiklat`
--

LOCK TABLES `pegdiklat` WRITE;
/*!40000 ALTER TABLE `pegdiklat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegdiklat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peggaji`
--

DROP TABLE IF EXISTS `peggaji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peggaji` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `gaji` varchar(15) NOT NULL,
  `sk` varchar(45) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `judulsk` varchar(255) DEFAULT NULL,
  `tanggalsk` varchar(255) DEFAULT NULL,
  `dok` text,
  `doaudit` tinyint(1) DEFAULT '1',
  `terakhir` tinyint(1) DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_peggaji_pegawai` (`nip`),
  KEY `IX_peggaji_ts` (`ts`,`issync`),
  CONSTRAINT `FK_peggaji_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peggaji`
--

LOCK TABLES `peggaji` WRITE;
/*!40000 ALTER TABLE `peggaji` DISABLE KEYS */;
/*!40000 ALTER TABLE `peggaji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peggol`
--

DROP TABLE IF EXISTS `peggol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peggol` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `golongan` varchar(14) NOT NULL,
  `tmt` date NOT NULL,
  `sk` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terakhir` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `judulsk` varchar(255) DEFAULT NULL,
  `tanggalsk` varchar(45) DEFAULT NULL,
  `dok` text,
  `petugas` varchar(45) DEFAULT NULL,
  `doaudit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_peggol_pegawai` (`nip`),
  KEY `FK_peggol_golongan` (`golongan`),
  KEY `IX_peggol_ts` (`ts`,`issync`),
  CONSTRAINT `FK_peggol_golongan` FOREIGN KEY (`golongan`) REFERENCES `golongan` (`golongan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_peggol_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peggol`
--

LOCK TABLES `peggol` WRITE;
/*!40000 ALTER TABLE `peggol` DISABLE KEYS */;
/*!40000 ALTER TABLE `peggol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegjab`
--

DROP TABLE IF EXISTS `pegjab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegjab` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `idjabatan` int(10) unsigned DEFAULT NULL,
  `tmt` date NOT NULL,
  `sk` varchar(45) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terakhir` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `jenis` varchar(50) NOT NULL,
  `namajab` varchar(255) DEFAULT NULL,
  `doaudit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `fk_pegjab_jabatan` (`idjabatan`),
  KEY `fk_pegjab_pegawai` (`nip`),
  KEY `IX_pegjab_ts` (`ts`,`issync`),
  CONSTRAINT `fk_pegjab_jabatan` FOREIGN KEY (`idjabatan`) REFERENCES `jabatan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pegjab_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegjab`
--

LOCK TABLES `pegjab` WRITE;
/*!40000 ALTER TABLE `pegjab` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegjab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegkeluarga`
--

DROP TABLE IF EXISTS `pegkeluarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegkeluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hubungan` varchar(50) DEFAULT NULL,
  `tgllahir` varchar(50) DEFAULT NULL,
  `hp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_pegkeluarga_ts` (`ts`,`issync`),
  KEY `FK_pegkeluarga_pegawai2` (`nip`),
  CONSTRAINT `FK_pegkeluarga_pegawai2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegkeluarga`
--

LOCK TABLES `pegkeluarga` WRITE;
/*!40000 ALTER TABLE `pegkeluarga` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegkeluarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegkerja`
--

DROP TABLE IF EXISTS `pegkerja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegkerja` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `thnawal` varchar(4) NOT NULL,
  `thnakhir` varchar(4) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terakhir` tinyint(1) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `fk_pegkerja_pegawai` (`nip`),
  KEY `IX_pegkerja_ts` (`ts`,`issync`),
  CONSTRAINT `fk_pegkerja_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegkerja`
--

LOCK TABLES `pegkerja` WRITE;
/*!40000 ALTER TABLE `pegkerja` DISABLE KEYS */;
INSERT INTO `pegkerja` VALUES (1,'132 456 001','Pikiran Rakyan','1996','1999','Wartawan','',1,NULL,NULL,NULL,'2012-06-19 00:00:01',52383,0),(2,'131 924 825','SMA Negeri 3 Durian','1992','1995','Guru','',1,NULL,NULL,NULL,'2012-06-19 00:00:01',43673,0);
/*!40000 ALTER TABLE `pegkerja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peglastdata`
--

DROP TABLE IF EXISTS `peglastdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peglastdata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `idpeggol` int(10) unsigned DEFAULT NULL,
  `idpegjab` int(10) unsigned DEFAULT NULL,
  `idpegdiklat` int(10) unsigned DEFAULT NULL,
  `idpegsekolah` int(10) unsigned DEFAULT NULL,
  `idpeggaji` int(10) unsigned DEFAULT NULL,
  `idpegserti` int(10) unsigned DEFAULT NULL,
  `idpegkerja` int(10) unsigned DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_peglastdata_pegawai` (`nip`),
  KEY `IX_peglastdata_ts` (`ts`,`issync`),
  CONSTRAINT `FK_peglastdata_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peglastdata`
--

LOCK TABLES `peglastdata` WRITE;
/*!40000 ALTER TABLE `peglastdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `peglastdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegsekolah`
--

DROP TABLE IF EXISTS `pegsekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegsekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `tingkat` varchar(20) NOT NULL,
  `sekolah` varchar(255) NOT NULL,
  `lulus` int(10) unsigned NOT NULL,
  `sk` varchar(45) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terakhir` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `doaudit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pegsekolah_pegawai` (`nip`),
  KEY `IX_pegsekolah_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pegsekolah_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegsekolah`
--

LOCK TABLES `pegsekolah` WRITE;
/*!40000 ALTER TABLE `pegsekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegsekolah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegserti`
--

DROP TABLE IF EXISTS `pegserti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegserti` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `sertifikat` varchar(255) NOT NULL,
  `lembaga` varchar(255) NOT NULL,
  `tahun` smallint(6) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terakhir` tinyint(1) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `fk_pegserti_pegawai` (`nip`),
  KEY `IX_pegserti_ts` (`ts`,`issync`),
  CONSTRAINT `fk_pegserti_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegserti`
--

LOCK TABLES `pegserti` WRITE;
/*!40000 ALTER TABLE `pegserti` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegserti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilihandata`
--

DROP TABLE IF EXISTS `pilihandata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilihandata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtambahan` int(10) unsigned NOT NULL,
  `pilihan` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urutan` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_pilihandata_tambahandata` (`idtambahan`),
  CONSTRAINT `FK_pilihandata_tambahandata` FOREIGN KEY (`idtambahan`) REFERENCES `tambahandata` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihandata`
--

LOCK TABLES `pilihandata` WRITE;
/*!40000 ALTER TABLE `pilihandata` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilihandata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presensi`
--

DROP TABLE IF EXISTS `presensi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presensi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `jammasuk` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `jampulang` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `jamwaktukerja` int(10) unsigned DEFAULT '0',
  `menitwaktukerja` int(10) unsigned DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL COMMENT '1 -> Hadir, 2 -> Izin, 3 -> Cuti, 4 ->Sakit, 5 ->Alpa',
  `keterangan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `source` varchar(45) DEFAULT 'MANUAL',
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_presensi` (`nip`,`tanggal`,`status`),
  CONSTRAINT `FK_presensi_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presensi`
--

LOCK TABLES `presensi` WRITE;
/*!40000 ALTER TABLE `presensi` DISABLE KEYS */;
/*!40000 ALTER TABLE `presensi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `satker`
--

DROP TABLE IF EXISTS `satker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `satker` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `satker` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `isdefault` tinyint(1) DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`satker`),
  UNIQUE KEY `UX_satker` (`replid`),
  KEY `IX_satker_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satker`
--

LOCK TABLES `satker` WRITE;
/*!40000 ALTER TABLE `satker` DISABLE KEYS */;
INSERT INTO `satker` VALUES (19,'(Tidak Ada)','Tidak Ada Satuan Kerja',1,NULL,NULL,NULL,'2012-06-19 00:00:01',17795,0),(21,'GURU','Pengajar',0,NULL,NULL,NULL,'2012-06-19 00:00:01',51312,0),(23,'KOPERASI','Koperasi',0,NULL,NULL,NULL,'2012-06-19 00:00:01',6583,0),(24,'MANAJEMEN','Manajemen Sekolah',0,NULL,NULL,NULL,'2012-06-19 00:00:01',10040,0),(22,'TATA USAHA','Tata Usaha Sekolah',0,NULL,NULL,NULL,'2012-06-19 00:00:01',30450,0),(20,'YAYASAN','Pengurus Yayasan',0,NULL,NULL,NULL,'2012-06-19 00:00:01',56600,0);
/*!40000 ALTER TABLE `satker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tambahandata`
--

DROP TABLE IF EXISTS `tambahandata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tambahandata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kolom` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 Text 2 File 3 Pilihan',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urutan` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tambahandata`
--

LOCK TABLES `tambahandata` WRITE;
/*!40000 ALTER TABLE `tambahandata` DISABLE KEYS */;
/*!40000 ALTER TABLE `tambahandata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tambahandatapegawai`
--

DROP TABLE IF EXISTS `tambahandatapegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tambahandatapegawai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `idtambahan` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 Teks 2 File 3 Pilihan',
  `teks` varchar(1000) DEFAULT NULL,
  `filedata` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `filemime` varchar(255) DEFAULT NULL,
  `filesize` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tambahandatapegawai_pegawai` (`nip`),
  KEY `FK_tambahandatapegawai_tambahandata` (`idtambahan`),
  CONSTRAINT `FK_tambahandatapegawai_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tambahandatapegawai_tambahandata` FOREIGN KEY (`idtambahan`) REFERENCES `tambahandata` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tambahandatapegawai`
--

LOCK TABLES `tambahandatapegawai` WRITE;
/*!40000 ALTER TABLE `tambahandatapegawai` DISABLE KEYS */;
/*!40000 ALTER TABLE `tambahandatapegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbssms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbssms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbssms`;

--
-- Table structure for table `daemons`
--

DROP TABLE IF EXISTS `daemons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daemons` (
  `Start` text NOT NULL,
  `Info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daemons`
--

LOCK TABLES `daemons` WRITE;
/*!40000 ALTER TABLE `daemons` DISABLE KEYS */;
/*!40000 ALTER TABLE `daemons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `format`
--

DROP TABLE IF EXISTS `format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `format` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 presensi, 1 penilaian, 2 pengumuman',
  `format` text,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `format`
--

LOCK TABLES `format` WRITE;
/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` VALUES (1,0,'Kami informasikan presensi [SISWA] tanggal [TANGGAL1]/[BULAN1] s/d [TANGGAL2]/[BULAN2] hadir [HADIR] absen [ABSEN]. [PENGIRIM]'),(2,2,'Kami informasikan nilai #SISWA tanggal #TANGGAL1/#BULAN1 s/d #TANGGAL2/#BULAN2 . #PENGIRIM'),(4,1,'Kami informasikan nilai [SISWA] tanggal [TANGGAL1]/[BULAN1] s/d [TANGGAL2]/[BULAN2] . [PENGIRIM]');
/*!40000 ALTER TABLE `format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gammu`
--

DROP TABLE IF EXISTS `gammu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gammu` (
  `Version` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gammu`
--

LOCK TABLES `gammu` WRITE;
/*!40000 ALTER TABLE `gammu` DISABLE KEYS */;
INSERT INTO `gammu` VALUES (7);
/*!40000 ALTER TABLE `gammu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT '8bit',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` varchar(160) NOT NULL DEFAULT '',
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false',
  `Status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 belum dibaca, 1 sudah dibaca',
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbox`
--

LOCK TABLES `inbox` WRITE;
/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kritiksaran`
--

DROP TABLE IF EXISTS `kritiksaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kritiksaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` text NOT NULL,
  `senddate` datetime DEFAULT NULL,
  `message` text,
  `from` text,
  `Status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kritiksaran`
--

LOCK TABLES `kritiksaran` WRITE;
/*!40000 ALTER TABLE `kritiksaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `kritiksaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbox`
--

DROP TABLE IF EXISTS `outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') DEFAULT '8bit',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` varchar(160) NOT NULL DEFAULT '',
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` text,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL,
  `idsmsgeninfo` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 belum dikirim, 1 sudah dikirim',
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbox`
--

LOCK TABLES `outbox` WRITE;
/*!40000 ALTER TABLE `outbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbox_multipart`
--

DROP TABLE IF EXISTS `outbox_multipart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') DEFAULT '8bit',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` varchar(160) DEFAULT NULL,
  `ID` int(11) unsigned NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbox_multipart`
--

LOCK TABLES `outbox_multipart` WRITE;
/*!40000 ALTER TABLE `outbox_multipart` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbox_multipart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outboxhistory`
--

DROP TABLE IF EXISTS `outboxhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outboxhistory` (
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idsmsgeninfo` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 belum dikirim, 1 sudah dikirim',
  `SenderID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_outboxhistory` (`SendingDateTime`,`DestinationNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outboxhistory`
--

LOCK TABLES `outboxhistory` WRITE;
/*!40000 ALTER TABLE `outboxhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `outboxhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pbk`
--

DROP TABLE IF EXISTS `pbk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pbk` (
  `GroupID` int(11) NOT NULL DEFAULT '-1',
  `Name` text NOT NULL,
  `Number` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pbk`
--

LOCK TABLES `pbk` WRITE;
/*!40000 ALTER TABLE `pbk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pbk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pbk_groups`
--

DROP TABLE IF EXISTS `pbk_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pbk_groups` (
  `Name` text NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pbk_groups`
--

LOCK TABLES `pbk_groups` WRITE;
/*!40000 ALTER TABLE `pbk_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `pbk_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesan`
--

DROP TABLE IF EXISTS `pesan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `pesan` varchar(160) NOT NULL,
  `pengirim` varchar(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesan`
--

LOCK TABLES `pesan` WRITE;
/*!40000 ALTER TABLE `pesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanpenerima`
--

DROP TABLE IF EXISTS `pesanpenerima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanpenerima` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpesan` int(10) unsigned NOT NULL,
  `jadwal` datetime NOT NULL,
  `penerima` varchar(20) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_pesanpenerima_idpesan` (`idpesan`),
  CONSTRAINT `FK_pesanpenerima_idpesan` FOREIGN KEY (`idpesan`) REFERENCES `pesan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanpenerima`
--

LOCK TABLES `pesanpenerima` WRITE;
/*!40000 ALTER TABLE `pesanpenerima` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanpenerima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonebook`
--

DROP TABLE IF EXISTS `phonebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonebook` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nohp` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 siswa, 1 ortu, 2 pegawai, 3 lainnya, 4 alumni',
  `keterangan` varchar(100) DEFAULT NULL COMMENT 'Jika status 1 isinya Ortu NamaSiswa',
  `idreplid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX` (`nohp`,`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonebook`
--

LOCK TABLES `phonebook` WRITE;
/*!40000 ALTER TABLE `phonebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `phonebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phones`
--

DROP TABLE IF EXISTS `phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Send` enum('yes','no') NOT NULL DEFAULT 'no',
  `Receive` enum('yes','no') NOT NULL DEFAULT 'no',
  `IMEI` text NOT NULL,
  `Client` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phones`
--

LOCK TABLES `phones` WRITE;
/*!40000 ALTER TABLE `phones` DISABLE KEYS */;
INSERT INTO `phones` VALUES ('MyPhone1','2010-02-03 03:48:05','2010-02-03 03:48:05','2010-02-03 03:48:15','yes','yes','354056001179799','Gammu 1.10.6, Windows XP SP2');
/*!40000 ALTER TABLE `phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sentitems`
--

DROP TABLE IF EXISTS `sentitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT '8bit',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` varchar(160) NOT NULL DEFAULT '',
  `ID` int(11) unsigned NOT NULL DEFAULT '0',
  `SenderID` text NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sentitems`
--

LOCK TABLES `sentitems` WRITE;
/*!40000 ALTER TABLE `sentitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `sentitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsgeninfo`
--

DROP TABLE IF EXISTS `smsgeninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsgeninfo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `tipe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 presensi, 1 penilaian, 2 pengumuman',
  `info` varchar(1000) DEFAULT NULL,
  `pengirim` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_smsgeninfo` (`tipe`,`info`(50),`pengirim`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsgeninfo`
--

LOCK TABLES `smsgeninfo` WRITE;
/*!40000 ALTER TABLE `smsgeninfo` DISABLE KEYS */;
INSERT INTO `smsgeninfo` VALUES (2,'2010-04-16',2,'Pengumuman','akademik ');
/*!40000 ALTER TABLE `smsgeninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsumum`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsumum` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsumum`;

--
-- Table structure for table `agama`
--

DROP TABLE IF EXISTS `agama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(20) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`agama`),
  UNIQUE KEY `UX_agama` (`replid`),
  KEY `IX_agama_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agama`
--

LOCK TABLES `agama` WRITE;
/*!40000 ALTER TABLE `agama` DISABLE KEYS */;
INSERT INTO `agama` VALUES (29,'Budha',5,NULL,NULL,NULL,'2010-03-02 03:07:22',48581,0),(28,'Hindu',4,NULL,NULL,NULL,'2010-03-02 03:07:22',61565,0),(25,'Islam',1,NULL,NULL,NULL,'2010-03-02 03:07:22',31019,0),(26,'Katolik',2,NULL,NULL,NULL,'2010-03-02 03:07:22',35929,0),(27,'Protestan',3,NULL,NULL,NULL,'2010-03-02 03:07:22',21057,0);
/*!40000 ALTER TABLE `agama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appregis`
--

DROP TABLE IF EXISTS `appregis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appregis` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transid` varchar(45) NOT NULL,
  `transkey` varchar(45) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_appregis_trans` (`transid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appregis`
--

LOCK TABLES `appregis` WRITE;
/*!40000 ALTER TABLE `appregis` DISABLE KEYS */;
/*!40000 ALTER TABLE `appregis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appupload`
--

DROP TABLE IF EXISTS `appupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appupload` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(45) NOT NULL,
  `upldate` datetime NOT NULL,
  `batchid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `filetype` varchar(45) NOT NULL,
  `filesize` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appupload`
--

LOCK TABLES `appupload` WRITE;
/*!40000 ALTER TABLE `appupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `appupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `judul` varchar(255) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1',
  `latar` mediumblob NOT NULL,
  `latardata` mediumblob,
  `tanggal` datetime NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `vres` decimal(5,2) NOT NULL DEFAULT '96.00',
  `hres` decimal(5,2) NOT NULL DEFAULT '96.00',
  PRIMARY KEY (`replid`),
  KEY `FK_card_departemen` (`departemen`),
  CONSTRAINT `FK_card_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardaktifitas`
--

DROP TABLE IF EXISTS `cardaktifitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardaktifitas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `judul` varchar(100) NOT NULL,
  `siswa` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pegawai` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `calonsiswa` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `validasipin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `inputketerangan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pengulangan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_cardaktifitas_departemen` (`departemen`),
  CONSTRAINT `FK_cardaktifitas_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardaktifitas`
--

LOCK TABLES `cardaktifitas` WRITE;
/*!40000 ALTER TABLE `cardaktifitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardaktifitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carddata`
--

DROP TABLE IF EXISTS `carddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carddata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcard` int(10) unsigned NOT NULL,
  `carddatatype` tinyint(1) unsigned NOT NULL COMMENT 'Info 1, IdSiswa 2, NamaSiswa 3, IdPegawai 4, NamaPegawai 5, IdCalon 6, NamaCalon 7, GambarSiswa 8, GambarPegawai 9, GambarCalon 10',
  `text` varchar(2000) DEFAULT NULL,
  `fontname` varchar(255) DEFAULT NULL,
  `fontsize` varchar(255) DEFAULT NULL,
  `fontstyle` varchar(255) DEFAULT NULL,
  `color` varchar(12) DEFAULT NULL,
  `posX` int(10) unsigned NOT NULL DEFAULT '0',
  `posY` int(10) unsigned NOT NULL DEFAULT '0',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `alignment` varchar(3) NOT NULL DEFAULT 'L',
  `caps` varchar(3) DEFAULT 'D',
  `idkolomtambahan` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_carddata_card` (`idcard`),
  KEY `FK_carddata_kolomtambahan` (`idkolomtambahan`),
  CONSTRAINT `FK_carddata_card` FOREIGN KEY (`idcard`) REFERENCES `card` (`replid`),
  CONSTRAINT `FK_carddata_kolomtambahan` FOREIGN KEY (`idkolomtambahan`) REFERENCES `jbsakad`.`tambahandata` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carddata`
--

LOCK TABLES `carddata` WRITE;
/*!40000 ALTER TABLE `carddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `carddata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardscandata`
--

DROP TABLE IF EXISTS `cardscandata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardscandata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idscaninfo` int(10) unsigned NOT NULL,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `jam` datetime NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_cardscandata_cardscaninfo` (`idscaninfo`),
  KEY `FK_cardscandata_siswa` (`nis`),
  KEY `FK_cardscandata_pegawai` (`nip`),
  KEY `FK_cardscandata_calonsiswa` (`nic`),
  CONSTRAINT `FK_cardscandata_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_cardscandata_cardscaninfo` FOREIGN KEY (`idscaninfo`) REFERENCES `cardscaninfo` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_cardscandata_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_cardscandata_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardscandata`
--

LOCK TABLES `cardscandata` WRITE;
/*!40000 ALTER TABLE `cardscandata` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardscandata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardscaninfo`
--

DROP TABLE IF EXISTS `cardscaninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardscaninfo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idaktifitas` int(10) unsigned NOT NULL,
  `informasi` varchar(255) NOT NULL,
  `mulai` datetime NOT NULL,
  `selesai` datetime DEFAULT NULL,
  `petugas` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_cardscaninfo_aktiftias` (`idaktifitas`),
  KEY `IX_cardscaninfo_mulai` (`mulai`),
  CONSTRAINT `FK_cardscaninfo_aktiftias` FOREIGN KEY (`idaktifitas`) REFERENCES `cardaktifitas` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardscaninfo`
--

LOCK TABLES `cardscaninfo` WRITE;
/*!40000 ALTER TABLE `cardscaninfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardscaninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambar`
--

DROP TABLE IF EXISTS `gambar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambar` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `modul` varchar(45) NOT NULL,
  `tanggal` datetime NOT NULL,
  `nama` varchar(255) NOT NULL,
  `berkas` varchar(255) NOT NULL,
  `lebar` int(10) unsigned NOT NULL,
  `tinggi` int(10) unsigned NOT NULL,
  `ukuran` int(10) unsigned NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambar` (`modul`,`tanggal`),
  KEY `FK_gambar_departemen` (`departemen`),
  CONSTRAINT `FK_gambar_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambar`
--

LOCK TABLES `gambar` WRITE;
/*!40000 ALTER TABLE `gambar` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitas`
--

DROP TABLE IF EXISTS `identitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identitas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(250) DEFAULT NULL,
  `situs` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `alamat1` varchar(255) DEFAULT NULL,
  `alamat2` varchar(255) DEFAULT NULL,
  `alamat3` varchar(255) DEFAULT NULL,
  `alamat4` varchar(255) DEFAULT NULL,
  `telp1` varchar(20) DEFAULT NULL,
  `telp2` varchar(20) DEFAULT NULL,
  `telp3` varchar(20) DEFAULT NULL,
  `telp4` varchar(20) DEFAULT NULL,
  `fax1` varchar(20) DEFAULT NULL,
  `fax2` varchar(20) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `foto` blob,
  `departemen` varchar(50) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `perpustakaan` varchar(45) DEFAULT NULL,
  `info1` varchar(20) DEFAULT NULL,
  `info2` varchar(20) DEFAULT NULL,
  `info3` varchar(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_identitas_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitas`
--

LOCK TABLES `identitas` WRITE;
/*!40000 ALTER TABLE `identitas` DISABLE KEYS */;
INSERT INTO `identitas` VALUES (4,'SMA Indonesia Membaca','www.indonesiamembaca.net','info@indonesiamembaca.net','Jl. Pendidikan No.1','',NULL,NULL,'(022)1234567','(022)1234567','','','(022)1234567','',NULL,'����\0JFIF\0\0\0\0\0\0��\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\n��\0C\0��\0C��\0\0K\0d\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0��(��\0+�!�<%���\'�V���g�Z�u�k�!��e�hz.�c�_jz����ma�i�v���^^\\Cmo\n4�Ȉ�����P�)O��\'���K��m�|B�����|���Go�|\\����!�F��I\"��k�zC����\0<O%���+b�o.�it�Q�<�mo�K�g�K����\nU�H��h�����_ؓ�E���Ξ�G����⦭{6�k���\Z�Xm[şu-�n��)����5[?��ۉx��*�WF�&�\"�g<I�T�$�h�*sx�W$�\\G#R���¶*i�^�4����O<|�0�u!���n+�\n��p�p�f\\]�غ�t�C�*����T�[5�j�2�.3��*b90�?|?ho�8/��z������5��K�77:U�\0���jO���5%{K�b����:���v].�d���<#�]R����[&-,��:�\0�Cjy.���?m��7�w�\'��?�0���h�okoq�n�S���k?�m�Oo�i���3G����F�f�9~��+x��&��/�mY��xu�/�0�ǆu����^�oï�2�U����z��|7s�O�_.!Ҽ?%��Mǅ���d[Q���\r��C�׈�����N�?� �.��Y����m_L�>)��_�%��Y�f�*h�_��C����;����1�]:w�g7:Ua���U���8s4���uq\\C�T������M�N*��G��\Zq�S�c��ʾQ�N1�JT��Y�����Ép�A���|;�Dpo�˸�h���@�q��R��#�(br�ƆaJ�O��E�����akի\n���{��+��z�� ���\0h��/�d�\\�[P�>�t���^^���j�?�o�\'U������}\"5�׾(�����<�jRJ��?N~\n�h?�_�Ķ�g�Y�������W�;ϊ�ƛ�����=\0k�O\\�)�j���u���|Y���b��	������߱ǆuo��)�M��>*�Ե��\n<-i.����\'Q�/�xGW���/�6�o���K�S�>���v�2���R�3�M��W���X��>���\n~ӿ�]���sŷ��\0�~ ��6�Ņ���F�g����i|]��\r��jZ���h�xOþ�֍y>���J�:KX��_������9U<��zȡV�2�3�����S3�Q�6�>*V-Uj��ԗ6;ω��:վ{���¾$�dg�&\\cS\r��9�O�)ř~?�Q����O�r�����᰹n>�t�|��3:��,.�������\0�G���K]��>.i>+ּ4\"�ǿ5�MC�>_�X�N����V�W�|-\"]��R��@զ�Wе�V�V�Я�M��\0��?|S�?kڿ��\0g?���^�=��ឥ7�߉?	�3��\Z���.�G���w���>��]k�\0|g�\0	\'�-5-[Ğ	׭�Xѯ����K�\0���OxO�w�\0����oF��7�>�W�x�gJ�¿>!kN��_�h?\rC$�w�O�\Z��Y��-���A⛙�K[�Mf4����;�k9�\\^ �1������e[6�R�,vN��Z����z���эEN�Xξ5�*5k���������g	���a�#���G��&Ux�xN\Zα1�eR�8��\\F7����ᰜA��J2�C\r:8<ήQ�a�x�\n�쿧j)��Ѥ�:K��G$l���2::����2��A �����(��\0+��\n��\06����\r�+�^����b�n�S���>絳�X���k⾡h���_�$�s�c0�>%�H�%�bڥ�ޡ�~�W�e�k�?k��(_ƿ�\Z���/��~�_����\0�u�[����S_�7�^��8��;�-�z}��&����޹{�=j}GU�7c��<^&���c~���\n��g^\Z�^_��%Z�	J����N�9�N��u�\Z��Q�������G�s�?��+:�%���=���p��X��J�[�7K\r��W��j�.�*8U�}e�����^�W��\0�K�Lx�\0]���I|Lky~(�_���moT���{��2�V�g�_�7���-#��Ӽ��1��|3��x�[��M:��k���o���]��^������\"G�g�c��S&��w��_���o�\Z| Լ?~�d5]3B�o���MOH�\n���\0PԮ4N����5j~<���)��!�_����)���ga�C������Դ��/��j����Q_��\r�M���K�?Z�-.�������\n}*��=6�I���u9c��mR���+��;��-,m��QY~�s�YZD��#%����\0N�n�d���2�e�/\r��[G���mj���:8�l^o	T�N��V���)W����SWKV���q_�9��s�|OS<��>�=����\0��l�vWS&�_�ar��N�z�W���r���GC-�����\rUcu|	�m#X���Ὲ���\0���a���\0\n�]��v��Ǟ������>��_xsľ��8|q�x[��+�R���.��]Z�Uң��D�?�޹�~��\0�~���!����/�_�g��+�H��ğ��x��K�+F��\0e��ma�Y�_��{g���^����t��Y�kZ��S��w2�ߓ�<�ums�~)��?t,<Gw���H�ݥx�;9f��r\'ҵ��5y	UŴR��ѷ�=�_�����ֵ����_������w��S�����֚�Ox7Y�׀���Լa�W���徝���Gw��_</�.mg����F�^�?�3�x|�9�\r��MXbG0��\'��e�:򥀥8a#υ�`��JS�U%�ԭ���_T�&�6�;��N�po��.�G���FG��9W����x�5�)*y�Q�[��i��n�=��.y�\'�m�G�/��`�Ɵ\n~.|=��\r�_?kߌ\Zg���.�������\ZCw8���#�~7i��1��DT���Q��M�՟�����u�g�_�O��φ�%^|A���8�G��#���:׆|K�M����u�ƾ�u�N��o`��\0��e��L��Q?ĽT�~%���2���:�;韶w> ��|y�sǚ��~\Z��\0?k�\n�����?�|ck���C�>j:�>/����YxG���߈�_��	|^�l4�k�2[����-�w��zw�$���\0��X�\n���;~̞����c_������C�\"���V�k�^i���v����3�s�i�C�^*G�������\0�8�\0�_\"����(�c���a�f8�1~WF�g����\Z��Zu��gB��ԏ5T�\\�?����6K���c�<�<O�����^$�r�ڶ<�f �qX\n���a�a1Y�,g6�\Z�iI�B2?*~/�\0���m�j3�h��Qh���S_5��<9�k��V~\r�v�6�/���P�� ��úφ5}F�F�l�yt&�tk��G��Ė�|	��t�5����,�\'��r�	�?�5y���w�:ƭt��=C�:Χ�b�_Oe���?j~!���=4�|W�>��ߴǇ-&��<7��7�4��u�����S�m��dӴm_�GM����=[ĳ]��u�\nϬ���������ٿ�n*�_����,0����n&�0������ن&�7KFs�\Z��R��i�t�M,����#F���o��9ɳ~⺙�|�$�s.)���/������d�Ehbr�M*5qX&\'��\'N�\Z�G�e_��8�s?L�����Qo�\0�5�I�_ٷ���~���\'�u};���5��S�ּM�kڵ�Z��|R��4����ש��m��Ǻ���n���׊.��T�n���\0c��\r�1\\[���ƓA<.��42�x�D,�G\"2�:1VRI\Z���E�N��xo�z]���k�u摭h���W�v��j�Z�X�ZN�\rŭռ�C42+#��`�����\Z����/�|W���:�?������>]���MgZ�>\r|(�Z/�<#6�r��Z͗�t�\'�tK�R����B��4���M�����K�A��{���EÒ��������]W�^aB�U`�k�:�&�N��̓�R�|<���\0�Qq/��9��7F�c���˱����x��0�if��o`�Q�u񑃎i��<M~\\u,Ul_��Q_ˇ�(�x�@������\0L�cy�j\Zg���/�1ۅ��?h/��\0\r>0�L�d�M�]N�K�J$�,�������\0O���\0�����H������$�=�������}�O�c�&���\ZM�m�=�|4���JR�m�H�;X\ZO�~�9�<��U��G5�e�NM�{Ln��C���Q�Ҋ�)�����µ�����R�lW\r��8��8�߰�s�sJ��G�b�L��4]�kɴ�\0�Z�ğ�_�����s��\0�s��>� C*/�_��7�\Z��čKphb�?eO5�\0���w�Wŋ���{>���x9u�\rxf�@�V���c�|%�i�%����e]3B𖇧%֭�MR��#�LѴ-GS���vv�����_�o���ٓ���.|7��/�>�vKO�_,~>.�g��\\�V�m�^�#]O��]�7_��j�������$�_��MV�ľ�|�k�|��W�t��g��\r�n|}��)~ϟ<A%�Z����c�x��U��gK�k���C���k�g�W�7~[X&c�5-�r��ƾ3�\'��(��K1�0�A��\ZyN�b3N�d8<>+�3,p�\'\n��\\�p��0|��1�u�*���=���JO����������p=^/���M��0Y�c�q�k����y��J0���p�^[��?��,��UN8J4��*����O\n�p�G��O�?fO����y�K�<u�?	hv����/|Q�<�ǁc�T�|#������0�}�1�m�^&��?jil�z&�5���k/�{���Q|\n�c�<g�O\n�\0n���y��6?�����\r5��~�Q������_�\r�\Z���?x��:����SZ����獼O��k��_�Ǆ�K�G�m����f�/�/|p��w5�[�o����}�G�W��mf�L��ڇ�u���^�V;K�#�R�ȳ��L�>/K��Ŀ�3��5o�z��O�O��~��I]��\0�3�~϶��=�Ꮝ��ldo�_�7��Qi����%����\0�>\\x��ᖟ��A�x��l�8�����>�O��8�\Zdx��c-�ifψ0��1��᧊�ʥ:X�.K�_�J��G�2�9:�?�|�1p�ѧĺ8�\0k�-^�\0�,7��\\����s��8J�\nc(T�e�g���N*�l4��yѡV��*��O������|�w�?h/��)�٣Z�e��^0��9}��������+��\0�#�V�᫑w��(�lt��gǯi�|q�O��ik^����c���C|X�>0~��������T�ğ�>xG����-R���~+����-OZ�4\riZ/�\rk��W��Y�mO��?x�Đ)�4jz?����%Ѽc�9����\r^��o�^;�֩�[����ō\Z����\0���/�?���o�\Z=��\Z|\r���A�j�\0|Mgt�,�O�g���#�Z��?}����hO�>�\0�����\0��_��\0�~�WY�\Z�_|A�|s���Bx?���߈ecĝĿ	�����0X�Q���#_6���o��-�υ���;�(V�?<˲��;⇆y�xM�<�8Zk;�O�c��Y\Zp�{���%M�v\Z�#������嘸�4�Κt�_I%�_�߇��9�w�qE>#�ӆ�t���VO��>!�8r4��&*r�v|�����Q�Q�`�{:���Q��Ǻ��j�o�><�/����Z�����?4[]7E׵\'�ɤxO���x��_�5�\n��ox��z���Y�m-��=���������?�^6�5�ٳ�?<��G�o���a����x�H㕭�x�O����?�at�Wě����I��+T�?��ß���۝3ß~|O𖑮[Xx�G�׼3�	��M��4�/�mb����\0O�4��[�m{k$l�������������/៊>��~��?c][�?�tO	�.��0�\\���g@��%����h�\0t��<��Ŀ����x�\\��	x>�F�F�K�A��\0M�I>-����M~��)��|�d�E�c1X)��<&q��`142�Q�O��F�%V�>�$�M�3��S�T��\0�7��\nq�\'��gÌ�����oqFU�fԳ>̸_6˳�/�)Ⲻ+\'�[,>+%��?�i)c����?�?	x�����ϋ,�n��|O���6�Wȱ�Z[�Zu��\r��h����r����L�(f\'���\r��d��\0�V|,����~7�f��~4��ۥ���+�B\r\n�s�&��#F� �N׷���ܻ5��t�\0�?��ĭkÖ�ZG��W��t�\Z����_���O��5�H�]�Ou���:\\$��R�2��L������������\0����o�|��~��\n6?�t?�6�1�,���O�_�\Z��Y1��O���}w�7�ׇ\\=��F�e�˳�5t�9V�}CJ�(;Jjb0Y��RI򤷋?3��|1�O�N9�pت?=�xc�>�Ա0�e�\0�9�\'\r��*u1TpY�A��%%�%)]�Qo�z(�����+���\0���_j߲���\0�G�zd��3��~-Y�\\�\nY@�:���9x���6��4k(�X�𞫣|J�y>X��f%Ey�%����\0�S�~;𯉼�-O�\'�<e��g*���iz���E�\\�\Z择Z��s��e�Ս���o<��k�,�qyFe���\n��;,��se����׆#Q-/�V�%k�kGdYgd9�\rgXx��~!�s�5�����ٮ�A�;*�j�a{;s_��.��\0n�|?e�xY�m�Ac.��_��#��L��[ohWv~$�~�y�j6z���M�ZXl�څ���x����6�gy��7����/?i�7��C�Χ�>|7�<U}�xO�G���_�N_�_�N��|q�G�u%�|C�sL����7��t�3^[��?	�M��~����f��X\\���\'���\0bߎ�\0?�����o~��g�j����/����c��a����uo\0���tmbXx��P�$�Q�i}���u�>�:�\0��\0�<_�7\\�Ai<i�\n\\�\Z>���w{�\0���c�����cЬ�ԛG�|E�\rS^�Ž榾�4vԯ����W��/�?��!��`x��Y�����%\\,%Ry�S��B�Y������}R�Ka�\n��k�N�E���s�׋�!��~[�g��m���a%�ٍ̰ha��O���18zXܳ�27�<�	C�\n�|Ք�,V�Fx��z/���^���gř������[����?�Y��>�Y�M�|L����Ľ~s����N��G��S�\rf[_\rj>:��q�\rSX�|U⟇Z7�~G�\0���+~\Z�\0�L�xKĚ��$�g��\0ٶ�ƾ8�W�n�2�KP�v��h���O	��[{]Jm+L��|��i�4���v��7�Zj�{�zm֩�j_k>0�\0��|l�}u�|b��5/�g�o�-�G�7���z�����O֡�Ѵ\rY�.�i�z�N��y�|�<M5���d)�yӿbk߃��\"|/���\0�~����~\n����?h?����=�(|Y�[�ri�?Ư�?���ϯ5ޯr�?�<�^��-k�}_�\0��²�]e8����\"�����B��6�lu�#��;�����&�ka��y,�w)�F�U\n��L6&\n�IF�fA���4���o�8��8�3>-���5*4]\'8J�\r�y�>,��ӜqYpRUh��-/�?b���=���?�,�>��S�������-g�\Z$VZ��/��7�?�M/�����7��_��R�����~%��T�����g�\rľ1�> h_���G�#�O�Z\ZU���@���[K���\0�;yo7��^,l,4�1�\Z?�쯥��ǟ��-|��ÿl�/�5�3K�y[���Α�\0A�׎�<�T�V�e��^\"Ѵ/�����#��5�_ixz��W���2�����|�i~+�G�?\n6���vZ��<=��Ūx#I�A�j�井����W�ٿ�\Z���-�nxWG���;[�௎�|F���6�O���R6���\0m��]>���<�Ew}�\0�b�[��ͼ���\n������t�C�;��7�oqVa��a�Y�qNq\'S4���&�%Ĺ�+���ʕ�t�,E|V&n��W�[�xǌ��S/�xO�8���Ό���x[\r<���a��|�3�r)b�������J��:T���U��S��tt_د�\'��\\���h^+�_�o��}Ǻ��o��|7�x���4�K�O���֭���V\Zſ��K�Kx~U�kX��M�����]����|K��֟\n�����~j�_�����\0اQ�������᷌�_x_��5������0�毮xE�<W�xSB���]�qg��R=#��+��>1���\0�P=J�V��C|`��~�s�j���>|=�3������O��s�|\\�U�-�}n�z���;���w��ԯ&����\0 k:����R��9��x�^��ofHb���=�i�<�U��$pY�XZ����.4�ي!�\0D<\0�X��Of�?������p��L6k����s��K��	`��ʜ*V�J����ѧS��	:U�\0����>�f��w�q�qOT�d�a[�xs0��\r�c��H�96Q�����HT���bkࣁ�d���pǼΖ+�������P_���Q����K�P~�ߴTH�kH>~��Ο�xú�3��<�x@{g`���>�*[VI?�*��\0��ɾ%�����_]h?n�C��5�<9���:����w��wv�\0��ë�$t�cX�5]O◌�6��\\�ŭ��i���\'��5���?��A�x���,�U�[��W\\�N^�5Ek�O�f���\\]H�?�����\0�\r�G��N�8�Xj��\0Λ����;p�f]H{��WK�%\Z�Ҷ,�Sy0��+��� (��\0�h�\0���=�K�^�$������M����\0eYu����h��?�ԭ��\0���8x�PsCÿ�����d�/|C�|3�E{�ؾ�4�\0�Gů��2xWQ�M��ſ����aig�x����m�O�����hZ�ݝ��|?k�_�D��5?ɮi\ZG�|1��P�^]Y���4W�\0F��|U��\0	x�C��ύ�/��xoQUMC��*�4��w�r-��X]*�̫=��<�\r~���<O��[�d8*XLχ���Zy�U��2���#,&\'���X�5|�_\r(ҩ^�_��?e�(Ӛ�i�����9�\0	�q��8��&��E�y,2�μ0X�Y��并_���Yf	�(a*,<��8�O�bkR�����Y���\r��Xu-I�浶�����^����hw�Y~��\'�d��|/��K}���\n>0�0�i����B�|�;�\Z6����\n���ݬ�w���ׄ|w����=g�Z����Ak��LZ֟��Z���ۼ��힥g<�I�:|I�\0�$�\0�\'>)�2�\"��?g�Y�y$��~xZ��n�<���I��~\n�\0�$��@$�����\0;H[��\'�����߱���W��\r�o��o<b=����������[�\0�����$�Uq���x[ǯ2�YT���ЭM��Ξa��j� դ�����6���_^1��j��?��C�g�\r>$���qx�5u�˩W�s.��u#.h���.%��a�.j�<�:�����U�\\���i���&�k��ˆ���|������x�R�I���>\"x�s�i��?5%�̶����x��gWod��wf����{D���\0�uk��Z顸�|e���\"�d�s\"�x��_����U�JeXu/�8�5-;͖�K����_3�?�$�%�e�x�]���k+�U-淗�����G��!6��a���e`�w\r���e�{�-�\0���/�x�ş���D�o����o��i_��m�э��h?~1��A�3�ж�a��F�H>�O��Xl��K�x�V�Us�𘺹MN�����G)�b�h�{:��֒�)�F<�-�/�s0�Y��18�����)fy^�qU�P����\\M����ME�l\'�x\\D�Rx�5eV���3�_����x��Ϋ�[���K��׌�mሾ+|a�g�n��_xSQ�4��1���O��:,�v��;T��~Y�+����֣�h�Ӕi�A�W�_���\0�\nw������?���\0�z�\"�t��5ϋ�\r<i�k������s�o�>����[����\ZT~0���3�6��Z��G�-��m^k��\0��_����5$+�=~��\0���)a���>x�ڜ��VF�ռ9�i���)\"y�.�|�6Gɯ�+����ҧf�9_��%�b15�<&?6�sK:u1x*Y�c�~���$�zXXsƭzjq�Z�9Ep���hx�����o�+x��`�8\\k�d�5�y$�9e\Z�2���dYl>����E`q��Ʒ��	��*��&M�Ƒ\"E$qƋqơ4@@UEPU@\n\0\0\0)�Q_����EP��','SMA',0,NULL,NULL,NULL,NULL,'2010-03-02 03:07:22',63030,0),(5,'Sekolah Indonesia Membaca','www.indonesiamembaca.net','info@indonesiamembaca.net','Jl. Pendidikan No.1','Jl. Kebersamaan No.1',NULL,NULL,'(022)1234567','(022)1234567','(022)1234567','(022)1234567','(022)1234567','(022)1234567',NULL,'����\0JFIF\0\0\0\0\0\0��\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\n��\0C\0��\0C��\0\0Z\0Q\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0����\'����Ϩ�p�8�K���|-�������Z�~�X��+glג�x�m��$�I?�R��}��1�/�^#�L��t]2��8d %����\r���I8���f���{S�.����̗z��u%���1��9,�Ĥ�0���O��&\0�;�~�Ř�F32�R�Q�ԧN�:2�:��CQ��*���Q�9BU��{��yܗ�>#q�^����ѧ<�	T�J�������\n��i��jN3�Ir\'	NWQ�Tk?�O��g\r��{��L�߶j�7�����܁p}�b�\0�a|\\�\0���\00����b���8���|�����O�vI���b����ӭ�J��k%���c��\n0����ᕾ4q�\0��âz��\0/�ߗJ��yG�9d��C��֡\'\n����<�0��q��X�W�OF��iٟ�C5�G0�1�y�5j5�J��Xy����[��\ZtҋO�h�7O��l������z�[�Z?᰾-�\0���\0P{�;����`.��?eo��;a��L\Z\'l�\0��~��Br�_�G��>�\0�Ph� v?�#���R��7�f_��\0O��7�\Z������-�ə�ӏ���ۇ����AG�z�\0 {�qӌ�8��WK��\0�3����/躼\'aӥ������GԢ���+��u>x߲�ƅ�\0�;dO��4^��\0��9���+ϼk���\0���F�-��ċj�6��+9�C-͜�G���Lk!����xS��848b�\"��K��S�JZ5�^\nқ��`�j�M;\nyǊYe7��T�Jz6�J��\ry���۫^\Zp�,��J:�IKo�߆_<�B��Ю��R�@چ�|�ǩYn£R���<\r$y�\\��^�\n��l��X9��;v5�q��\0j����mW��\0L�IB��;�q���tWO2������9�퇇�{}D�u�S�5m>�Q�q�	:)!�\n���8�8������a��jԫ��>��귽W\rZ�����KޤTf�F����MMs������\Zϊ�X�8�S��e��ۺK��&�K�x�C�K�.5�����\\,�Z����\0\Z*L����TW����\0�����u�b�y��v��(>��F<g�oc�~S�B�d�����I\'H�=��+_�?�������H�N��\Z�zv���+��g��{d����8\'�O_���5Z�Ny�1ɭ��C	ߢ�y˾0�O�)Ż��E�ʕlL�oV�g�O�4�M/�>���`���4�-�@R8�U�\',�嘒N�Z�F�/RFO�Ԏ=�\0�u�+\'Dm��A\ZV����|��<tpx��9�����{�q�<1r-���e��o�#˧ZH_˂ܒ|�˘��iB�B���\n�\0x��Gx\r��E�O�q�2ʮ�0��gy�2���2�ujѧS���7*�aGB�#��(P������?���nG�S��U�N�x��a(S���V�c\'\Z4 ��nR�t��J\'�zߏ<��&Ѵ�OH�5xePyϔ_�^�����K:/��/�0�A״�_bo\"���D8�Fł�Ypx�9�ƙ%��W��y&�B^Yf��G 奒Fff�$�9�A��J�\0J���4�ˋ+�iX.��hg�с\0I�(pR�p�NT�_����q#�h��x/�G�����������/j�*�|r�N\"nj��p��8�_X�����6���	�&��.!�*��J�\Zq�J�����iW�6�r��I%�rI���P�[NF0��������6�k��.�ŭ�1���p�v�i��E�U�(�YpAi��ř~\"h��ԑ��b4��Q\"�ҳګ��&�Y7�\rҢ\",�*���zg�_�&�9�\0�[Y�\0�)��:�	����0�����ڸ�����x9֧\Z�&�:8|n_��\Z�V0˱�k�1t�R�8֣\'J�j.�Y�\00�E��?��L֌a���qtkA{ԪӞ\ZR�V�ڏ=*ԧ\Z��d�d���K�H�I���:�L�8������������p��Ų�$f+[�!S��(��:p?���\0�~8�d{ӿ����3�o��g�7�1�\0A+�_|gڿ��o��\0Wr�4���Ҍd�Q�̕�\0��7�ʵ?��mq`�����rWѸ��M7湥�v{���?��)�W��.|��]�\0\n�q��=99�;��pN~�sܚ�������s�<��=}�������I\r�`<E��ծ{c��s��5�_�����~q���\"��|�\0�B�7��\0�!�������\0�N�\0N⿯���6?�4q�\0P�7����_�N:�����squ�O�\\�C�]�E�vV��m���Đ�Ю06�\0�V�5�h��gJӳӵ�]�	���<u\"�	���^��$oi��q������ a�ı�#M�l7��l�a�IQ�J��ߵ��8��|ʳ��b1�q��\0��d�*6+,�2��ԄS��ex�mben\\>[VQ���8��\0f����\'N��\\��x\Z�\ZJx����Xdݒ�zT�r&��AS���N��>����q���9����s���v�S��������N\08{��rr}�=z��8�\07	9;$���z+��Wm�Z��B���k����a����Η,�]Ar�X)��ͮ�x.a�`[��J��W�?I�\0�q��\0Э�{����}��Z���U�w{g-ߏ�X\Z��m3B�P�$��:Ku�� I)onY\0�#,�#.��\0L�V\0|7��3�\0\"���YH�G�q_��.8�8����0��\rn.���\\%K��3%��2ꓣ?z�<��u�|2j>��a�\n)VW���4��K���V9~H��MjmJ1�)�W�f��:X�\Z���Fpo�\r/���g�=�/�\0_s_��Y�\0�7��?��=�\0�ew�?L�\r~C�����\0WN�����5����s���\08��\0;�ܜW�)�w��yw��h�8��c�J<����^\0�**]�����E1����o�T\0H��Ӡ�:�>�89�I5�\\9\'��=��׎y�y\'�~��r�Ծ-�Y��\"����t�@��K�+��% ~�Q��<����ƲJ�	R\r����e��y�;�<�ҫ�X�d��4�:��\\ܘ�iR�.�-ҫiY9F�[�̾2�*��L.I�VWF�f�χ�]U�6�IU�.Xݨɷ���}��=�t�;n�\'#�@ݑ�N��\\���uKY��H/m.bhn-�bC,l0�$n`GL��d�#����km������MKQ�K����T��In-��·p���P�Y�**���N�\0���}�\0B�:���I��\0��;w���-��e�r������f8:��џ,p��7Y�\rN�I�ΝzS�F�>8T��O��Ď���W�ۣ���Q��UU�W�Z0��[�;sS���$��T������]Z�[�&�Z��˽���yc��EuM��F�B�U�\0~�>���7�����n-�oz�$VI4gr��Z$k1�\n��<}�2pk��\0���z3�x�g��iq��\01>��;����,?X��\\�\0�S��/�g��>%�a��\\\'O;�-ca/��<��)N5#Z���K��J���!;J1N����!+��<�~#ז�Si�*�wY����׺ۮۏ�ۏ�}sm6�CQ,Q�$qơ$�v�\"\0B�\n�\0\0\00p���[�ܒ|/�u ��c����Frk����{�|;��?떑Ԟ�\Z���\'5���jE�Ǉ/<+�M�I�����5\rJh�������gt�N���#���T�c_ՙ�Y���ӞK_����Υz΅*(P�Nrv�M\\i�ѧN.W�J)j�7��C�8�Y���a񘊘LD)P�Ƭ�֭R���\"�NK�s�b���mX��UH��#�Ќc>�ڿ^�f���߃�ͽ���S�]Fz�:NFH�om5���Z�%����\r���4�K/�G9g��@2[��E~��8�¾	�r�Z�or����۫�s���o1�$��9�G�U(d�>����s��7��Xl5Jr���S�A&�����4�[RY�m�I�\Ztp�GS��R��JiI��f���~�q��\0п��)p=�\03�4W�Y�A ܸ*01���s�c�23���>8~������P�4��=֣����|�\'�ҧ��8q+�i,d�Fv��x�>�iTm��`r8cW�%�S��A� �s�rǱw�:�+���$͸_���W�\'(*U�U���b��)�U��-���p�:��f�O���8��Γ�#\'R�jo������B��]i8N)�i(�����o�~_+[𶹥�ʁw�� b2p�4>[�	l��J�:V�3�:�`���v�?����}	8�W�o���{o�#�����Y\'�<N��_76PMs�\'�����d���H|Kg4z����d!K�2.�q>���}w���|5}c}g�}N�T�|�I��+[T�|\r5���Y��g�O�c�_��Mc��m��̯rC�e?[��*4�p�	�IsJ�eR�$9�����Փ��E������)�5\Z�u:�Wi|p�Q��������:^����y�c�8���rA��qҐiz���<d��~��\0��	��3�>*[�׵�FH.>\"k~&��^��|9i{��7T��*�s�[-��q�x���i�r���J{]-2���?čᯂ^\"K���ֵ�C����CJ���ƽ���\Z����k\Zeյ�zf���������\"�I1k\ZE���]�^�t�}xn��F�]��\0��]~z�e�\0B��S�\0�R��\0���iӥ������OM:����I��9�FNx��k�о��Ē�:���L��4:u��7�k��6��4� �9�Ѹ>!���=��4���k%����m����JOK|u�5����e�В�U����--�[���/⇈|km�O��g�\0���Qm�šŦ��R��IӼ6�tv�jZ$k�\"��ّ�����{�ݮ���_�,\\��a�{N���W�+b)�髧O�r����zP�K\r���\"t���CJ�ݭu�WZ1��O�U��6WP|���7�>1�ȷ���$�4H�Kk�LK*��\\F�����b�6巇�`��h�U�ѷ�<���8���\0D証�ez�a�8��קvP1�%t#�!�����~����}��|I�T̳Z�y%\np�gC\rF?\r=+˒�{�S�7�T�9{��C���~YEҢ��*No��\"�V�z�,��J�D�N	rӄ#�QQy���Q^1��q��7�|C���O��f��ԣ��H��F��-��=O^�o��	!��_M%���A=�Z�����L�O\Z�Ŀ�z�������\0	u����\r��@�h�V��0���_�m�۽*�\r#d��YO\r嵍�v�?�.�?�G�~�S���_�8�i������M��}O����u��C�M�r�_\\�}��<o����g����狼i$�\Z�Οi�\\�\Z��GY-t_������Og&w���Y��\0�ou�����Ğ�g}�[j~�%���OK�.��o�izo�mb+)o�.��\Z�Z�����W��3\\h&�L�����}�#ؐ2~��z�@ǶS�u�����������|W��Z��I�ī�=����Eky�hQݿ��_��	Σ��׿�ë�\\꺯�|s�:�J��_�_�M�:DV~m�7�/|}���I�4~%��~*�V���_X�z+���]:�\0�:���}6u�2�v�\\�%Ԛ����\ZW�tǳ�]rh%��uE�MN<t��G\n���ik����\0����\'�h[�x��x�x��ƾ]G��nD\'B�=�U�����e��i��}�L�u;=wP�����`�{ۤ������+���}.O\Z�SL��V���9?�o�Ѵ�.�q��\r�Gg��~�}kV�l4��J�Q���ɣ��:u�H���E�_ʷ��u�|�?������Z�,�����w��M[D����{�xC�:.�}�]~\r!<E��]j��\0����15h���]}��K��k_C�{��\0�w��������sR�%�N������V�.�W�i�>\">)�-�KY��������j�\Z��;#��7r��W��m	��V���D�������\0�TV���','yayasan',0,NULL,NULL,NULL,NULL,'2010-03-02 03:07:22',55385,0),(6,'Perpustakaan Umum','','','',NULL,NULL,NULL,'','',NULL,NULL,'',NULL,NULL,'����\0JFIF\0\0\0\0\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 70\n��\0C\0\n\n\n\n\r\r#%$\"\"!&+7/&)4)!\"0A149;>>>%.DIC<H7=>;��\0C\n\r;(\"(;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;��\0\0K\0d\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�j(��\nd��M,��ƃ,�pz�X�%�V��d7���\"��.d���Ԟy�����o|K6-T�=:|�=��ov�=+jT\'Wm����]<:\\ڷ�[����%��kY�� 87��e?��-�\0�\\���-`��-nX�?������o�:�[���iGo*�DB�9*����a�N��i�}լ����X�ln$�=OLߟj�(�iF�sy�>{��&��P�Z���kdlɤj7�|�I�኱�el��Eo�x��\Za�Yūێ�Z��z�?+~W���i\r��eH$�!_��r1���R��Y���sm݀[�99!{��\0~j�B�H���h�X��gʪ��I�|��á��H�-&�v�:���Yb>���Z���][^O�<�:�h�0�-�P�=��NG$Wu�x�kI�ӼRQw���h�b���o�}�ͫ��4u_�罆�!V\\�\\�����;�)�ȥ�S�\n(��\n�<]�ȼ9m�R�mm�=��w��+��W���\Z��Ӵ�?�[�o�7*�=\0�]j>ڢ�Ï�}V����ȍ�[�6���=���\0�*I�\0uTtQ�;�zl�ܴ�y��[H}Ca�8R8+��{Ժ�05�\\O��.�\'*��;��P�0�FܥA�޽��Q���#�Vs��-e-��[�Y[I!��IV\'x�޻���A�\0�������m5F�#q>�}�4�\03y@��:�ׁ�k��G��D��B�a�n����c���uWs����wQ��l1/s�?��+��y�%g�=���Μ�̞�u-kZ}���\r.���9�Xn&!�zyk��~U��:\\6Z�����k�6�����b��n�6���u;���{e�Կ���A�+S9n̬ӐA<��J���c�Bu��,k�\08��\Z�uɄ�uTb�zY���\ZS�Skk�������W�?����8<c�S��iW�\Z�oy����*���\'�I��ճY�6��:�$�̰�&<WwwQ���z�l���\0|u\n��p��U�oxc��Vh��Nf�E��Ap�-fOEc�?C�=�\0� ��!�4�&�D�ea�Eu�\0.\'�²C,�*Z^�o	s���aF{�x��4i5(�ϧ�1���ө�z��\0�vQEy�����ox�Նu��*��f������`��$��jvI >�*G��V�02宼�+7�烕�Y��ɮ��N��ʰ�c���}�|�\0\\�	x�T\\�r[���*���\\i:��m���r���نve��\'$g��`��\0J�-�T�d��W/�����\0{b��We\\L�V��﷡�a��x�-7Y+�ׯ���[�o���[�2�e-�G@:)c���Ry���u�\"�k�X8yn#���nm�K�쪮�\'۹�=juMHXC��k9g9�\0��+E�7��Oz|;ớ�Fͭ��C\n�뉮D.���@�vݎ	�Z���k��[����`�ޝ�ӽ��o��`q�x�\Z�P����Kq mǘ\0V#�\'c��8�]N�����[���b$C<\"^N\0�={�����>�e�Y0�)P�v�����W.;����Pp��\r?��mF��Zc����F���0��V� Wj�ﻱ�X,Z\\�Jҍ���ӳGN;��\Zr�[�����g��qc\"�k5�����a�\'�OӴëj��Á;Z����dF3�������Qf�,�����`AWR285����oYIo���Z[\\�o�Ҍ�@����,;�|���Kk�������R�RwO����2���P(`Q�]�����\Z�s��y���l~�W�̺n�;�1��V0=q��+�<9��\0c�oM�q����6�\0x(���2���ϐ�_����/��4袊�O�\n��\'i�����]\"o9����,��!��5�TsC�A2	\"�J:0� ӌ�Zh��N.2ٞD���<��\'� 0�t#۸���:��b8�������Kx������k�K)tR���$�i�[;�[s��}��*�7s�=�䖎���a�yH 㞣���ע�T�Hn|�,���UW��\0��=i�I�庻\";[�E�o��[�c���AH�o��m��.)^���Y�9�*@,�v�{c�cI?����jM�X���x#�V�w���ϭR]�l\'���K�W1��]i�Eo.z|��s�Q��q^T\\��N��c��U���z~���ƥj�+�E�Y%�R�k�������}�s]~��ŧD:�PE���V���t�\\I⋋�q������e���օ�q�oث�rPr9���h�zU�[�o&�䅭e��6�ߐ��&J�7&�����v�5�Vj��~�;d�\0�����H ���ҩeP3�H\'��+�/f����h- 9\rm`mw�7)$1,v�G8�x�j����f��o/-خ^#�Xt��s�V��;fv+0�O`�{x<%���VG�晟4^�i����������f����(��mק��A����\Z���>h��i�k�����HuF�\0�\0V�\\���j��W��r�{87հ��w�QEs��EP-�˭�G}�*�V�/o��~�GهOC��k�N��֗�&�4�+E}Bq�C$c�y�U�Cq�x�X۪���5�G:I�l�V�&Q��K���J/&����3cHdb��\0������5`H���=d�������5�]x�w��M��h�?�b�\rw�:6�3%�WP�=��.�i���[ٜ��UIs{w�~L�Xv�FX�壎$���ƪ��U�E�1Fz�0c?X�?���:-���K��n��\0�����τ��]+�s���%����\\��ʩ���[�<����\0��5�x�{�F�yHф󝘃�\0�͎GlzV����x�T�����K+OG���E+��\n��?B�4�givv��\n����<�O�ӂ�;���U�z���_��``R�Er�QE��','P_alls',1,'alls',NULL,NULL,NULL,'2010-03-25 06:22:39',22308,0);
/*!40000 ALTER TABLE `identitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenispekerjaan`
--

DROP TABLE IF EXISTS `jenispekerjaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenispekerjaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pekerjaan` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pekerjaan`),
  UNIQUE KEY `UX_jenispekerjaan` (`replid`),
  KEY `IX_jenispekerjaan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenispekerjaan`
--

LOCK TABLES `jenispekerjaan` WRITE;
/*!40000 ALTER TABLE `jenispekerjaan` DISABLE KEYS */;
INSERT INTO `jenispekerjaan` VALUES (14,'PNS',NULL,NULL,NULL,'2010-03-02 03:07:22',10914,0),(15,'Wiraswasta',NULL,NULL,NULL,'2010-03-02 03:07:22',53173,0);
/*!40000 ALTER TABLE `jenispekerjaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lampiransurat`
--

DROP TABLE IF EXISTS `lampiransurat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lampiransurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `tanggal` datetime NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengantar` text NOT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampiransurat_departemen` (`departemen`),
  KEY `FK_lampiransurat_petugas` (`petugas`),
  CONSTRAINT `FK_lampiransurat_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_lampiransurat_petugas` FOREIGN KEY (`petugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lampiransurat`
--

LOCK TABLES `lampiransurat` WRITE;
/*!40000 ALTER TABLE `lampiransurat` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampiransurat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengantarsurat`
--

DROP TABLE IF EXISTS `pengantarsurat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengantarsurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `tanggal` datetime NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengantar` text NOT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_pengantarsurat_departemen` (`departemen`),
  KEY `FK_pengantarsurat_petugas` (`petugas`),
  CONSTRAINT `FK_pengantarsurat_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengantarsurat_petugas` FOREIGN KEY (`petugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengantarsurat`
--

LOCK TABLES `pengantarsurat` WRITE;
/*!40000 ALTER TABLE `pengantarsurat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengantarsurat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petasekolah`
--

DROP TABLE IF EXISTS `petasekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petasekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsekolah` int(10) unsigned NOT NULL,
  `idwilayah` int(10) unsigned DEFAULT NULL,
  `koordinat` varchar(100) DEFAULT NULL,
  `gambar` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_peta_wilayah` (`idwilayah`),
  KEY `FK_peta_sekolah` (`idsekolah`),
  KEY `IX_petasekolah_ts` (`ts`,`issync`),
  CONSTRAINT `FK_peta_sekolah` FOREIGN KEY (`idsekolah`) REFERENCES `identitas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_peta_wilayah` FOREIGN KEY (`idwilayah`) REFERENCES `wilayah` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petasekolah`
--

LOCK TABLES `petasekolah` WRITE;
/*!40000 ALTER TABLE `petasekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `petasekolah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sekolah`
--

DROP TABLE IF EXISTS `sekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namasekolah` varchar(45) NOT NULL,
  `gambar` blob,
  `koordinat` text,
  `wilayah` int(10) unsigned NOT NULL,
  `titikpusat` varchar(10) NOT NULL,
  `lokasi` varchar(10) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_sekolah_wilayah` (`wilayah`),
  KEY `IX_sekolah_ts` (`ts`,`issync`),
  CONSTRAINT `FK_sekolah_wilayah` FOREIGN KEY (`wilayah`) REFERENCES `wilayah` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekolah`
--

LOCK TABLES `sekolah` WRITE;
/*!40000 ALTER TABLE `sekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `sekolah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suku`
--

DROP TABLE IF EXISTS `suku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suku` varchar(20) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`suku`),
  UNIQUE KEY `UX_suku` (`replid`),
  KEY `IX_suku_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suku`
--

LOCK TABLES `suku` WRITE;
/*!40000 ALTER TABLE `suku` DISABLE KEYS */;
INSERT INTO `suku` VALUES (32,'Jawa',0,NULL,NULL,NULL,'2010-03-02 03:07:22',36536,0),(34,'Minang',0,NULL,NULL,NULL,'2012-07-19 07:27:05',23157,0),(33,'Sunda',0,NULL,NULL,NULL,'2010-03-02 03:07:22',6177,0);
/*!40000 ALTER TABLE `suku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabledep`
--

DROP TABLE IF EXISTS `tabledep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabledep` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rootid` int(10) unsigned NOT NULL,
  `tname` varchar(100) NOT NULL,
  `colname` varchar(100) DEFAULT NULL,
  `deldep` varchar(2) DEFAULT NULL,
  `upddep` varchar(2) DEFAULT NULL,
  `tingkat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `coltype` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_content` (`tname`,`deldep`,`upddep`),
  KEY `IX_tabledep_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabledep`
--

LOCK TABLES `tabledep` WRITE;
/*!40000 ALTER TABLE `tabledep` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabledep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tingkatpendidikan`
--

DROP TABLE IF EXISTS `tingkatpendidikan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tingkatpendidikan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pendidikan` varchar(20) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pendidikan`),
  UNIQUE KEY `UX_tingkatpendidikan` (`replid`),
  KEY `IX_tingkatpendidikan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tingkatpendidikan`
--

LOCK TABLES `tingkatpendidikan` WRITE;
/*!40000 ALTER TABLE `tingkatpendidikan` DISABLE KEYS */;
INSERT INTO `tingkatpendidikan` VALUES (25,'D1',NULL,NULL,NULL,'2010-03-02 03:07:22',26946,0),(24,'D3',NULL,NULL,NULL,'2010-03-02 03:07:22',50668,0),(23,'S1',NULL,NULL,NULL,'2010-03-02 03:07:22',41443,0),(22,'S2',NULL,NULL,NULL,'2010-03-02 03:07:22',55209,0),(21,'S3',NULL,NULL,NULL,'2010-03-02 03:07:22',20656,0),(28,'SD',NULL,NULL,NULL,'2010-03-02 03:07:22',3183,0),(26,'SMA',NULL,NULL,NULL,'2010-03-02 03:07:22',19478,0),(27,'SMP',NULL,NULL,NULL,'2010-03-02 03:07:22',22307,0);
/*!40000 ALTER TABLE `tingkatpendidikan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wilayah`
--

DROP TABLE IF EXISTS `wilayah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wilayah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namawilayah` varchar(45) NOT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `koordinat` text,
  `rootid` int(10) unsigned NOT NULL,
  `titikpusat` varchar(15) DEFAULT NULL,
  `zoom` varchar(30) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_wilayah_provinsi` (`rootid`),
  KEY `IX_wilayah_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wilayah`
--

LOCK TABLES `wilayah` WRITE;
/*!40000 ALTER TABLE `wilayah` DISABLE KEYS */;
/*!40000 ALTER TABLE `wilayah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wilayah1`
--

DROP TABLE IF EXISTS `wilayah1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wilayah1` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namawilayah` varchar(45) NOT NULL,
  `gambar` blob,
  `koordinat` text,
  `rootid` int(10) unsigned NOT NULL,
  `titikpusat` varchar(15) DEFAULT NULL,
  `zoom` varchar(30) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_wilayah_provinsi` (`rootid`),
  KEY `IX_wilayah1_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wilayah1`
--

LOCK TABLES `wilayah1` WRITE;
/*!40000 ALTER TABLE `wilayah1` DISABLE KEYS */;
/*!40000 ALTER TABLE `wilayah1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsuser`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsuser` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsuser`;

--
-- Table structure for table `adminsiswa`
--

DROP TABLE IF EXISTS `adminsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminsiswa` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isnew` varchar(45) NOT NULL DEFAULT '1',
  `haschange` varchar(45) NOT NULL DEFAULT '0',
  `password` varchar(100) NOT NULL DEFAULT '',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminsiswa`
--

LOCK TABLES `adminsiswa` WRITE;
/*!40000 ALTER TABLE `adminsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminsiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hakakses`
--

DROP TABLE IF EXISTS `hakakses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hakakses` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `theme` tinyint(2) unsigned DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_hakakses_login` (`login`),
  KEY `FK_hakakses_departemen` (`departemen`),
  CONSTRAINT `FK_hakakses_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_hakakses_login` FOREIGN KEY (`login`) REFERENCES `login` (`login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hakakses`
--

LOCK TABLES `hakakses` WRITE;
/*!40000 ALTER TABLE `hakakses` DISABLE KEYS */;
INSERT INTO `hakakses` VALUES (NULL,NULL,NULL,20,'101','SIMAKA',1,NULL,'',1,'2010-03-05 14:00:05',1,NULL,NULL,NULL),(NULL,NULL,NULL,21,'101','KEUANGAN',1,NULL,'',1,'2010-03-05 14:00:29',1,NULL,NULL,NULL),(NULL,NULL,NULL,22,'101','SIMTAKA',1,NULL,NULL,1,NULL,1,NULL,NULL,NULL),(NULL,NULL,NULL,23,'101','INFOGURU',1,NULL,NULL,1,'2010-04-16 10:01:22',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hakakses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hakaksesinfosiswa`
--

DROP TABLE IF EXISTS `hakaksesinfosiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hakaksesinfosiswa` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `theme` tinyint(2) unsigned DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_hakaksesinfosiswa_nis` (`nis`),
  CONSTRAINT `FK_hakaksesinfosiswa_nis` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hakaksesinfosiswa`
--

LOCK TABLES `hakaksesinfosiswa` WRITE;
/*!40000 ALTER TABLE `hakaksesinfosiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `hakaksesinfosiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hakakseskeuangan`
--

DROP TABLE IF EXISTS `hakakseskeuangan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hakakseskeuangan` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hakakseskeuangan`
--

LOCK TABLES `hakakseskeuangan` WRITE;
/*!40000 ALTER TABLE `hakakseskeuangan` DISABLE KEYS */;
/*!40000 ALTER TABLE `hakakseskeuangan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hakaksessimaka`
--

DROP TABLE IF EXISTS `hakaksessimaka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hakaksessimaka` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_hakakses_nip` (`login`),
  KEY `FK_hakakses_modul` (`modul`),
  CONSTRAINT `FK_hakakses_modul` FOREIGN KEY (`modul`) REFERENCES `modul` (`modul`) ON UPDATE CASCADE,
  CONSTRAINT `FK_hakakses_nip` FOREIGN KEY (`login`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hakaksessimaka`
--

LOCK TABLES `hakaksessimaka` WRITE;
/*!40000 ALTER TABLE `hakaksessimaka` DISABLE KEYS */;
/*!40000 ALTER TABLE `hakaksessimaka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landlord`
--

DROP TABLE IF EXISTS `landlord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landlord` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isnew` varchar(45) NOT NULL DEFAULT '1',
  `haschange` varchar(45) NOT NULL DEFAULT '0',
  `password` varchar(100) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landlord`
--

LOCK TABLES `landlord` WRITE;
/*!40000 ALTER TABLE `landlord` DISABLE KEYS */;
INSERT INTO `landlord` VALUES ('GMS2','BD','AT',1,'1','0','5f4dcc3b5aa765d61d8327deb882cf99','2020-10-27 10:05:46',NULL,NULL,NULL);
/*!40000 ALTER TABLE `landlord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_login_nip` (`login`),
  CONSTRAINT `FK_login_nip` FOREIGN KEY (`login`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (NULL,NULL,NULL,7,'101','5f4dcc3b5aa765d61d8327deb882cf99','',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginsiswa`
--

DROP TABLE IF EXISTS `loginsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginsiswa` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `theme` tinyint(2) NOT NULL DEFAULT '1',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_loginsiswa_nis` (`login`),
  CONSTRAINT `FK_loginsiswa_nis` FOREIGN KEY (`login`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginsiswa`
--

LOCK TABLES `loginsiswa` WRITE;
/*!40000 ALTER TABLE `loginsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `loginsiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lokasi`
--

DROP TABLE IF EXISTS `lokasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lokasi` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isnew` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `haschange` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lokasi` varchar(45) NOT NULL DEFAULT '',
  `singkatan` varchar(3) NOT NULL DEFAULT '',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lokasi`
--

LOCK TABLES `lokasi` WRITE;
/*!40000 ALTER TABLE `lokasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `lokasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modul`
--

DROP TABLE IF EXISTS `modul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modul` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `isnew` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `haschange` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modul` varchar(100) NOT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`modul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modul`
--

LOCK TABLES `modul` WRITE;
/*!40000 ALTER TABLE `modul` DISABLE KEYS */;
/*!40000 ALTER TABLE `modul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsvcr`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsvcr` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsvcr`;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL,
  `judul` varchar(255) NOT NULL,
  `komentar` text NOT NULL,
  `idguru` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_agenda_ts` (`ts`,`issync`),
  KEY `FK_agenda_pegawai` (`idguru`),
  CONSTRAINT `FK_agenda_pegawai` FOREIGN KEY (`idguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `angket`
--

DROP TABLE IF EXISTS `angket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `angket` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL DEFAULT '',
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglakhir` date NOT NULL DEFAULT '0000-00-00',
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_angket_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angket`
--

LOCK TABLES `angket` WRITE;
/*!40000 ALTER TABLE `angket` DISABLE KEYS */;
/*!40000 ALTER TABLE `angket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beritaguru`
--

DROP TABLE IF EXISTS `beritaguru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beritaguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `abstrak` text NOT NULL,
  `isi` text NOT NULL,
  `idguru` varchar(30) CHARACTER SET utf8 NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_beritaguru_ts` (`ts`,`issync`),
  KEY `FK_beritaguru_pegawai` (`idguru`),
  CONSTRAINT `FK_beritaguru_pegawai` FOREIGN KEY (`idguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beritaguru`
--

LOCK TABLES `beritaguru` WRITE;
/*!40000 ALTER TABLE `beritaguru` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritaguru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beritasekolah`
--

DROP TABLE IF EXISTS `beritasekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beritasekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jenisberita` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `abstrak` text NOT NULL,
  `isi` text NOT NULL,
  `idpengirim` varchar(30) CHARACTER SET utf8 NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_beritasekolah_ts` (`ts`,`issync`),
  KEY `FK_beritasekolah_pegawai` (`idpengirim`),
  CONSTRAINT `FK_beritasekolah_pegawai` FOREIGN KEY (`idpengirim`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beritasekolah`
--

LOCK TABLES `beritasekolah` WRITE;
/*!40000 ALTER TABLE `beritasekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritasekolah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beritasiswa`
--

DROP TABLE IF EXISTS `beritasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beritasiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `abstrak` text NOT NULL,
  `isi` text NOT NULL,
  `idpengirim` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idguru` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_beritasiswa_ts` (`ts`,`issync`),
  KEY `FK_beritasiswa_siswa` (`idpengirim`),
  KEY `FK_beritasiswa_pegawai` (`idguru`),
  CONSTRAINT `FK_beritasiswa_pegawai` FOREIGN KEY (`idguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_beritasiswa_siswa` FOREIGN KEY (`idpengirim`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beritasiswa`
--

LOCK TABLES `beritasiswa` WRITE;
/*!40000 ALTER TABLE `beritasiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buletin`
--

DROP TABLE IF EXISTS `buletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buletin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tempatbuletin` varchar(50) NOT NULL,
  `tanggalbuletin` date NOT NULL,
  `judul` varchar(255) NOT NULL,
  `buletin` text NOT NULL,
  `idpengirim` varchar(20) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `gambar` mediumblob,
  `tanggalinput` datetime DEFAULT NULL,
  `idkategori` int(10) unsigned DEFAULT '0',
  `tampil` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '''0 Null, 1 Situs, 2 Jibas, 3 Situs&Jibas''',
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_buletin_1` (`idkategori`),
  KEY `IX_buletin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buletin`
--

LOCK TABLES `buletin` WRITE;
/*!40000 ALTER TABLE `buletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `buletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buletin_cmt`
--

DROP TABLE IF EXISTS `buletin_cmt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buletin_cmt` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idbuletin` int(10) unsigned NOT NULL,
  `tglpost` datetime NOT NULL,
  `idpenilai` varchar(20) NOT NULL,
  `komentar` varchar(100) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_buletin_cmt_idbuletin` (`idbuletin`),
  KEY `IX_buletin_cmt_ts` (`ts`,`issync`),
  CONSTRAINT `FK_buletin_cmt_idbuletin` FOREIGN KEY (`idbuletin`) REFERENCES `buletin` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buletin_cmt`
--

LOCK TABLES `buletin_cmt` WRITE;
/*!40000 ALTER TABLE `buletin_cmt` DISABLE KEYS */;
/*!40000 ALTER TABLE `buletin_cmt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buletin_rate`
--

DROP TABLE IF EXISTS `buletin_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buletin_rate` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idbuletin` int(10) unsigned NOT NULL,
  `tglpost` datetime NOT NULL,
  `idpenilai` varchar(20) NOT NULL,
  `rating` tinyint(3) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_buletin_rate_idbuletin` (`idbuletin`),
  KEY `IX_buletin_rate_ts` (`ts`,`issync`),
  CONSTRAINT `FK_buletin_rate_idbuletin` FOREIGN KEY (`idbuletin`) REFERENCES `buletin` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buletin_rate`
--

LOCK TABLES `buletin_rate` WRITE;
/*!40000 ALTER TABLE `buletin_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `buletin_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catatankategori`
--

DROP TABLE IF EXISTS `catatankategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catatankategori` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kategori` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_catatankategori_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catatankategori`
--

LOCK TABLES `catatankategori` WRITE;
/*!40000 ALTER TABLE `catatankategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `catatankategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catatansiswa`
--

DROP TABLE IF EXISTS `catatansiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catatansiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idkategori` int(10) unsigned NOT NULL,
  `nis` varchar(30) CHARACTER SET utf8 NOT NULL,
  `idkelas` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` varchar(255) NOT NULL,
  `catatan` text NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_catatansiswa_idkat` (`idkategori`),
  KEY `IX_catatansiswa_ts` (`ts`,`issync`),
  KEY `FK_catatansiswa_siswa` (`nis`),
  KEY `FK_catatansiswa_pegawai` (`nip`),
  CONSTRAINT `FK_catatansiswa_idkat` FOREIGN KEY (`idkategori`) REFERENCES `catatankategori` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_catatansiswa_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_catatansiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catatansiswa`
--

LOCK TABLES `catatansiswa` WRITE;
/*!40000 ALTER TABLE `catatansiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `catatansiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id` varchar(50) NOT NULL,
  `waktukirim` date NOT NULL,
  `pesan` text NOT NULL,
  `chatgroup` text NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_chat_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dirshare`
--

DROP TABLE IF EXISTS `dirshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dirshare` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idroot` int(10) unsigned NOT NULL,
  `dirname` varchar(255) NOT NULL,
  `dirfullpath` varchar(255) NOT NULL,
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_dirshare_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dirshare`
--

LOCK TABLES `dirshare` WRITE;
/*!40000 ALTER TABLE `dirshare` DISABLE KEYS */;
INSERT INTO `dirshare` VALUES (1,'2010-03-02 03:08:16',60772,0,0,'root','root/',NULL,NULL,NULL,NULL,NULL),(2,'2010-03-12 02:49:11',0,0,1,'101','root/101/','101',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dirshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draft`
--

DROP TABLE IF EXISTS `draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draft` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tanggalpesan` datetime NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `idpemilik` varchar(20) NOT NULL,
  `idpengirim` varchar(25) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_draft_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft`
--

LOCK TABLES `draft` WRITE;
/*!40000 ALTER TABLE `draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fileshare`
--

DROP TABLE IF EXISTS `fileshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileshare` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `iddir` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL,
  `filetime` datetime NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_fileshareguru_1` (`iddir`),
  KEY `IX_fileshare_ts` (`ts`,`issync`),
  CONSTRAINT `FK_fileshareguru_1` FOREIGN KEY (`iddir`) REFERENCES `dirshare` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fileshare`
--

LOCK TABLES `fileshare` WRITE;
/*!40000 ALTER TABLE `fileshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `fileshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galerifoto`
--

DROP TABLE IF EXISTS `galerifoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galerifoto` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idguru` varchar(20) DEFAULT NULL,
  `foto` blob,
  `keterangan` varchar(255) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `fotokecil` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_galerifoto_nip` (`idguru`),
  KEY `IX_galerifoto_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galerifoto`
--

LOCK TABLES `galerifoto` WRITE;
/*!40000 ALTER TABLE `galerifoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `galerifoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `nis` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `kategori` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `fjudul` text NOT NULL,
  `keterangan` varchar(2000) NOT NULL,
  `fprevketerangan` varchar(2000) NOT NULL,
  `fketerangan` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `lastactive` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  `nread` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(45) NOT NULL,
  `info2` varchar(45) NOT NULL,
  `info3` varchar(45) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_gallery_departemen` (`departemen`),
  KEY `FK_gallery_siswa` (`nis`),
  KEY `FK_gallery_pegawai` (`nip`),
  KEY `IX_gallery` (`tanggal`,`lastactive`,`kategori`),
  CONSTRAINT `FK_gallery_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_gallery_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_gallery_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallerycomment`
--

DROP TABLE IF EXISTS `gallerycomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallerycomment` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `galleryid` int(10) unsigned NOT NULL,
  `nis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  `komen` varchar(1000) NOT NULL,
  `fkomen` text NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_gallerycomment_siswa` (`nis`),
  KEY `FK_gallerycomment_pegawai` (`nip`),
  KEY `FK_gallerycomment_notes` (`galleryid`),
  CONSTRAINT `FK_gallerycomment_notes` FOREIGN KEY (`galleryid`) REFERENCES `gallery` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_gallerycomment_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_gallerycomment_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallerycomment`
--

LOCK TABLES `gallerycomment` WRITE;
/*!40000 ALTER TABLE `gallerycomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallerycomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleryfile`
--

DROP TABLE IF EXISTS `galleryfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleryfile` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `galleryid` int(10) unsigned NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filesize` int(10) unsigned NOT NULL,
  `filetype` varchar(45) NOT NULL,
  `fileinfo` varchar(1000) DEFAULT NULL,
  `ffileinfo` text,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `location` varchar(45) NOT NULL,
  `iscover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_galleryfile_gallery` (`galleryid`),
  CONSTRAINT `FK_galleryfile_gallery` FOREIGN KEY (`galleryid`) REFERENCES `gallery` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleryfile`
--

LOCK TABLES `galleryfile` WRITE;
/*!40000 ALTER TABLE `galleryfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleryfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambarbuletin`
--

DROP TABLE IF EXISTS `gambarbuletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambarbuletin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idpengirim` varchar(20) NOT NULL,
  `foto` mediumblob,
  `keterangan` varchar(255) DEFAULT NULL,
  `namafile` varchar(100) NOT NULL,
  `bulan` tinyint(2) unsigned NOT NULL,
  `tahun` int(4) unsigned NOT NULL,
  `filename` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambarbuletin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambarbuletin`
--

LOCK TABLES `gambarbuletin` WRITE;
/*!40000 ALTER TABLE `gambarbuletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambarbuletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambarlogin`
--

DROP TABLE IF EXISTS `gambarlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambarlogin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `direktori` varchar(255) NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `aktif` tinyint(1) DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambarlogin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambarlogin`
--

LOCK TABLES `gambarlogin` WRITE;
/*!40000 ALTER TABLE `gambarlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambarlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambartiny`
--

DROP TABLE IF EXISTS `gambartiny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambartiny` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `foto` blob,
  `keterangan` varchar(255) DEFAULT NULL,
  `namagambar` varchar(100) DEFAULT NULL,
  `bulan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `tahun` int(4) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambartiny_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambartiny`
--

LOCK TABLES `gambartiny` WRITE;
/*!40000 ALTER TABLE `gambartiny` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambartiny` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambartinypesan`
--

DROP TABLE IF EXISTS `gambartinypesan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambartinypesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `namafile` varchar(255) DEFAULT NULL,
  `direktori` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `namagambar` varchar(100) DEFAULT NULL,
  `bulan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `tahun` int(4) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambartinypesan_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambartinypesan`
--

LOCK TABLES `gambartinypesan` WRITE;
/*!40000 ALTER TABLE `gambartinypesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambartinypesan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jawabanangket`
--

DROP TABLE IF EXISTS `jawabanangket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jawabanangket` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjawab` int(10) unsigned NOT NULL DEFAULT '0',
  `idpertanyaan` int(10) unsigned NOT NULL DEFAULT '0',
  `idpilihan` int(10) unsigned DEFAULT NULL,
  `isian` text,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_jawabanangket_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jawabanangket`
--

LOCK TABLES `jawabanangket` WRITE;
/*!40000 ALTER TABLE `jawabanangket` DISABLE KEYS */;
/*!40000 ALTER TABLE `jawabanangket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jawabangket`
--

DROP TABLE IF EXISTS `jawabangket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jawabangket` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idangket` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(20) DEFAULT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_jawabangket_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jawabangket`
--

LOCK TABLES `jawabangket` WRITE;
/*!40000 ALTER TABLE `jawabangket` DISABLE KEYS */;
/*!40000 ALTER TABLE `jawabangket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategoribuletin`
--

DROP TABLE IF EXISTS `kategoribuletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategoribuletin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kategori` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Index_2` (`kategori`),
  KEY `IX_kategoribuletin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategoribuletin`
--

LOCK TABLES `kategoribuletin` WRITE;
/*!40000 ALTER TABLE `kategoribuletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategoribuletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komentar` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nip` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `komentar` text,
  `tanggal` datetime NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_komentar_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentar`
--

LOCK TABLES `komentar` WRITE;
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lampiranberitaguru`
--

DROP TABLE IF EXISTS `lampiranberitaguru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lampiranberitaguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idberita` int(10) unsigned NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `direktori` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampiranberitaguru_1` (`idberita`),
  KEY `IX_lampiranberitaguru_ts` (`ts`,`issync`),
  CONSTRAINT `FK_lampiranberitaguru_1` FOREIGN KEY (`idberita`) REFERENCES `beritaguru` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lampiranberitaguru`
--

LOCK TABLES `lampiranberitaguru` WRITE;
/*!40000 ALTER TABLE `lampiranberitaguru` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampiranberitaguru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lampiranberitasiswa`
--

DROP TABLE IF EXISTS `lampiranberitasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lampiranberitasiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idberita` int(10) unsigned NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `direktori` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampiranberitasiswa_1` (`idberita`),
  KEY `IX_lampiranberitasiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_lampiranberitasiswa_1` FOREIGN KEY (`idberita`) REFERENCES `beritasiswa` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lampiranberitasiswa`
--

LOCK TABLES `lampiranberitasiswa` WRITE;
/*!40000 ALTER TABLE `lampiranberitasiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampiranberitasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lampirandraft`
--

DROP TABLE IF EXISTS `lampirandraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lampirandraft` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idpesan` int(10) unsigned NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `direktori` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampirandraft_idpesan` (`idpesan`),
  KEY `IX_lampirandraft_ts` (`ts`,`issync`),
  CONSTRAINT `FK_lampirandraft_idpesan` FOREIGN KEY (`idpesan`) REFERENCES `draft` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lampirandraft`
--

LOCK TABLES `lampirandraft` WRITE;
/*!40000 ALTER TABLE `lampirandraft` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampirandraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lampiranpesan`
--

DROP TABLE IF EXISTS `lampiranpesan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lampiranpesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idpesan` int(10) unsigned NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `direktori` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampiranpesan_1` (`idpesan`),
  KEY `IX_lampiranpesan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_lampiranpesan_1` FOREIGN KEY (`idpesan`) REFERENCES `pesan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lampiranpesan`
--

LOCK TABLES `lampiranpesan` WRITE;
/*!40000 ALTER TABLE `lampiranpesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampiranpesan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mutiara`
--

DROP TABLE IF EXISTS `mutiara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mutiara` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kata` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(20) NOT NULL DEFAULT '',
  `lastname` varchar(25) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_mutiara_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutiara`
--

LOCK TABLES `mutiara` WRITE;
/*!40000 ALTER TABLE `mutiara` DISABLE KEYS */;
/*!40000 ALTER TABLE `mutiara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new`
--

DROP TABLE IF EXISTS `new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `foto` longblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_new_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new`
--

LOCK TABLES `new` WRITE;
/*!40000 ALTER TABLE `new` DISABLE KEYS */;
/*!40000 ALTER TABLE `new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `nis` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `kategori` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `fjudul` text NOT NULL,
  `kepada` varchar(100) NOT NULL,
  `tema` varchar(7) NOT NULL,
  `pesan` varchar(2000) NOT NULL,
  `fprevpesan` varchar(2000) NOT NULL,
  `fpesan` text NOT NULL,
  `tautan` varchar(255) DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  `lastactive` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  `nread` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(45) NOT NULL,
  `info2` varchar(45) NOT NULL,
  `info3` varchar(45) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_notes_siswa` (`nis`),
  KEY `FK_notes_pegawai` (`nip`),
  KEY `FK_notes_departemen` (`departemen`),
  KEY `IX_notes_tanggal` (`lastactive`,`tanggal`,`kategori`) USING BTREE,
  CONSTRAINT `FK_notes_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_notes_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_notes_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notescomment`
--

DROP TABLE IF EXISTS `notescomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notescomment` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notesid` int(10) unsigned NOT NULL,
  `nis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  `komen` varchar(1000) NOT NULL,
  `fkomen` text NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_notescomment_siswa` (`nis`),
  KEY `FK_notescomment_pegawai` (`nip`),
  KEY `FK_notescomment_notes` (`notesid`),
  CONSTRAINT `FK_notescomment_notes` FOREIGN KEY (`notesid`) REFERENCES `notes` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_notescomment_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_notescomment_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notescomment`
--

LOCK TABLES `notescomment` WRITE;
/*!40000 ALTER TABLE `notescomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `notescomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notesfile`
--

DROP TABLE IF EXISTS `notesfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notesfile` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notesid` int(10) unsigned NOT NULL,
  `filecate` varchar(5) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filesize` int(10) unsigned NOT NULL,
  `filetype` varchar(45) NOT NULL,
  `fileinfo` varchar(1000) DEFAULT NULL,
  `ffileinfo` text,
  `location` varchar(45) NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_notesfile_notes` (`notesid`),
  CONSTRAINT `FK_notesfile_notes` FOREIGN KEY (`notesid`) REFERENCES `notes` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notesfile`
--

LOCK TABLES `notesfile` WRITE;
/*!40000 ALTER TABLE `notesfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `notesfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertanyaan`
--

DROP TABLE IF EXISTS `pertanyaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pertanyaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idangket` int(10) unsigned NOT NULL DEFAULT '0',
  `pertanyaan` varchar(1000) NOT NULL DEFAULT '',
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pertanyaan_angket` (`idangket`),
  KEY `IX_pertanyaan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pertanyaan_angket` FOREIGN KEY (`idangket`) REFERENCES `angket` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertanyaan`
--

LOCK TABLES `pertanyaan` WRITE;
/*!40000 ALTER TABLE `pertanyaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pertanyaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesan`
--

DROP TABLE IF EXISTS `pesan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tanggalpesan` datetime NOT NULL,
  `tanggaltampil` date DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `keguru` tinyint(1) unsigned DEFAULT '0',
  `kesiswa` tinyint(1) unsigned DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_pesan_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesan`
--

LOCK TABLES `pesan` WRITE;
/*!40000 ALTER TABLE `pesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanterkirim`
--

DROP TABLE IF EXISTS `pesanterkirim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanterkirim` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `idpesan` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_pesanterkirim_1` (`idpesan`),
  KEY `IX_pesanterkirim_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pesanterkirim_1` FOREIGN KEY (`idpesan`) REFERENCES `pesan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanterkirim`
--

LOCK TABLES `pesanterkirim` WRITE;
/*!40000 ALTER TABLE `pesanterkirim` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanterkirim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilihan`
--

DROP TABLE IF EXISTS `pilihan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilihan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpertanyaan` int(10) unsigned NOT NULL DEFAULT '0',
  `pilihan` varchar(45) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pilihan_pertanyaan` (`idpertanyaan`),
  KEY `IX_pilihan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pilihan_tanya` FOREIGN KEY (`idpertanyaan`) REFERENCES `pertanyaan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihan`
--

LOCK TABLES `pilihan` WRITE;
/*!40000 ALTER TABLE `pilihan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilihan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profil`
--

DROP TABLE IF EXISTS `profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nip` varchar(20) DEFAULT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `telpon` varchar(45) DEFAULT NULL,
  `hp` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `hobi` text,
  `buku` text,
  `riwayat` text,
  `foto` mediumblob,
  `tentang` text,
  `nis` varchar(20) DEFAULT NULL,
  `bg` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_profil_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil`
--

LOCK TABLES `profil` WRITE;
/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subkategoribuletin`
--

DROP TABLE IF EXISTS `subkategoribuletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subkategoribuletin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kategori` varchar(100) NOT NULL,
  `subkategori` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_subkategoribuletin_1` (`kategori`),
  KEY `IX_subkategoribuletin_ts` (`ts`,`issync`),
  CONSTRAINT `FK_subkategoribuletin_1` FOREIGN KEY (`kategori`) REFERENCES `kategoribuletin` (`kategori`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subkategoribuletin`
--

LOCK TABLES `subkategoribuletin` WRITE;
/*!40000 ALTER TABLE `subkategoribuletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `subkategoribuletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tujuanpesan`
--

DROP TABLE IF EXISTS `tujuanpesan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tujuanpesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idpesan` int(10) unsigned NOT NULL,
  `idpenerima` varchar(20) NOT NULL,
  `baru` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tujuanpesan_1` (`idpesan`),
  KEY `IX_tujuanpesan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_tujuanpesan_1` FOREIGN KEY (`idpesan`) REFERENCES `pesan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tujuanpesan`
--

LOCK TABLES `tujuanpesan` WRITE;
/*!40000 ALTER TABLE `tujuanpesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tujuanpesan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `nis` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `kategori` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `fjudul` text NOT NULL,
  `keterangan` varchar(2000) NOT NULL,
  `fprevketerangan` varchar(2000) NOT NULL,
  `fketerangan` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filesize` int(10) unsigned NOT NULL,
  `filetype` varchar(45) NOT NULL,
  `fileinfo` varchar(1000) DEFAULT NULL,
  `ffileinfo` text,
  `location` varchar(45) NOT NULL,
  `lastactive` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  `nread` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(45) NOT NULL,
  `info2` varchar(45) NOT NULL,
  `info3` varchar(45) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_video_departemen` (`departemen`),
  KEY `FK_video_siswa` (`nis`),
  KEY `FK_video_pegawai` (`nip`),
  KEY `IX_video` (`kategori`,`tanggal`,`lastactive`),
  CONSTRAINT `FK_video_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_video_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_video_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videocomment`
--

DROP TABLE IF EXISTS `videocomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videocomment` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `videoid` int(10) unsigned NOT NULL,
  `nis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  `komen` varchar(1000) NOT NULL,
  `fkomen` text NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_videocomment_video` (`videoid`),
  KEY `FK_videocomment_siswa` (`nis`),
  KEY `FK_videocomment_pegawai` (`nip`),
  CONSTRAINT `FK_videocomment_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_videocomment_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_videocomment_video` FOREIGN KEY (`videoid`) REFERENCES `video` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videocomment`
--

LOCK TABLES `videocomment` WRITE;
/*!40000 ALTER TABLE `videocomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `videocomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsel`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsel` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsel`;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` varchar(2000) NOT NULL,
  `tanggal` datetime NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL,
  `urutan` int(10) unsigned NOT NULL DEFAULT '1',
  `nfollower` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_channel_pegawai` (`nip`),
  KEY `FK_channel_pelajaran` (`idpelajaran`),
  CONSTRAINT `FK_channel_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_channel_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channelfollow`
--

DROP TABLE IF EXISTS `channelfollow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channelfollow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idchannel` int(10) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_channelfollow_siswa` (`nis`),
  KEY `FK_channelfollow_pegawai` (`nip`),
  KEY `FK_channelfollow_channel` (`idchannel`),
  CONSTRAINT `FK_channelfollow_channel` FOREIGN KEY (`idchannel`) REFERENCES `channel` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_channelfollow_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_channelfollow_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channelfollow`
--

LOCK TABLES `channelfollow` WRITE;
/*!40000 ALTER TABLE `channelfollow` DISABLE KEYS */;
/*!40000 ALTER TABLE `channelfollow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ftdatamedia`
--

DROP TABLE IF EXISTS `ftdatamedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ftdatamedia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idmedia` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IX_ftdatamedia` (`idmedia`),
  FULLTEXT KEY `FT_media` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ftdatamedia`
--

LOCK TABLES `ftdatamedia` WRITE;
/*!40000 ALTER TABLE `ftdatamedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ftdatamedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idchannel` int(10) unsigned NOT NULL,
  `judul` varchar(255) NOT NULL,
  `urutan` int(10) unsigned NOT NULL,
  `prioritas` tinyint(3) unsigned NOT NULL,
  `idkategori` int(10) unsigned DEFAULT NULL,
  `cover` mediumtext NOT NULL,
  `videoname` varchar(255) NOT NULL,
  `ovideoname` varchar(255) NOT NULL,
  `videosize` int(10) unsigned NOT NULL,
  `videotype` varchar(10) NOT NULL,
  `videoloc` varchar(255) NOT NULL,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deskripsi` varchar(1000) NOT NULL,
  `objektif` varchar(1000) NOT NULL,
  `pertanyaan` varchar(1000) NOT NULL,
  `katakunci` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `nview` int(10) unsigned NOT NULL DEFAULT '0',
  `nlike` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_media_channel` (`idchannel`),
  KEY `FK_media_cbekategori` (`idkategori`),
  CONSTRAINT `FK_media_cbekategori` FOREIGN KEY (`idkategori`) REFERENCES `jbscbe`.`kategori` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_media_channel` FOREIGN KEY (`idchannel`) REFERENCES `channel` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediafile`
--

DROP TABLE IF EXISTS `mediafile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mediafile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idmedia` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `ofilename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `fileinfo` varchar(255) NOT NULL,
  `fileloc` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mediafile_media` (`idmedia`),
  CONSTRAINT `FK_mediafile_media` FOREIGN KEY (`idmedia`) REFERENCES `media` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediafile`
--

LOCK TABLES `mediafile` WRITE;
/*!40000 ALTER TABLE `mediafile` DISABLE KEYS */;
/*!40000 ALTER TABLE `mediafile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medialike`
--

DROP TABLE IF EXISTS `medialike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medialike` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idmedia` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_medialike_siswa` (`nis`),
  KEY `FK_medialike_pegawai` (`nip`),
  KEY `FK_medialike_media` (`idmedia`),
  CONSTRAINT `FK_medialike_media` FOREIGN KEY (`idmedia`) REFERENCES `media` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_medialike_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_medialike_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medialike`
--

LOCK TABLES `medialike` WRITE;
/*!40000 ALTER TABLE `medialike` DISABLE KEYS */;
/*!40000 ALTER TABLE `medialike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediamodul`
--

DROP TABLE IF EXISTS `mediamodul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mediamodul` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idmodul` int(10) unsigned NOT NULL,
  `idmedia` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL,
  `urutan` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mediamodul_modul` (`idmodul`),
  KEY `FK_mediamodul_media` (`idmedia`),
  CONSTRAINT `FK_mediamodul_media` FOREIGN KEY (`idmedia`) REFERENCES `media` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_mediamodul_modul` FOREIGN KEY (`idmodul`) REFERENCES `modul` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediamodul`
--

LOCK TABLES `mediamodul` WRITE;
/*!40000 ALTER TABLE `mediamodul` DISABLE KEYS */;
/*!40000 ALTER TABLE `mediamodul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medianotes`
--

DROP TABLE IF EXISTS `medianotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medianotes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idmedia` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notes` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_medianotes_siswa` (`nis`),
  KEY `FK_medianotes_pegawai` (`nip`),
  KEY `FK_medianotes_media` (`idmedia`),
  CONSTRAINT `FK_medianotes_media` FOREIGN KEY (`idmedia`) REFERENCES `media` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_medianotes_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_medianotes_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medianotes`
--

LOCK TABLES `medianotes` WRITE;
/*!40000 ALTER TABLE `medianotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `medianotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modul`
--

DROP TABLE IF EXISTS `modul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modul` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idchannel` int(10) unsigned NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL,
  `urutan` int(10) unsigned NOT NULL,
  `nfollower` int(10) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_modul_channel` (`idchannel`),
  CONSTRAINT `FK_modul_channel` FOREIGN KEY (`idchannel`) REFERENCES `channel` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modul`
--

LOCK TABLES `modul` WRITE;
/*!40000 ALTER TABLE `modul` DISABLE KEYS */;
/*!40000 ALTER TABLE `modul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulfollow`
--

DROP TABLE IF EXISTS `modulfollow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulfollow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idmodul` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_modulfollow_siswa` (`nis`),
  KEY `FK_modulfollow_pegawai` (`nip`),
  KEY `FK_modulfollow_modul` (`idmodul`),
  CONSTRAINT `FK_modulfollow_modul` FOREIGN KEY (`idmodul`) REFERENCES `modul` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_modulfollow_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_modulfollow_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulfollow`
--

LOCK TABLES `modulfollow` WRITE;
/*!40000 ALTER TABLE `modulfollow` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulfollow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewhistory`
--

DROP TABLE IF EXISTS `viewhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewhistory` (
  `viewdate` date NOT NULL,
  `sessionid` varchar(30) NOT NULL,
  `idmedia` int(10) unsigned NOT NULL,
  UNIQUE KEY `ux_viewhistory` (`viewdate`,`sessionid`,`idmedia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewhistory`
--

LOCK TABLES `viewhistory` WRITE;
/*!40000 ALTER TABLE `viewhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `viewhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbstgram`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbstgram` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbstgram`;

--
-- Table structure for table `anggota`
--

DROP TABLE IF EXISTS `anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anggota` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelompok` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL COMMENT '0 Siswa, 1 Pegawai, 2 Other, 3 Calon Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nouser` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_anggota_kelompokpeserta` (`idkelompok`),
  KEY `FK_anggota_siswa` (`nis`),
  KEY `FK_anggota_pegawai` (`nip`),
  KEY `FK_anggota_calonsiswa` (`nic`),
  CONSTRAINT `FK_anggota_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_kelompokpeserta` FOREIGN KEY (`idkelompok`) REFERENCES `kelompoktujuan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggota`
--

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bantuan`
--

DROP TABLE IF EXISTS `bantuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bantuan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bantuan` mediumtext NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bantuan`
--

LOCK TABLES `bantuan` WRITE;
/*!40000 ALTER TABLE `bantuan` DISABLE KEYS */;
INSERT INTO `bantuan` VALUES (1,'Terima kasih telah menggunakan {TGRAM_NAME}\r\n\r\nUntuk pertanyaan dan konsultasi mengenai ... silahkan hubungi\r\n1. \r\n2. \r\n3. \r\n\r\nUntuk informasi lebih lanjut, silahkan kunjungi situs kami di http://www.sekolah.id');
/*!40000 ALTER TABLE `bantuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `berita`
--

DROP TABLE IF EXISTS `berita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `berita` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `berita` varchar(450) NOT NULL,
  `operator` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_berita_pegawai` (`operator`),
  CONSTRAINT `FK_berita_pegawai` FOREIGN KEY (`operator`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berita`
--

LOCK TABLES `berita` WRITE;
/*!40000 ALTER TABLE `berita` DISABLE KEYS */;
/*!40000 ALTER TABLE `berita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callback`
--

DROP TABLE IF EXISTS `callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callback` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(20) NOT NULL,
  `userid` varchar(30) NOT NULL,
  `chatid` bigint(20) unsigned NOT NULL,
  `token` varchar(10) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_callback` (`action`,`userid`,`chatid`,`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callback`
--

LOCK TABLES `callback` WRITE;
/*!40000 ALTER TABLE `callback` DISABLE KEYS */;
/*!40000 ALTER TABLE `callback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompokalumni`
--

DROP TABLE IF EXISTS `kelompokalumni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompokalumni` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(255) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`replid`) USING BTREE,
  KEY `FK_kelompokalumni_departemen` (`departemen`),
  CONSTRAINT `FK_kelompokalumni_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompokalumni`
--

LOCK TABLES `kelompokalumni` WRITE;
/*!40000 ALTER TABLE `kelompokalumni` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompokalumni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompoktujuan`
--

DROP TABLE IF EXISTS `kelompoktujuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompoktujuan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(2555) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pemilik` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`replid`) USING BTREE,
  KEY `FK_kelompoktujuan_departemen` (`departemen`),
  KEY `FK_kelompoktujuan_pegawai` (`pemilik`),
  CONSTRAINT `FK_kelompoktujuan_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_kelompoktujuan_pegawai` FOREIGN KEY (`pemilik`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompoktujuan`
--

LOCK TABLES `kelompoktujuan` WRITE;
/*!40000 ALTER TABLE `kelompoktujuan` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompoktujuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` tinyint(3) unsigned NOT NULL COMMENT '1 Pegawai, 2 Siswa, 3 Calon Siswa, 4 Alumni',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `kelompok` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1 Sendiri, 2 Orangtua',
  `tgramname` varchar(255) NOT NULL,
  `chatid` bigint(20) unsigned NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `regdate` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `idalumni` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_member_siswa` (`nis`),
  KEY `FK_member_pegawai` (`nip`),
  KEY `FK_member_calonsiswa` (`nic`),
  KEY `IX_member` (`jenis`,`kelompok`,`chatid`),
  KEY `FK_member_kelompokalumni` (`idalumni`),
  CONSTRAINT `FK_member_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_member_kelompokalumni` FOREIGN KEY (`idalumni`) REFERENCES `kelompokalumni` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_member_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_member_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `send`
--

DROP TABLE IF EXISTS `send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `send` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msgdate` datetime NOT NULL,
  `destchatid` bigint(20) unsigned NOT NULL,
  `destname` varchar(255) NOT NULL,
  `srcchatid` bigint(20) unsigned NOT NULL,
  `msgtext` mediumtext,
  `msgdata` mediumblob,
  `msgfilename` varchar(255) DEFAULT NULL,
  `msgtype` tinyint(3) unsigned NOT NULL COMMENT '1 Text, 2 Object',
  `msgsource` varchar(50) NOT NULL,
  `isfetch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_send` (`isfetch`,`msgdate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `send`
--

LOCK TABLES `send` WRITE;
/*!40000 ALTER TABLE `send` DISABLE KEYS */;
/*!40000 ALTER TABLE `send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendhistory`
--

DROP TABLE IF EXISTS `sendhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendhistory` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsend` int(10) unsigned NOT NULL,
  `msgdate` datetime NOT NULL,
  `destchatid` bigint(20) unsigned NOT NULL,
  `destname` varchar(255) NOT NULL,
  `srcchatid` bigint(20) unsigned NOT NULL,
  `msgtext` mediumtext,
  `msgdata` mediumblob,
  `msgfilename` varchar(255) DEFAULT NULL,
  `msgtype` tinyint(3) unsigned NOT NULL COMMENT '1 Text, 2 Object',
  `msgsource` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_sendhistory` (`msgdate`,`srcchatid`,`msgtype`,`msgsource`,`idsend`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendhistory`
--

LOCK TABLES `sendhistory` WRITE;
/*!40000 ALTER TABLE `sendhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsegw`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsegw` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsegw`;

--
-- Table structure for table `anggota`
--

DROP TABLE IF EXISTS `anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anggota` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelompok` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL COMMENT '0 Siswa, 1 Pegawai, 2 Other, 3 Calon Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nouser` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_anggota_kelompokpeserta` (`idkelompok`),
  KEY `FK_anggota_siswa` (`nis`),
  KEY `FK_anggota_pegawai` (`nip`),
  KEY `FK_anggota_calonsiswa` (`nic`),
  CONSTRAINT `FK_anggota_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_kelompokpenerima` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokpenerima` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggota`
--

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailinfo`
--

DROP TABLE IF EXISTS `emailinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` mediumtext NOT NULL,
  `idfile` varchar(255) NOT NULL,
  `idlaporan` varchar(5) NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Informasi 1 Laporan',
  `target` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Dept 1 Tingkat 2 Kelas 3 Kelompok 4 Kelompok Cs 5 Pegawai 6 Lainnya',
  `jenisjadwal` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Sekarang, 1 Terjadwal',
  `jadwal` datetime DEFAULT NULL,
  `pembuat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `cc` varchar(500) NOT NULL,
  `bcc` varchar(500) NOT NULL,
  `jenispenerima` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Semua, 1 Siswa saja, 2 Ortu saja',
  PRIMARY KEY (`id`),
  KEY `FK_emailinfo_pegawai` (`pembuat`),
  CONSTRAINT `FK_emailinfo_pegawai` FOREIGN KEY (`pembuat`) REFERENCES `jbssdm`.`pegawai` (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailinfo`
--

LOCK TABLES `emailinfo` WRITE;
/*!40000 ALTER TABLE `emailinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailinfotarget`
--

DROP TABLE IF EXISTS `emailinfotarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailinfotarget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idemailinfo` int(10) unsigned DEFAULT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `idtingkat` int(10) unsigned DEFAULT NULL,
  `idkelas` int(10) unsigned DEFAULT NULL,
  `idkelompok` int(10) unsigned DEFAULT NULL,
  `idkelompokcs` int(10) unsigned DEFAULT NULL,
  `bagianpegawai` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Semua 1 Akademik 2 Non Akademik',
  `userlist` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_emailinfotarget_departemen` (`departemen`),
  KEY `FK_emailinfotarget_tingkat` (`idtingkat`),
  KEY `FK_emailinfotarget_kelas` (`idkelas`),
  KEY `FK_emailinfotarget_kelompokpenerima` (`idkelompok`),
  KEY `FK_emailinfotarget_kelompokcs` (`idkelompokcs`),
  KEY `FK_emailinfotarget_emailinfo` (`idemailinfo`),
  CONSTRAINT `FK_emailinfotarget_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_emailinfotarget_emailinfo` FOREIGN KEY (`idemailinfo`) REFERENCES `emailinfo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_emailinfotarget_kelas` FOREIGN KEY (`idkelas`) REFERENCES `jbsakad`.`kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_emailinfotarget_kelompokcs` FOREIGN KEY (`idkelompokcs`) REFERENCES `jbsakad`.`kelompokcalonsiswa` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_emailinfotarget_kelompokpenerima` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokpenerima` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_emailinfotarget_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailinfotarget`
--

LOCK TABLES `emailinfotarget` WRITE;
/*!40000 ALTER TABLE `emailinfotarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailinfotarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Siswa, 1 Calon Siswa, 2 Pegawai',
  `idlaporan` varchar(5) NOT NULL,
  `rentang` varchar(5) NOT NULL,
  `kelompoktarget` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Dept 1 Tingkat 2 Kelas 3 Kelompok 4 Kelompok Cs 5 Pegawai 6 Lainnya',
  `departemen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `daftarpenerima` mediumtext,
  `bagianpegawai` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Semua, 1 Akademik, 2 Non Akademik',
  `kepada` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Semua, 1 Siswa saja, 2 Ortu saja',
  `email` mediumtext NOT NULL,
  `jsonjadwal` varchar(2000) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `pembuat` varchar(30) DEFAULT NULL,
  `tglbuat` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jadwal_departemen` (`departemen`),
  CONSTRAINT `FK_jadwal_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal`
--

LOCK TABLES `jadwal` WRITE;
/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwallog`
--

DROP TABLE IF EXISTS `jadwallog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwallog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjadwal` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `keterangan` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jadwallog_jadwal` (`idjadwal`),
  CONSTRAINT `FK_jadwallog_jadwal` FOREIGN KEY (`idjadwal`) REFERENCES `jadwal` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwallog`
--

LOCK TABLES `jadwallog` WRITE;
/*!40000 ALTER TABLE `jadwallog` DISABLE KEYS */;
/*!40000 ALTER TABLE `jadwallog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompokpenerima`
--

DROP TABLE IF EXISTS `kelompokpenerima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompokpenerima` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(2555) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_kelompokpenerima_departemen` (`departemen`),
  CONSTRAINT `FK_kkelompokpenerima_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompokpenerima`
--

LOCK TABLES `kelompokpenerima` WRITE;
/*!40000 ALTER TABLE `kelompokpenerima` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompokpenerima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `send`
--

DROP TABLE IF EXISTS `send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `send` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idemailinfo` int(10) unsigned NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` mediumtext NOT NULL,
  `idfileattach` varchar(500) NOT NULL,
  `kepada` varchar(500) NOT NULL,
  `cc` varchar(500) NOT NULL,
  `bcc` varchar(500) NOT NULL,
  `jadwalkirim` datetime NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prio` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Reguler 1 Priority',
  `ntry` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_send` (`idemailinfo`,`jadwalkirim`,`status`,`prio`),
  CONSTRAINT `FK_send_emailinfo` FOREIGN KEY (`idemailinfo`) REFERENCES `emailinfo` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `send`
--

LOCK TABLES `send` WRITE;
/*!40000 ALTER TABLE `send` DISABLE KEYS */;
/*!40000 ALTER TABLE `send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendhistory`
--

DROP TABLE IF EXISTS `sendhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendhistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idemailinfo` int(10) unsigned NOT NULL,
  `idsend` int(10) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `isi` mediumtext NOT NULL,
  `idfileattach` varchar(500) NOT NULL,
  `kepada` varchar(500) NOT NULL,
  `cc` varchar(500) NOT NULL,
  `bcc` varchar(500) NOT NULL,
  `jadwalkirim` datetime NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prio` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Reguler 1 Priority',
  `info` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sendsendhistory_emailinfo` (`idemailinfo`),
  KEY `IX_sendhistory` (`idemailinfo`,`idsend`),
  CONSTRAINT `FK_sendhistory_emailinfo` FOREIGN KEY (`idemailinfo`) REFERENCES `emailinfo` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendhistory`
--

LOCK TABLES `sendhistory` WRITE;
/*!40000 ALTER TABLE `sendhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signature`
--

DROP TABLE IF EXISTS `signature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signature` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `signature` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signature`
--

LOCK TABLES `signature` WRITE;
/*!40000 ALTER TABLE `signature` DISABLE KEYS */;
INSERT INTO `signature` VALUES (1,' ');
/*!40000 ALTER TABLE `signature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsjs`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsjs` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsjs`;

--
-- Table structure for table `anggota`
--

DROP TABLE IF EXISTS `anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anggota` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelompok` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL COMMENT '0 Siswa, 1 Pegawai, 2 Other, 3 Calon Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nouser` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_anggota_kelompokpeserta` (`idkelompok`),
  KEY `FK_anggota_siswa` (`nis`),
  KEY `FK_anggota_pegawai` (`nip`),
  KEY `FK_anggota_calonsiswa` (`nic`),
  CONSTRAINT `FK_anggota_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_kelompokpeserta` FOREIGN KEY (`idkelompok`) REFERENCES `kelompoktujuan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggota`
--

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bantuan`
--

DROP TABLE IF EXISTS `bantuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bantuan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bantuan` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bantuan`
--

LOCK TABLES `bantuan` WRITE;
/*!40000 ALTER TABLE `bantuan` DISABLE KEYS */;
/*!40000 ALTER TABLE `bantuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `berita`
--

DROP TABLE IF EXISTS `berita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `berita` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idberita` varchar(30) NOT NULL,
  `target` varchar(5) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `idtingkat` int(10) unsigned DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` varchar(2000) NOT NULL,
  `berita` mediumtext NOT NULL,
  `tgltayang` datetime NOT NULL,
  `penulis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tglbuat` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UX_berita` (`idberita`),
  KEY `FK_berita_departemen` (`departemen`),
  KEY `FK_berita_tingkat` (`idtingkat`),
  KEY `FK_berita_pegawai` (`penulis`),
  CONSTRAINT `FK_berita_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_berita_pegawai` FOREIGN KEY (`penulis`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_berita_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berita`
--

LOCK TABLES `berita` WRITE;
/*!40000 ALTER TABLE `berita` DISABLE KEYS */;
/*!40000 ALTER TABLE `berita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beritaanggota`
--

DROP TABLE IF EXISTS `beritaanggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beritaanggota` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idberita` varchar(30) NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_beritaanggota_berita` (`idberita`),
  KEY `FK_beritaanggota_siswa` (`nis`),
  KEY `FK_beritaanggota_pegawai` (`nip`),
  KEY `FK_beritaanggota_calonsiswa` (`nic`),
  CONSTRAINT `FK_beritaanggota_berita` FOREIGN KEY (`idberita`) REFERENCES `berita` (`idberita`) ON UPDATE CASCADE,
  CONSTRAINT `FK_beritaanggota_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_beritaanggota_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_beritaanggota_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beritaanggota`
--

LOCK TABLES `beritaanggota` WRITE;
/*!40000 ALTER TABLE `beritaanggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritaanggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beritakelas`
--

DROP TABLE IF EXISTS `beritakelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beritakelas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idberita` varchar(30) NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_beritakelas_berita` (`idberita`),
  KEY `FK_beritakelas_kelas` (`idkelas`),
  CONSTRAINT `FK_beritakelas_berita` FOREIGN KEY (`idberita`) REFERENCES `berita` (`idberita`) ON UPDATE CASCADE,
  CONSTRAINT `FK_beritakelas_kelas` FOREIGN KEY (`idkelas`) REFERENCES `jbsakad`.`kelas` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beritakelas`
--

LOCK TABLES `beritakelas` WRITE;
/*!40000 ALTER TABLE `beritakelas` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritakelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beritakelompok`
--

DROP TABLE IF EXISTS `beritakelompok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beritakelompok` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idberita` varchar(30) NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_beritakelompok_berita` (`idberita`),
  KEY `FK_beritakelompok_kelompoktujuan` (`idkelompok`),
  CONSTRAINT `FK_beritakelompok_berita` FOREIGN KEY (`idberita`) REFERENCES `berita` (`idberita`) ON UPDATE CASCADE,
  CONSTRAINT `FK_beritakelompok_kelompoktujuan` FOREIGN KEY (`idkelompok`) REFERENCES `kelompoktujuan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beritakelompok`
--

LOCK TABLES `beritakelompok` WRITE;
/*!40000 ALTER TABLE `beritakelompok` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritakelompok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientservice`
--

DROP TABLE IF EXISTS `clientservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientservice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idservice` varchar(10) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_clientservice` (`idservice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientservice`
--

LOCK TABLES `clientservice` WRITE;
/*!40000 ALTER TABLE `clientservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsuserinfo`
--

DROP TABLE IF EXISTS `jsuserinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsuserinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `devid` varchar(20) NOT NULL,
  `devname` varchar(255) NOT NULL,
  `jsuserid` varchar(20) NOT NULL,
  `jsusername` varchar(255) NOT NULL,
  `jsusernik` varchar(25) NOT NULL,
  `jsuserrole` tinyint(3) unsigned NOT NULL,
  `jsuserphone` varchar(15) NOT NULL,
  `jsuseremail` varchar(255) NOT NULL,
  `jsuserbday` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_jsuserinfo` (`devid`,`jsuserid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsuserinfo`
--

LOCK TABLES `jsuserinfo` WRITE;
/*!40000 ALTER TABLE `jsuserinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsuserinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompoktujuan`
--

DROP TABLE IF EXISTS `kelompoktujuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompoktujuan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(2555) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pemilik` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`replid`) USING BTREE,
  KEY `FK_kelompoktujuan_departemen` (`departemen`),
  KEY `FK_kelompoktujuan_pegawai` (`pemilik`),
  CONSTRAINT `FK_kelompoktujuan_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_kelompoktujuan_pegawai` FOREIGN KEY (`pemilik`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompoktujuan`
--

LOCK TABLES `kelompoktujuan` WRITE;
/*!40000 ALTER TABLE `kelompoktujuan` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompoktujuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notif`
--

DROP TABLE IF EXISTS `notif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notif` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msgdate` datetime NOT NULL,
  `desttoken` mediumtext NOT NULL,
  `topicid` varchar(255) NOT NULL,
  `msgtitle` varchar(255) NOT NULL,
  `msgbody` mediumtext,
  `msgsource` varchar(50) NOT NULL,
  `issending` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `IX_notif` (`msgdate`,`issending`,`priority`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='FCM Notif Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notif`
--

LOCK TABLES `notif` WRITE;
/*!40000 ALTER TABLE `notif` DISABLE KEYS */;
/*!40000 ALTER TABLE `notif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifmessage`
--

DROP TABLE IF EXISTS `notifmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `topicid` varchar(255) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `notifdate` datetime NOT NULL,
  `source` varchar(20) NOT NULL,
  `issending` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_notifmessage_siswa` (`nis`),
  KEY `FK_notifmessage_pegawai` (`nip`),
  KEY `FK_notifmessage_calonsiswa` (`nic`),
  KEY `IX_notifmessage` (`notifdate`,`issending`,`priority`),
  CONSTRAINT `FK_notifmessage_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_notifmessage_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_notifmessage_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='SchoolData Notif Message';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifmessage`
--

LOCK TABLES `notifmessage` WRITE;
/*!40000 ALTER TABLE `notifmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifmessagehistory`
--

DROP TABLE IF EXISTS `notifmessagehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifmessagehistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `topicid` varchar(255) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `notifdate` datetime NOT NULL,
  `source` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_notifmessagehistory_siswa` (`nis`),
  KEY `FK_notifmessagehistory_pegawai` (`nip`),
  KEY `FK_notifmessagehistory_calonsiswa` (`nic`),
  KEY `IX_notifmessagehistory` (`topicid`,`source`,`notifdate`) USING BTREE,
  CONSTRAINT `FK_notifmessagehistory_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_notifmessagehistory_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_notifmessagehistory_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifmessagehistory`
--

LOCK TABLES `notifmessagehistory` WRITE;
/*!40000 ALTER TABLE `notifmessagehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifmessagehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reqstatdaily`
--

DROP TABLE IF EXISTS `reqstatdaily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reqstatdaily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reqdate` date NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UX_reqstatdaily` (`reqdate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reqstatdaily`
--

LOCK TABLES `reqstatdaily` WRITE;
/*!40000 ALTER TABLE `reqstatdaily` DISABLE KEYS */;
/*!40000 ALTER TABLE `reqstatdaily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reqstatproto`
--

DROP TABLE IF EXISTS `reqstatproto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reqstatproto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reqdate` date NOT NULL,
  `reqproto` int(10) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UX_reqstat` (`reqdate`,`reqproto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reqstatproto`
--

LOCK TABLES `reqstatproto` WRITE;
/*!40000 ALTER TABLE `reqstatproto` DISABLE KEYS */;
/*!40000 ALTER TABLE `reqstatproto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestremoveaccess`
--

DROP TABLE IF EXISTS `requestremoveaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestremoveaccess` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `jibasid` varchar(50) NOT NULL,
  `devid` varchar(20) NOT NULL,
  `hp` varchar(45) NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `bydevid` varchar(20) NOT NULL,
  `approve` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `approvedate` datetime DEFAULT NULL,
  `approveby` varchar(30) DEFAULT NULL,
  `approvedesc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_requestremoveaccess` (`tanggal`,`approve`,`jibasid`,`devid`,`bydevid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestremoveaccess`
--

LOCK TABLES `requestremoveaccess` WRITE;
/*!40000 ALTER TABLE `requestremoveaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `requestremoveaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runtext`
--

DROP TABLE IF EXISTS `runtext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runtext` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idruntext` varchar(15) NOT NULL,
  `runtext` varchar(255) NOT NULL,
  `penulis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tglbuat` datetime NOT NULL,
  `urutan` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_runtext_pegawai` (`penulis`),
  CONSTRAINT `FK_runtext_pegawai` FOREIGN KEY (`penulis`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runtext`
--

LOCK TABLES `runtext` WRITE;
/*!40000 ALTER TABLE `runtext` DISABLE KEYS */;
/*!40000 ALTER TABLE `runtext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `splang00`
--

DROP TABLE IF EXISTS `splang00`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `splang00` (
  `tipe` varchar(20) NOT NULL,
  `nilai` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `splang00`
--

LOCK TABLES `splang00` WRITE;
/*!40000 ALTER TABLE `splang00` DISABLE KEYS */;
/*!40000 ALTER TABLE `splang00` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syncdata`
--

DROP TABLE IF EXISTS `syncdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncdata` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `tablename` varchar(255) NOT NULL,
  `iddata` varchar(255) NOT NULL DEFAULT '0',
  `state` varchar(255) NOT NULL DEFAULT 'I',
  `dataload` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1 Text, 2 ABase64',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0 Unsync, -1 Failed',
  `loginfo` varchar(1000) DEFAULT '',
  `logtime` datetime DEFAULT NULL,
  `nerror` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UX_reqsyncdata` (`tablename`,`iddata`) USING BTREE,
  KEY `IX_syncdata` (`dataload`,`status`,`nerror`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syncdata`
--

LOCK TABLES `syncdata` WRITE;
/*!40000 ALTER TABLE `syncdata` DISABLE KEYS */;
INSERT INTO `syncdata` VALUES (1,'jbsakad.departemen','11','I',1,0,'',NULL,0),(2,'jbsakad.tahunajaran','20','I',1,0,'',NULL,0),(3,'jbsakad.tingkat','26','I',1,0,'',NULL,0),(4,'jbsakad.tingkat','27','I',1,0,'',NULL,0),(5,'jbsakad.tingkat','28','I',1,0,'',NULL,0),(6,'jbsakad.angkatan','19','I',1,0,'',NULL,0),(7,'jbsakad.kelas','46','I',1,0,'',NULL,0),(8,'jbsakad.semester','20','I',1,0,'',NULL,0),(9,'jbssdm.pegawai','23','I',2,0,'',NULL,0),(10,'FS','0','FS',1,0,'FIRST FULL SYNC',NULL,0);
/*!40000 ALTER TABLE `syncdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tentang`
--

DROP TABLE IF EXISTS `tentang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tentang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tentang` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tentang`
--

LOCK TABLES `tentang` WRITE;
/*!40000 ALTER TABLE `tentang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tentang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccess`
--

DROP TABLE IF EXISTS `useraccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccess` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jibasid` varchar(50) NOT NULL,
  `jibasidtype` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '1 Pegawai, 2 Siswa, 3 Calon Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `regdate` datetime NOT NULL,
  `appname` varchar(45) NOT NULL,
  `appver` varchar(10) NOT NULL,
  `compver` varchar(10) NOT NULL,
  `devname` varchar(255) NOT NULL,
  `devaddr` varchar(255) NOT NULL,
  `devid` varchar(20) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `statusdesc` varchar(255) NOT NULL,
  `loggedin` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_useraccess_siswa` (`nis`),
  KEY `FK_useraccess_pegawai` (`nip`),
  KEY `FK_useraccess_calonsiswa` (`nic`),
  KEY `IX_useraccess` (`jibasid`,`devid`,`status`,`loggedin`) USING BTREE,
  CONSTRAINT `FK_useraccess_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_useraccess_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_useraccess_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccess`
--

LOCK TABLES `useraccess` WRITE;
/*!40000 ALTER TABLE `useraccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `useraccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertoken`
--

DROP TABLE IF EXISTS `usertoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertoken` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jibasid` varchar(50) NOT NULL,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `devid` varchar(20) NOT NULL,
  `token` varchar(255) NOT NULL,
  `lastuse` datetime NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `loggedin` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_usertoken_siswa` (`nis`),
  KEY `FK_usertoken_pegawai` (`nip`),
  KEY `FK_usertokencalonsiswa` (`nic`),
  KEY `IX_usertoken` (`nis`,`nip`,`nic`,`devid`,`token`,`jibasid`,`aktif`,`loggedin`) USING BTREE,
  CONSTRAINT `FK_usertoken_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_usertoken_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_usertoken_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertoken`
--

LOCK TABLES `usertoken` WRITE;
/*!40000 ALTER TABLE `usertoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `usertoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-14  1:48:58

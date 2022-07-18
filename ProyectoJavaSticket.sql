-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: centro1
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE SCHEMA IF NOT EXISTS `centro1` DEFAULT CHARACTER SET utf8 ;
USE `centro1` ;

--
-- Table structure for table `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificacion` (
  `Pelicula_idPelicula` int NOT NULL,
  `puntaje` int DEFAULT NULL,
  `persona_idPersona` int NOT NULL,
  KEY `fk_Persona_has_Pelicula_Pelicula1_idx` (`Pelicula_idPelicula`),
  KEY `fk_calificacion_persona1_idx` (`persona_idPersona`),
  CONSTRAINT `fk_calificacion_persona1` FOREIGN KEY (`persona_idPersona`) REFERENCES `persona` (`idPersona`),
  CONSTRAINT `fk_Persona_has_Pelicula_Pelicula1` FOREIGN KEY (`Pelicula_idPelicula`) REFERENCES `pelicula` (`idPelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion`
--

LOCK TABLES `calificacion` WRITE;
/*!40000 ALTER TABLE `calificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion_celebridad`
--

DROP TABLE IF EXISTS `calificacion_celebridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificacion_celebridad` (
  `Celebridad_idCelebridad` int NOT NULL,
  `puntaje` int DEFAULT NULL,
  `persona_idPersona` int NOT NULL,
  KEY `fk_Persona_has_Celebridad_Celebridad1_idx` (`Celebridad_idCelebridad`),
  KEY `fk_calificacion_celebridad_persona1_idx` (`persona_idPersona`),
  CONSTRAINT `fk_calificacion_celebridad_persona1` FOREIGN KEY (`persona_idPersona`) REFERENCES `persona` (`idPersona`),
  CONSTRAINT `fk_Persona_has_Celebridad_Celebridad1` FOREIGN KEY (`Celebridad_idCelebridad`) REFERENCES `celebridad` (`idCelebridad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_celebridad`
--

LOCK TABLES `calificacion_celebridad` WRITE;
/*!40000 ALTER TABLE `calificacion_celebridad` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion_celebridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celebridad`
--

DROP TABLE IF EXISTS `celebridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celebridad` (
  `idCelebridad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL,
  `foto` varchar(500) NOT NULL,
  `calificacion` double NOT NULL,
  PRIMARY KEY (`idCelebridad`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celebridad`
--

LOCK TABLES `celebridad` WRITE;
/*!40000 ALTER TABLE `celebridad` DISABLE KEYS */;
INSERT INTO `celebridad` VALUES (1,'Magaly','Solier','actor','https://res.cloudinary.com/dytz5evzl/image/upload/v1655698931/magalysolier_xgkhxy.jpg',0),(2,'Sam','Rami','director','https://res.cloudinary.com/dytz5evzl/image/upload/v1655698932/sanraimi_qau6wr.jpg',0),(3,'Jonny','Deep','actor','https://res.cloudinary.com/dytz5evzl/image/upload/v1655698937/johnny-depp_pse6pu.jpg',0),(4,'Martin','Scorsese','director','https://res.cloudinary.com/dytz5evzl/image/upload/v1655698935/Martin_Scorsese_izgk4e.jpg',0),(5,'Steven','Spielberg','director','https://res.cloudinary.com/dytz5evzl/image/upload/v1655698939/Steven_Spielberg_hlerma.jpg',0),(6,'Sofia','Coppola','director','https://th.bing.com/th/id/R.b3480685cda9e8cd9e13cccbf3dc4853?rik=jmgthZaEGeSFBQ&pid=ImgRaw&r=0',0),(7,'Tom','Cruise','actor','https://res.cloudinary.com/dytz5evzl/image/upload/v1655698941/Tom_Cruise_csv1wz.jpg',0),(8,'Cara','Delevingne','actor','https://upload.wikimedia.org/wikipedia/commons/2/25/Cara_Delevingne_by_Gage_Skidmore.jpg',0),(9,'Will','Smith','actor','https://www.datoviral.com/wp-content/uploads/2020/08/will-1024x1024.jpg',0),(10,'Robert','Downey','actor','https://th.bing.com/th/id/R.13038a774687f3b1fa63a20c811a8f06?rik=1z4uupwbpXSu%2bw&riu=http%3a%2f%2fcdn2.estamosrodando.com%2fbiografias%2f6%2f16%2frobert-downey-jr.-150689.jpg&ehk=Nrwrjs9s5mv0vZiImIBUROoz1RcoesLiem85xWpQxdw%3d&risl=&pid=ImgRaw&r=0',0),(11,'Jennifer','Lawrence','actor','https://th.bing.com/th/id/R.8202a4d988163353d275e848e608be73?rik=jqzwR%2fyVgN0dRQ&riu=http%3a%2f%2fcdn2.estamosrodando.com%2fbiografias%2f9%2f16%2fjennifer-lawrence-192192.jpg&ehk=KWzfTjo51e9OFfYIlNcXnFhuA4TDeNgx1A0qooCYgTc%3d&risl=&pid=ImgRaw&r=0',0),(12,'Ben','Affleck','director','https://www.soyaire.com/__export/1656361365945/sites/debate/img/2022/06/27/ben-affleck_2.jpg_172596871.jpg',0),(13,'Darren','Aronofsky','director','https://th.bing.com/th/id/OIP.fG_aRTWTVLgd-oHLG7RC3gHaLH?pid=ImgDet&rs=1',0),(14,'Bong','Joon','director','https://upload.wikimedia.org/wikipedia/commons/0/07/Bong_Joon-ho_Deauville_2013.jpg',0),(15,'Song','Kang','actor','https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Song_Gangho_2016.jpg/220px-Song_Gangho_2016.jpg',0),(16,'Lee','Seon','actor','https://i.mydramalist.com/WnVoDf.jpg',0),(17,'Jon','Favreau','director','https://upload.wikimedia.org/wikipedia/commons/0/0b/Jon_Favreau_Deauville_2014.jpg',0),(18,'James','Jones','actor','https://upload.wikimedia.org/wikipedia/commons/f/fc/James_Earl_Jones_%288516667383%29.jpg',0),(19,'Donald','Glover','actor','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Donald_Glover_TIFF_2015.jpg/250px-Donald_Glover_TIFF_2015.jpg',0),(20,'Elizabeth','Olsen','actor','https://upload.wikimedia.org/wikipedia/commons/2/27/Elizabeth_Olsen_by_Gage_Skidmore_2.jpg',0),(21,'Benedict','Cumberbatch','actor','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/BCumberbatch_Comic-Con_2019.jpg/1200px-BCumberbatch_Comic-Con_2019.jpg',0),(22,'Paul','Weitz','director','https://upload.wikimedia.org/wikipedia/commons/7/70/Paul_Weitz_at_2015_Sundance.jpg',0),(23,'Kevin','Hart','actor','https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Kevin_Hart_2014_%28cropped_2%29.jpg/640px-Kevin_Hart_2014_%28cropped_2%29.jpg',0),(24,'Anthony','Carrigan','actor','https://i.pinimg.com/736x/2f/b1/87/2fb187f746d2856574e5d0fdca438fc2--gotham-victor-zsasz-gotham-tv.jpg',0),(25,'Liam','Neeson','actor','https://upload.wikimedia.org/wikipedia/commons/f/fe/Liam_Neeson_Deauville_2012_2.jpg',0),(26,'Ben','Kingsley','actor','https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Sir_Ben_Kingsley_2012.jpg/1200px-Sir_Ben_Kingsley_2012.jpg',0),(27,'Francis','Coppola','director','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Francis_Ford_Coppola_-1976.jpg/1280px-Francis_Ford_Coppola_-1976.jpg',0),(28,'Marlon','Brando','actor','https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Marlon_Brando_publicity_for_One-Eyed_Jacks.png/800px-Marlon_Brando_publicity_for_One-Eyed_Jacks.png',0),(29,'Al','Pacino','actor','https://i.pinimg.com/originals/ec/db/93/ecdb93c3117920783d49e7d92326607c.jpg',0),(30,'Roberto','Benigni','director','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Roberto_Benigni-5274.jpg/800px-Roberto_Benigni-5274.jpg',0),(31,'Nicoletta','Braschi','actor','https://cdn2.estamosrodando.com/biografias/8/1/nicoletta-braschi-262999.jpg',0),(32,'Giorgio','Cantarini','actor','https://i.pinimg.com/originals/cb/06/6a/cb066a7078fe69ee1672a5bcfc5137ab.jpg',0),(33,'Maria','Paz','director','https://images.mubicdn.net/images/cast_member/454318/cache-702538-1628129215/image-w856.jpg?size=800x',0),(34,'Emilia','Ossadon','actor','https://images.mubicdn.net/images/cast_member/496808/cache-520326-1583397119/image-w856.jpg?size=800x',0),(35,'Adam','McKay','director','https://m.media-amazon.com/images/M/MV5BZmQ2ZDNkMGYtOWUzNi00N2Q3LTk1MDItODFlNDJkMTZkMjFmXkEyXkFqcGdeQXVyMjMxNzg4Mjk@._V1_.jpg',0),(36,'Leonardo','DiCaprio','actor','https://upload.wikimedia.org/wikipedia/commons/4/46/Leonardo_Dicaprio_Cannes_2019.jpg',0),(37,'Scarlett','Johansson','actor','https://upload.wikimedia.org/wikipedia/commons/6/60/Scarlett_Johansson_by_Gage_Skidmore_2_%28cropped%29.jpg',0),(38,'Anthony','Russo','director','https://m.media-amazon.com/images/M/MV5BMTc2NjM5MTM0Ml5BMl5BanBnXkFtZTgwMTY3ODczNjM@._V1_.jpg',0),(39,'William','Eubank','director','https://m.media-amazon.com/images/M/MV5BMTg4ODQ5OTM0Ml5BMl5BanBnXkFtZTcwMTMyMzE0NA@@._V1_.jpg',0),(40,'Kristen','Stewart','actor','https://media.vogue.es/photos/5e1589c94ffb7f0008982a64/2:3/w_2560%2Cc_limit/GettyImages-1198145046.jpg',0),(41,'Vincent','Cassel','actor','https://upload.wikimedia.org/wikipedia/commons/a/a3/Vincent_Cassel_Cannes_2018.jpg',0),(42,'Kirk','DeMicco','director','https://upload.wikimedia.org/wikipedia/commons/1/17/Kirk_DeMicco%2C_Golden_Globes_2014_%28crop%29.jpg',0),(43,'Manuel','Miranda','actor','https://los40.com/los40/imagenes/2018/12/14/album/1544792358_093313_1544792529_album_normal.jpg',0),(44,'Gloria','Estefan','actor','https://upload.wikimedia.org/wikipedia/commons/3/36/Gloria_Estefan_in_2017.jpg',0),(45,'Jared','Bush','director','https://mx.web.img3.acsta.net/pictures/21/02/04/06/22/4219703.jpg',0),(46,'Stephanie','Beatriz','actor','https://upload.wikimedia.org/wikipedia/commons/8/80/Actor_Stephanie_Beatriz.jpg',0),(47,'Wilmer','Valderrama','actor','https://upload.wikimedia.org/wikipedia/commons/8/8d/Wilmer_Valderrama_2012.jpg',0),(48,'Michael','Bay','director','https://m.media-amazon.com/images/M/MV5BMTc2NzcyMDU5NV5BMl5BanBnXkFtZTcwODc1OTM0NA@@._V1_.jpg',0),(49,'Mark','Wahlberg','actor','https://upload.wikimedia.org/wikipedia/commons/2/26/Mark_Wahlberg_2021.jpg',0),(50,'Nicola','Peltz','actor','https://m.media-amazon.com/images/M/MV5BNDhlZmM5MDEtNTE2Ni00Yzg3LTg4YjEtNWQwY2Y2NTRlODM2XkEyXkFqcGdeQXVyMTkyNTc4MDE@._V1_.jpg',0),(51,'Jon','Watts','director','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Jon_Watts_by_Gage_Skidmore.jpg/800px-Jon_Watts_by_Gage_Skidmore.jpg',0),(52,'Tom','Holland','actor','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Tom_Holland_by_Gage_Skidmore.jpg/1200px-Tom_Holland_by_Gage_Skidmore.jpg',0),(53,'Michael','Keaton','actor','https://m.media-amazon.com/images/M/MV5BZmNiZmMzN2MtOTNkMy00YjA1LTg4NzktMWI4Njg1NzI3ODAyXkEyXkFqcGdeQXVyNzg5MzIyOA@@._V1_.jpg',0),(54,'Oscar','Catacora','director','https://caretas.pe/wp-content/uploads/2021/11/73818-u5Vz0Br4Vl4Zn7H.jpg',0),(55,'Rosa','Nina','actor','https://elcomercio.pe/resizer/e1mAvcWG1xILfx-Jw1R11gnUAPk=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/GW5HVC6UJ5H6XJYHCLFSJ6HDPY.png',0),(56,'Vicente','Catacora','actor','https://eligecultura.gob.cl/uploads/Wi%C3%B1aypacha.jpg',0),(57,'Reid','carolin','director','https://m.media-amazon.com/images/M/MV5BMTUyNzI2ODQ3Nl5BMl5BanBnXkFtZTcwNDA4OTMwOA@@._V1_.jpg',0),(58,'Channing','Tatum','actor','https://es.web.img3.acsta.net/pictures/16/02/09/10/01/017868.jpg',0),(59,'Jane','Adams','actor','https://m.media-amazon.com/images/M/MV5BMTM1NDg5NzQ3MF5BMl5BanBnXkFtZTcwNTUyMzcyOA@@._V1_.jpg',0),(60,'David','Ayer','director','https://m.media-amazon.com/images/M/MV5BZjBmMTY4M2ItMmEwNC00NTUyLWIyZDEtYWNhNjViNjRiOGVlXkEyXkFqcGdeQXVyMTY2MzU0MjA@._V1_.jpg',0),(61,'Joel','Edgerton','actor','https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Joel_Edgerton_by_Gage_Skidmore.jpg/640px-Joel_Edgerton_by_Gage_Skidmore.jpg',0),(62,'Ricardo','Maldonado','director','https://images.squarespace-cdn.com/content/v1/58ac51ab5016e1b8ebf60b21/1552531155863-G4YM5P2W1FF55HGBUSGA/RICARDOalta.jpg',0),(63,'Carlos','Alcantara','actor','https://upload.wikimedia.org/wikipedia/commons/7/7b/Alfombra_roja_Asu_Mare_3_%283%29_-_Carlos_Alcantara.jpg',0),(64,'Emilia','Drago','actor','https://images.sr.roku.com/idType/roku/context/global/id/12ee7ba052ae510d9e8c8c37ff99e42d/images/gracenote/person/assets/753291_v9_aa.jpg/magic/396x0/filters:quality(70)',0),(65,'Jeffrey','Abrams','director','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/J._J._Abrams_%2823175170706%29_%28cropped%29.jpg/1200px-J._J._Abrams_%2823175170706%29_%28cropped%29.jpg',0),(66,'Adam','Driver','actor','https://media.vogue.mx/photos/611bb6e9cb7984d0cfbfbde3/2:3/w_2560%2Cc_limit/GettyImages-1327321152.jpg',0),(67,'Daisy','Ridley','actor','https://upload.wikimedia.org/wikipedia/commons/6/6e/Daisy_Ridley_by_Gage_Skidmore.jpg',0);
/*!40000 ALTER TABLE `celebridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celebridad_por_pelicula`
--

DROP TABLE IF EXISTS `celebridad_por_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celebridad_por_pelicula` (
  `Celebridad_idCelebridad` int NOT NULL,
  `Pelicula_idPelicula` int NOT NULL,
  KEY `fk_Celebridad_has_Pelicula_Pelicula1_idx` (`Pelicula_idPelicula`),
  KEY `fk_Celebridad_has_Pelicula_Celebridad1_idx` (`Celebridad_idCelebridad`),
  CONSTRAINT `fk_Celebridad_has_Pelicula_Celebridad1` FOREIGN KEY (`Celebridad_idCelebridad`) REFERENCES `celebridad` (`idCelebridad`),
  CONSTRAINT `fk_Celebridad_has_Pelicula_Pelicula1` FOREIGN KEY (`Pelicula_idPelicula`) REFERENCES `pelicula` (`idPelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celebridad_por_pelicula`
--

LOCK TABLES `celebridad_por_pelicula` WRITE;
/*!40000 ALTER TABLE `celebridad_por_pelicula` DISABLE KEYS */;
INSERT INTO `celebridad_por_pelicula` VALUES (10,1),(38,1),(37,1),(21,1),(33,2),(34,2),(1,2),(2,3),(20,3),(21,3),(14,4),(15,4),(16,4),(27,5),(28,5),(29,5),(5,6),(25,6),(26,6),(17,7),(18,7),(19,7),(30,8),(31,8),(32,8),(51,9),(52,9),(53,9),(39,10),(40,10),(41,10),(42,11),(43,11),(44,11),(57,12),(58,12),(59,12),(60,13),(61,13),(9,13),(45,14),(46,14),(47,14),(35,15),(36,15),(11,15),(22,16),(23,16),(24,16),(48,17),(49,17),(50,17),(54,18),(55,18),(56,18),(62,19),(63,19),(64,19),(65,20),(66,20),(67,20);
/*!40000 ALTER TABLE `celebridad_por_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `idCompra` char(7) NOT NULL,
  `montoTotal` double NOT NULL,
  `persona_idPersona` int NOT NULL,
  `fechaCompra` date NOT NULL,
  `cancelado` tinyint NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `fk_compra_persona1_idx` (`persona_idPersona`),
  CONSTRAINT `fk_compra_persona1` FOREIGN KEY (`persona_idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES ('10793DD',271.5,1,'2022-06-08',1),('176164B',321,1,'2022-06-08',1),('19012BB',547.3,2,'2022-06-08',1),('46C3841',542.5,1,'2022-06-08',1),('5C6F3D7',223,2,'2022-06-08',1),('67736B1',120,3,'2022-06-08',1),('A64329B',253.5,1,'2022-06-08',1),('B19CF09',198,3,'2022-06-08',1),('BB59E32',295.5,3,'2022-06-08',1),('C4BD85C',86,2,'2022-06-08',1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcion`
--

DROP TABLE IF EXISTS `funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcion` (
  `idFuncion` int NOT NULL AUTO_INCREMENT,
  `precio` double NOT NULL,
  `stock` int NOT NULL,
  `Pelicula_idPelicula` int NOT NULL,
  `fecha` date NOT NULL,
  `horaInicio` time NOT NULL,
  `habilitado` tinyint NOT NULL,
  PRIMARY KEY (`idFuncion`),
  KEY `fk_Funcion_Pelicula1_idx` (`Pelicula_idPelicula`),
  CONSTRAINT `fk_Funcion_Pelicula1` FOREIGN KEY (`Pelicula_idPelicula`) REFERENCES `pelicula` (`idPelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcion`
--

LOCK TABLES `funcion` WRITE;
/*!40000 ALTER TABLE `funcion` DISABLE KEYS */;
INSERT INTO `funcion` VALUES (1,24.5,100,1,'2022-06-15','20:10:00',1),(2,20,100,2,'2022-06-10','20:10:00',1),(3,21.5,90,3,'2022-06-12','20:10:00',1),(4,22.5,80,4,'2022-06-20','20:10:00',1),(5,25,70,5,'2022-06-28','20:10:00',1),(6,29.6,100,3,'2022-07-12','20:10:00',1),(7,20,75,4,'2022-07-11','20:10:00',1),(8,25,59,5,'2022-07-20','20:10:00',1),(9,21.3,88,3,'2022-07-23','20:10:00',1),(10,24.5,70,2,'2022-07-24','20:10:00',1),(11,24.5,95,1,'2022-08-29','20:10:00',1),(12,32.5,90,5,'2022-07-20','20:10:00',1),(13,22.4,100,6,'2022-07-12','20:10:00',1),(14,15,80,7,'2022-07-11','20:10:00',1),(15,27,70,8,'2022-07-23','20:10:00',1),(16,40,90,9,'2022-10-10','20:10:00',1),(17,51.4,100,10,'2022-09-02','20:10:00',1),(18,39.4,80,11,'2022-09-11','20:10:00',1),(19,43.6,70,12,'2022-11-05','20:10:00',1),(20,29.5,90,13,'2022-12-13','20:10:00',1),(21,42.4,100,14,'2022-09-12','20:10:00',1),(22,39.4,87,15,'2022-08-19','20:10:00',1),(23,17.2,78,16,'2022-08-18','20:10:00',1),(24,35.5,94,17,'2022-09-20','20:10:00',1),(25,32.6,100,18,'2022-10-12','20:10:00',1),(26,30,83,19,'2022-10-23','20:10:00',1),(27,20,75,20,'2022-10-23','20:10:00',1),(28,50.3,60,18,'2022-09-20','10:00:00',1),(29,70.3,65,19,'2022-09-20','13:00:00',1),(30,10.5,70,20,'2022-09-20','14:50:00',1),(31,23.5,55,15,'2022-09-20','17:45:00',1),(32,45.7,55,16,'2022-09-20','08:10:00',1),(33,60,65,12,'2022-09-20','22:30:00',1);
/*!40000 ALTER TABLE `funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcion_has_sala`
--

DROP TABLE IF EXISTS `funcion_has_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcion_has_sala` (
  `Funcion_idFuncion` int NOT NULL,
  `Sala_idSala` int NOT NULL,
  KEY `fk_Funcion_has_Sala_Sala1_idx` (`Sala_idSala`),
  KEY `fk_Funcion_has_Sala_Funcion1_idx` (`Funcion_idFuncion`),
  CONSTRAINT `fk_Funcion_has_Sala_Funcion1` FOREIGN KEY (`Funcion_idFuncion`) REFERENCES `funcion` (`idFuncion`),
  CONSTRAINT `fk_Funcion_has_Sala_Sala1` FOREIGN KEY (`Sala_idSala`) REFERENCES `sala` (`idSala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcion_has_sala`
--

LOCK TABLES `funcion_has_sala` WRITE;
/*!40000 ALTER TABLE `funcion_has_sala` DISABLE KEYS */;
INSERT INTO `funcion_has_sala` VALUES (11,3),(4,4),(1,2),(3,3),(9,6),(2,5),(5,7),(7,8),(6,3),(12,9),(13,2),(14,4),(15,4),(8,3),(10,6),(16,14),(17,11),(18,12),(19,13),(20,3),(21,14),(22,2),(23,4),(24,3),(25,6),(26,7),(27,8),(28,3),(29,3),(30,3),(31,3),(32,3),(33,3);
/*!40000 ALTER TABLE `funcion_has_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `idPelicula` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) NOT NULL,
  `restriccionEdad` varchar(30) NOT NULL,
  `sinopsis` text,
  `duracion` time NOT NULL,
  `foto` varchar(500) NOT NULL,
  `calificacionPelicula` double NOT NULL,
  `genero` varchar(45) NOT NULL,
  `estado` tinyint NOT NULL,
  PRIMARY KEY (`idPelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (1,'Avengers','AA','Nuestros Heroes pelearan la batalla final contra Thanos','02:32:13','https://res.cloudinary.com/dytz5evzl/image/upload/v1655698635/poster-vengadores-endgame-1552567490_axarp3.jpg',0,'Acción',1),(2,'Lina de Lima','+12 (B)','Una mujer viaja desde Perú hasta Chile para trabajar de criada para una familia adinerada. ','02:33:13','https://res.cloudinary.com/dytz5evzl/image/upload/v1655698640/Afiche-oficial-Lina-de-Lima_obfedo.jpg',0,'Drama',1),(3,'Doctor Strange','+15 (B15)','El Dr. Stephen Strange abre un portal al multiverso al utilizar un hechizo prohibido.','02:26:13','https://res.cloudinary.com/dytz5evzl/image/upload/v1655698626/doctor-strange-nuevo-poster_ormmlw.jpg',0,'Aventura',1),(4,'Parasite','+18 (C)','Gi Woo, empieza a impartir clases particulares en la adinerada casa de los Park, las dos familias, que tienen mucho en común ','02:35:13','https://res.cloudinary.com/dytz5evzl/image/upload/v1655698641/91sustfojBL._AC_SL1500__ihloqm.jpg',0,'Thriller',1),(5,'El padrino','D','Don Vito Corleone es el respetado y temido jefe de una de las cinco familias de la mafia de Nueva York en los años 40. ','02:40:13','https://res.cloudinary.com/dytz5evzl/image/upload/v1655698627/el-padrino_50_poster_u2e5rd.jpg',0,'Thriller',1),(6,'La lista de Schindler','+18 (C)','Basada en hechos reales, ambientada en plena Segunda Guerra Mundial,relata la historia de Oskar Schindler','02:23:56','https://www.themoviedb.org/t/p/original/hNFxRqok5ZI7Yb39Mxwd7t0dYiD.jpg',0,'Thriller',1),(7,'El Rey León','AA','Un clásico imprescindible en tu biblioteca Disney.Simba es un cachorro de león y su mayor deseo es ser un valiente rey como su padre.','01:50:00','https://www.ecartelera.com/carteles/12800/12888/003.jpg',0,'Aventura',1),(8,'La vida es bella','+15 (B15)','En un campamento de concetración un padre hara todo lo posible para que su hijo no sufra las desgracias de la epoca','02:43:20','https://www.tuposter.com/pub/media/catalog/product/cache/image/700x560/91bbed04eb86c2a8aaef7fbfb2041b2a/m/o/mocu-217.jpg',0,'Drama',1),(9,'Spider-man: Homecoming','D','Peter Parker vuelve a su vida escolar e intenta retomar su rutina de adolescente normal.','02:10:00','https://www.ecartelera.com/carteles/9900/9968/008.jpg',0,'Fantasía',1),(10,'Underwater ','+18 (C)','Una tripulación queda atrapada en una instalación submarina que se está inundando ','01:37:00','https://markmeets.com/wp-content/uploads/2019/12/Underwater-movie-poster.jpg',0,'Terror',1),(11,'Vivo','AA','Kinkajú, un personaje muy peculiar que se presenta como un oso de la miel.','02:03:20','https://i0.wp.com/hiramnoriega.com/wp-content/uploads/2021/08/4232344324234432.jpg?w=600&ssl=1',0,'Infantil',1),(12,'Dog un viaje salvaje','D','Briggs,un ex Ranger que se aventurará a cruzar el país junto a Lulu una perra del ejército ','01:24:00','https://es.web.img2.acsta.net/pictures/22/03/03/18/15/3886284.jpg',0,'Aventura',1),(13,'Bright','+15 (B15)','Ambientada en un mundo en el que las criaturas fantásticas conviven con los humanosas.','01:59:13','https://es.web.img3.acsta.net/c_310_420/pictures/17/12/11/16/55/1011025.jpg',0,'Acción',1),(14,'Encanto','AA','La película cuenta la historia de una familia,los Madrigal,y viven en una casa mágica ','01:45:56','https://m.media-amazon.com/images/I/71noGMUal1S.AC_SL1100.jpg',0,'Aventura',1),(15,'Dont Look Up','+15 (B15)','Un filme con suficiente sustancia como para invitar a la reflexión,sobre el medioambiente.','02:10:00','https://www.aceprensa.com/wp-content/uploads/elementor/thumbs/cartel-No-mires-arriba-1-ph95l4rvbtvfjnklulw12kxv3e15wy6w0e4vm0gt8g.jpg',0,'Drama',1),(16,'FatherHood','AA',' Un día después del nacimiento de su hija , su mujer muere inesperadamente.','01:23:34','https://es.web.img3.acsta.net/c_310_420/pictures/21/05/11/09/03/5865537.jpg',0,'Comedia',1),(17,'La era de la extinción','+12 (B)','Los Autobots como los Decepticons han desaparecido de la faz de la Tierra.','02:03:20','https://es.web.img3.acsta.net/c_310_420/pictures/14/06/23/11/40/441402.jpg',0,'Acción',1),(18,'Wiñaypacha','+12 (B)','Willka y Phaxsi, una pareja de ancianos de más de 80 años viven abandonados en los Andes.','02:23:28','https://es.web.img2.acsta.net/r_1920_1080/pictures/18/03/15/18/22/5183181.jpg',0,'Drama',1),(19,'¡AsuMare!2','+15 (B15)','Cachin se casa con Emilia y tendra muchas dificultades para adaptarse al nuevo estilo de vida.','01:20:30','https://th.bing.com/th/id/R.3e85b3299328ed9bc581c6cb231a305d?rik=19HMhy%2bpiqPhaA&riu=http%3a%2f%2fcde.3.elcomercio.pe%2fima%2f0%2f1%2f0%2f4%2f9%2f1049417.jpg&ehk=cGgSwIdKAuBZPR0o2qfJVUh0yzxvfogXTOcIEX10Gr0%3d&risl=&pid=ImgRaw&r=0',0,'Comedia',1),(20,'El Ascenso de Skywalker','+12 (B)','La Resistencia se enfrentarán una vez más a la Primera Orden.','02:33:18','https://xl.movieposterdb.com/21_06/2019/2527338/xl_2527338_298a4740.jpg',0,'Ficción',1);
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idPersona` int NOT NULL AUTO_INCREMENT,
  `dni` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `foto` longblob,
  `numeroCelular` int NOT NULL,
  `fechaDeNacimiento` date NOT NULL,
  `email` varchar(128) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `contrasenia` varchar(300) NOT NULL,
  `direccionCliente` text NOT NULL,
  `rol` varchar(45) NOT NULL,
  `codigoPUCP` int DEFAULT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,71383973,'Carlos','Alcantara',_binary 'https://th.bing.com/th/id/R.eb691d29845dfbc97cd4f6545cd51ba8?rik=SntRktYYmk%2f6zA&riu=http%3a%2f%2fwww.cubiertasparacocina.com%2fimages%2fsinfoto.jpg&ehk=yAsKFdHTMSQezgFDs3RZvJU7iN02F9gvSGo5sEY7AgU%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',970149453,'1985-05-12','CarlitosXD@pucp.edu.pe','Calos95','a4e7c6ae4013276deabc1be4f9c65a6dc382f317e0cb81497aba26915cde5b66','Mz. F Lt.3 AA.HH San Martín de Porres','Cliente',NULL),(2,73281233,'Martha','Makwiler',_binary 'https://th.bing.com/th/id/R.eb691d29845dfbc97cd4f6545cd51ba8?rik=SntRktYYmk%2f6zA&riu=http%3a%2f%2fwww.cubiertasparacocina.com%2fimages%2fsinfoto.jpg&ehk=yAsKFdHTMSQezgFDs3RZvJU7iN02F9gvSGo5sEY7AgU%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',942441229,'1980-10-11','MarMak@gmail.com','MarthyLove','7fe39c84669e65b95be6ef25b5f47d8f2e5ed39775f1e46233e3f9de1e8f7ec0','Mz.H Lt.5 Calle 13 Av. Illinois','Cliente',NULL),(3,48482312,'Stephanie','Alfaro',_binary 'https://th.bing.com/th/id/R.eb691d29845dfbc97cd4f6545cd51ba8?rik=SntRktYYmk%2f6zA&riu=http%3a%2f%2fwww.cubiertasparacocina.com%2fimages%2fsinfoto.jpg&ehk=yAsKFdHTMSQezgFDs3RZvJU7iN02F9gvSGo5sEY7AgU%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',947343221,'1995-03-20','steph.alf@pucp.edu.pe','Stephanie','1312a30aa658103b67cdd742d43ead05debd6149f3d1a77e59cb355480ff63df','Calle 31 Mz.3 N° 1342 Piso cuatro La Molina','Cliente',NULL),(4,85275142,'Anthony','Ugaz',_binary 'https://th.bing.com/th/id/R.eb691d29845dfbc97cd4f6545cd51ba8?rik=SntRktYYmk%2f6zA&riu=http%3a%2f%2fwww.cubiertasparacocina.com%2fimages%2fsinfoto.jpg&ehk=yAsKFdHTMSQezgFDs3RZvJU7iN02F9gvSGo5sEY7AgU%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',901325126,'1965-02-04','anjhue_mkd@pucp.edu.pe','Anthony','27ea2d2d1ee6604afcfb19ae191f8e699be1d146c9f54441f97fea2d8f65359f','Av. Universitaria, Av. Cornejo calle 13','Cliente',NULL),(5,36622804,'Maria','Salazar',_binary 'https://th.bing.com/th/id/R.eb691d29845dfbc97cd4f6545cd51ba8?rik=SntRktYYmk%2f6zA&riu=http%3a%2f%2fwww.cubiertasparacocina.com%2fimages%2fsinfoto.jpg&ehk=yAsKFdHTMSQezgFDs3RZvJU7iN02F9gvSGo5sEY7AgU%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',972205310,'1975-11-11','mary_god@gmail.com','Maria','061a94fc44e42a80f6c775d21c3a184168ff27ec04e89c19fa45cb8664a29b4a','Palmeras, ATE, AAHH Santos Mz Y Lt 3','Cliente',NULL),(6,38625735,'Rayan','Cantogrande',_binary 'https://th.bing.com/th/id/R.eb691d29845dfbc97cd4f6545cd51ba8?rik=SntRktYYmk%2f6zA&riu=http%3a%2f%2fwww.cubiertasparacocina.com%2fimages%2fsinfoto.jpg&ehk=yAsKFdHTMSQezgFDs3RZvJU7iN02F9gvSGo5sEY7AgU%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',982986951,'1978-07-24','someLove@gmail.com','Rayan','46cb1d8db568bb978745189f53d365bd8b3d979498682f1ce8ed21929f831be2','Barranco, al lado de la iglesia principal 1133','Cliente',NULL),(7,22038476,'James','Bones',_binary 'https://th.bing.com/th/id/R.eb691d29845dfbc97cd4f6545cd51ba8?rik=SntRktYYmk%2f6zA&riu=http%3a%2f%2fwww.cubiertasparacocina.com%2fimages%2fsinfoto.jpg&ehk=yAsKFdHTMSQezgFDs3RZvJU7iN02F9gvSGo5sEY7AgU%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',949835609,'2000-10-13','JB_rompehuesos@pucp.edu.pe','James665','9488f1557ac77c500066b176e14964b16776c7bf722d4b0747931edb873ea906','MiPerú, parque El Ejercito calle 2 Lt.21','Cliente',NULL),(8,41223316,'Antonio','Vilchez',_binary 'https://th.bing.com/th/id/R.eb691d29845dfbc97cd4f6545cd51ba8?rik=SntRktYYmk%2f6zA&riu=http%3a%2f%2fwww.cubiertasparacocina.com%2fimages%2fsinfoto.jpg&ehk=yAsKFdHTMSQezgFDs3RZvJU7iN02F9gvSGo5sEY7AgU%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',922133240,'1987-10-15','ant.ingMecanico@pucp.edu.pe','Antonio Ing','8b0c0761591f585ed8033f4b515bf9f042a6ffbbdb4c053ed4bc84b4b190943c','Sheraton Piso 4, al lado del parque','Operador',NULL),(9,64553489,'Martha','Martina',_binary 'https://th.bing.com/th/id/R.eb691d29845dfbc97cd4f6545cd51ba8?rik=SntRktYYmk%2f6zA&riu=http%3a%2f%2fwww.cubiertasparacocina.com%2fimages%2fsinfoto.jpg&ehk=yAsKFdHTMSQezgFDs3RZvJU7iN02F9gvSGo5sEY7AgU%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',900102111,'1994-08-24','martha1994@pucp.edu.pe','Marthita','9d85d94a8743bc69a6752f0a65d7a9eb4428688434fb5727803c6741ea54a5be','Chaclacayo cuadra 35, calle 5 Lt. 5','Operador',NULL),(10,799321553,'Melanie','Bernuy',_binary 'https://th.bing.com/th/id/R.eb691d29845dfbc97cd4f6545cd51ba8?rik=SntRktYYmk%2f6zA&riu=http%3a%2f%2fwww.cubiertasparacocina.com%2fimages%2fsinfoto.jpg&ehk=yAsKFdHTMSQezgFDs3RZvJU7iN02F9gvSGo5sEY7AgU%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',956333218,'1992-08-01','mela_traqui@pucp.edu.pe','Mela','4b644b4350ebb053c0ac2639f0d45037d01ff9f1790698718e5d273f7ecc53bf','Chorrillos Parque Martinez Cuadra 3, ultimo piso del 3341','Operador',NULL),(11,43344129,'Willian','Diaz',_binary 'https://th.bing.com/th/id/R.eb691d29845dfbc97cd4f6545cd51ba8?rik=SntRktYYmk%2f6zA&riu=http%3a%2f%2fwww.cubiertasparacocina.com%2fimages%2fsinfoto.jpg&ehk=yAsKFdHTMSQezgFDs3RZvJU7iN02F9gvSGo5sEY7AgU%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',993227485,'1977-11-15','diaz_Ingeniero@pucp.edu.pe','Ingeniero Diaz','2d427983aed35a3418f0786b601a607facb6cb2cbbd8e809d33e95c5fde00587','Miraflores, Parque Kenneddy cuadra 35 Lt. 1992','Administrador',NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `idPersonal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `Sede_idSede` int NOT NULL,
  PRIMARY KEY (`idPersonal`),
  KEY `fk_Personal_Sede1_idx` (`Sede_idSede`),
  CONSTRAINT `fk_Personal_Sede1` FOREIGN KEY (`Sede_idSede`) REFERENCES `sede` (`idSede`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Yujun','Khateryz',1),(2,'Jorge','Palacios',2),(3,'Jossy','Ugaz',3),(4,'Martha','Perez',1),(5,'Sonic','Kayter',2),(6,'Labion','Zuck',3),(7,'Clarck','Messi',1),(8,'Robert','Kiroy',2),(9,'Metz','Castillo',3);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `Sede_idSede` int NOT NULL,
  `aforo` int NOT NULL,
  `idSala` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  PRIMARY KEY (`idSala`),
  KEY `fk_Funcion_has_Sede_Sede1_idx` (`Sede_idSede`),
  CONSTRAINT `fk_Funcion_has_Sede_Sede1` FOREIGN KEY (`Sede_idSede`) REFERENCES `sede` (`idSede`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,110,1,1),(1,110,2,2),(1,110,3,9),(1,110,4,10),(2,130,5,1),(2,130,6,2),(2,130,7,9),(2,130,8,10),(3,150,9,1),(3,150,10,2),(3,150,11,10),(3,150,12,3),(3,150,13,4),(3,150,14,5);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `idSede` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccionSede` text NOT NULL,
  PRIMARY KEY (`idSede`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Chacarilla','Puente de los Perdidos, al lado de la Tía Veneno'),(2,'Lince','Cuadra 3, al frente de la farmacia \"Gladys\"'),(3,'Miraflores','Al frente de Larcomar');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta` (
  `idTarjeta` int NOT NULL AUTO_INCREMENT,
  `numeroTarjeta` char(16) NOT NULL,
  `fechaVencimiento` varchar(5) NOT NULL,
  `CVV` char(3) NOT NULL,
  `banco` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `persona_idPersona` int NOT NULL,
  PRIMARY KEY (`idTarjeta`),
  KEY `fk_tarjeta_persona1_idx` (`persona_idPersona`),
  CONSTRAINT `fk_tarjeta_persona1` FOREIGN KEY (`persona_idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` VALUES (1,'4214650892759699','05/27','369','Banco de la Nación','tarjeta de débito',2),(2,'4551908078323149','04/23','682','BBVA','tarjeta de débito',1),(3,'4557468661337064','11/24','277','BCP','tarjeta de débito',3),(4,'4551277964997524','08/26','425','BBVA','tarjeta de crédito',2),(5,'4214215459701388','10/31','149','Banco de la Nación','tarjeta de crédito',1),(6,'4557528738842121','03/27','596','BCP','tarjeta de crédito',2),(7,'4214713323997009','07/29','799','Banco de la Nación','tarjeta de débito',1),(8,'4551289919741796','12/22','593','BBVA','tarjeta de débito',1),(9,'4557800042467977','09/25','944','BCP','tarjeta de débito',2),(10,'4551592565985549','12/27','646','BBVA','tarjeta de crédito',3),(11,'4214259692207360','04/28','476','Banco de la Nación','tarjeta de crédito',3),(12,'4557256672538003','03/34','412','BCP','tarjeta de crédito',2);
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `Compra_idCompra` char(7) NOT NULL,
  `Funcion_idFuncion` int NOT NULL,
  `qr` longblob NOT NULL,
  `cantidadButaca` int NOT NULL,
  `carrito` tinyint NOT NULL,
  KEY `fk_Ticket_Funcion1_idx` (`Funcion_idFuncion`),
  KEY `fk_Ticket_Compra1` (`Compra_idCompra`),
  CONSTRAINT `fk_Ticket_Compra1` FOREIGN KEY (`Compra_idCompra`) REFERENCES `compra` (`idCompra`),
  CONSTRAINT `fk_Ticket_Funcion1` FOREIGN KEY (`Funcion_idFuncion`) REFERENCES `funcion` (`idFuncion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('46C3841',1,_binary 'xd',10,0),('46C3841',2,_binary 'xd',7,0),('BB59E32',1,_binary 'xd',5,0),('BB59E32',3,_binary 'xd',8,0),('46C3841',5,_binary 'xd',7,0),('19012BB',11,_binary 'xd',7,0),('19012BB',9,_binary 'xd',6,0),('19012BB',5,_binary 'xd',4,0),('19012BB',6,_binary 'xd',5,0),('5C6F3D7',4,_binary 'xd',8,0),('5C6F3D7',3,_binary 'xd',2,0),('10793DD',2,_binary 'xd',5,0),('10793DD',1,_binary 'xd',3,0),('10793DD',10,_binary 'xd',4,0),('176164B',8,_binary 'xd',5,0),('176164B',10,_binary 'xd',8,0),('67736B1',2,_binary 'xd',6,0),('C4BD85C',3,_binary 'xd',4,0),('B19CF09',1,_binary 'xd',4,0),('B19CF09',7,_binary 'xd',5,0),('A64329B',1,_binary 'xd',6,0),('A64329B',9,_binary 'xd',5,0);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-18  8:31:55

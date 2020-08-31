-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: journal
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.10-MariaDB

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

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Ouches : en direct des cuisines de la maison Troisgros','troisgros.jpg','Il y a un an, jour pour jour, la famille Troisgros accueillait ses clients dans son nouveau lieu à Ouches. Michel Troisgros dresse le bilan d’une année « exceptionnelle », alors que s’ouvre celle des 50 ans de 3 étoiles Michelin.\r\nRencontre avec Michel Troisgros qui revient sur cette année riche en émotions et découvrez l’ambiance en cuisine à l’heure du service .'),(2,'Saint-Étienne est la capitale du design','design.jpg','Saint-Étienne est la seule ville française désignée Ville créative pour le design par l\'Unesco. Elle est aussi labellisée French Tech / Design Tech. Saint-Étienne a été la capitale industrielle de l\'Europe au XIXe siècle. Dans notre ville sont nées des inventions qui ont marqué leur époque. Le monde n\'a plus jamais été comme avant après l\'invention de la première ligne de chemin de fer à Saint-Étienne'),(4,'Ligue des Champions','champion-5f4cdff2a5b46.jpeg','Le Paris Saint-Germain s’est incliné face au Bayern Munich (0-1) Dimanche 23 Août à Lisbonne pour la première finale de Ligue des champions de son histoire. Un but de Kingsley Coman, ancien parisien, lui a été fatal.'),(5,'Vacances de rêve sur la côte d\'Azur !','soleil-5f4ce0d733945.jpeg','Envie de partir au soleil tout en restant en France? La région Provence-Alpes-Côte d\'Azur (Var, Vaucluse, Alpes maritimes, Hautes Alpes) est l\'une des zones les plus chaudes et ensoleillées de l\'Hexagone. Le Sud-Est, c\'est bien sûr Saint-Tropez et sa jet-set, Cannes et sa croisette, Antibes et ses remparts, Marseille, son Vieux Port et ses calanques, Monaco et son jardin exotique, Nice et sa Promenade des Anglais, Avignon et son Palais des Papes, Menton et la Riviera...');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'jeannette@leprogres.com','[\"ROLE_ADMIN\"]','$argon2id$v=19$m=65536,t=4,p=1$LmQwMXB0NXd0b1BpbEhBdw$Zq41BRB9lMUdJFBZHGd7zsUw99oQ4ZGo3w/HvVPv7kE'),(2,'bernadette@leprogres.com','[\"ROLE_ADMIN\"]','$argon2id$v=19$m=65536,t=4,p=1$cmE2aTBDTmh0NTl5SHRsYQ$yeakIlsHFTn0rqKv4pNmtY0fMlB3WKMPeaWJUhG3Bk4');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-31 16:22:31

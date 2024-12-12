CREATE DATABASE IF NOT EXISTS `baloncesto` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `baloncesto`;

CREATE TABLE IF NOT EXISTS `entrenamiento` (
    `entrenamientoID` int(11) NOT NULL,
    `tipo` varchar(40) COLLATE utf8_spanish2_ci DEFAULT NULL,
    `ubicacion` varchar(40) DEFAULT NULL,
    `fecha` Date COLLATE utf8_spanish2_ci DEFAULT NULL,
    PRIMARY KEY (`entrenamientoID`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
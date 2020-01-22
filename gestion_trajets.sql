CREATE DATABASE IF NOT EXISTS gestion_trajets;
USE gestion_trajets;

CREATE TABLE IF NOT EXISTS `gare` (
  `ID_gare` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nom_gare` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `tgv` (
  `ID_TGV` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `gare_depart` int(10) NOT NULL REFERENCES gare(ID_GARE),
  `gare_arrivee` int(10) NOT NULL REFERENCES gare(ID_GARE),
  `heure_depart` date NOT NULL,
  `heure_arrivee` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `trajet` (
  `ID_trajet` int(10) NOT NULL,
  `date_depart` date NOT NULL,
  `date_arrivee` date NOT NULL,
  `ID_TGV` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

COMMIT;

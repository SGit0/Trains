CREATE DATABASE IF NOT EXISTS gestion_trains;
USE gestion_trains;

CREATE TABLE IF NOT EXISTS `gare` (
  `ID_gare` int(10) NOT NULL,
  `nom_gare` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `tgv` (
  `ID_TGV` int(10) NOT NULL,
  `gare_depart` int(10) NOT NULL,
  `gare_arrivee` int(10) NOT NULL,
  `heure_depart` date NOT NULL,
  `heure_arrivee` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `trajet` (
  `ID_trajet` int(10) NOT NULL,
  `date_depart` date NOT NULL,
  `date_arrivee` date NOT NULL,
  `ID_TGV` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `gare`
  ADD PRIMARY KEY (`ID_gare`);

ALTER TABLE `tgv`
  ADD PRIMARY KEY (`ID_TGV`),
  ADD KEY `gareariv` (`gare_arrivee`),
  ADD KEY `garedep` (`gare_depart`);

ALTER TABLE `trajet`
  ADD PRIMARY KEY (`ID_trajet`),
  ADD KEY `TGV` (`ID_TGV`);

ALTER TABLE `gare`
  MODIFY `ID_gare` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tgv`
  MODIFY `ID_TGV` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `trajet`
  MODIFY `ID_trajet` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tgv`
  ADD CONSTRAINT `gareariv` FOREIGN KEY (`gare_arrivee`) REFERENCES `gare` (`ID_gare`),
  ADD CONSTRAINT `garedep` FOREIGN KEY (`gare_depart`) REFERENCES `gare` (`ID_gare`);

ALTER TABLE `trajet`
  ADD CONSTRAINT `TGV` FOREIGN KEY (`ID_TGV`) REFERENCES `tgv` (`ID_TGV`);
COMMIT;


// Autorid: Eero Ääremaa ja Oskar Lui Veelma
// Kasutasime: SQL Central 17.0.4.2053, MySQL
// Parandused all

CREATE TABLE `Külastajad` (
	`Id` INT NOT NULL DEFAULT AUTOINCREMENT,
	`Spa_id` INT NOT NULL,
	`Eesnimi` varchar(50) NOT NULL,
	`Perenimi` varchar(50) NOT NULL,
	`Saabumine` DATETIME NOT NULL,
	`Lahkumine` DATETIME NOT NULL,
	`Kuldklent` BIT NOT NULL,
	`Isikukood` varchar(11) NOT NULL,
	`Teenindaja_id` INT NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Kuldkliendid` (
	`Id` INT NOT NULL DEFAULT AUTOINCREMENT,
	`Isikukood` varchar(11) NOT NULL,
	`Liitumise_aeg` DATETIME NOT NULL,
	`Külastused_kokku` INT NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Toad` (
	`Toa_nr` INT NOT NULL DEFAULT AUTOINCREMENT,
	`Toa_tüüp` INT NOT NULL,
	`Yhe_öö_hind` FLOAT NOT NULL,
	PRIMARY KEY (`Toa_nr`)
);

CREATE TABLE `Toa_tüübid` (
	`Toa_tüüp_id` INT NOT NULL DEFAULT AUTOINCREMENT,
	`Nimetus` varchar(50) NOT NULL,
	`Yhekohalised_voodid` INT NOT NULL,
	`Kahekohalised_voodid` INT NOT NULL,
	`Lisavoodi_võimalus` BIT NOT NULL,
	`Spa_id` INT NOT NULL,
	PRIMARY KEY (`Toa_tüüp_id`)
);

CREATE TABLE `Ööbivad_kliendid` (
	`Id` INTEGER NOT NULL,
	`Saabumine` DATETIME NOT NULL,
	`Väljumine` DATETIME NOT NULL,
	`Toa_nr` INT NOT NULL
);

CREATE TABLE `SPAd` (
	`Spa_id` INT NOT NULL DEFAULT AUTOINCREMENT,
	`SPA_nimi` varchar(50) NOT NULL,
	PRIMARY KEY (`Spa_id`)
);

CREATE TABLE `Teenindajad` (
	`Teenindaja_id` INT NOT NULL DEFAULT AUTOINCREMENT,
	`Spa_id` INT NOT NULL,
	`Eesnimi` varchar(50) NOT NULL,
	`Perenimi` varchar(50) NOT NULL,
	PRIMARY KEY (`Teenindaja_id`)
);

CREATE TABLE `Teenused` (
	`Teenus_tüüp_id` INT NOT NULL DEFAULT AUTOINCREMENT,
	`Teenuse_nimi` varchar(50) NOT NULL,
	`Teenuse_hind` FLOAT NOT NULL,
	PRIMARY KEY (`Teenus_tüüp_id`)
);

CREATE TABLE `Külastaja teenused` (
	`Külastaja_id` INT NOT NULL,
	`Teenuse_id` INT NOT NULL
);

ALTER TABLE `Külastajad` ADD CONSTRAINT `Külastajad_fk0` FOREIGN KEY (`Spa_id`) REFERENCES `SPAd`(`Spa_id`);

ALTER TABLE `Külastajad` ADD CONSTRAINT `Külastajad_fk1` FOREIGN KEY (`Teenindaja_id`) REFERENCES `Teenindajad`(`Teenindaja_id`);

// Probleem lahendatud järgmises
ALTER TABLE `Toad` ADD CONSTRAINT `Toad_fk0` FOREIGN KEY (`Toa_tüüp`) REFERENCES `Toa_tüübid`(`Toa_tüüp_id`);

ALTER TABLE `Toa_tüübid` ADD CONSTRAINT `Toa_tüübid_fk0` FOREIGN KEY (`Spa_id`) REFERENCES `SPAd`(`Spa_id`);

// Probeelm lahendtud järgmises
ALTER TABLE `Ööbivad_kliendid` ADD CONSTRAINT `Ööbivad_kliendid_fk0` FOREIGN KEY (`Id`) REFERENCES `Külastajad`(`Id`);

ALTER TABLE `Ööbivad_kliendid` ADD CONSTRAINT `Ööbivad_kliendid_fk1` FOREIGN KEY (`Toa_nr`) REFERENCES `Toad`(`Toa_nr`);

ALTER TABLE `Teenindajad` ADD CONSTRAINT `Teenindajad_fk0` FOREIGN KEY (`Spa_id`) REFERENCES `SPAd`(`Spa_id`);

ALTER TABLE `Külastaja teenused` ADD CONSTRAINT `Külastaja teenused_fk0` FOREIGN KEY (`Külastaja_id`) REFERENCES `Külastajad`(`Id`);

ALTER TABLE `Külastaja teenused` ADD CONSTRAINT `Külastaja teenused_fk1` FOREIGN KEY (`Teenuse_id`) REFERENCES `Teenused`(`Teenus_tüüp_id`);

//ALTER TABLE `Külastajad` DROP FOREIGN KEY `Spa_id`;
//ALTER TABLE `Toa_tüübid` DROP FOREIGN KEY  `Toa_tüübid_fk0`; 
//ALTER TABLE `Toa_tüübid` ADD CONSTRAINT `Toa_tüübid_fk0` PRIMARY KEY (`Spa_id`);

/*                                  PEAMISED PARANDUSED
 * 1. Tegime väiksed parandused objektide tüüpidele, mis diagrammis olid näpuvea tõttu sisse jäänud
 * 2. Muutsime kõik kohad kus olid AUTOINCREMENT hoopis DEFAULT AUTOINCREMENT-iks
 * 3. Tegime korda kaks välisvõtit, mis viitasid valele andmeväljale
 *
 */

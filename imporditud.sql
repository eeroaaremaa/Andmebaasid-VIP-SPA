// Autorid: Eero ��remaa ja Oskar Lui Veelma
// Kasutasime: SQL Central 17.0.4.2053, MySQL
// Parandused all

CREATE TABLE `K�lastajad` (
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
	`K�lastused_kokku` INT NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Toad` (
	`Toa_nr` INT NOT NULL DEFAULT AUTOINCREMENT,
	`Toa_t��p` INT NOT NULL,
	`Yhe_��_hind` FLOAT NOT NULL,
	PRIMARY KEY (`Toa_nr`)
);

CREATE TABLE `Toa_t��bid` (
	`Toa_t��p_id` INT NOT NULL DEFAULT AUTOINCREMENT,
	`Nimetus` varchar(50) NOT NULL,
	`Yhekohalised_voodid` INT NOT NULL,
	`Kahekohalised_voodid` INT NOT NULL,
	`Lisavoodi_v�imalus` BIT NOT NULL,
	`Spa_id` INT NOT NULL,
	PRIMARY KEY (`Toa_t��p_id`)
);

CREATE TABLE `��bivad_kliendid` (
	`Id` INTEGER NOT NULL,
	`Saabumine` DATETIME NOT NULL,
	`V�ljumine` DATETIME NOT NULL,
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
	`Teenus_t��p_id` INT NOT NULL DEFAULT AUTOINCREMENT,
	`Teenuse_nimi` varchar(50) NOT NULL,
	`Teenuse_hind` FLOAT NOT NULL,
	PRIMARY KEY (`Teenus_t��p_id`)
);

CREATE TABLE `K�lastaja teenused` (
	`K�lastaja_id` INT NOT NULL,
	`Teenuse_id` INT NOT NULL
);

ALTER TABLE `K�lastajad` ADD CONSTRAINT `K�lastajad_fk0` FOREIGN KEY (`Spa_id`) REFERENCES `SPAd`(`Spa_id`);

ALTER TABLE `K�lastajad` ADD CONSTRAINT `K�lastajad_fk1` FOREIGN KEY (`Teenindaja_id`) REFERENCES `Teenindajad`(`Teenindaja_id`);

// Probleem lahendatud j�rgmises
ALTER TABLE `Toad` ADD CONSTRAINT `Toad_fk0` FOREIGN KEY (`Toa_t��p`) REFERENCES `Toa_t��bid`(`Toa_t��p_id`);

ALTER TABLE `Toa_t��bid` ADD CONSTRAINT `Toa_t��bid_fk0` FOREIGN KEY (`Spa_id`) REFERENCES `SPAd`(`Spa_id`);

// Probeelm lahendtud j�rgmises
ALTER TABLE `��bivad_kliendid` ADD CONSTRAINT `��bivad_kliendid_fk0` FOREIGN KEY (`Id`) REFERENCES `K�lastajad`(`Id`);

ALTER TABLE `��bivad_kliendid` ADD CONSTRAINT `��bivad_kliendid_fk1` FOREIGN KEY (`Toa_nr`) REFERENCES `Toad`(`Toa_nr`);

ALTER TABLE `Teenindajad` ADD CONSTRAINT `Teenindajad_fk0` FOREIGN KEY (`Spa_id`) REFERENCES `SPAd`(`Spa_id`);

ALTER TABLE `K�lastaja teenused` ADD CONSTRAINT `K�lastaja teenused_fk0` FOREIGN KEY (`K�lastaja_id`) REFERENCES `K�lastajad`(`Id`);

ALTER TABLE `K�lastaja teenused` ADD CONSTRAINT `K�lastaja teenused_fk1` FOREIGN KEY (`Teenuse_id`) REFERENCES `Teenused`(`Teenus_t��p_id`);

//ALTER TABLE `K�lastajad` DROP FOREIGN KEY `Spa_id`;
//ALTER TABLE `Toa_t��bid` DROP FOREIGN KEY  `Toa_t��bid_fk0`; 
//ALTER TABLE `Toa_t��bid` ADD CONSTRAINT `Toa_t��bid_fk0` PRIMARY KEY (`Spa_id`);

/*                                  PEAMISED PARANDUSED
 * 1. Tegime v�iksed parandused objektide t��pidele, mis diagrammis olid n�puvea t�ttu sisse j��nud
 * 2. Muutsime k�ik kohad kus olid AUTOINCREMENT hoopis DEFAULT AUTOINCREMENT-iks
 * 3. Tegime korda kaks v�lisv�tit, mis viitasid valele andmev�ljale
 *
 */

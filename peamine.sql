// VIP SPA projekt 
// Autorid: Eero ��remaa ja Oskar Lui Veelma

//DROP TABLE SPAd;
//DROP TABLE K�lastajad;
//DROp table Teenindajad;
//drop table ��bivad_kliendid;
//drop table Toad;

// Esmalt loeme SPA-de tabeli
CREATE TABLE SPAd (
    Spa_id int NOT NULL,
    SPA_nimi varchar(50) NOT NULL,
    PRIMARY KEY (Spa_id)
);

// Lisame tabelisse �he SPA
INSERT INTO SPAd
VALUES (1, 'SQL SPA'); 


// Loome k�lastajate tabeli
CREATE TABLE K�lastajad (
    Id int NOT NULL,
    Spa_id int NOT NULL,
    Eesnimi varchar(50),
    Perenimi varchar(50),
    Saabumine datetime,
    Lahkumine datetime,
    Kuldklient BIT,
    Isikukood varchar(11),
    Teenindaja_id integer,
    PRIMARY KEY (Id)
);

// Loome Teenindajate tabeli
CREATE TABLE Teenindajad (
    Teenindaja_id integer NOT NULL,
    Spa_id integer NOT NULL,
    Eesnimi varchar(50),
    Perenimi varchar(50),
    PRIMARY KEY (Teenindaja_id)
);

// Loome ��bivate klientide tabeli
CREATE TABLE ��bivad_kliendid(
    ID varchar(50) NOT NULL,
    Saabumine datetime,
    V�ljumine datetime,
    Toa_nr int,
    PRIMARY KEY (ID)
);

// Loome tubade kohta tabeli
CREATE TABLE Toad (
    Toa_nr integer NOT NULL,
    Toa_t��p integer,
    Yhe_��_hind float,
    PRIMARY KEY (Toa_nr)
);

//CREATE TABLE Toa_t��bid(
//    Toa_t��p_id integer NOT NULL AUTOINCREMENT)
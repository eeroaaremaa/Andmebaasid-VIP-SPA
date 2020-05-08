// VIP SPA projekt 
// Autorid: Eero Ääremaa ja Oskar Lui Veelma

//DROP TABLE SPAd;
//DROP TABLE Külastajad;
//DROp table Teenindajad;
//drop table Ööbivad_kliendid;
//drop table Toad;

// Esmalt loeme SPA-de tabeli
CREATE TABLE SPAd (
    Spa_id int NOT NULL,
    SPA_nimi varchar(50) NOT NULL,
    PRIMARY KEY (Spa_id)
);

// Lisame tabelisse ühe SPA
INSERT INTO SPAd
VALUES (1, 'SQL SPA'); 


// Loome külastajate tabeli
CREATE TABLE Külastajad (
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

// Loome ööbivate klientide tabeli
CREATE TABLE Ööbivad_kliendid(
    ID varchar(50) NOT NULL,
    Saabumine datetime,
    Väljumine datetime,
    Toa_nr int,
    PRIMARY KEY (ID)
);

// Loome tubade kohta tabeli
CREATE TABLE Toad (
    Toa_nr integer NOT NULL,
    Toa_tüüp integer,
    Yhe_öö_hind float,
    PRIMARY KEY (Toa_nr)
);

//CREATE TABLE Toa_tüübid(
//    Toa_tüüp_id integer NOT NULL AUTOINCREMENT)
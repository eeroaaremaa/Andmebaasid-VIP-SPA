// Andmete lisamine

INSERT INTO SPAd
VALUES(1, 'VIP SPA');

// Lisame toa t��bid
// Toa ID, Nimetus, �hekohalised voodid, kahekohalised voodid, lisavoodi v�imalus (BIT), SPA ID

INSERT INTO Toa_t��bid
VALUES(1, '�hene tuba ilma lisavoodita', 1, 0, 0, 1);

INSERT INTO Toa_t��bid
VALUES(2, '�hene tuba lisavoodi v�imalusega', 1, 0, 1, 1);

INSERT INTO Toa_t��bid
VALUES(3, 'Kahene tuba ilma lisavoodita', 0, 1, 0, 1);

INSERT INTO Toa_t��bid
VALUES(4, 'Kahene tuba lisavoodi v�imalusega', 0, 1, 1, 1);

INSERT INTO Toa_t��bid
VALUES(5, 'VIP tuba kahele', 0, 1, 0, 1);

// Lisame toad
// Toa number, Toa t��p, �he �� hind

// �hekohalised toad lisavoodita
INSERT INTO Toad
VALUES(10, 1, 25.99);

INSERT INTO Toad
VALUES(11, 1, 25.99);

INSERT INTO Toad
VALUES(12, 1, 25.99);

INSERT INTO Toad
VALUES(13, 1, 27.99);

INSERT INTO Toad
VALUES(14, 1, 26.99);

INSERT INTO Toad
VALUES(15, 1, 30.00);

// �hekohalised toad lisavoodiga
INSERT INTO Toad
VALUES(20, 2, 30.99);

INSERT INTO Toad
VALUES(21, 2, 33);

INSERT INTO Toad
VALUES(22, 2, 30.99);

INSERT INTO Toad
VALUES(23, 2, 35.99);

// Kahekohalised toad lisavoodita
INSERT INTO Toad
VALUES(30, 3, 65);

INSERT INTO Toad
VALUES(31, 3, 63);

INSERT INTO Toad
VALUES(32, 3, 72);

INSERT INTO Toad
VALUES(33, 3, 69);

// Kahekohalised toad lisavoodi v�imalusega

INSERT INTO Toad
VALUES(40, 4, 82);

INSERT INTO Toad
VALUES(41, 4, 86);

INSERT INTO Toad
VALUES(42, 4, 92);

INSERT INTO Toad
VALUES(43, 4, 83);

INSERT INTO Toad
VALUES(44, 4, 97);

// VIP toad

INSERT INTO Toad
VALUES(50, 5, 240);

INSERT INTO Toad
VALUES(51, 5, 290);


// Loome teenindajad
// Teenindaja ID, SPA ID, Eesnimi, Perenimi

INSERT INTO Teenindajad
VALUES (1, 1, 'Triin', 'Kadak');

INSERT INTO Teenindajad
VALUES (2, 1, 'Karl', 'Kask');

INSERT INTO Teenindajad
VALUES (3, 1, 'Siim', 'Tamm');

INSERT INTO Teenindajad
VALUES (4, 1, 'Kaur', 'M�nd');

INSERT INTO Teenindajad
VALUES (5, 1, 'Raul', 'Kuusk');


// Loome k�lastajad


// Loome kuldkliendid

INSERT INTO Kuldkliendid
VALUES (1, '38907192465', '2019-12-14 12:42:51', 32);

INSERT INTO Kuldkliendid
VALUES (2, '38604142374', '2019-02-16 17:26:23', 22);

// Loome k�lastajad
// ID, SPA ID, Eesnimi, perenimi, saabumine, lahkumine, kuldklient, isikukood, teenidaja id

INSERT INTO K�lastajad 
VALUES (1, 1, 'Elon', 'Must', '2020-05-09 19:55:23', '2020-05-10 10:00:00', 1, '38907192465', 1);

INSERT INTO K�lastajad 
VALUES (1, 1, 'Mark', 'Kuubis', '2020-05-09 14:24:53', '2020-05-10 10:00:00', 2, '50103230534', 0);

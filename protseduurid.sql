// Protseduurid 
// Autorid: Eero ��remaa ja Oskar Lui Veelma
// Kasutasime: SQL Central 17.0.4.2053, MySQL

// Protseduur et arvutada kokku �he kliendi poolt teenuste kogusumma, mida ta SPAs kulutas
// Selle jaoks leiame k�ik teenused ja nende hinnad ning leiame selle summa

CREATE PROCEDURE KliendiPooltKulutatudSummaSPAs @KliendiID int
AS
BEGIN 
SELECT SUM(Teenused.Teenuse_hind) as SUMMAKOKKU 
FROM Teenused , "K�lastaja teenused" 
WHERE "K�lastaja teenused".Teenuse_id=Teenused.Teenus_t��p_id AND K�lastaja_id = @KliendiID
END
GO;

EXEC KliendiPooltKulutatudSummaSPAs @KliendiID = 1;


// Milliseid tube �ks teenindaja teenindab ning n�itame, kas tegemist on kuldkliendiga
// Selle jaoks leiame millised kliendid on ��bivad kliendid ning kes neid kliente teenindavad

CREATE PROCEDURE TeenindajaToad @TeenindajaID int
AS 
BEGIN 
SELECT DISTINCT ��bivad_kliendid.Toa_nr, K�lastajad.Kuldklent
FROM Teenindajad, K�lastajad, ��bivad_kliendid 
WHERE 
    ��bivad_kliendid.Id = K�lastajad.Id
    AND
    K�lastajad.Teenindaja_id = @TeenindajaID
END 
GO;

EXEC TeenindajaToad @TeenindajaID = 3;


// Valime k�ik toad, mis on h�ivatud ja n�itame kliendi nime, isikukoodi, kuldkliendi staatuse, teenindaja nime ja millal tuba vabaneb
// Selle jaoks leiame k�ik ��bivad kliendid ning leiame neile vastava teenindaja ning kuvame info tabelisse

CREATE PROCEDURE Tubade�levaade
AS
BEGIN
SELECT DISTINCT K�lastajad.Eesnimi, K�lastajad.Perenimi, 
K�lastajad.Isikukood, K�lastajad.Kuldklent, 
��bivad_kliendid.Toa_nr, Teenindajad.Eesnimi, Teenindajad.Perenimi, ��bivad_kliendid.V�ljumine
FROM Teenindajad, K�lastajad, ��bivad_kliendid 
WHERE 
    ��bivad_kliendid.Id = K�lastajad.Id
AND
    K�lastajad.Teenindaja_id = Teenindajad.Teenindaja_id
END 
GO;

EXEC Tubade�levaade;


// Protseduur kuldklientide leidmiseks, kes on enda k�mnende k�lastuse juures
// Kui kuldkliendi k�lastused jaguvad k�mnega siis n�itame kuldkliendi k�lastuste summat, vastasel juhul ei n�ita midagi

CREATE PROCEDURE KuldklientideKampaania @KuldkliendiID integer AS
BEGIN 
SELECT K�lastused_kokku
FROM Kuldkliendid
WHERE K�lastused_kokku % 10 = 0 
AND id = @KuldkliendiID;
END
GO;

EXEC KuldklientideKampaania @KuldkliendiID = 3;


// Protseduur tubade reklaamimiseks ning �he SPA k�ikide erinevate tubade n�itamiseks
// Seda kasutada siis, kui klient helistab ja tahab teada millised toad majas on
// Lisaks sellele saab seda kasutada siis kui SPAd reklaamida, kui on soovi k�ikidest erinevatest tubadest �levaade anda

CREATE PROCEDURE K�ikToad @SPA_ID int AS
BEGIN 
SELECT DISTINCT Toad.Toa_nr AS 'Toa number', ROUND(Toad.Yhe_��_hind, 2) AS '�he �� hind eurodes', Toa_t��bid.Nimetus , 
Toa_t��bid.Yhekohalised_voodid AS '�hekohaliste voodite arv',
Toa_t��bid.Kahekohalised_voodid AS 'Kahekohaliste voodite arv', Toa_t��bid.Lisavoodi_v�imalus AS 'Lisavoodi v�imalus'
FROM Toad, Toa_t��bid
WHERE Toa_t��bid.Spa_id = @SPA_ID
AND Toa_t��bid.Toa_t��p_id = Toad.Toa_t��p
END
GO;

EXEC K�ikToad @SPA_ID = 1;

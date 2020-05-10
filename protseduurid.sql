// Protseduurid 
// Autorid: Eero Ääremaa ja Oskar Lui Veelma
// Kasutasime: SQL Central 17.0.4.2053, MySQL

// Protseduur et arvutada kokku ühe kliendi poolt teenuste kogusumma, mida ta SPAs kulutas
// Selle jaoks leiame kõik teenused ja nende hinnad ning leiame selle summa

CREATE PROCEDURE KliendiPooltKulutatudSummaSPAs @KliendiID int
AS
BEGIN 
SELECT SUM(Teenused.Teenuse_hind) as SUMMAKOKKU 
FROM Teenused , "Külastaja teenused" 
WHERE "Külastaja teenused".Teenuse_id=Teenused.Teenus_tüüp_id AND Külastaja_id = @KliendiID
END
GO;

EXEC KliendiPooltKulutatudSummaSPAs @KliendiID = 1;


// Milliseid tube üks teenindaja teenindab ning näitame, kas tegemist on kuldkliendiga
// Selle jaoks leiame millised kliendid on ööbivad kliendid ning kes neid kliente teenindavad

CREATE PROCEDURE TeenindajaToad @TeenindajaID int
AS 
BEGIN 
SELECT DISTINCT Ööbivad_kliendid.Toa_nr, Külastajad.Kuldklent
FROM Teenindajad, Külastajad, Ööbivad_kliendid 
WHERE 
    Ööbivad_kliendid.Id = Külastajad.Id
    AND
    Külastajad.Teenindaja_id = @TeenindajaID
END 
GO;

EXEC TeenindajaToad @TeenindajaID = 3;


// Valime kõik toad, mis on hõivatud ja näitame kliendi nime, isikukoodi, kuldkliendi staatuse, teenindaja nime ja millal tuba vabaneb
// Selle jaoks leiame kõik ööbivad kliendid ning leiame neile vastava teenindaja ning kuvame info tabelisse

CREATE PROCEDURE TubadeÜlevaade
AS
BEGIN
SELECT DISTINCT Külastajad.Eesnimi, Külastajad.Perenimi, 
Külastajad.Isikukood, Külastajad.Kuldklent, 
Ööbivad_kliendid.Toa_nr, Teenindajad.Eesnimi, Teenindajad.Perenimi, Ööbivad_kliendid.Väljumine
FROM Teenindajad, Külastajad, Ööbivad_kliendid 
WHERE 
    Ööbivad_kliendid.Id = Külastajad.Id
AND
    Külastajad.Teenindaja_id = Teenindajad.Teenindaja_id
END 
GO;

EXEC TubadeÜlevaade;


// Protseduur kuldklientide leidmiseks, kes on enda kümnende külastuse juures
// Kui kuldkliendi külastused jaguvad kümnega siis näitame kuldkliendi külastuste summat, vastasel juhul ei näita midagi

CREATE PROCEDURE KuldklientideKampaania @KuldkliendiID integer AS
BEGIN 
SELECT Külastused_kokku
FROM Kuldkliendid
WHERE Külastused_kokku % 10 = 0 
AND id = @KuldkliendiID;
END
GO;

EXEC KuldklientideKampaania @KuldkliendiID = 3;


// Protseduur tubade reklaamimiseks ning ühe SPA kõikide erinevate tubade näitamiseks
// Seda kasutada siis, kui klient helistab ja tahab teada millised toad majas on
// Lisaks sellele saab seda kasutada siis kui SPAd reklaamida, kui on soovi kõikidest erinevatest tubadest ülevaade anda

CREATE PROCEDURE KõikToad @SPA_ID int AS
BEGIN 
SELECT DISTINCT Toad.Toa_nr AS 'Toa number', ROUND(Toad.Yhe_öö_hind, 2) AS 'Ühe öö hind eurodes', Toa_tüübid.Nimetus , 
Toa_tüübid.Yhekohalised_voodid AS 'Ühekohaliste voodite arv',
Toa_tüübid.Kahekohalised_voodid AS 'Kahekohaliste voodite arv', Toa_tüübid.Lisavoodi_võimalus AS 'Lisavoodi võimalus'
FROM Toad, Toa_tüübid
WHERE Toa_tüübid.Spa_id = @SPA_ID
AND Toa_tüübid.Toa_tüüp_id = Toad.Toa_tüüp
END
GO;

EXEC KõikToad @SPA_ID = 1;

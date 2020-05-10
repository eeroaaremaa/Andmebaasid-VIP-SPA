

// Protseduur et arvutada kokku ühe kliendi poolt teenuste kogusumma, mida ta SPAs kulutas
//DROP PROCEDURE KliendiPooltKulutatudSummaSPAs;

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
DROP PROCEDURE TeenindajaToad;

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
DROP PROCEDURE TubadeÜlevaade;


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

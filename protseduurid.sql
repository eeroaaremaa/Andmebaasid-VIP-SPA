

// Protseduur et arvutada kokku �he kliendi poolt teenuste kogusumma, mida ta SPAs kulutas
//DROP PROCEDURE KliendiPooltKulutatudSummaSPAs;

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
DROP PROCEDURE TeenindajaToad;

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
DROP PROCEDURE Tubade�levaade;


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



// Protseduur et arvutada kokku �he kliendi poolt teenuste kogusumma, mida ta SPAs kulutas

DROP PROCEDURE KliendiPooltKulutatudSummaSPAs;

CREATE PROCEDURE KliendiPooltKulutatudSummaSPAs @KliendiID int
AS
BEGIN 
SELECT SUM(Teenused.Teenuse_hind) as SUMMAKOKKU 
FROM Teenused , "K�lastaja teenused" 
WHERE "K�lastaja teenused".Teenuse_id=Teenused.Teenus_t��p_id AND K�lastaja_id = @KliendiID
END

GO;

EXEC KliendiPooltKulutatudSummaSPAs @KliendiID = 4;

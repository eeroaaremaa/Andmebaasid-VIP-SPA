

// Protseduur et arvutada kokku ühe kliendi poolt teenuste kogusumma, mida ta SPAs kulutas

DROP PROCEDURE KliendiPooltKulutatudSummaSPAs;

CREATE PROCEDURE KliendiPooltKulutatudSummaSPAs @KliendiID int
AS
BEGIN 
SELECT SUM(Teenused.Teenuse_hind) as SUMMAKOKKU 
FROM Teenused , "Külastaja teenused" 
WHERE "Külastaja teenused".Teenuse_id=Teenused.Teenus_tüüp_id AND Külastaja_id = @KliendiID
END

GO;

EXEC KliendiPooltKulutatudSummaSPAs @KliendiID = 4;

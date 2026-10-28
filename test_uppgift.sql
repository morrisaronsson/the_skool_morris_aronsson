--SELECT * FROM SYSTEM.YH2025
--FETCH FIRST 20 ROWS ONLY;

-- Listing the Columns with the right names

SELECT
    COLUMN1 AS utbildningsområde,
    COLUMN3 AS inriktning_namn,
    COLUMN4 AS utbildningsnamn,
    COLUMN5 AS beslut,
    COLUMN7 AS flera_kommuner,
    COLUMN8 AS antal_kommuner,
    COLUMN9 AS "län",
    COLUMN10 AS kommun,
    COLUMN11 AS YH_poäng,
    COLUMN12 AS studieform,
    COLUMN13 AS studietakt,
    COLUMN14 AS examenstyp,
    COLUMN16 AS smalt_yrkesområde,
    COLUMN17 AS utbildningsanordnare,
    COLUMN19 AS sökta_utbildningsomgångar,
    COLUMN20 AS beviljade_utbildningsomgångar,
    COLUMN21 AS sökta_platser_per_utbildningsomgång,
    COLUMN22 AS sökta_platser_totalt,
    COLUMN28 AS total_beviljade_platser
FROM SYSTEM.YH2025
FETCH FIRST 10 ROWS ONLY;


-- Selecting specific data

SELECT
    COLUMN1 AS utbildningsområde,
    COLUMN22 AS sökta_platser
FROM SYSTEM.YH2025
FETCH FIRST 40 ROWS ONLY;









EXIT

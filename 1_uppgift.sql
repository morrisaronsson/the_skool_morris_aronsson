SET PAGESIZE 100

-- 1a)
-- Im using REGEXP_LIKE to remove any letters, since the formatting of the table has put in text which is messing up the counting. 

SELECT
    COLUMN1 AS utbildningsområde,
    SUM(TO_NUMBER(COLUMN22)) AS antal_sökta_platser
FROM SYSTEM.YH2025
WHERE REGEXP_LIKE(TRIM(COLUMN22), '^[0-9]+$')
GROUP BY COLUMN1
ORDER BY antal_sökta_platser DESC;

-- 1b)

SELECT
    COLUMN1 AS utbildningsområde,
    COUNT(COLUMN5) AS antal_beviljade
FROM SYSTEM.YH2025
WHERE COLUMN5 = 'Beviljad'
GROUP BY COLUMN1
ORDER BY antal_beviljade DESC;

-- 1c)

SELECT
    COLUMN1 AS utbildningsområde,
    COUNT(COLUMN5) AS antal_avslagna
FROM SYSTEM.YH2025
WHERE COLUMN5 = 'Avslag'
GROUP BY COLUMN1
ORDER BY antal_avslagna DESC;

-- 1d)

SELECT 
    COLUMN4 AS utbildningsnamn,
    COUNT(COLUMN5) AS antal_beviljade
FROM SYSTEM.YH2025
WHERE COLUMN5 = 'Beviljad' AND COLUMN1 = 'Data/IT'
GROUP BY COLUMN4
ORDER BY antal_beviljade DESC;

-- 1e)

SELECT
    COLUMN4 AS utbildningsnamn,
    COUNT(COLUMN5) AS antal_avslagna
FROM SYSTEM.YH2025
WHERE COLUMN5 = 'Avslag' AND COLUMN1 = 'Data/IT'
GROUP BY COLUMN4
ORDER BY antal_avslagna DESC;

-- 1f)
    
SELECT
    COLUMN4 AS utbildningsnamn,
    COLUMN17 AS utbildningsanordnare_administrativ_enhet,
    COUNT(COLUMN5) AS antal_beviljade
FROM SYSTEM.YH2025
WHERE COLUMN5 = 'Beviljad' AND COLUMN1 = 'Data/IT'
GROUP BY COLUMN4, COLUMN17
ORDER BY antal_beviljade DESC;

-- 1g)

SELECT
    COLUMN9 AS Län,
    COUNT(COLUMN5) AS antal_beviljade
FROM SYSTEM.YH2025
WHERE COLUMN5 = 'Beviljad'
GROUP BY COLUMN9
ORDER BY antal_beviljade DESC
OFFSET 1 ROWS
FETCH FIRST 5 ROWS ONLY;

-- 1h)

SELECT
    COLUMN1 AS utbildningsområde,
    COUNT(CASE WHEN COLUMN12 = 'Bunden' THEN 1 END) AS bunden_studieform,
    COUNT(CASE WHEN COLUMN12 = 'Distans' THEN 1 END) AS distans_studieform
FROM SYSTEM.YH2025
GROUP BY COLUMN1
ORDER BY bunden_studieform DESC;

-- 1i)

SELECT
    COUNT(DISTINCT COLUMN4) AS antal_ai_utbildningar -- Counts unique names once with DISTINCT. Using UPPER converts the names to uppercase before searching, so it counts variations like ai, AI, Ai atc. 
FROM SYSTEM.YH2025
WHERE UPPER(COLUMN4) LIKE '%AI%';





EXIT    

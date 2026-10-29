SET PAGESIZE 100

-- Fråga 1: Finns det några kurser med smalt yrkesområde som blivit beviljade och i så fall vilka? Och vilka utbildningsområden är det?

SELECT 
    COLUMN1 AS utbildningsområde,
    COLUMN4 AS utbildningsnamn,
    COLUMN16 AS smalt_yrkesområde,
    COUNT(COLUMN5) AS antal_beviljade
FROM SYSTEM.YH2025
WHERE COLUMN5 = 'Beviljad' AND COLUMN16 = 'Ja'
GROUP BY COLUMN1, COLUMN4, COLUMN16;

-- Fråga 2: Mellan kommunalt och privat, vilken Huvudmannatyp blir oftas beviljad bidrag?

SELECT
    COLUMN18 AS huvudmannatyp,
    COUNT(COLUMN5) AS antal_beviljade
FROM SYSTEM.YH2025
WHERE COLUMN5 = 'Beviljad'
GROUP BY COLUMN18, COLUMN5
ORDER BY antal_beviljade DESC;

-- Fråga 3: Vilka områden är svårast eller enklast att ta sig in i?
-- 3.1 Lista alla områden efter antal bevlijade och avslagna.

SELECT
    COLUMN1 AS utbildningsområden,
    COUNT(CASE WHEN COLUMN5 = 'Beviljad' THEN 1 END) AS beviljade,
    COUNT(CASE WHEN COLUMN5 = 'Avslag' THEN 1 END) AS avslagna
FROM SYSTEM.YH2025
GROUP BY COLUMN1
ORDER BY beviljade DESC;

--3.2 Räkna ut oddsen för att komma in genom att använda AVG. Räknar beviljade som 1 och avlsagna som 0 och då bli genomsnittet beviljandegraden. Eftersom 0 också räknas, om vi tar x 100 så får vi fram procentsatsen. 

SELECT
    COLUMN1 AS utbildningsområde,
    AVG(CASE 
    WHEN COLUMN5 = 'Beviljad' THEN 1 
    WHEN COLUMN5 = 'Avslag' THEN 0
    END) * 100 AS beviljandechans
FROM SYSTEM.YH2025
GROUP BY COLUMN1
ORDER BY beviljandechans DESC;

-- Fråga 4: Vad blir mest beviljat mellan distans eller bunden studieform?
-- Använder samma princip som i förra frågan, räknar beviljade mot avslagna och gångar med 100 för att få ut procentsatsen. 

SELECT
    COLUMN12 AS studieform,
    AVG(CASE
    WHEN COLUMN5 = 'Beviljad' THEN 1
    WHEN COLUMN5 = 'Avslag' THEN 0
    END) * 100 AS beviljandechans
FROM SYSTEM.YH2025
GROUP BY COLUMN12
ORDER BY beviljandechans DESC;


-- Fråga 5: Var finns det mest konkurans i form av geografisk plats? Var kan det finnas behov?

SELECT 
    COLUMN10 AS kommun,
    COUNT(COLUMN5) AS antal_beviljade_utbildningar
FROM SYSTEM.YH2025
WHERE COLUMN5 = 'Beviljad'
GROUP BY COLUMN10 
ORDER BY antal_beviljade_utbildningar ASC
FETCH FIRST 10 ROWS ONLY;





EXIT

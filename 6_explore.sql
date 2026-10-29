SET PAGESIZE 100

-- 1a)
-- No REGEXP_LIKE needed anymore, since the columns are now fixed to be only number columns.

SELECT
    uo.utbildningsomrade_name AS utbildningsområde,
    SUM(a.sökta_platser_totalt) AS antal_sökta_platser
FROM ansokan a
JOIN sun5_inriktning s ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade uo ON s.utbildningsomrade_id = uo.utbildningsomrade_id
GROUP BY uo.utbildningsomrade_name
ORDER BY antal_sökta_platser DESC;

-- 1b)

SELECT
    uo.utbildningsomrade_name AS utbildningsområde,
    COUNT(a.beslut) AS antal_beviljade
FROM ansokan a
JOIN sun5_inriktning s ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade uo ON s.utbildningsomrade_id = uo.utbildningsomrade_id
WHERE a.beslut = 'Beviljad'
GROUP BY uo.utbildningsomrade_name
ORDER BY antal_beviljade DESC;

-- 1c)

SELECT
    uo.utbildningsomrade_name AS utbildningsområde,
    COUNT(a.beslut) AS antal_avslagna
FROM ansokan a
JOIN sun5_inriktning s ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade uo ON s.utbildningsomrade_id = uo.utbildningsomrade_id
WHERE a.beslut = 'Avslag'
GROUP BY uo.utbildningsomrade_name
ORDER BY antal_avslagna DESC;

-- 1d)

SELECT
    a.utbildningsnamn AS utbildningsnamn,
    COUNT(a.beslut) AS antal_beviljade
FROM ansokan a
JOIN sun5_inriktning s ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade uo ON s.utbildningsomrade_id = uo.utbildningsomrade_id
WHERE a.beslut = 'Beviljad' AND uo.utbildningsomrade_name = 'Data/IT'
GROUP BY a.utbildningsnamn
ORDER BY antal_beviljade DESC;

-- 1e)

SELECT
    a.utbildningsnamn AS utbildningsnamn,
    COUNT(a.beslut) AS antal_avslagna
FROM ansokan a
JOIN sun5_inriktning s ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade uo ON s.utbildningsomrade_id = uo.utbildningsomrade_id
WHERE a.beslut = 'Avslag' AND uo.utbildningsomrade_name = 'Data/IT'
GROUP BY a.utbildningsnamn
ORDER BY antal_avslagna DESC;

-- 1f)

SELECT
    a.utbildningsnamn AS utbildningsnamn,
    ua.name AS utbildningsanordnare_administrativ_enhet,
    COUNT(a.beslut) AS antal_beviljade
FROM ansokan a
JOIN sun5_inriktning s ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade uo ON s.utbildningsomrade_id = uo.utbildningsomrade_id
JOIN utbildningsanordnare ua ON a.anordnare_id = ua.anordnare_id
WHERE a.beslut = 'Beviljad' AND uo.utbildningsomrade_name = 'Data/IT'
GROUP BY a.utbildningsnamn, ua.name
ORDER BY antal_beviljade DESC;

-- 1g)

SELECT
    l.lan_name AS Län,
    COUNT(a.beslut) AS antal_beviljade
FROM ansokan a
JOIN ansokan_kommun ak ON a.diarienummer = ak.diarienummer
JOIN kommun k ON ak.kommun_id = k.kommun_id
JOIN lan l ON k.lan_id = l.lan_id
WHERE a.beslut = 'Beviljad'
GROUP BY l.lan_name
ORDER BY antal_beviljade DESC
FETCH FIRST 5 ROWS ONLY;

-- 1h)

SELECT
    uo.utbildningsomrade_name AS utbildningsområde,
    COUNT(CASE WHEN a.studieform = 'Bunden' THEN 1 END) AS bunden_studieform,
    COUNT(CASE WHEN a.studieform = 'Distans' THEN 1 END) AS distans_studieform
FROM ansokan a
JOIN sun5_inriktning s ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade uo ON s.utbildningsomrade_id = uo.utbildningsomrade_id
GROUP BY uo.utbildningsomrade_name
ORDER BY bunden_studieform DESC;

-- 1i)

SELECT
    COUNT(DISTINCT utbildningsnamn) AS antal_ai_utbildningar 
FROM ansokan
WHERE UPPER(utbildningsnamn) LIKE '%AI%';

EXIT

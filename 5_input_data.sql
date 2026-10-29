-- Insert data for the first 20 rows of the spreadsheet
-- Order matters: parent tables first, then child tables.
-- Identity columns are generated automatically, so child rows look up IDs by name/code.

-- utbildningsomrade
INSERT INTO utbildningsomrade (utbildningsomrade_name) VALUES ('Data/IT');

-- lan (rows with 'Flera kommuner' skipped)
INSERT INTO lan (lan_name) VALUES ('Stockholm');
INSERT INTO lan (lan_name) VALUES ('Västra Götaland');
INSERT INTO lan (lan_name) VALUES ('Skåne');
INSERT INTO lan (lan_name) VALUES ('Gävleborg');
INSERT INTO lan (lan_name) VALUES ('Halland');

-- kommun
INSERT INTO kommun (kommun_name, lan_id) VALUES ('Stockholm', (SELECT lan_id FROM lan WHERE lan_name = 'Stockholm'));
INSERT INTO kommun (kommun_name, lan_id) VALUES ('Göteborg', (SELECT lan_id FROM lan WHERE lan_name = 'Västra Götaland'));
INSERT INTO kommun (kommun_name, lan_id) VALUES ('Malmö', (SELECT lan_id FROM lan WHERE lan_name = 'Skåne'));
INSERT INTO kommun (kommun_name, lan_id) VALUES ('Solna', (SELECT lan_id FROM lan WHERE lan_name = 'Stockholm'));
INSERT INTO kommun (kommun_name, lan_id) VALUES ('Gävle', (SELECT lan_id FROM lan WHERE lan_name = 'Gävleborg'));
INSERT INTO kommun (kommun_name, lan_id) VALUES ('Varberg', (SELECT lan_id FROM lan WHERE lan_name = 'Halland'));

-- seqf
INSERT INTO seqf (examenstyp) VALUES ('Yrkeshögskoleexamen');

-- utbildningsanordnare
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('Forsbergs Skola', 'Privat');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('Göteborgs Stad, Yrgo', 'Kommun');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('Futuregames Malmö ', 'Privat');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('Futuregames Stockholm', 'Privat');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('Nackademin Aktiebolag', 'Privat');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('KYH AB Göteborg', 'Privat');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('KYH AB Stockholm', 'Privat');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('IT-Högskolan Stockholm AB', 'Privat');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('IT-Högskolan Sverige AB', 'Privat');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('Plushögskolan AB - Teknikhögskolan', 'Privat');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('Campus Varberg/Varbergs kommun', 'Kommun');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('IHM Business School AB Stockholm', 'Privat');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('Handelsakademin i Göteborg AB', 'Privat');
INSERT INTO utbildningsanordnare (name, huvudmannatyp) VALUES ('Hyper Island Program AB - Stockholm', 'Privat');

-- sun5_inriktning
INSERT INTO sun5_inriktning (sun5_kod, utbildningsomrade_id, sun5_namn) VALUES ('481ab', (SELECT utbildningsomrade_id FROM utbildningsomrade WHERE utbildningsomrade_name = 'Data/IT'), 'Utbildningar till programmerare, spel');
INSERT INTO sun5_inriktning (sun5_kod, utbildningsomrade_id, sun5_namn) VALUES ('481ac', (SELECT utbildningsomrade_id FROM utbildningsomrade WHERE utbildningsomrade_name = 'Data/IT'), 'Utbildningar inom systemhantering och programmering');

-- ansokan
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/4192', '481ab', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'Forsbergs Skola'), 'Forsbergs, Spelutvecklare – Game Programming', 'Avslag', 550, 'Bunden', 100, 'Nej', 3, 0, 84, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3719', '481ab', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'Göteborgs Stad, Yrgo'), 'Game Developer', 'Beviljad', 430, 'Bunden', 100, 'Nej', 3, 3, 75, 75);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3428', '481ab', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'Futuregames Malmö '), 'Game Programmer', 'Beviljad', 400, 'Bunden', 100, 'Nej', 3, 3, 90, 90);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/2978', '481ab', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'Futuregames Stockholm'), 'Game Programmer Specialization', 'Beviljad', 550, 'Bunden', 100, 'Nej', 3, 3, 105, 105);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3348', '481ab', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'Futuregames Stockholm'), 'Performance Engineer', 'Avslag', 200, 'Distans', 100, 'Nej', 3, 0, 90, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3568', '481ab', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'Nackademin Aktiebolag'), 'Spelutvecklare', 'Beviljad', 500, 'Bunden', 100, 'Nej', 3, 3, 105, 105);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3369', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'KYH AB Göteborg'), '.NET Developer', 'Avslag', 400, 'Bunden', 100, 'Nej', 3, 0, 105, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3690', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'KYH AB Stockholm'), '.NET Developer ', 'Avslag', 430, 'Bunden', 100, 'Nej', 3, 0, 105, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/4099', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'IT-Högskolan Stockholm AB'), '.NET-Cloud developer', 'Avslag', 400, 'Bunden', 100, 'Nej', 3, 0, 105, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3917', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'IT-Högskolan Sverige AB'), '.NET-utvecklare', 'Avslag', 400, 'Bunden', 100, 'Nej', 3, 0, 105, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/4039', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'IT-Högskolan Stockholm AB'), '.NET-utvecklare', 'Avslag', 400, 'Bunden', 100, 'Nej', 3, 0, 105, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/4120', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'IT-Högskolan Sverige AB'), '.NET-utvecklare', 'Avslag', 400, 'Distans', 100, 'Nej', 3, 0, 105, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3596', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'Nackademin Aktiebolag'), '.NET-utvecklare', 'Beviljad', 400, 'Bunden', 100, 'Nej', 3, 2, 105, 70);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/4141', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'Plushögskolan AB - Teknikhögskolan'), '.NET-utvecklare ', 'Avslag', 400, 'Bunden', 100, 'Nej', 3, 0, 105, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3903', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'Campus Varberg/Varbergs kommun'), 'AI-utvecklare med fokus på maskininlärning', 'Beviljad', 400, 'Bunden', 100, 'Nej', 3, 2, 60, 40);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3176', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'IHM Business School AB Stockholm'), 'Applied AI developer', 'Avslag', 415, 'Bunden', 100, 'Nej', 3, 0, 105, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3165', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'Handelsakademin i Göteborg AB'), 'Backend Developer inriktning Cloud', 'Avslag', 400, 'Bunden', 100, 'Nej', 3, 0, 105, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3784', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'IT-Högskolan Sverige AB'), 'DevOps-utvecklare', 'Avslag', 400, 'Bunden', 100, 'Nej', 3, 0, 105, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/4123', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'IT-Högskolan Sverige AB'), 'DevOps-utvecklare', 'Avslag', 400, 'Bunden', 100, 'Nej', 3, 0, 105, 0);
INSERT INTO ansokan (diarienummer, sun5_kod, seqf_kod, anordnare_id, utbildningsnamn, beslut, yh_poang, studieform, studietakt_procent, smalt_yrkesomrade, sökta_utbildningsomgångar, beviljade_utbildningsomgångar, sökta_platser_totalt, beviljade_platser_totalt)
VALUES ('MYH 2025/3309', '481ac', (SELECT seqf_kod FROM seqf WHERE examenstyp = 'Yrkeshögskoleexamen'), (SELECT anordnare_id FROM utbildningsanordnare WHERE name = 'Hyper Island Program AB - Stockholm'), 'Fullstack Developer ', 'Avslag', 450, 'Distans', 100, 'Nej', 3, 0, 105, 0);

-- ansokan_kommun (only applications with a single municipality)
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/4192', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Stockholm'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/3719', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Göteborg'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/3428', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Malmö'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/2978', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Stockholm'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/3568', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Solna'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/3369', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Göteborg'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/3690', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Stockholm'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/4099', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Stockholm'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/3917', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Malmö'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/4039', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Stockholm'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/4120', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Göteborg'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/3596', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Solna'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/4141', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Gävle'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/3903', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Varberg'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/3176', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Stockholm'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/3165', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Malmö'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/3784', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Malmö'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/4123', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Göteborg'));
INSERT INTO ansokan_kommun (diarienummer, kommun_id) VALUES ('MYH 2025/3309', (SELECT kommun_id FROM kommun WHERE kommun_name = 'Stockholm'));

COMMIT;

EXIT

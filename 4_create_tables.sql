CREATE TABLE utbildningsomrade (
    utbildningsomrade_id    NUMBER(10)      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    utbildningsomrade_name  VARCHAR2(100)   NOT NULL
);


CREATE TABLE sun5_inriktning (
    sun5_kod    NUMBER(10)   GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    utbildningsomrade_id    NUMBER(10)  NOT NULL,
    sun5_namn   VARCHAR(50) NOT NULL,
    CONSTRAINT sun5_utbildningsomrade FOREIGN KEY (utbildningsomrade_id)
        REFERENCES utbildningsomrade(utbildningsomrade_id)
);


CREATE TABLE seqf (
    seqf_kod    NUMBER(10)  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    examenstyp  VARCHAR(50) NOT NULL
);


CREATE TABLE utbildningsanordnare (
    anordnare_id    NUMBER(10)  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name    VARCHAR(50) NOT NULL,
    huvudmannatyp   VARCHAR(50) NOT NULL
);


CREATE TABLE ansokan (
    diarienummer    NUMBER(10)       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sun5_kod    NUMBER(10)  NOT NULL,
    seqf_kod    NUMBER(10)  NOT NULL,
    anordnare_id    NUMBER(10)  NOT NULL,
    utbildningsnamn VARCHAR(100) NOT NULL,
    beslut  VARCHAR(10) NOT NULL,
    yh_poäng    NUMBER(10)  NOT NULL,
    studieform  VARCHAR(50) NOT NULL, 
    studietakt_procent  NUMBER(10)  NOT NULL,
    smalt_yrkesomrade   VARCHAR(50) NOT NULL,
    sökta_utbildningsomgångar   NUMBER(10)  NOT NULL,
    beviljade_utbildningsomgångar   NUMBER(10)  NOT NULL, 
    sökta_platser_totalt    NUMBER(10)  NOT NULL,
    beviljade_platser_totalt    NUMBER(10)  NOT NULL,
    CONSTRAINT sun5_ansokan FOREIGN KEY (sun5_kod) REFERENCES sun5_inriktning(sun5_kod),
    CONSTRAINT seqf_ansokan FOREIGN KEY (seqf_kod) REFERENCES seqf(seqf_kod),
    CONSTRAINT anordnare_ansokan FOREIGN KEY (anordnare_id) REFERENCES utbildningsanordnare(anordnare_id)
);


CREATE TABLE lan (
    lan_id  NUMBER(10)  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    lan_name    VARCHAR(50) NOT NULL
);


CREATE TABLE kommun (
    kommun_id   NUMBER(10)  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    kommun_name VARCHAR(100)    NOT NULL, 
    lan_id  NUMBER(10) NOT NULL,
    CONSTRAINT lan_kommun FOREIGN KEY (lan_id)
        REFERENCES lan(lan_id)
);


CREATE TABLE ansokan_kommun (
    ansokan_kommun_id   NUMBER(10)  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    diarienummer    NUMBER(10) NOT NULL,
    kommun_id   NUMBER(10)  NOT NULL,
    CONSTRAINT ansokan_diarienummer FOREIGN KEY (diarienummer)
        REFERENCES ansokan(diarienummer),
    CONSTRAINT ansokan_kommun_kommun FOREIGN KEY (kommun_id)
        REFERENCES kommun(kommun_id)

);







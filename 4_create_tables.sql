CREATE TABLE utbildningsomrade (
    utbildningsomrade_id    NUMBER(10)      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    utbildningsomrade_name  VARCHAR2(100 CHAR)   NOT NULL
);

CREATE TABLE sun5_inriktning (
    sun5_kod                VARCHAR2(10 CHAR)    PRIMARY KEY,
    utbildningsomrade_id    NUMBER(10)           NOT NULL,
    sun5_namn               VARCHAR2(100 CHAR)   NOT NULL,
    CONSTRAINT sun5_utbildningsomrade FOREIGN KEY (utbildningsomrade_id)
        REFERENCES utbildningsomrade(utbildningsomrade_id)
);

CREATE TABLE seqf (
    seqf_kod    NUMBER(10)          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    examenstyp  VARCHAR2(50 CHAR)   NOT NULL
);

CREATE TABLE utbildningsanordnare (
    anordnare_id    NUMBER(10)           GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name            VARCHAR2(100 CHAR)   NOT NULL,
    huvudmannatyp   VARCHAR2(50 CHAR)    NOT NULL
);

CREATE TABLE ansokan (
    diarienummer                    VARCHAR2(20 CHAR)    PRIMARY KEY,
    sun5_kod                        VARCHAR2(10 CHAR)    NOT NULL,
    seqf_kod                        NUMBER(10)           NOT NULL,
    anordnare_id                    NUMBER(10)           NOT NULL,
    utbildningsnamn                 VARCHAR2(150 CHAR)   NOT NULL,
    beslut                          VARCHAR2(20 CHAR)    NOT NULL,
    yh_poang                        NUMBER(10)           NOT NULL,
    studieform                      VARCHAR2(50 CHAR)    NOT NULL,
    studietakt_procent              NUMBER(10)           NOT NULL,
    smalt_yrkesomrade               VARCHAR2(50 CHAR)    NOT NULL,
    sökta_utbildningsomgångar       NUMBER(10)           NOT NULL,
    beviljade_utbildningsomgångar   NUMBER(10)           NOT NULL,
    sökta_platser_totalt            NUMBER(10)           NOT NULL,
    beviljade_platser_totalt        NUMBER(10)           NOT NULL,
    CONSTRAINT sun5_ansokan      FOREIGN KEY (sun5_kod)     REFERENCES sun5_inriktning(sun5_kod),
    CONSTRAINT seqf_ansokan      FOREIGN KEY (seqf_kod)     REFERENCES seqf(seqf_kod),
    CONSTRAINT anordnare_ansokan FOREIGN KEY (anordnare_id) REFERENCES utbildningsanordnare(anordnare_id)
);

CREATE TABLE lan (
    lan_id      NUMBER(10)          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    lan_name    VARCHAR2(50 CHAR)   NOT NULL
);

CREATE TABLE kommun (
    kommun_id    NUMBER(10)           GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    kommun_name  VARCHAR2(100 CHAR)   NOT NULL,
    lan_id       NUMBER(10)           NOT NULL,
    CONSTRAINT lan_kommun FOREIGN KEY (lan_id)
        REFERENCES lan(lan_id)
);

CREATE TABLE ansokan_kommun (
    ansokan_kommun_id   NUMBER(10)           GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    diarienummer        VARCHAR2(20 CHAR)    NOT NULL,
    kommun_id           NUMBER(10)           NOT NULL,
    CONSTRAINT ansokan_diarienummer FOREIGN KEY (diarienummer)
        REFERENCES ansokan(diarienummer),
    CONSTRAINT ansokan_kommun_kommun FOREIGN KEY (kommun_id)
        REFERENCES kommun(kommun_id)
);

EXIT

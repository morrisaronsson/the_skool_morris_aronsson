-- Loading the table

SET LOADFORMAT XLSX

LOAD TABLE yhtabell 'resultat-ansokningsomgang-2025.xlsx' NEW

COMMIT;

EXIT


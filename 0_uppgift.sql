-- Loading the table

SET LOADFORMAT XLSX

LOAD TABLE  yh2025 'resultat-ansokningsomgang-2025.xlsx' NEW

COMMIT;

EXIT


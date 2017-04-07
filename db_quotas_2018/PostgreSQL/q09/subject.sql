CREATE TABLE q09.subject
(
	id_subject int NOT NULL,
	subject varchar(50) NULL,
	subject_order varchar(50) NULL,
	id_subject_osm int NULL,
	responsible varchar(30) NULL,
	timestamp_ timestamp NULL,
	sorting int NOT NULL DEFAULT 99999999,
    CONSTRAINT PK_subject PRIMARY KEY
    (
        id_subject
    )
);
CREATE TABLE q09.region
(
	id_region int NOT NULL,
	region varchar(255) NULL,
	note varchar(250) NULL,
	responsible varchar(30) NULL,
	timestamp_ timestamp NULL,
	region_order varchar(150) NULL,
	id_region_osm int NULL,
	sorting int NOT NULL DEFAULT 99999999,
    CONSTRAINT PK_region PRIMARY KEY
    (
        id_region
    )
);
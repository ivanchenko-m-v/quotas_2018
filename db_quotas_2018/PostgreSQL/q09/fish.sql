CREATE TABLE q09.fish(
	id_fish int NOT NULL,
	fish varchar(45) NULL,
	note varchar(250) NULL,
	responsible varchar(30) NULL,
	timestamp_ timestamp NULL,
	id_fish_osm int NULL,
	fish_order varchar(45) NULL,
	sorting int NOT NULL DEFAULT 9999999,
    CONSTRAINT PK_fish PRIMARY KEY
    (
        id_fish 
    )
);
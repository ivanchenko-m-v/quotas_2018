CREATE TABLE q09.z__limits_catch_conversion_catch
(
	id int NOT NULL,
	year_from int NULL,
	year_to int NULL,
	id_declarant int NULL,
	id_regime int NULL,
	id_basin int NULL,
	id_subject int NULL,
	id_fish_from int NULL,
	id_region_from int NULL,
	declarant_from varchar(100) NULL,
	fish_from varchar(50) NULL,
	region_from varchar(50) NULL,
	id_declarant_to int NULL,
	id_regime_to int NULL,
	id_subject_to int NULL,
	id_fish_to int NULL,
	id_region_to int NULL,
	declarant_to varchar(100) NULL,
	regime_to varchar(100) NULL,
	fish_to varchar(60) NULL,
	region_to varchar(60) NULL,
	subject_to varchar(60) NULL,
	note varchar(250) NULL,
	responsible varchar(30) NULL,
	timestamp_ timestamp NULL,
    CONSTRAINT PK_z__limits_catch_conversion_catch PRIMARY KEY
    (
        id
    )
);
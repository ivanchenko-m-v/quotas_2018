CREATE TABLE q09.limits(
	id_limit int NOT NULL,
	id_declarant int NOT NULL,
	id_basin int NOT NULL,
	date_ date NOT NULL,
	id_regime int NOT NULL,
	id_region int NOT NULL,
	id_fish int NOT NULL,
	id_subject int NOT NULL,
	id_unit int NOT NULL,
	catch_volume decimal(38, 17) NULL,
	document varchar(50) NOT NULL,
	document_date date NOT NULL,
	document_change varchar(50) NULL,
	document_change_date date NULL,
	person varchar(50) NULL,
	note varchar(255) NULL,
	responsible varchar(30) NULL,
	timestamp_ timestamp NULL,
    CONSTRAINT PK_limits PRIMARY KEY
    (
        id_limit 
    )
);
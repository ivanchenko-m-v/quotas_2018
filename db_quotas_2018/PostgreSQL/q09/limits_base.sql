CREATE TABLE q09.limits_base
(
	id_basin int NOT NULL,
	date_ date NOT NULL,
	id_region int NOT NULL,
	id_fish int NOT NULL,
	id_unit int NOT NULL,
	catch_volume decimal(38, 17) NULL,
	document varchar(50) NOT NULL,
	document_date date NOT NULL,
	person varchar(50) NULL,
	responsible varchar(30) NULL,
	timestamp_ timestamp NULL,
    CONSTRAINT PK_limits_base PRIMARY KEY  
    (
        id_basin,
        date_,
        id_region,
        id_fish,
        id_unit,
        document,
        document_date 
    )
);
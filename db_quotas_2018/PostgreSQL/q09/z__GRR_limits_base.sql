CREATE TABLE q09.z__GRR_limits_base
(
	id_change int NOT NULL,
	timestamp_change timestamp NULL,
	id_pos int NULL,
	sub_number int NOT NULL,
	document varchar(50) NOT NULL,
	document_date date NOT NULL,
	dyear int NOT NULL,
	id_basin int NOT NULL,
	fish varchar(45) NULL,
	id_fish int NOT NULL,
	region varchar(255) NULL,
	id_region int NOT NULL,
	unit varchar(15) NULL,
	id_unit int NOT NULL,
	catch_volume decimal(38, 17) NULL,
	person varchar(50) NULL,
	responsible varchar(30) NULL,
	timestamp_ timestamp NULL,
    CONSTRAINT PK_z__GRR_limits_base PRIMARY KEY
    (
        sub_number
    )
);
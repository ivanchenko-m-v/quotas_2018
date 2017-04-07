CREATE TABLE q09.z__GRR_limits
(
	id_change int NOT NULL,
	timestamp_change timestamp NULL,
	id int NOT NULL,
	id_pos int NULL,
	sub_number int NOT NULL,
	government_agency varchar(150) NOT NULL,
	government_agency_inn varchar(20) NOT NULL,
	government_agency_address varchar(250) NOT NULL,
	document varchar(50) NOT NULL,
	document_date date NOT NULL,
	document_number varchar(50) NOT NULL,
	basin varchar(30) NULL,
	id_basin int NOT NULL,
	subject varchar(40) NULL,
	id_subject int NOT NULL,
	declarant varchar(250) NULL,
	declarant_inn varchar(20) NULL,
	id_declarant int NOT NULL,
	regime varchar(55) NULL,
	id_regime int NOT NULL,
	fish varchar(45) NULL,
	id_fish int NOT NULL,
	region varchar(255) NULL,
	id_region int NOT NULL,
	dyear int NOT NULL,
	unit varchar(15) NULL,
	id_unit int NOT NULL,
	catch_volume decimal(38, 17) NULL,
	note varchar(255) NULL,
	person varchar(50) NULL,
	responsible varchar(30) NULL,
	timestamp_ timestamp NULL,
	note_update varchar(255) NULL,
    CONSTRAINT PK_z__GRR_limits PRIMARY KEY
    (
        sub_number
    )
);
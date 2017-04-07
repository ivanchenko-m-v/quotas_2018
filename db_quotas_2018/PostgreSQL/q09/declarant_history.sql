CREATE TABLE q09.declarant_history(
	id_declarant_history int NOT NULL,
	id_declarant int NOT NULL,
	date_registration date NULL,
	declarant varchar(250) NULL,
	work_number varchar(20) NULL,
	declarant_type varchar(20) NULL,
	address varchar(150) NULL,
	postal_address varchar(200) NULL,
	director varchar(80) NULL,
	phone varchar(40) NULL,
	fax varchar(20) NULL,
	telex varchar(20) NULL,
	e_mail varchar(50) NULL,
	declarant_full varchar(150) NULL,
	inn varchar(20) NULL,
	kpp varchar(9) NULL,
	reg_number varchar(50) NULL,
	OKPO varchar(50) NULL,
	OKATO varchar(5) NULL,
	OKVED varchar(10) NULL,
	KOPF varchar(2) NULL,
	KFS varchar(2) NULL,
	date_expiration date NULL,
	id_own int NULL,
	own varchar(250) NULL,
	note varchar(255) NULL,
	responsible varchar(30) NULL,
	juridical boolean NULL,
	timestamp_ timestamp NULL,
	del_comment varchar(255) NULL,
	id_declarant_history_was int NULL,
	sign int NULL,
    CONSTRAINT PK_declarant_history PRIMARY KEY  
    (
        id_declarant_history 
    )
);

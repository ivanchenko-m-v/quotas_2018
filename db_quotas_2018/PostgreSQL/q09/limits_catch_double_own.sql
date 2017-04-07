CREATE TABLE q09.limits_catch_double_own(
	id_own int NOT NULL,
	id_declarant1 int NOT NULL,
	id_declarant2 int NOT NULL,
	transfer_year int NULL,
	declarant1 varchar(255) NULL,
	declarant2 varchar(255) NULL,
	note varchar(250) NULL,
	timestamp_ timestamp NULL,
    CONSTRAINT PK_limits_catch_double_own PRIMARY KEY
    (
        id_own,
        id_declarant1
    )
);
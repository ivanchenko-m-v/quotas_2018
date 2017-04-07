CREATE TABLE q09.subject_okato
(
	subject_okato_code varchar(5) NOT NULL,
	subject_name varchar(125) NULL,
	id_basin varchar(10) NULL,
    CONSTRAINT PK_subject_okato PRIMARY KEY
    (
        subject_okato_code
    )
);
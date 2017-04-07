CREATE TABLE q09.report(
	id_report int NOT NULL,
	report varchar(250) NULL,
	creation_date timestamp NULL,
    CONSTRAINT PK_report PRIMARY KEY 
    (
        id_report
    )
);
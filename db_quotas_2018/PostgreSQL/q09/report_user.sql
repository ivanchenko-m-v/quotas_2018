CREATE TABLE q09.report_user
(
	id_report int NOT NULL,
	report varchar(250) NULL,
	creation_date timestamp NULL,
    CONSTRAINT PK_report_user PRIMARY KEY 
    (
        id_report
    )
);
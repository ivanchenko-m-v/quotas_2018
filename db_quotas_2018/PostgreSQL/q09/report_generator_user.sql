CREATE TABLE q09.report_generator_user
(
	id_report int NOT NULL,
	trbkzag int NOT NULL,
	elname varchar(150) NULL,
	elname_order varchar(150) NULL,
	code_ int NULL,
	order_ int NOT NULL,
    CONSTRAINT PK_report_generator_user PRIMARY KEY 
    (
        id_report,
        trbkzag,
        order_
    )
);
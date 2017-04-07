CREATE TABLE q09.distribution_tac(
	id_distribution_tac int NOT NULL,
	distribution_tac varchar(150) NULL,
	creation_date date NULL,
    CONSTRAINT PK_distribution_tac PRIMARY KEY
    (
        id_distribution_tac 
    )
);
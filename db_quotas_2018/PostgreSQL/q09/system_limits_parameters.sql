CREATE TABLE q09.system_limits_parameters
(
	id_parameter int NOT NULL,
	parameter varchar(150) NULL,
	parameter_int_value int NULL,
	parameter_char_value varchar(50) NULL,
    CONSTRAINT PK_system_limits_parameters PRIMARY KEY
    (
        id_parameter
    )
);
CREATE TABLE q09.limits_base_distribution(
	id_distribution_tac int NOT NULL,
	object varchar(50) NULL,
	limits_percent decimal(38, 17) NULL,
	id_regime int NULL,
	id_subject int NULL,
	id_basin int NULL,
	regime_subject int NULL,
    CONSTRAINT PK_limits_base_distribution PRIMARY KEY
    (
        id_distribution_tac 
    )
);
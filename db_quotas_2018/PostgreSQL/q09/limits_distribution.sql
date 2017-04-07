CREATE TABLE q09.limits_distribution
(
	id_distribution_lim int NOT NULL,
	id_declarant int NOT NULL,
	id_basin int NOT NULL,
	date_ date NOT NULL,
	id_regime int NOT NULL,
	id_region int NOT NULL,
	id_fish int NOT NULL,
	id_subject int NOT NULL,
	id_unit int NOT NULL,
	catch_volume decimal(38, 17) NULL,
	responsible varchar(30) NULL,
	timestamp_ timestamp NULL,
    CONSTRAINT PK_limits_distribution PRIMARY KEY 
    (
        id_distribution_lim,
        id_declarant,
        id_basin,
        date_,
        id_regime,
        id_region,
        id_fish,
        id_subject,
        id_unit
    )
);
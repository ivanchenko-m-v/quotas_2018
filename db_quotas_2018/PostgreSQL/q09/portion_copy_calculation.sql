CREATE TABLE q09.portion_copy_calculation
(
	id_regime int NOT NULL,
	id_fish int NOT NULL,
	id_region int NOT NULL,
	regime varchar(55) NULL,
	fish varchar(45) NULL,
	region varchar(255) NULL,
	id_fish_copy int NOT NULL,
	id_region_copy int NOT NULL,
	fish_copy varchar(45) NULL,
	region_copy varchar(255) NULL,
	id_basin int NOT NULL,
    CONSTRAINT PK_portion_copy_calculation PRIMARY KEY
    (
        id_regime,
        id_fish,
        id_region,
        id_fish_copy,
        id_region_copy
    )
);
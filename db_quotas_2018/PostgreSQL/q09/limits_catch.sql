CREATE TABLE q09.limits_catch
(
	date_ date NOT NULL,
	id_basin int NOT NULL,
	id_subject int NOT NULL,
	id_declarant int NOT NULL,
	id_regime int NOT NULL,
	id_region int NOT NULL,
	id_fish int NOT NULL,
	id_unit int NOT NULL,
	portion_sign int NOT NULL,
	portion decimal(28, 10) NULL,
	limits_volume decimal(28, 10) NULL,
	catch_volume_stat decimal(28, 10) NULL,
	catch_volume_stat_oper decimal(28, 10) NULL,
	catch_volume_1 decimal(28, 10) NULL,
	catch_volume_2 decimal(28, 10) NULL,
	catch_volume_oper decimal(28, 10) NULL,
    CONSTRAINT PK_limits_catch PRIMARY KEY 
    (
        date_,
        id_basin,
        id_subject,
        id_declarant,
        id_regime,
        id_region,
        id_fish,
        id_unit,
        portion_sign
    )
);
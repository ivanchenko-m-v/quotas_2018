CREATE TABLE q09.region_p
(
	id_region int NOT NULL,
	id_region_parent int NOT NULL,
    CONSTRAINT PK_region_p PRIMARY KEY
    (
        id_region,
        id_region_parent
    )
);
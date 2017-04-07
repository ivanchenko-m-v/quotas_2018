CREATE TABLE q09.user_permission
(
	PCName char(50) NOT NULL,
	UserName char(50) NOT NULL,
	permission int NULL,
	launching int NOT NULL,
	portion_edit boolean NOT NULL,
	portion_view boolean NOT NULL,
	distribution_del boolean NOT NULL,
	spr_edit boolean NOT NULL,
    CONSTRAINT PK_user_permission PRIMARY KEY
    (
        PCName,
        UserName
    )
);
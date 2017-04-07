CREATE TABLE q09.user_action
(
	id int NOT NULL,
	timestamp_ timestamp NULL,
	PCName varchar(50) NULL,
	UserName varchar(50) NULL,
	action_ int NULL,
    CONSTRAINT PK_user_action PRIMARY KEY
    (
        id
    )
);
CREATE TABLE q09.user_grant
(
	PCName varchar(30) NOT NULL,
	UserName varchar(30) NOT NULL,
	permission varchar(50) NOT NULL,
	permission_value int NULL,
    CONSTRAINT PK_user_grant PRIMARY KEY
    (
        PCName,
        UserName,
        permission
    )
);
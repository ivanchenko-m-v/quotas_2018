CREATE TABLE q09.subsidiary_list
(
	id_subsidiary_list int NOT NULL,
	subsidiary_list varchar(100) NULL,
	subsidiary_list_sort int NOT NULL,
	subsidiary_list_name varchar(3000) NULL,
    CONSTRAINT PK_subsidiary_list PRIMARY KEY 
    (
        id_subsidiary_list,
        subsidiary_list_sort
    )
);
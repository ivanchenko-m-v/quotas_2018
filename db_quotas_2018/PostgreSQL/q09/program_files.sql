CREATE TABLE q09.program_files(
	id int NOT NULL,
	file_name varchar(100) NOT NULL,
	date_modified timestamp NOT NULL,
	not_delete boolean NULL,
    CONSTRAINT PK_program_files PRIMARY KEY
    (
        file_name
    )
);
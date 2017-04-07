CREATE TABLE q09.subject_p
(
	id_subject int NOT NULL,
	id_subject_parent int NOT NULL,
    CONSTRAINT PK_subject_p PRIMARY KEY
    (
        id_subject,
        id_subject_parent
    )
);
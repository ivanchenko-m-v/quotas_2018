CREATE TABLE q09.fish_p(
	id_fish int NOT NULL,
	id_fish_parent int NOT NULL,
    CONSTRAINT PK_fish_p PRIMARY KEY
    (
        id_fish,
        id_fish_parent 
    )
);
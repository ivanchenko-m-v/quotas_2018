CREATE TABLE q09.portion(
	id_history int NOT NULL,
	id_declarant int NOT NULL,
	id_basin int NOT NULL,
	id_regime int NOT NULL,
	id_region int NOT NULL,
	id_fish int NOT NULL,
	id_subject int NOT NULL,
	portion decimal(38, 17) NULL,
	date_open date NULL,
	date_close date NULL,
	report_organization varchar(150) NULL,
	report_number varchar(60) NULL,
	report_date date NULL,
	report_document varchar(50) NULL,
	contract_organization varchar(150) NULL,
	contract_number varchar(60) NULL,
	contract_date date NULL,
	contract_cancel_organization varchar(100) NULL,
	contract_cancel_number varchar(60) NULL,
	contract_cancel_date date NULL,
	contract_cancel_document varchar(50) NULL,
	transfer_number varchar(150) NULL,
	transfer_date date NULL,
	transfer_reason varchar(150) NULL,
	note varchar(255) NULL,
	responsible varchar(30) NULL,
	timestamp_ timestamp NULL,
	id_declarant_history int NULL,
    CONSTRAINT PK_portion PRIMARY KEY
    (
        id_history
    )
);
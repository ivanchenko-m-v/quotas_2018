﻿-- =============================================================================
-- db_quotas_2018
-- tb_user_ar_audit - таблица 'операции с данными пользователя ВБР'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  29-03-2017
-- Дата обновления:         04-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
CREATE TABLE IF NOT EXISTS tb_user_ar_audit
(
    date_update DATE NOT NULL DEFAULT current_date,			 -- Дата вставки записи в таблицу
    time_update TIME NOT NULL DEFAULT current_time,			 -- Время вставки записи в таблицу
    IUD CHAR(1) NOT NULL,                                    -- 'I', 'U', 'D' - INSERT, UPDATE OR DELETE (заполняется триггером) 
    id_user_ar_key INT NOT NULL,                             -- Идентификатор пользователя ВБР 
                                                                 -- в текущем состоянии (после возможных реорганизаций)
	id_user_ar INT NOT NULL,					             -- Идентификатор пользователя ВБР 
                                                                 -- при добавлении записи в таблицу БД 
    date_reorganize DATE NOT NULL DEFAULT '1900-01-01',      -- Дата реорганизации                                               
    id_user_ar_fms INT NOT NULL DEFAULT 0,					 -- Код пользователя ВБР/владельца доли в ОСМ
                                                                 -- (FMS - Fishery Monitoring System)
	id_dbrecord_operation INT NOT NULL DEFAULT 1,			 -- Код операции над записью БД
	legal_entity BOOLEAN NOT NULL DEFAULT TRUE,				 -- Признак юр.лицо/инд.предприниматель
    date_registration DATE NOT NULL DEFAULT current_date,	 -- Дата регистрации пользователя ВБР
    user_ar VARCHAR(256) NOT NULL,							 -- Название пользователя ВБР
    shipowner VARCHAR(256) NOT NULL DEFAULT '',				 -- Наименование судовладельца в ОСМ
    title_full VARCHAR(256) NOT NULL DEFAULT '',			 -- Полное название пользователя ВБР/владельца доли
    case_number VARCHAR(24) NOT NULL DEFAULT '',			 -- Номер дела пользователя ВБР
    form_of_ownership VARCHAR(24) NOT NULL DEFAULT '',		 -- Текстовая аббревиатура формы собственности
    director VARCHAR(32) NOT NULL DEFAULT '',				 -- ФИО руководителя и должность
    address VARCHAR(255) NOT NULL DEFAULT '',				 -- Юридический адрес
    postal_address VARCHAR(255) NOT NULL DEFAULT '',		 -- Почтовый адрес
    phone VARCHAR(64) NOT NULL DEFAULT '',					 -- Телефон, включая междугородний код
    fax VARCHAR(32) NOT NULL DEFAULT '',					 -- Факс, включая междугородний код
    telex VARCHAR(32) NOT NULL DEFAULT '',					 -- Телекс
    e_mail VARCHAR(32) NOT NULL DEFAULT '',					 -- E-mail
    inn VARCHAR(16) NOT NULL DEFAULT '',					 -- ИНН
    kpp VARCHAR(16) NOT NULL DEFAULT '',					 -- КПП
    ogrn VARCHAR(64) NOT NULL DEFAULT '',					 -- ОГРН
    OKPO VARCHAR(24) NOT NULL DEFAULT '',					 -- ОКПО
    OKATO VARCHAR(24) NOT NULL DEFAULT '',					 -- ОКАТО
    OKVED VARCHAR(24) NOT NULL DEFAULT '',					 -- ОКВЭД
    KOPF VARCHAR(2) NOT NULL DEFAULT '',					 -- ОКОПФ
    KFS VARCHAR(2) NOT NULL DEFAULT '',						 -- ОКФС
    note VARCHAR(255) NOT NULL DEFAULT '',					 -- Примечание
    db_responsible VARCHAR(32) NOT NULL DEFAULT current_user -- Ответственный за корректировку записи
, 
    CONSTRAINT PK_tb_user_ar_audit PRIMARY KEY (id_user_ar_key, date_update, time_update, IUD)
);

CREATE INDEX idx_user_ar_audit ON tb_user_ar_audit (id_user_ar ASC);

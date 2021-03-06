﻿-- =============================================================================
-- db_quotas_2018
-- tb_subject_hierarchy - таблица 'Иерархия субъекта РФ'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  28-03-2017
-- Дата обновления:         03-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
CREATE TABLE IF NOT EXISTS tb_subject_hierarchy
(
	id_subject INT NOT NULL,		-- идентификатор субъекта РФ
	id_subject_top INT NOT NULL 	-- идентификатор субъекта РФ верхнего(обобщающего) уровня
, 
    CONSTRAINT PK_tb_subject_hierarchy PRIMARY KEY (id_subject, id_subject_top)
);

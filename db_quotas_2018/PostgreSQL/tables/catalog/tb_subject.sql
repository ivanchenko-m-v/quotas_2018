-- =============================================================================
-- db_quotas_2018
-- tb_subject - таблица 'субъект РФ'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  28-03-2017
-- Дата обновления:         05-06-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
--
DROP TABLE IF EXISTS quotas.tb_subject CASCADE;
-- 
CREATE TABLE IF NOT EXISTS quotas.tb_subject
(
	id_subject INT NOT NULL PRIMARY KEY,					-- идентификатор субъекта РФ
 	id_subject_fms INT NOT NULL DEFAULT 0,					-- идентификатор субъекта РФ в ОСМ(FMS - Fishery Monitoring System)
 	sort_order INT NOT NULL DEFAULT 2147483647,				-- порядок сортировки в справочнике (0x7FFFFFFF)
    subject VARCHAR(64) NOT NULL CHECK (subject <> ''),		-- наименование субъекта РФ
    subject_title_by_order VARCHAR(64) NOT NULL DEFAULT ''	-- наименование субъекта РФ, согласно утверждённого приказа
);
--  
CREATE UNIQUE INDEX idx_subject ON quotas.tb_subject (subject);												

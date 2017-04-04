-- =============================================================================
-- db_quotas_2018
-- tb_document - таблица 'Нормативный документ'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  28-03-2017
-- Дата обновления:         03-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
CREATE TABLE IF NOT EXISTS tb_document
(
	id_document INT NOT NULL PRIMARY KEY,					-- идентификатор нормативного документа
    id_document_type INT NOT NULL DEFAULT 0, 				-- идентификатор типа нормативного документа
    id_organization_approval INT NOT NULL DEFAULT 0,		-- идентификатор утверждающей организации
    document_number VARCHAR(32) NOT NULL DEFAULT '',		-- номер нормативного документа
    document_date DATE NOT NULL DEFAULT current_date,	    -- дата нормативного документа
	document_title VARCHAR(256) NOT NULL DEFAULT '',		-- заголовок нормативного документа
	document_person VARCHAR(32) NOT NULL DEFAULT '',		-- ответственное лицо, утвердившее нормативный документ
	document_note VARCHAR(256) NOT NULL DEFAULT ''		    -- примечание к нормативному документу
);

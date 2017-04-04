-- =============================================================================
-- db_quotas_2018
-- tb_aquatic_resource - таблица 'ВБР'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  27-03-2017
-- Дата обновления:         03-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
CREATE TABLE IF NOT EXISTS tb_aquatic_resource
(
	id_aquatic_resource INT NOT NULL PRIMARY KEY,		-- идентификатор ВБР
 	id_ar_fms INT NOT NULL DEFAULT 0,					-- идентификатор ВБР в ОСМ(FMS - Fishery Monitoring System)
 	sort_order INT NOT NULL DEFAULT 2147483647,			-- порядок сортировки в справочнике (0x7FFFFFFF)
    aquatic_resource VARCHAR(64) NOT NULL,				-- наименование ВБР
    ar_title_by_order VARCHAR(64) NOT NULL DEFAULT ''	-- наименование ВБР, согласно утверждённого приказа
);

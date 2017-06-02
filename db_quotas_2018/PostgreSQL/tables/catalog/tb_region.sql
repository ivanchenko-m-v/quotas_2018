-- =============================================================================
-- db_quotas_2018
-- tb_region - таблица 'район добычи(промысла) ВБР'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  27-03-2017
-- Дата обновления:         02-06-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
--
DROP TABLE IF EXISTS quotas.tb_region CASCADE;
DROP SEQUENCE IF EXISTS quotas.region_seq;
CREATE SEQUENCE IF NOT EXISTS quotas.region_seq;
--
CREATE TABLE IF NOT EXISTS quotas.tb_region
(
	id_region INT NOT NULL PRIMARY KEY DEFAULT nextval('quotas.region_seq'), --идентификатор района добычи(промысла) ВБР
 	id_region_fms INT NOT NULL DEFAULT 0,					                 --идентификатор района добычи(промысла) ВБР в ОСМ(FMS - Fishery Monitoring System)
 	sort_order INT NOT NULL DEFAULT 2147483647,				                 --порядок сортировки в справочнике (0x7FFFFFFF)
    region VARCHAR(64) NOT NULL CHECK (region <> ''),		                 --наименование района добычи(промысла) ВБР
    region_title_by_order VARCHAR(64) NOT NULL DEFAULT ''	                 --наименование района добычи(промысла) ВБР, согласно утверждённого приказа
);
--  
CREATE INDEX idx_region ON quotas.tb_region (region); -- допускаются дубликаты из-за несоответствия справочников ОСМ												

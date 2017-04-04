-- =============================================================================
-- db_quotas_2018
-- tb_total_allowable_catch - таблица 'общий допустимый улов(ОДУ) ВБР'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  27-03-2017
-- Дата обновления:         03-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
CREATE TABLE IF NOT EXISTS tb_total_allowable_catch
(
	date_tac DATE NOT NULL,					        -- дата начала действия ОДУ
	id_basin INT NOT NULL,						    -- идентификатор бассейна промысла ВБР
	id_region INT NOT NULL,						    -- идентификатор района добычи(промысла) ВБР
	id_aquatic_resource INT NOT NULL,				-- идентификатор ВБР
	id_unit INT NOT NULL,							-- единица измерения
	id_document INT NOT NULL,						-- идентификатор нормативного документа
    total_allowed_catch DECIMAL(38, 17) NOT NULL	-- объём ОДУ
, 
    CONSTRAINT PK_tb_total_allowable_catch PRIMARY KEY (date_tac, id_basin, id_region, id_aquatic_resource, id_unit, id_document)
);

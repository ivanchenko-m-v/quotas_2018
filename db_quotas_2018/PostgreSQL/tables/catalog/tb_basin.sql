-- =============================================================================
-- db_quotas_2018
-- tb_basin - таблица 'Бассейн промысла ВБР(рыбопромысловый бассейн)'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  28-03-2017
-- Дата обновления:         01-06-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
--
DROP TABLE IF EXISTS quotas.tb_basin;
--
CREATE TABLE IF NOT EXISTS quotas.tb_basin
(
	id_basin INT NOT NULL PRIMARY KEY,			    -- идентификатор бассейна промысла ВБР
	basin VARCHAR(32) NOT NULL CHECK (basin <> ''),	-- наименование бассейна промысла ВБР
	basin_abbr VARCHAR(4) NOT NULL DEFAULT ''	    -- аббревиатура бассейна промысла ВБР
);
-- 
CREATE UNIQUE INDEX idx_basin ON quotas.tb_basin (basin);												

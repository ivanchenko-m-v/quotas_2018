-- =============================================================================
-- db_quotas_2018
-- tb_portion_calc - таблица 'Расcчитанная доля квоты пользователя ВБР'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  04-04-2017
-- Дата обновления:         04-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
CREATE TABLE IF NOT EXISTS tb_portion_calc
(
	date_calc DATE NOT NULL DEFAULT current_date,               -- дата расчёта
	id_user_ar INT NOT NULL,								    -- идентификатор пользователя ВБР
	id_basin INT NOT NULL,									    -- идентификатор бассейна промысла ВБР
	id_quota_type INT NOT NULL,								    -- идентификатор вида квоты на добычу ВБР
	id_region INT NOT NULL,									    -- идентификатор района добычи(промысла) ВБР
	id_aquatic_resource INT NOT NULL,						    -- идентификатор ВБР
	id_subject INT NOT NULL,								    -- идентификатор субъекта РФ
	portion_volume DECIMAL(38,17) NOT NULL DEFAULT 0,			-- размер раcсчитанной доли
	db_responsible VARCHAR(32) NOT NULL DEFAULT current_user    -- ответственный сотрудник, внесший запись БД (выполнивший расчёт)
, 
    CONSTRAINT PK_tb_portion_calc PRIMARY KEY (date_calc, id_user_ar, id_basin, id_quota_type, id_region, id_aquatic_resource, id_subject)
);

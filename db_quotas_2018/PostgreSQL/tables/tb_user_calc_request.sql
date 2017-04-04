-- =============================================================================
-- db_quotas_2018
-- tb_user_calc_request - таблица 'Заявка пользователя ВБР 
--                                 на расчёт квот'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  28-03-2017
-- Дата обновления:         04-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
CREATE TABLE IF NOT EXISTS tb_user_calc_request
(
	id_user_ar INT NOT NULL,								    -- идентификатор пользователя ВБР
	id_basin INT NOT NULL,									    -- идентификатор бассейна промысла ВБР
	id_quota_type INT NOT NULL,								    -- идентификатор вида квоты на добычу ВБР
	id_region INT NOT NULL,									    -- идентификатор района добычи(промысла) ВБР
	id_aquatic_resource INT NOT NULL,						    -- идентификатор ВБР
	id_subject INT NOT NULL,								    -- идентификатор субъекта РФ
	date_request DATE NOT NULL DEFAULT current_date,		    -- дата заявки
	portion_volume DECIMAL(38,17) NOT NULL DEFAULT 0,			-- размер запрашиваемой доли
	date_record DATE NOT NULL DEFAULT current_date,		        -- дата регистрации заявки	
	db_responsible VARCHAR(32) NOT NULL DEFAULT current_user    -- ответственный сотрудник, внесший запись БД
, 
    CONSTRAINT PK_tb_user_calc_request PRIMARY KEY (id_user_ar, id_subject, id_basin, id_quota_type, id_region, id_aquatic_resource)
);

-- 04-04-2017
-- ALTER TABLE public.tb_user_calc_request RENAME COLUMN portion TO portion_volume;

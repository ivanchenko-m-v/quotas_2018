-- =============================================================================
-- db_quotas_2018
-- sp_quota - функции сервера для получения данных объёма 
--            утверждённой квоты пользователя ВБР
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  12-05-2017
-- Дата обновления:         12-05-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
/*
    q09.sp_quota( ... ) 
    - получение данных объёма утверждённой квоты пользователя ВБР 
      за выбранные годы
    
    параметры:
        p_user_ar   - пользователь ВБР
        p_year_from - год начала периода данных выборки
        p_year_to   - год окончания периода данных выборки
        
    возвращает:
        -- таблица данных объёма утверждённой квоты пользователя ВБР 
           за период заданных годов
*/
--
DROP FUNCTION IF EXISTS q09.sp_quota(INTEGER,INTEGER,INTEGER);
--
CREATE OR REPLACE FUNCTION q09.sp_quota( 
                    p_user_ar INTEGER DEFAULT 0,                    -- пользователь ВБР
                    p_year_from INTEGER DEFAULT 0,                  -- год начала периода данных выборки
                    p_year_to INTEGER DEFAULT q09.current_year( )   -- год окончания периода данных выборки
                                       ) 
RETURNS TABLE
    (
        i_year INTEGER,
        i_basin INTEGER, 
        i_subject INTEGER, 
        i_regime INTEGER,
        i_user_ar INTEGER,
        i_region INTEGER,
        i_ar INTEGER,
        i_unit INTEGER,
        quota_volume NUMERIC(38,17)
    )
AS
$$
    DECLARE p_user_from INTEGER;
    DECLARE p_user_to INTEGER;
BEGIN
    -- формируем диапазон выборки пользователей
    p_user_from=p_user_ar;
    IF p_user_ar=0 THEN
        p_user_to=2147483647; -- 0x7FFFFFFF max 32bit positive value
    ELSE
        p_user_to=p_user_ar;
    END IF;
        
    RETURN QUERY
        SELECT 
                CAST(EXTRACT(YEAR FROM date_) AS INTEGER) AS n_year, id_basin, id_subject, 
                id_regime, id_declarant, id_region, id_fish, id_unit, catch_volume
            FROM q09.limits
            WHERE (EXTRACT(YEAR FROM date_) BETWEEN p_year_from AND p_year_to)AND
                  (id_declarant BETWEEN p_user_from AND p_user_to);

END;
$$ LANGUAGE plpgsql;

-- select * from q09.sp_quota() limit 100;
-- select * from q09.sp_quota(0, 2016) limit 100;
-- select * from q09.sp_quota(0, 2014, 2014) limit 100;


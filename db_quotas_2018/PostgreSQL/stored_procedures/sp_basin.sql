-- =============================================================================
-- db_quotas_2018
-- sp_basin - функции сервера для работы с данными бассейнов промысла 
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  31-05-2017
-- Дата обновления:         31-05-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
/*
    public.sp_basin_read( ... ) 
    - функции сервера для работы с данными бассейнов промысла
    
    параметры:
        p_year_from - год начала периода данных выборки
        p_year_to   - год окончания периода данных выборки
        
    вызывает исключение в случаях:
        - Год начала периода ранее 2004 года или младше текущего года
        - Год окончания периода старше начала периода или младше текущего года
        
    возвращает:
        -- данных объёма улова за период заданных годов
*/
--
DROP FUNCTION IF EXISTS public.sp_basin_read(INTEGER);
--
CREATE OR REPLACE FUNCTION public.sp_basin_read( 
                                                p_id INTEGER DEFAULT 0
                                               ) 
RETURNS TABLE
    (
        i_id INTEGER,
        x_basin VARCHAR(32), 
        x_basin_abbr VARCHAR(4)
    )
AS
$$
BEGIN
    -- выборка всех данных
    IF  p_id=0 THEN
        RETURN QUERY
            SELECT id_basin, basin, basin_abbr 
                FROM public.tb_basin;
    END IF;
        
    RETURN QUERY
        SELECT id_basin, basin, basin_abbr 
            FROM public.tb_basin
        WHERE id_basin=p_id;

END;
$$ LANGUAGE plpgsql;

/*
    public.sp_basin( ... ) 
    - функции сервера для работы с данными бассейнов промысла
    
    параметры:
        p_year_from - год начала периода данных выборки
        p_year_to   - год окончания периода данных выборки
        
    вызывает исключение в случаях:
        - Год начала периода ранее 2004 года или младше текущего года
        - Год окончания периода старше начала периода или младше текущего года
        
    возвращает:
        -- данных объёма улова за период заданных годов
*/
--
DROP FUNCTION IF EXISTS public.sp_basin(VARCHAR,INTEGER,VARCHAR,VARCHAR);
--
CREATE OR REPLACE FUNCTION public.sp_basin( 
                                            p_action VARCHAR(8),
                                            p_id INTEGER,
                                            p_basin VARCHAR(32),
                                            p_abbr VARCHAR(4)
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
        quota_volume NUMERIC(38,17),
        fishery_volume NUMERIC(38,17)
    )
AS
$$
    DECLARE c_year INTEGER;
BEGIN
    -- запоминаем текущий год
    c_year = q09.current_year( );
    -- Год начала периода не ранее 2004 года и не позднее текущего года
    IF p_year_from < 2004 OR p_year_from > c_year THEN
 		RAISE EXCEPTION 'Year period-start should be between % and %', 2004, c_year;
    END IF;
    -- Год окончания периода не ранее начала периода и не позднее текущего года
    IF  p_year_to < p_year_from OR p_year_to > c_year THEN
 		RAISE EXCEPTION 'Year period-end should be between % and %', p_year_from, c_year;
    END IF;
        
    RETURN QUERY
        SELECT 
                CAST(EXTRACT(YEAR FROM date_) AS INTEGER) AS n_year, id_basin, id_subject, 
                id_regime, id_declarant, id_region, id_fish, id_unit, limits_volume,
                q09.max(q09.max(catch_volume_stat, catch_volume_stat_oper), catch_volume_oper) as catch_volume
            FROM q09.limits_catch
            WHERE (portion_sign=0)AND(EXTRACT(YEAR FROM date_) BETWEEN p_year_from AND p_year_to);

END;
$$ LANGUAGE plpgsql;


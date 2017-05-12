-- =============================================================================
-- db_quotas_2018
-- sp_fishery_volume - функции сервера для получения данных объёма улова за 
--                     выбранные годы
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  11-05-2017
-- Дата обновления:         12-05-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
/*
    q09.max(v1 NUMERIC, v2 NUMERIC)
    - выбор максимального значения типа NUMERIC (нет стандартной функции в pgsql)
*/
CREATE OR REPLACE FUNCTION q09.max(v1 NUMERIC, v2 NUMERIC)
RETURNS NUMERIC
AS
$$
BEGIN
	-- v1 and v2 is null
	IF v1 IS NULL AND v2 IS NULL THEN
    	RETURN NULL;
    END IF;
    -- only v1 is null
    IF v1 IS NULL THEN
    	RETURN v2;
    END IF;
    -- only v2 is null
    IF v2 IS NULL THEN
    	RETURN v1;
    END IF;
    -- v1 > v2
    IF (v1 - v2) > 0 THEN
    	RETURN v1;
    END IF;
    -- v1 <= v2
    RETURN v2;
END;
$$ LANGUAGE plpgsql;
/* ---------------------- tests q09.max ---------------------- */
-- select q09.max( 2.0, 3.0 );
-- select q09.max( null, 3.0 );
-- select q09.max( 1.23, null );
-- select q09.max( null, null );
-- select q09.max( 2.00000000000000098, 2.00000000000000099 );
-- select q09.max( 2.000000000000001, 2.00000000000000099 );
-- select q09.max( 
--     			  999999999999999999999999999999999999999999999999999.000000000000001, 
--                999999999999999999999999999999999999999999999999999.00000000000000099 
--               );

/*
    q09.min(v1 NUMERIC, v2 NUMERIC)
    - выбор минимального значения типа NUMERIC (нет стандартной функции в pgsql)
*/
CREATE OR REPLACE FUNCTION q09.min(v1 NUMERIC, v2 NUMERIC)
RETURNS NUMERIC
AS
$$
BEGIN
	-- v1 and v2 is null
	IF v1 IS NULL AND v2 IS NULL THEN
    	RETURN NULL;
    END IF;
    -- only v1 is null
    IF v1 IS NULL THEN
    	RETURN v1;
    END IF;
    -- only v2 is null
    IF v2 IS NULL THEN
    	RETURN v2;
    END IF;
    -- v1 > v2
    IF (v1 - v2) > 0 THEN
    	RETURN v2;
    END IF;
    -- v1 <= v2
    RETURN v1;
END;
$$ LANGUAGE plpgsql;
/* ---------------------- tests q09.min ---------------------- */
-- select q09.min( 2.0, 3.0 );
-- select q09.min( null, 3.0 );
-- select q09.min( 1.23, null );
-- select q09.min( null, null );
-- select q09.min( 2.00000000000000098, 2.00000000000000099 );
-- select q09.min( 2.000000000000001, 2.00000000000000099 );
-- select q09.min( 
--     			  999999999999999999999999999999999999999999999999999.000000000000001, 
--                999999999999999999999999999999999999999999999999999.00000000000000099 
--               );

/*
    q09.current_year( )
    - возвращает текущий год
*/
CREATE OR REPLACE FUNCTION q09.current_year( )
RETURNS INT
AS
$$
    DECLARE c_year INT;
BEGIN
	
    -- SELECT EXTRACT(YEAR FROM current_TIMESTAMP);
    SELECT EXTRACT(YEAR FROM current_TIMESTAMP) INTO c_year;
    
	RETURN c_year;
END;
$$ LANGUAGE plpgsql;

/*
    q09.sp_fishery_volume( ... ) 
    - получение данных объёма улова за выбранные годы
    
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
DROP FUNCTION IF EXISTS q09.sp_fishery_volume(INTEGER,INTEGER);
--
CREATE OR REPLACE FUNCTION q09.sp_fishery_volume( 
                                        p_year_from INTEGER, -- год начала периода данных выборки
                                        p_year_to INTEGER    -- год окончания периода данных выборки
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

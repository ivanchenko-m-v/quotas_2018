-- =============================================================================
-- db_quotas_2018
-- sp_basin - функции сервера для работы с данными бассейнов промысла 
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  31-05-2017
-- Дата обновления:         05-06-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
/*
    quotas.sp_basin_read( p_id INTEGER ) 
    - функции сервера для выборки ОДНОЙ записи данных бассейна промысла
    
    параметры:
        p_id - идентификатор бассейна промысла
        
    возвращает:
        -- запись данных бассейна промысла
*/
--
DROP FUNCTION IF EXISTS quotas.sp_basin_read(INTEGER);
--
CREATE OR REPLACE FUNCTION quotas.sp_basin_read( p_id INTEGER ) 
RETURNS quotas.tb_basin
AS
$$
    SELECT  quotas.tb_basin.id_basin, 
    		 quotas.tb_basin.basin, 
             quotas.tb_basin.basin_abbr
        FROM quotas.tb_basin
        WHERE id_basin=p_id LIMIT 1 OFFSET 0;
$$
LANGUAGE sql VOLATILE
COST 100;
/*
    quotas.sp_basin_read( ) 
    - функции сервера для выборки ВСЕХ записей данных бассейнов промысла
    
    возвращает:
        -- набор записей данных бассейна промысла
*/
-- 
DROP FUNCTION IF EXISTS quotas.sp_basin_read( );
-- 
CREATE OR REPLACE FUNCTION quotas.sp_basin_read( ) 
RETURNS SETOF quotas.tb_basin 
AS
$$
	SELECT id_basin, basin, basin_abbr 
	    FROM quotas.tb_basin;
$$ 
LANGUAGE sql VOLATILE
COST 100;
/*TESTS*/
-- select * from sp_basin_read(63)
-- select quotas.sp_basin_read( 0 );
-- select quotas.sp_basin_read( );
-- select * from quotas.sp_basin_read( );

/*
    quotas.sp_basin( ... ) 
    - функции сервера для работы с данными бассейнов промысла
    
    параметры:
        p_action - код действия с записью БД
                    'CREATE' - вставка, 
                    'PATCH' - обновление, 
                    'REMOVE' - удаление
        p_id - код записи БД id_basin, для операции вставки не используется
        p_basin - значение наименования бассейна промысла
        p_abbr - значение аббревиатуры наименования бассейна промысла
    возвращает:    
        идентификатор вставленной/обновлённой/удалённой записи
*/
--
DROP FUNCTION IF EXISTS quotas.sp_basin(VARCHAR,INTEGER,VARCHAR,VARCHAR);
--
CREATE OR REPLACE FUNCTION quotas.sp_basin( 
                                            p_action VARCHAR(8) DEFAULT '',
                                            p_id INTEGER DEFAULT 0,
                                            p_basin VARCHAR(32) DEFAULT '',
                                            p_abbr VARCHAR(4) DEFAULT ''
                                          ) 
RETURNS INTEGER
AS
$$
    DECLARE result_id INTEGER;
BEGIN
    -- insert new basin
    IF p_action='CREATE' THEN
    BEGIN
        IF EXISTS(SELECT id_basin FROM quotas.tb_basin) THEN
            BEGIN
                INSERT INTO quotas.tb_basin
                    SELECT MAX(id_basin)+1, p_basin, p_abbr
                    FROM quotas.tb_basin
                RETURNING id_basin INTO result_id;
                RETURN result_id;
            END;
        ELSE
            BEGIN
                INSERT INTO quotas.tb_basin
                    VALUES(1, p_basin, p_abbr);
                RETURN 1;
            END;
        END IF;
    END;    
    END IF; 
    -- update basin
    IF p_action='PATCH' THEN
        BEGIN
            UPDATE quotas.tb_basin 
                SET basin=p_basin, basin_abbr=p_abbr
                WHERE id_basin=p_id
            RETURNING id_basin INTO result_id;
            RETURN result_id;
        END;
    END IF; 
    -- delete basin
    IF p_action='REMOVE' THEN
    	BEGIN
            DELETE FROM quotas.tb_basin 
                WHERE id_basin=p_id
            RETURNING id_basin INTO result_id;
            RETURN result_id;
        END;
    END IF; 
END;
$$ LANGUAGE plpgsql;

/*
CREATE OR REPLACE FUNCTION quotas.sp_basin( 
                                            p_action VARCHAR(8) DEFAULT '',
                                            p_id INTEGER DEFAULT 0,
                                            p_basin VARCHAR(32) DEFAULT '',
                                            p_abbr VARCHAR(4) DEFAULT ''
                                          ) 
RETURNS void
AS
$$
BEGIN
    -- insert new basin
    IF p_action='CREATE' THEN
    BEGIN
        IF EXISTS(SELECT * FROM quotas.tb_basin) THEN
            BEGIN
                INSERT INTO quotas.tb_basin (id_basin, basin, basin_abbr)
                            SELECT MAX(id_basin)+1, p_basin, p_abbr
                            FROM quotas.tb_basin;
                RETURN;
            END;
        ELSE
            BEGIN
                INSERT INTO quotas.tb_basin
                    VALUES(1, p_basin, p_abbr);
                RETURN;
            END;
        END IF;
    END;    
    END IF; 
    -- update basin
    IF p_action='PATCH' THEN
        BEGIN
            UPDATE quotas.tb_basin 
                SET basin=p_basin, basin_abbr=p_abbr
                WHERE id_basin=p_id;
            RETURN;
        END;
    END IF; 
    -- delete basin
    IF p_action='REMOVE' THEN
    	BEGIN
            DELETE FROM quotas.tb_basin 
                WHERE id_basin=p_id;
            RETURN;
        END;
    END IF; 
END;
$$ LANGUAGE plpgsql;
*/

-- SELECT * FROM quotas.tb_basin;
-- DELETE FROM quotas.tb_basin WHERE id_basin > 63;
-- select quotas.sp_basin('CREATE', -1, 'Antarctic' );
-- select quotas.sp_basin('CREATE', -1, 'Indian ocean', 'IO' );
-- select quotas.sp_basin('CREATE', -1, 'Pacific ocean', 'PO' );
-- select quotas.sp_basin('PATCH', 1, 'Atlantic ocean', 'AO' );
-- select quotas.sp_basin('PATCH', 64, 'South ocean', 'SO' );
-- select quotas.sp_basin('PATCH', 3, 'Pacific ocean', 'PO' );
-- select quotas.sp_basin('PATCH', 65, 'North ocean', 'NO' );
-- select quotas.sp_basin('REMOVE', 64 );
-- select quotas.sp_basin('REMOVE', 65 );
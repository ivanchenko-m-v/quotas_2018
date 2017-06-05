-- =============================================================================
-- db_quotas_2018
-- sp_region - функции сервера для работы с данными районов промысла 
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  02-06-2017
-- Дата обновления:         05-06-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
/*
    quotas.sp_region_read( p_id INTEGER ) 
    - функции сервера для выборки ОДНОЙ записи данных района промысла
    
    параметры:
        p_id - идентификатор района промысла
        
    возвращает:
        -- запись данных района промысла
*/
--
DROP FUNCTION IF EXISTS quotas.sp_region_read(INTEGER);
--
CREATE OR REPLACE FUNCTION quotas.sp_region_read( p_id INTEGER ) 
RETURNS quotas.tb_region
AS
$$
    SELECT  TBR.id_region, 
            TBR.id_region_fms,
    		TBR.sort_order, 
            TBR.region,
            TBR.region_title_by_order
        FROM quotas.tb_region TBR
        WHERE id_region=p_id LIMIT 1 OFFSET 0;
$$
LANGUAGE sql VOLATILE
COST 100;

/*
    quotas.sp_region_read( ) 
    - функции сервера для выборки ВСЕХ записей данных районов промысла
    
    возвращает:
        -- набор записей данных районов промысла
*/
-- 
DROP FUNCTION IF EXISTS quotas.sp_region_read( );
-- 
CREATE OR REPLACE FUNCTION quotas.sp_region_read( ) 
RETURNS SETOF quotas.tb_region 
AS
$$
    SELECT  TBR.id_region, 
            TBR.id_region_fms,
    		TBR.sort_order, 
            TBR.region,
            TBR.region_title_by_order
	    FROM quotas.tb_region TBR;
$$ 
LANGUAGE sql VOLATILE
COST 100;

/*
    quotas.sp_region_read( p_criteria VARCHAR ) 
    - функции сервера для выборки ОДНОЙ записи данных района промысла
    
    параметры:
        p_criteria - строка поиска в наименовании
        
    возвращает:
        -- набор записей данных районов промысла, 
           соответствующих критерию выборки
*/
--
DROP FUNCTION IF EXISTS quotas.sp_region_read(VARCHAR);
--
CREATE OR REPLACE FUNCTION quotas.sp_region_read( p_criteria VARCHAR(64) ) 
RETURNS SETOF quotas.tb_region 
AS
$$
    DECLARE x_like VARCHAR(64);
BEGIN
    x_like := concat('%', lower(p_criteria), '%');
	RETURN QUERY
        SELECT  TBR.id_region, 
                TBR.id_region_fms,
                TBR.sort_order, 
                TBR.region,
                TBR.region_title_by_order
            FROM quotas.tb_region TBR
            WHERE (lower(TBR.region) LIKE x_like)OR
            	  (lower(TBR.region_title_by_order) LIKE x_like);
END;
$$
LANGUAGE plpgsql VOLATILE
COST 100;
/*TESTS*/
-- select * from sp_region_read(63)
-- select quotas.sp_region_read( 0 );
-- select quotas.sp_region_read( );
-- select * from quotas.sp_region_read( );
-- select * from quotas.sp_region_read( 'под' );

/*
    quotas.sp_region( ... ) 
    - функции сервера для работы с данными районов промысла
    
    параметры:
        p_action - код действия с записью БД
                    'CREATE' - вставка, 
                    'PATCH' - обновление, 
                    'REMOVE' - удаление
        p_id_region               --идентификатор района добычи(промысла) ВБР
        p_id_region_fms           --идентификатор района добычи(промысла) ВБР в ОСМ(FMS - Fishery Monitoring System)
    	p_sort_order              --порядок сортировки в справочнике (0x7FFFFFFF)
        p_region                  --наименование района добычи(промысла) ВБР
        p_region_title_by_order   --наименование района добычи(промысла) ВБР, согласно утверждённого приказа
    возвращает:    
        идентификатор вставленной/обновлённой/удалённой записи
*/
--
DROP FUNCTION IF EXISTS quotas.sp_region(VARCHAR,INTEGER,VARCHAR,VARCHAR);
--
CREATE OR REPLACE FUNCTION quotas.sp_region( 
                                            p_action VARCHAR(8) DEFAULT '',
                                            p_id_region INTEGER DEFAULT 0,					
                                            p_id_region_fms INTEGER DEFAULT 0,				
                                            p_sort_order INTEGER DEFAULT 2147483647,			
                                            p_region VARCHAR(64) DEFAULT '',	
                                            p_region_title_by_order VARCHAR(64) DEFAULT ''
                                          ) 
RETURNS INTEGER
AS
$$
    DECLARE result_id INTEGER;
BEGIN
    -- insert new region
    IF p_action='CREATE' THEN
        IF EXISTS(SELECT id_region FROM quotas.tb_region) THEN
            BEGIN
                INSERT INTO quotas.tb_region 
                            (id_region, id_region_fms, sort_order, 
                             region, region_title_by_order)
                    SELECT  MAX(id_region)+1, p_id_region_fms, p_sort_order, 
                            p_region, p_region_title_by_order
                        FROM quotas.tb_region
                RETURNING id_region INTO result_id;
                RETURN result_id;
            END;
        ELSE
            BEGIN
                INSERT INTO quotas.tb_region
                    VALUES (1, p_id_region_fms, p_sort_order, 
                            p_region, p_region_title_by_order);
                RETURN 1;
            END;
    	END IF;
    END IF; 
    -- update region
    IF p_action='PATCH' THEN
        BEGIN
            UPDATE quotas.tb_region 
                SET id_region_fms=p_id_region_fms,
                    sort_order=p_sort_order,
                    region=p_region, 
                    region_title_by_order=p_region_title_by_order
                WHERE id_region=p_id_region
            RETURNING id_region INTO result_id;
            RETURN result_id;
        END;
    END IF; 
    -- delete region
    IF p_action='REMOVE' THEN
    	BEGIN
            DELETE FROM quotas.tb_region 
                WHERE id_region=p_id_region
            RETURNING id_region INTO result_id;
            RETURN result_id;
        END;
    END IF; 
    
END;
$$ LANGUAGE plpgsql;

-- SELECT * FROM quotas.tb_region where id_region < 20;
-- select * from quotas.sp_region_read( );
-- select * from quotas.sp_region_read(2671);
-- select * from quotas.sp_region_read(3);
-- DELETE FROM quotas.tb_region WHERE id_region > 63;
-- select quotas.sp_region('CREATE', -1, 0, 2147483647, 'Antarctic' );
-- select quotas.sp_region('CREATE', -1, 0, 2147483647, 'Indian ocean', 'IO' );
-- select quotas.sp_region('CREATE', -1, 0, 2147483647, 'Pacific ocean', 'PO' );
-- select quotas.sp_region('PATCH', 1,  0, 2147483647, 'Atlantic ocean', 're1' );
-- select quotas.sp_region('PATCH', 2, 0, 2147483647, 'South ocean', 'ку2' );
-- select quotas.sp_region('PATCH', 3, 0, 2147483647, 'Pacific ocean', 'Pку3O' );
-- select quotas.sp_region('REMOVE', 1 );
-- select quotas.sp_region('REMOVE', 2 );
-- select quotas.sp_region('REMOVE', 3 );
-- =============================================================================
-- db_quotas_2018
-- sp_subject - функции сервера для работы с данными субъектов РФ
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  05-06-2017
-- Дата обновления:         05-06-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
/*
    quotas.sp_subject_read( p_id INTEGER ) 
    - функции сервера для выборки ОДНОЙ записи данных субъекта РФ
    
    параметры:
        p_id - идентификатор субъекта РФ
        
    возвращает:
        -- запись данных субъекта РФ
*/
--
DROP FUNCTION IF EXISTS quotas.sp_subject_read(INTEGER);
--
CREATE OR REPLACE FUNCTION quotas.sp_subject_read( p_id INTEGER ) 
RETURNS quotas.tb_subject
AS
$$
    SELECT  TBS.id_subject, 
            TBS.id_subject_fms,
    		TBS.sort_order, 
            TBS.subject,
            TBS.subject_title_by_order
        FROM quotas.tb_subject TBS
        WHERE id_subject=p_id LIMIT 1 OFFSET 0;
$$
LANGUAGE sql VOLATILE
COST 100;

/*
    quotas.sp_subject_read( ) 
    - функции сервера для выборки ВСЕХ записей данных субъектов РФ
    
    возвращает:
        -- набор записей данных субъектов РФ
*/
-- 
DROP FUNCTION IF EXISTS quotas.sp_subject_read( );
-- 
CREATE OR REPLACE FUNCTION quotas.sp_subject_read( ) 
RETURNS SETOF quotas.tb_subject 
AS
$$
    SELECT  TBS.id_subject, 
            TBS.id_subject_fms,
    		TBS.sort_order, 
            TBS.subject,
            TBS.subject_title_by_order
	    FROM quotas.tb_subject TBS;
$$ 
LANGUAGE sql VOLATILE
COST 100;

/*
    quotas.sp_subject_read( p_criteria VARCHAR ) 
    - функции сервера для выборки ОДНОЙ записи данных субъекта РФ
    
    параметры:
        p_criteria - строка поиска в наименовании
        
    возвращает:
        -- набор записей данных субъектов РФ, 
           соответствующих критерию выборки
*/
--
DROP FUNCTION IF EXISTS quotas.sp_subject_read(VARCHAR);
--
CREATE OR REPLACE FUNCTION quotas.sp_subject_read( p_criteria VARCHAR(64) ) 
RETURNS SETOF quotas.tb_subject 
AS
$$
    DECLARE x_like VARCHAR(64);
BEGIN
    x_like := concat('%', lower(p_criteria), '%');
	RETURN QUERY
        SELECT  TBS.id_subject, 
                TBS.id_subject_fms,
                TBS.sort_order, 
                TBS.subject,
                TBS.subject_title_by_order
            FROM quotas.tb_subject TBS
            WHERE (lower(TBS.subject) LIKE x_like)OR
            	  (lower(TBS.subject_title_by_order) LIKE x_like);
END;
$$
LANGUAGE plpgsql VOLATILE
COST 100;
/*TESTS*/
-- select * from sp_subject_read(63)
-- select quotas.sp_subject_read( 0 );
-- select quotas.sp_subject_read( );
-- select * from quotas.sp_subject_read( );
-- select * from quotas.sp_subject_read( 'под' );

/*
    quotas.sp_subject( ... ) 
    - функции сервера для работы с данными субъектов РФ
    
    параметры:
        p_action - код действия с записью БД
                    'CREATE' - вставка, 
                    'PATCH' - обновление, 
                    'REMOVE' - удаление
        p_id_subject              -- идентификатор субъекта РФ
        p_id_subject_fms          -- идентификатор субъекта РФ в ОСМ(FMS - Fishery Monitoring System)
    	p_sort_order              -- порядок сортировки в справочнике (0x7FFFFFFF)
        p_subject                 -- наименование субъекта РФ
        p_subject_title_by_order  -- наименование субъекта РФ, согласно утверждённого приказа
    возвращает:    
        идентификатор вставленной/обновлённой/удалённой записи
*/
--
DROP FUNCTION IF EXISTS quotas.sp_subject(VARCHAR,INTEGER,VARCHAR,VARCHAR);
--
CREATE OR REPLACE FUNCTION quotas.sp_subject( 
                                            p_action VARCHAR(8) DEFAULT '',
                                            p_id_subject INTEGER DEFAULT 0,					
                                            p_id_subject_fms INTEGER DEFAULT 0,				
                                            p_sort_order INTEGER DEFAULT 2147483647,			
                                            p_subject VARCHAR(64) DEFAULT '',	
                                            p_subject_title_by_order VARCHAR(64) DEFAULT ''
                                          ) 
RETURNS INTEGER
AS
$$
    DECLARE result_id INTEGER;
BEGIN
    -- insert new subject
    IF p_action='CREATE' THEN
        IF EXISTS(SELECT id_subject FROM quotas.tb_subject) THEN
            BEGIN
                INSERT INTO quotas.tb_subject 
                            (id_subject, id_subject_fms, sort_order, 
                             subject, subject_title_by_order)
                    SELECT  MAX(id_subject)+1, p_id_subject_fms, p_sort_order, 
                            p_subject, p_subject_title_by_order
                        FROM quotas.tb_subject
                RETURNING id_subject INTO result_id;
                RETURN result_id;
            END;
        ELSE
            BEGIN
                INSERT INTO quotas.tb_subject
                    VALUES (1, p_id_subject_fms, p_sort_order, 
                            p_subject, p_subject_title_by_order);
                RETURN 1;
            END;
    	END IF;
    END IF; 
    -- update subject
    IF p_action='PATCH' THEN
        BEGIN
            UPDATE quotas.tb_subject 
                SET id_subject_fms=p_id_subject_fms,
                    sort_order=p_sort_order,
                    subject=p_subject, 
                    subject_title_by_order=p_subject_title_by_order
                WHERE id_subject=p_id_subject
            RETURNING id_subject INTO result_id;
            RETURN result_id;
        END;
    END IF; 
    -- delete subject
    IF p_action='REMOVE' THEN
    	BEGIN
            DELETE FROM quotas.tb_subject 
                WHERE id_subject=p_id_subject
            RETURNING id_subject INTO result_id;
            RETURN result_id;
        END;
    END IF; 
    
END;
$$ LANGUAGE plpgsql;

-- SELECT * FROM quotas.tb_subject where id_subject < 20;
-- select * from quotas.sp_subject_read( );
-- select * from quotas.sp_subject_read(2671);
-- select * from quotas.sp_subject_read(3);
-- DELETE FROM quotas.tb_subject WHERE id_subject > 63;
-- select quotas.sp_subject('CREATE', -1, 0, 2147483647, 'Antarctic' );
-- select quotas.sp_subject('CREATE', -1, 0, 2147483647, 'Indian ocean', 'IO' );
-- select quotas.sp_subject('CREATE', -1, 0, 2147483647, 'Pacific ocean', 'PO' );
-- select quotas.sp_subject('PATCH', 1,  0, 2147483647, 'Atlantic ocean', 're1' );
-- select quotas.sp_subject('PATCH', 2, 0, 2147483647, 'South ocean', 'ку2' );
-- select quotas.sp_subject('PATCH', 3, 0, 2147483647, 'Pacific ocean', 'Pку3O' );
-- select quotas.sp_subject('REMOVE', 1 );
-- select quotas.sp_subject('REMOVE', 2 );
-- select quotas.sp_subject('REMOVE', 3 );
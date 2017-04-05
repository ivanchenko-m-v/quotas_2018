-- =============================================================================
-- db_quotas_2018
-- sp_user_ar - функции сервера для работы с данными 'пользователь ВБР'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  05-04-2017
-- Дата обновления:         05-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================

/*
*/
CREATE OR REPLACE FUNCTION sp_user_ar( IN action varchar(6), IN u tb_user_ar ) 
RETURNS INT
AS
$$
BEGIN
    IF action='INSERT' THEN
        BEGIN
            PERFORM check_user_ar( u );
        END;
    END IF;
-- RETURN ROW_COUNT;
END;
$$ LANGUAGE plpgsql;

/*
    user_ar_insert( IN u tb_user_ar  ) 
    - процедура вставки записи данных tb_user_ar
    параметры:
        u - данные записи tb_user_ar
    вызывает исключение в случаях:
        - длина названия пользователя ВБР user_ar слишком мала (менее 3х символов)
    возвращает:
        запись БД tb_user_ar,заполненную вновь вставленными кодами id_user_ar_key, id_user_ar
*/
CREATE OR REPLACE FUNCTION user_ar_insert( INOUT u tb_user_ar  ) 
RETURNS tb_user_ar
AS
$$
BEGIN
    PERFORM user_ar_check( u );
    INSERT INTO public.tb_user_ar 
    	SELECT (MAX(id_user_ar_key)+1) AS id_user_ar_key, 
        (MAX(id_user_ar_key)+1) AS id_user_ar,
        u.date_reorganize, u.id_user_ar_fms, u.id_dbrecord_operation,
        u.legal_entity, u.date_registration, u.user_ar, u.shipowner,
        u.title_full, u.case_number, u.form_of_ownership, u.director,
        u.address, u.postal_address, u.phone, u.fax, u.telex,
        u.e_mail, u.inn, u.kpp, u.ogrn, u.okpo, u.okved, u.kopf, u.kfs, u.note
        FROM public.tb_user_ar
     RETURNING * INTO u;
END;
$$ LANGUAGE plpgsql;

-- ver 2
CREATE OR REPLACE FUNCTION user_ar_insert( IN x_user varchar(256)  ) 
RETURNS void
AS
$$
BEGIN
    IF length(x_user) < 3 THEN
 		RAISE EXCEPTION 'Too short LENGTH of user_ar title. The length of user_ar title must be more than 3 characters.';
    END IF;
    INSERT INTO public.tb_user_ar (id_user_ar_key,id_user_ar,user_ar)
    	SELECT (MAX(id_user_ar_key)+1) AS id_user_ar_key, 
        	   (MAX(id_user_ar_key)+1) AS id_user_ar, 
               x_user
               FROM public.tb_user_ar;
END;
$$ LANGUAGE plpgsql;

-- DROP function user_ar_insert( tb_user_ar  );
-- select user_ar_insert( 'GeoПупсики Заполярья'  );
-- select * from user_ar_insert( (0,0,'1900-01-01',0,1,TRUE,current_date,'Рыбколхоз ''Пупсик''','','','','','','','','','','','','','','','','','','','','') );
-- select user_ar_check( (0,0,'1900-01-01',0,0,TRUE,'1900-01-01','','','','','','','','','','','','','','','','','','','','','') );
-- drop function user_ar_check( tb_user_ar );
-- delete from tb_user_ar where user_ar like '%упс%';

/*
    delete_user_ar( IN id int )
    - процедура проверки данных tb_user_ar, переданных для вставки/изменения
    параметры:
        u - данные записи tb_user_ar
    вызывает исключение в случаях:
        - длина названия пользователя ВБР user_ar слишком мала (менее 3х символов)
*/
CREATE OR REPLACE FUNCTION delete_user_ar( IN id int ) 
RETURNS void
AS
$$
BEGIN
    DELETE FROM tb_user_ar WHERE tb_user_ar.id_user_ar_key=id;
END;
$$ LANGUAGE plpgsql;

/*
    user_ar_check( IN u tb_user_ar )
    - процедура проверки данных tb_user_ar, переданных для вставки/изменения
    параметры:
        u - данные записи tb_user_ar
    вызывает исключение в случаях:
        - длина названия пользователя ВБР user_ar слишком мала (менее 3х символов)
*/
CREATE OR REPLACE FUNCTION user_ar_check( IN u tb_user_ar ) 
RETURNS void
AS
$$
BEGIN
    IF length(u.user_ar) < 3 THEN
 		RAISE EXCEPTION 'Too short LENGTH of user_ar title. The length of user_ar title must be more than 3 characters.';
    END IF;
END;
$$ LANGUAGE plpgsql;


/*
    sp_user_ar( IN x_filter varchar(6) ) 
    - процедура выборки данных из таблицы tb_user_ar
    параметры:
        x_filter - часть наименования или ИНН для фильтрации значений
    возвращает:
        набор записей, содержащих значение фильтра в полях (user_ar, title_full, inn)
*/
CREATE OR REPLACE FUNCTION sp_user_ar( IN x_filter varchar(6) ) 
RETURNS TABLE (item tb_user_ar)
AS
$sp_user_ar$
DECLARE
	xlike text;
BEGIN
    IF length(x_filter) > 256 THEN
		RAISE EXCEPTION 'Too long LENGTH of filter. Filter length for tb_user_ar must be less than 256';
		RETURN;
    END IF;
    
	xlike := concat('%', x_filter, '%'); 
    IF length(x_filter) > 0 THEN
    BEGIN
    	RETURN QUERY
            SELECT  tb_user_ar.*
                FROM public.tb_user_ar
                WHERE (user_ar LIKE xlike)OR
                      (title_full LIKE xlike)OR
                      (inn LIKE xlike);
    END;
    ELSE
    	RETURN QUERY
            SELECT  tb_user_ar.* 
                FROM public.tb_user_ar;
   END IF;
END;
$sp_user_ar$ LANGUAGE plpgsql;

-- tests
-- select (sp_user_ar('oo')).*;
-- select sp_user_ar('oo');
/*
    -- for rising exception
	select sp_user_ar(
					concat('oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
					'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo')
                    );
*/

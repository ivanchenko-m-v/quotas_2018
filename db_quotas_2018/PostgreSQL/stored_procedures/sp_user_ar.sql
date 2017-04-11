-- =============================================================================
-- db_quotas_2018
-- sp_user_ar - функции сервера для работы с данными 'пользователь ВБР'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  05-04-2017
-- Дата обновления:         07-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================

/*
    sp_user_ar( ... ) 
    - процедура вставки/обновления записи данных tb_user_ar
    параметры:
        p_action - 'NEW' - новый пользователь ВБР, 'CORRECT' - корректировка значений полей
        p_<PAR>  - значения полей записи данных tb_user_ar
    вызывает исключение в случаях:
        - длина названия пользователя ВБР user_ar слишком мала (менее 3х символов)
        - p_id_user_ar_key<=0 при обновлении записи
*/
CREATE OR REPLACE FUNCTION sp_user_ar( 
                                        p_action VARCHAR(10), 
                                        p_id_user_ar_key INT,           -- 0 для action='NEW', <> 0 для action='CORRECT'
                                        p_id_user_ar_fms INT,           -- Код пользователя ВБР/владельца доли в ОСМ
                                        p_legal_entity BOOLEAN,         -- Признак юр.лицо/инд.предприниматель
                                        p_user_ar VARCHAR(256),			-- Название пользователя ВБР
                                        p_shipowner VARCHAR(256),		-- Наименование судовладельца в ОСМ
                                        p_title_full VARCHAR(256),		-- Полное название пользователя ВБР/владельца доли
                                        p_case_number VARCHAR(24),		-- Номер дела пользователя ВБР
                                        p_form_of_ownership VARCHAR(24),-- Текстовая аббревиатура формы собственности
                                        p_director VARCHAR(32),			-- ФИО руководителя и должность
                                        p_address VARCHAR(255),			-- Юридический адрес
                                        p_postal_address VARCHAR(255),	-- Почтовый адрес
                                        p_phone VARCHAR(64),			-- Телефон, включая междугородний код
                                        p_fax VARCHAR(32),				-- Факс, включая междугородний код
                                        p_telex VARCHAR(32),			-- Телекс
                                        p_e_mail VARCHAR(32),			-- E-mail
                                        p_inn VARCHAR(16),				-- ИНН
                                        p_kpp VARCHAR(16),				-- КПП
                                        p_ogrn VARCHAR(64),				-- ОГРН
                                        p_OKPO VARCHAR(24),				-- ОКПО
                                        p_OKATO VARCHAR(24),			-- ОКАТО
                                        p_OKVED VARCHAR(24),			-- ОКВЭД
                                        p_KOPF VARCHAR(2),				-- ОКОПФ
                                        p_KFS VARCHAR(2),				-- ОКФС
                                        p_note VARCHAR(255)				-- Примечание
                                     ) 
RETURNS void
AS
$$
BEGIN
    IF length(p_user_ar) < 3 THEN
 		RAISE EXCEPTION 'Too short LENGTH of user_ar title. The length of user_ar title must be more than 3 characters.';
    END IF;
   -- новый пользователь ВБР
    IF p_action='NEW' THEN
        -- вставка записи в таблицу БД
        INSERT INTO public.tb_user_ar
            (
                id_user_ar_key, 
                id_user_ar,
                id_user_ar_fms, 
                id_dbrecord_operation,  --  = 1, 'user_ar NEW'
                legal_entity,           -- Признак юр.лицо/инд.предприниматель
                user_ar,			    -- Название пользователя ВБР
                shipowner,		        -- Наименование судовладельца в ОСМ
                title_full,		        -- Полное название пользователя ВБР/владельца доли
                case_number,		    -- Номер дела пользователя ВБР
                form_of_ownership,	    -- Текстовая аббревиатура формы собственности
                director,			    -- ФИО руководителя и должность
                address,			    -- Юридический адрес
                postal_address,	        -- Почтовый адрес
                phone,				    -- Телефон, включая междугородний код
                fax,				    -- Факс, включая междугородний код
                telex,				    -- Телекс
                e_mail,			        -- E-mail
                inn,				    -- ИНН
                kpp,				    -- КПП
                ogrn,				    -- ОГРН
                OKPO,				    -- ОКПО
                OKATO,				    -- ОКАТО
                OKVED,				    -- ОКВЭД
                KOPF,				    -- ОКОПФ
                KFS,				    -- ОКФС
                note   			        -- Примечание
            )
            SELECT  (MAX(id_user_ar_key)+1) AS id_user_ar_key, 
                    (MAX(id_user_ar_key)+1) AS id_user_ar,
                    p_id_user_ar_fms, 
                    1,                  -- id_dbrecord_operation = 1, 'user_ar NEW'
                    p_legal_entity,     -- Признак юр.лицо/инд.предприниматель
                    p_user_ar,			-- Название пользователя ВБР
                    p_shipowner,		-- Наименование судовладельца в ОСМ
                    p_title_full,		-- Полное название пользователя ВБР/владельца доли
                    p_case_number,		-- Номер дела пользователя ВБР
                    p_form_of_ownership,-- Текстовая аббревиатура формы собственности
                    p_director,			-- ФИО руководителя и должность
                    p_address,			-- Юридический адрес
                    p_postal_address,	-- Почтовый адрес
                    p_phone,			-- Телефон, включая междугородний код
                    p_fax,				-- Факс, включая междугородний код
                    p_telex,			-- Телекс
                    p_e_mail,			-- E-mail
                    p_inn,				-- ИНН
                    p_kpp,				-- КПП
                    p_ogrn,				-- ОГРН
                    p_OKPO,				-- ОКПО
                    p_OKATO,			-- ОКАТО
                    p_OKVED,			-- ОКВЭД
                    p_KOPF,				-- ОКОПФ
                    p_KFS,				-- ОКФС
                    p_note   			-- Примечание
             FROM public.tb_user_ar;
    END IF;
    -- исправление ошибок, изменение полей
    IF p_action='CORRECT' THEN
    	BEGIN
            IF p_id_user_ar_key<=0 THEN
                RAISE EXCEPTION 'Invalid id_user_ar_key=%1 for CORRECT operation.', p_id_user_ar_key;
            END IF;
            UPDATE public.tb_user_ar SET
                    id_dbrecord_operation=2,                -- id_dbrecord_operation = 2, 'user_ar CORRECT FIELD VALUES'
                    legal_entity=p_legal_entity,            -- Признак юр.лицо/инд.предприниматель
                    user_ar=p_user_ar,			            -- Название пользователя ВБР
                    shipowner=p_shipowner,		            -- Наименование судовладельца в ОСМ
                    title_full=p_title_full,		        -- Полное название пользователя ВБР/владельца доли
                    case_number=p_case_number,		        -- Номер дела пользователя ВБР
                    form_of_ownership=p_form_of_ownership,  -- Текстовая аббревиатура формы собственности
                    director=p_director,			        -- ФИО руководителя и должность
                    address=p_address,			            -- Юридический адрес
                    postal_address=p_postal_address,	    -- Почтовый адрес
                    phone=p_phone,				            -- Телефон, включая междугородний код
                    fax=p_fax,				                -- Факс, включая междугородний код
                    telex=p_telex,			                -- Телекс
                    e_mail=p_e_mail,			            -- E-mail
                    inn=p_inn,				                -- ИНН
                    kpp=p_kpp,				                -- КПП
                    ogrn=p_ogrn,				            -- ОГРН
                    OKPO=p_OKPO,				            -- ОКПО
                    OKATO=p_OKATO,			                -- ОКАТО
                    OKVED=p_OKVED,			                -- ОКВЭД
                    KOPF=p_KOPF,				            -- ОКОПФ
                    KFS=p_KFS,				                -- ОКФС
                    note=p_note   			                -- Примечание
            WHERE  id_user_ar_key=p_id_user_ar_key;
        END;
    END IF;
END;
$$ LANGUAGE plpgsql;
/*
-- test NEW
select sp_user_ar( 
                  'NEW', 
                  0,           -- 0 для action='NEW', <> 0 для action='CORRECT'
                  0,           -- Код пользователя ВБР/владельца доли в ОСМ
                  TRUE,         -- Признак юр.лицо/инд.предприниматель
                  'ООО ''Морские гребешки''',			-- Название пользователя ВБР
                  'SudowladeleTS',		-- Наименование судовладельца в ОСМ
                  'Общество с ограниченной ответственностью ''Морские гребешки''',		-- Полное название пользователя ВБР/владельца доли
                  'case #245',		-- Номер дела пользователя ВБР
                  'LTD',-- Текстовая аббревиатура формы собственности
                  'Пупсиков Сергей Сысоевич',			-- ФИО руководителя и должность
                  '127000, Останкино',			-- Юридический адрес
                  '789065, Сахалин',	-- Почтовый адрес
                  '(789)065-09-87',			-- Телефон, включая междугородний код
                  '(789)065-09-97',				-- Факс, включая междугородний код
                  'GREBESHOK',			-- Телекс
                  'GREBESHOK@sea.org',			-- E-mail
                  '123456789',				-- ИНН
                  '987456321',				-- КПП
                  '077 2354 884564',				-- ОГРН
                  '456',				-- ОКПО
                  '789',			-- ОКАТО
                  '654',			-- ОКВЭД
                  '22',				-- ОКОПФ
                  '55',				-- ОКФС
                  'Добавлен новый Пользователь ВБР'				-- Примечание
                                     );
-- test CORRECT
select sp_user_ar( 
                  'CORRECT', 
                  5,           -- 0 для action='NEW', <> 0 для action='CORRECT'
                  786,           -- Код пользователя ВБР/владельца доли в ОСМ
                  FALSE,         -- Признак юр.лицо/инд.предприниматель
                  'ИП ''Петушков Х.Х.''',			-- Название пользователя ВБР
                  'туц SudowladeleTS',		-- Наименование судовладельца в ОСМ
                  'Индивидуальный Предприниматель ''Петушков Х.Х.''',		-- Полное название пользователя ВБР/владельца доли
                  'дело #245',		-- Номер дела пользователя ВБР
                  'ИП',-- Текстовая аббревиатура формы собственности
                  'Петушков Хасан Харисович',			-- ФИО руководителя и должность
                  '127000, Останкино, ул.Королёва,12',			-- Юридический адрес
                  '789065, Сахалин, г.Поронайск',	-- Почтовый адрес
                  '(789)065-09-87;(495)365-09-87',			-- Телефон, включая междугородний код
                  '(789)065-09-97;(495)365-09-87',				-- Факс, включая междугородний код
                  'GREBESHOK-ПЕТУШОК',			-- Телекс
                  'pxx@sea.org',			-- E-mail
                  '987456321',				-- ИНН
                  '123456789',				-- КПП
                  '884564 077 2354',				-- ОГРН
                  '4568765',				-- ОКПО
                  '3256',			-- ОКАТО
                  '9854',			-- ОКВЭД
                  '77',				-- ОКОПФ
                  '11',				-- ОКФС
                  'Был гребешок, стал петушок'				-- Примечание
                                     );
-- select * from TB_user_ar_audit; 
-- select * from TB_user_ar;
*/

/*
*/
CREATE OR REPLACE FUNCTION sp_user_ar_reorganize( 
                                        p_action VARCHAR(10), 
                                        p_id_user_ar_key INT,           -- <> 0 для action='REORGANIZE'
                                        p_id_user_ar_fms INT,           -- Код пользователя ВБР/владельца доли в ОСМ
                                        p_legal_entity BOOLEAN,         -- Признак юр.лицо/инд.предприниматель
                                        p_user_ar VARCHAR(256),			-- Название пользователя ВБР
                                        p_shipowner VARCHAR(256),		-- Наименование судовладельца в ОСМ
                                        p_title_full VARCHAR(256),		-- Полное название пользователя ВБР/владельца доли
                                        p_case_number VARCHAR(24),		-- Номер дела пользователя ВБР
                                        p_form_of_ownership VARCHAR(24),-- Текстовая аббревиатура формы собственности
                                        p_director VARCHAR(32),			-- ФИО руководителя и должность
                                        p_address VARCHAR(255),			-- Юридический адрес
                                        p_postal_address VARCHAR(255),	-- Почтовый адрес
                                        p_phone VARCHAR(64),			-- Телефон, включая междугородний код
                                        p_fax VARCHAR(32),				-- Факс, включая междугородний код
                                        p_telex VARCHAR(32),			-- Телекс
                                        p_e_mail VARCHAR(32),			-- E-mail
                                        p_inn VARCHAR(16),				-- ИНН
                                        p_kpp VARCHAR(16),				-- КПП
                                        p_ogrn VARCHAR(64),				-- ОГРН
                                        p_OKPO VARCHAR(24),				-- ОКПО
                                        p_OKATO VARCHAR(24),			-- ОКАТО
                                        p_OKVED VARCHAR(24),			-- ОКВЭД
                                        p_KOPF VARCHAR(2),				-- ОКОПФ
                                        p_KFS VARCHAR(2),				-- ОКФС
                                        p_note VARCHAR(255)				-- Примечание
                                                 ) 
RETURNS void
AS
$$
BEGIN
    -- реорганизация
    IF p_action='REORGANIZE' THEN
        BEGIN
        END;
    END IF;
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
    -- если есть фильтр - фильтруем
    IF length(x_filter) > 0 THEN
    BEGIN
    	RETURN QUERY
            SELECT  tb_user_ar.*
                FROM public.tb_user_ar
                WHERE (
                          (user_ar LIKE xlike)OR
                          (title_full LIKE xlike)OR
                          (inn LIKE xlike)
                      ) AND
                      ( date_reorganize='1900-01-01' ); -- выбираем только нереорганизованных
    END;
     -- если нет фильтра - выбираем все
   ELSE
    	RETURN QUERY
            SELECT  tb_user_ar.* 
                FROM public.tb_user_ar
                WHERE ( date_reorganize='1900-01-01' ); -- выбираем только нереорганизованных
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

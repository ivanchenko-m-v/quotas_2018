-- =============================================================================
-- db_quotas_2018
-- sp_cnn_client - функции сервера для выборки параметров соединения 
-- 				   пользователя с БД
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  19-04-2017
-- Дата обновления:         20-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
DROP FUNCTION IF EXISTS cnn.sp_cnn_client(VARCHAR,VARCHAR);
CREATE OR REPLACE FUNCTION cnn.sp_cnn_client(
									p_lgn VARCHAR(16),
									p_hsh VARCHAR(32)
											)
RETURNS TEXT
AS
$$
	DECLARE retval TEXT;
BEGIN
	IF NOT EXISTS( SELECT client FROM cnn.tb_cnn WHERE ((lgn=p_lgn)AND(hsh=p_hsh)) ) THEN
        	RAISE EXCEPTION 'LOGIN OR PASSWORD NOT CORRECT FOR LOGIN=''%'' ', p_lgn;
    END IF;
    -- form return value
    SELECT concat(cnn.tb_cnn.client,'###',cnn.tb_cnn.input) AS cnn_text
    	INTO retval
        FROM cnn.tb_cnn WHERE ((lgn=p_lgn)AND(hsh=p_hsh));
    RETURN retval;
END;
$$ 
LANGUAGE plpgsql;
/**
*			TEST
*/
DROP FUNCTION IF EXISTS cnn.sp_cnn_client( );
CREATE OR REPLACE FUNCTION cnn.sp_cnn_client( )
RETURNS TEXT
AS
$$
	DECLARE retval TEXT;
BEGIN
	IF NOT EXISTS( SELECT client FROM cnn.tb_cnn ) THEN
        	RAISE EXCEPTION 'LOGIN OR PASSWORD NOT CORRECT';
    END IF;
    -- form return value
    SELECT concat(cnn.tb_cnn.client,'###',cnn.tb_cnn.input) AS cnn
    	INTO retval
        FROM cnn.tb_cnn LIMIT 1;
    RETURN retval;
END;
$$ 
LANGUAGE plpgsql;
-- test
-- select cnn.sp_cnn_client( 'ban', '');
-- 
-- select cnn.sp_cnn_client( 'ban', 'x5x6');
-- select cnn.sp_cnn_client( );


/*
drop function if exists cnn.puk();
create or replace function cnn.puk() returns int 
as
$$
	declare i_val1 int=9;
    declare i_val2 int=19;
begin
	return (i_val1*i_val2);
end;
$$ LANGUAGE plpgsql;
-- select cnn.puk();

drop function if exists cnn.puk_text();
create or replace function cnn.puk_text() returns text 
as
$$
	declare i_val1 int=9;
    declare i_val2 int=19;
begin
	return concat(i_val1,i_val2);
end;
$$ LANGUAGE plpgsql;
-- select cnn.puk_text();
*/

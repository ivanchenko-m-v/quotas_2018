-- =============================================================================
-- db_quotas_2018
-- trigger_user_ar_insert - триггер на операцию вставки записи в таблицу
--                          tb_user_ar
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  29-03-2017
-- Дата обновления:         04-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
-- ######################## trigger func #######################################
CREATE OR REPLACE FUNCTION after_user_ar_operation( )
RETURNS TRIGGER
AS
$after_user_ar_operation$
    BEGIN
        -- when DELETE tb_user_ar
        IF( TG_OP = 'DELETE' ) THEN
            INSERT INTO tb_user_ar_audit
                SELECT current_date, current_time, 'D', OLD.*;
            RETURN OLD;
        END IF;
        -- when UPDATE tb_user_ar
        IF( TG_OP = 'UPDATE' ) THEN
             INSERT INTO tb_user_ar_audit
                SELECT current_date, current_time, 'U', NEW.*; -- , current_user
            RETURN NEW;
        END IF;
        -- when UPDATE tb_user_ar
        IF( TG_OP = 'INSERT' ) THEN
             INSERT INTO tb_user_ar_audit
                SELECT current_date, current_time, 'I', NEW.*;
            RETURN NEW;
        END IF;
        -- AFTER operation must return NULL
        RETURN NULL; 
    END;
$after_user_ar_operation$ LANGUAGE plpgsql;

-- ########################### trigger #########################################
CREATE TRIGGER trigger_user_ar_after_IUD
AFTER INSERT OR UPDATE OR DELETE ON tb_user_ar
    FOR EACH ROW EXECUTE PROCEDURE after_user_ar_operation( );
    
-- DROP TRIGGER trigger_user_ar_after_IUD ON tb_user_ar;
-- DROP FUNCTION after_user_ar_operation( );
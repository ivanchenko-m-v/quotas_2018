-- =============================================================================
-- db_quotas_2018
-- sp_aquatic_resource - функции сервера для работы с данными 'ВБР'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  11-04-2017
-- Дата обновления:         11-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================

/*
    sp_aquatic_resource( p_id_ar int, p_ar varchar(64) ) 
    - процедура вставки/обновления записи данных tb_aquatic_resource
    параметры:
        p_id_ar - id_aquatic_resource
        p_ar    - aquatic_resource
    вызывает исключение в случаях:
        - длина названия ВБР user_ar слишком мала (менее 3х символов)
*/
CREATE OR REPLACE FUNCTION sp_aquatic_resource( p_id_ar INT, p_ar VARCHAR(64) )
RETURNS void
AS
$$
BEGIN
	IF length(p_ar)<3 THEN
    	RAISE EXCEPTION 'Must be specified the title of aquatic resource';
    END IF;
    
    IF p_id_ar=0 THEN
        BEGIN
            IF NOT EXISTS(SELECT id_aquatic_resource FROM public.tb_aquatic_resource) THEN
                INSERT INTO public.tb_aquatic_resource (id_aquatic_resource, aquatic_resource)
                    VALUES( 1, p_ar );
            ELSE
                INSERT INTO public.tb_aquatic_resource (id_aquatic_resource, aquatic_resource)
                    SELECT max(id_aquatic_resource)+1, p_ar FROM public.tb_aquatic_resource;
            END IF;
            RETURN;
        END;
    END IF;
    
    IF NOT EXISTS(SELECT id_aquatic_resource from public.tb_aquatic_resource where id_aquatic_resource=p_id_ar) THEN
        INSERT INTO public.tb_aquatic_resource (id_aquatic_resource, aquatic_resource)
            VALUES (p_id_ar, p_ar);
    ELSE
        update public.tb_aquatic_resource set aquatic_resource=p_ar
            where id_aquatic_resource=p_id_ar;
    END IF;
END;
$$
LANGUAGE plpgsql;

/*
    sp_aquatic_resource( 
                        p_id_ar int, p_id_ar_fms int, p_sort_order int,
                        p_ar varchar(64), p_ar_title_by_order varchar(64)
                       ) 
    - процедура вставки/обновления записи данных tb_aquatic_resource
    параметры:
        p_id_ar             - id_aquatic_resource
        p_id_ar_fms         - id_ar_fms
        p_sort_order        - sort_order
        p_ar                - aquatic_resource
        p_ar_title_by_order - ar_title_by_order
    вызывает исключение в случаях:
        - длина названия ВБР user_ar слишком мала (менее 3х символов)
*/
CREATE OR REPLACE FUNCTION 
                            sp_aquatic_resource( 
                                                p_id_ar int, p_id_ar_fms int, p_sort_order int,
                                                p_ar varchar(64), p_ar_title_by_order varchar(64)
                                               ) 
RETURNS void
AS
$$
BEGIN
	IF length(p_ar)<3 THEN
    	RAISE EXCEPTION 'Must be specified the title of aquatic resource';
    END IF;
    
    IF p_id_ar=0 THEN
        BEGIN
            IF NOT EXISTS(SELECT id_aquatic_resource FROM public.tb_aquatic_resource) THEN
                INSERT INTO public.tb_aquatic_resource (id_aquatic_resource, id_ar_fms, sort_order,
                                                        aquatic_resource, ar_title_by_order)
                    VALUES( 1, p_id_ar_fms, p_sort_order, p_ar, p_ar_title_by_order );
            ELSE
                INSERT INTO public.tb_aquatic_resource (id_aquatic_resource, id_ar_fms, sort_order,
                                                        aquatic_resource, ar_title_by_order)
                    SELECT max(id_aquatic_resource)+1, p_id_ar_fms, p_sort_order, p_ar, p_ar_title_by_order
                        FROM public.tb_aquatic_resource;
            END IF;
            RETURN;
        END;
    END IF;
    
    IF NOT EXISTS(SELECT id_aquatic_resource from public.tb_aquatic_resource WHERE id_aquatic_resource=p_id_ar) THEN
        INSERT INTO public.tb_aquatic_resource (id_aquatic_resource, id_ar_fms, sort_order,
                                                aquatic_resource, ar_title_by_order)
            VALUES( p_id_ar, p_id_ar_fms, p_sort_order, p_ar, p_ar_title_by_order );
    ELSE
        UPDATE public.tb_aquatic_resource SET id_ar_fms=p_id_ar_fms, sort_order=p_sort_order,
                                              aquatic_resource=p_ar, ar_title_by_order=p_ar_title_by_order
            WHERE id_aquatic_resource=p_id_ar;
    END IF;
END;
$$
LANGUAGE plpgsql;

-- SELECT sp_aquatic_resource( 1, 'Good fish-Хорошая рыбка');
-- SELECT sp_aquatic_resource( 0, 123456, 99999, 'Барабулина', 'вставлена барабулина');
/*
begin work;
        insert into public.tb_aquatic_resource (id_aquatic_resource, aquatic_resource)
            values (0, '');
        update public.tb_aquatic_resource set id_aquatic_resource=1, aquatic_resource='ar'
            where id_aquatic_resource=0;
commit;
-- rollback;
            insert into public.tb_aquatic_resource (id_aquatic_resource, aquatic_resource)
                select max(id_aquatic_resource)+1, 'good fish' from public.tb_aquatic_resource;
*/                

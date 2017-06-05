-- выявление дубликатов 
SELECT SUBJECT, COUNT(ID_SUBJECT)
	FROM q09.SUBJECT
    GROUP BY SUBJECT
    HAVING COUNT(ID_SUBJECT)>1;
-- 2612,399 З.Беринг.зап.ч(СЗТО)
-- 2611,398 З.Беринг.вост.ч.(СЗТО) НА 02.06.2017 ИМЕЮТ ДУБЛИКАТЫ, НО НЕ ИМЕЮТ ОДУ,ДОЛЕЙ,КВОТ,ДАННЫХ ВЫЛОВА
SELECT ID_SUBJECT, SUBJECT FROM Q09.SUBJECT 
	WHERE SUBJECT IN (SELECT SUBJECT
                        FROM q09.SUBJECT
                        GROUP BY SUBJECT
                        HAVING COUNT(ID_SUBJECT)>1)
                        AND
                      (ID_SUBJECT NOT IN (SELECT ID_SUBJECT FROM Q09.LIMITS_CATCH) ) AND
                      (ID_SUBJECT NOT IN (SELECT ID_SUBJECT FROM Q09.LIMITS_COMMON) ) AND
                      (ID_SUBJECT NOT IN (SELECT ID_SUBJECT FROM Q09.LIMITS_BASE) ) AND
                      (ID_SUBJECT NOT IN (SELECT ID_SUBJECT FROM Q09.LIMITS) ) AND
                      (ID_SUBJECT NOT IN (SELECT ID_SUBJECT FROM Q09.PORTION) );
-- очистка целевой таблицы
DELETE FROM quotas.tb_SUBJECT;
-- перенос данных
INSERT INTO quotas.tb_SUBJECT (id_SUBJECT, id_SUBJECT_fms, sort_order, SUBJECT, SUBJECT_title_by_order)
	SELECT id_SUBJECT, 
    		CASE WHEN  id_SUBJECT_osm is not null
            	THEN id_SUBJECT_osm
                ELSE 0
            END, 
            sorting, 
            SUBJECT, 
    		CASE WHEN SUBJECT_order is not null
            	THEN SUBJECT_order
                ELSE ''
            END 
    	FROM q09.SUBJECT;

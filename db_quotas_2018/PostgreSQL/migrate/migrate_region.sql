-- выявление дубликатов 
SELECT REGION, COUNT(ID_REGION)
	FROM q09.region
    GROUP BY REGION
    HAVING COUNT(ID_REGION)>1;
-- 2612,399 З.Беринг.зап.ч(СЗТО)
-- 2611,398 З.Беринг.вост.ч.(СЗТО) НА 02.06.2017 ИМЕЮТ ДУБЛИКАТЫ, НО НЕ ИМЕЮТ ОДУ,ДОЛЕЙ,КВОТ,ДАННЫХ ВЫЛОВА
SELECT ID_REGION, REGION FROM Q09.REGION 
	WHERE REGION IN (SELECT REGION
                        FROM q09.region
                        GROUP BY REGION
                        HAVING COUNT(ID_REGION)>1)
                        AND
                      (ID_REGION NOT IN (SELECT ID_REGION FROM Q09.LIMITS_CATCH) ) AND
                      (ID_REGION NOT IN (SELECT ID_REGION FROM Q09.LIMITS_COMMON) ) AND
                      (ID_REGION NOT IN (SELECT ID_REGION FROM Q09.LIMITS_BASE) ) AND
                      (ID_REGION NOT IN (SELECT ID_REGION FROM Q09.LIMITS) ) AND
                      (ID_REGION NOT IN (SELECT ID_REGION FROM Q09.PORTION) );
-- очистка целевой таблицы
DELETE FROM quotas.tb_region;
-- перенос данных
INSERT INTO quotas.tb_region (id_region, id_region_fms, sort_order, region, region_title_by_order)
	SELECT id_region, 
    		CASE WHEN  id_region_osm is not null
            	THEN id_region_osm
                ELSE 0
            END, 
            sorting, 
            region, 
    		CASE WHEN region_order is not null
            	THEN region_order
                ELSE ''
            END 
    	FROM q09.region;

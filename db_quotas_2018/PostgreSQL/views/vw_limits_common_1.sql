-- =============================================================================
-- db_quotas_2018
-- vw_limits_common_1 - представления для отображения ОДУ по видам квот
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  16-05-2017
-- Дата обновления:         16-05-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================

DROP VIEW IF EXISTS q09.vw_limits_common_1 CASCADE;

CREATE VIEW q09.vw_limits_common_1 AS
(
    SELECT 
           T1.id_basin
          ,T1.id_fish
          ,T1.id_region
          ,T1.id_unit
          ,T1.id_subject
          ,B.basin
          ,F.fish
          ,R.region
          ,S.subject
          ,EXTRACT(YEAR FROM T1.date_) as _year
          ,T1.catch_volume as catch_volume_1
      FROM ((((q09.limits_common T1 INNER JOIN q09.basin B ON T1.id_basin=B.id_basin)
    		INNER JOIN q09.fish F ON T1.id_fish=F.id_fish)
    		INNER JOIN q09.region R ON T1.id_region=R.id_region)
            INNER JOIN q09.subject S ON T1.id_subject=S.id_subject)
            WHERE (T1.catch_volume>0)AND(T1.id_regime=1)AND(T1.id_unit=168)AND
    			   (T1.document_date IN (SELECT MAX(DD.document_date) 
                                            FROM q09.limits_common DD
                                            WHERE (DD.id_regime=1)AND(DD.id_unit=T1.id_unit)AND(DD.id_subject=T1.id_subject)AND
                                                  (DD.id_region=T1.id_region)AND(DD.id_fish=T1.id_fish)AND
                                                  (EXTRACT(YEAR FROM DD.date_)=EXTRACT(YEAR FROM T1.date_))
                                       )
                   )
            ORDER BY T1.id_basin,T1.id_fish,T1.id_region,EXTRACT(YEAR FROM T1.date_)
);
-- SELECT * FROM q09.vw_limits_common_1;

DROP VIEW IF EXISTS q09.vw_limits_common_12 CASCADE;

CREATE VIEW q09.vw_limits_common_12 AS
(
    SELECT 
           T1.id_basin
          ,T1.id_fish
          ,T1.id_region
          ,T1.id_unit
          ,T1.id_subject
          ,B.basin
          ,F.fish
          ,R.region
          ,S.subject
          ,EXTRACT(YEAR FROM T1.date_) as _year
          ,T1.catch_volume as catch_volume_1
      FROM ((((q09.limits_common T1 INNER JOIN q09.basin B ON T1.id_basin=B.id_basin)
    		INNER JOIN q09.fish F ON T1.id_fish=F.id_fish)
    		INNER JOIN q09.region R ON T1.id_region=R.id_region)
            INNER JOIN q09.subject S ON T1.id_subject=S.id_subject)
            WHERE (T1.catch_volume>0)AND(T1.id_regime=12)AND(T1.id_unit=168)AND
    			   (T1.document_date IN (SELECT MAX(DD.document_date) 
                                            FROM q09.limits_common DD
                                            WHERE (DD.id_regime=12)AND(DD.id_unit=T1.id_unit)AND(DD.id_subject=T1.id_subject)AND
                                                  (DD.id_region=T1.id_region)AND(DD.id_fish=T1.id_fish)AND
                                                  (EXTRACT(YEAR FROM DD.date_)=EXTRACT(YEAR FROM T1.date_))
                                       )
                   )
            ORDER BY T1.id_basin,T1.id_fish,T1.id_region,EXTRACT(YEAR FROM T1.date_)

);

-- SELECT * FROM q09.vw_limits_common_12;
DROP TABLE IF EXISTS q09.tb_limits_common;
CREATE TABLE q09.tb_limits_common
(
    id_basin INTEGER NOT NULL,
    id_fish INTEGER NOT NULL,
    id_region INTEGER NOT NULL,
    id_unit INTEGER NOT NULL,
    id_subject INTEGER NOT NULL,
    nYEAR INTEGER NOT NULL,
    basin VARCHAR(128)  NOT NULL DEFAULT '',
    fish VARCHAR(128)  NOT NULL DEFAULT '',
    region VARCHAR(128)  NOT NULL DEFAULT '',
    subject VARCHAR(128)  NOT NULL DEFAULT '',
    catch_volume_1 NUMERIC (38,17) NOT NULL default 0.0,
    catch_volume_12 NUMERIC (38,17) NOT NULL default 0.0,
    CONSTRAINT PK_tb_limits_common PRIMARY KEY 
    (
        id_region,
        id_fish,
        id_unit,
        id_subject,
        nYEAR
    )
);
delete from q09.tb_limits_common;
-- id_regime=1
INSERT INTO q09.tb_limits_common (id_basin, id_fish, id_region, id_unit, id_subject, basin, fish, region, subject, nYEAR, catch_volume_1)
    SELECT 
           T1.id_basin
          ,T1.id_fish
          ,T1.id_region
          ,T1.id_unit
          ,T1.id_subject
          ,B.basin
          ,F.fish
          ,R.region
          ,S.subject
          ,EXTRACT(YEAR FROM T1.date_) as _year
          ,T1.catch_volume as catch_volume_1
      FROM ((((q09.limits_common T1 INNER JOIN q09.basin B ON T1.id_basin=B.id_basin)
    		INNER JOIN q09.fish F ON T1.id_fish=F.id_fish)
    		INNER JOIN q09.region R ON T1.id_region=R.id_region)
            INNER JOIN q09.subject S ON T1.id_subject=S.id_subject)
            WHERE (T1.catch_volume>0)AND(T1.id_regime=1)AND(T1.id_unit=168)AND
    			   (T1.document_date IN (SELECT MAX(DD.document_date) 
                                            FROM q09.limits_common DD
                                            WHERE (DD.id_regime=1)AND(DD.id_unit=T1.id_unit)AND(DD.id_subject=T1.id_subject)AND
                                                  (DD.id_region=T1.id_region)AND(DD.id_fish=T1.id_fish)AND
                                                  (EXTRACT(YEAR FROM DD.date_)=EXTRACT(YEAR FROM T1.date_))
                                       )
                    );
/*                    
INSERT INTO q09.tb_limits_common (id_basin, id_fish, id_region, id_unit, basin, fish, region, nYEAR, catch_volume_12)
    SELECT 
           T1.id_basin
          ,T1.id_fish
          ,T1.id_region
          ,T1.id_unit
          ,B.basin
          ,F.fish
          ,R.region
          ,EXTRACT(YEAR FROM T1.date_) as _year
          ,T1.catch_volume as catch_volume_12
      FROM (((q09.limits_common T1 INNER JOIN q09.basin B ON T1.id_basin=B.id_basin)
    		INNER JOIN q09.fish F ON T1.id_fish=F.id_fish)
    		INNER JOIN q09.region R ON T1.id_region=R.id_region)
            WHERE (T1.catch_volume>0)AND(T1.id_regime=12)AND
    			   (T1.document_date IN (SELECT MAX(DD.document_date) 
                                            FROM q09.limits_common DD
                                            WHERE (DD.id_regime=12)AND(DD.id_unit=T1.id_unit)AND
                                                  (DD.id_region=T1.id_region)AND(DD.id_fish=T1.id_fish)AND
                                                  (EXTRACT(YEAR FROM DD.date_)=EXTRACT(YEAR FROM T1.date_))
                                       )
                    )AND((T1.id_fish, T1.id_region, T1.id_unit, EXTRACT(YEAR FROM T1.date_))NOT IN(SELECT id_fish, id_region, id_unit, nyear FROM q09.tb_limits_common));
*/
-- id_regime=12 not in table -> insert
INSERT INTO q09.tb_limits_common (id_basin, id_fish, id_region, id_unit, id_subject, basin, fish, region, subject, nYEAR, catch_volume_1)
    SELECT 
           T1.id_basin
          ,T1.id_fish
          ,T1.id_region
          ,T1.id_unit
          ,T1.id_subject
          ,B.basin
          ,F.fish
          ,R.region
          ,S.subject
          ,EXTRACT(YEAR FROM T1.date_) as _year
          ,T1.catch_volume as catch_volume_1
      FROM ((((q09.limits_common T1 INNER JOIN q09.basin B ON T1.id_basin=B.id_basin)
    		INNER JOIN q09.fish F ON T1.id_fish=F.id_fish)
    		INNER JOIN q09.region R ON T1.id_region=R.id_region)
            INNER JOIN q09.subject S ON T1.id_subject=S.id_subject)
            WHERE (T1.catch_volume>0)AND(T1.id_regime=12)AND(T1.id_unit=168)AND
    			   (T1.document_date IN (SELECT MAX(DD.document_date) 
                                            FROM q09.limits_common DD
                                            WHERE (DD.id_regime=12)AND(DD.id_unit=T1.id_unit)AND(DD.id_subject=T1.id_subject)AND
                                                  (DD.id_region=T1.id_region)AND(DD.id_fish=T1.id_fish)AND
                                                  (EXTRACT(YEAR FROM DD.date_)=EXTRACT(YEAR FROM T1.date_))
                                       )
                    )AND((T1.id_fish, T1.id_region, T1.id_unit, T1.id_subject, EXTRACT(YEAR FROM T1.date_))NOT IN(SELECT id_fish, id_region, id_unit, id_subject, nyear FROM q09.tb_limits_common));
-- update
UPDATE q09.tb_limits_common TU SET catch_volume_12=T1.catch_volume
      FROM q09.limits_common T1
            WHERE (T1.catch_volume>0)AND(T1.id_regime=12)AND(T1.id_unit=168)AND
    			   (T1.document_date IN (SELECT MAX(DD.document_date) 
                                            FROM q09.limits_common DD
                                            WHERE (DD.id_regime=12)AND(DD.id_unit=T1.id_unit)AND(DD.id_subject=T1.id_subject)AND
                                                  (DD.id_region=T1.id_region)AND(DD.id_fish=T1.id_fish)AND
                                                  (EXTRACT(YEAR FROM DD.date_)=EXTRACT(YEAR FROM T1.date_))
                                       )
                    )AND
                    (
                        (T1.id_fish=TU.id_fish)AND
                        (T1.id_region=TU.id_region)AND
                        (T1.id_unit=TU.id_unit)AND
                        (T1.id_subject=TU.id_subject)AND
                        (EXTRACT(YEAR FROM T1.date_)=TU.nyear)
                    );
                    
-- select * from   q09.tb_limits_common;   
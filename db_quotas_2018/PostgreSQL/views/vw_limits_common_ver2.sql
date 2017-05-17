-- =============================================================================
-- db_quotas_2018
-- vw_limits_common_ver2 - представления для отображения ОДУ по видам квот
--						   версия 2
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  17-05-2017
-- Дата обновления:         17-05-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================

/*
-- [q09].[vw_limits_common_actual] - представление 
--									 'актуальные ОДУ по видам квот'
--									 (таблица хранит избыточную информацию, 
--									  которая отфильтровывается в данном
--								      представлении)
*/
DROP VIEW IF EXISTS q09.vw_limits_common_actual CASCADE;

CREATE VIEW q09.vw_limits_common_actual AS
	    SELECT
		   T1.id_regime 
          ,T1.id_basin
          ,T1.id_fish
          ,T1.id_region
          ,T1.id_unit
          ,T1.id_subject
          ,EXTRACT(YEAR FROM T1.date_) AS YYYY
          ,B.basin
          ,F.fish
          ,R.region
          ,S.subject
          ,T1.catch_volume AS l_vol
		  ,CAST(T1.catch_volume AS DOUBLE PRECISION) AS f_vol
      FROM ((((q09.limits_common T1 INNER JOIN q09.basin B ON T1.id_basin=B.id_basin)
    		INNER JOIN q09.fish F ON T1.id_fish=F.id_fish)
    		INNER JOIN q09.region R ON T1.id_region=R.id_region)
            INNER JOIN q09.subject S ON T1.id_subject=S.id_subject)
            WHERE (T1.catch_volume>0)AND
    			   (T1.document_date IN (SELECT MAX(DD.document_date) 
                                            FROM q09.limits_common DD
                                            WHERE (DD.id_regime=T1.id_regime)AND(DD.id_unit=T1.id_unit)AND(DD.id_subject=T1.id_subject)AND
                                                  (DD.id_region=T1.id_region)AND(DD.id_fish=T1.id_fish)AND
                                                  (EXTRACT(YEAR FROM DD.date_)=EXTRACT(YEAR FROM T1.date_))
                                       )
                   );

/*
SELECT id_regime
      ,id_basin
      ,id_fish
      ,id_region
      ,id_unit
      ,id_subject
      ,YYYY
      ,basin
      ,fish
      ,region
      ,subject
      ,l_vol
      ,f_vol
  FROM q09.vw_limits_common_actual
  where (id_regime IN(1,12))and(id_unit=168)
  order by id_regime,id_basin,id_fish,id_region,YYYY
*/

/*
-- [dbo].[vw_limits_common_1_and_12] - представление 
--									 'ОДУ по видам квот промышленные и прибрежные'
*/
DROP VIEW IF EXISTS q09.vw_limits_common_1_and_12;

CREATE VIEW q09.vw_limits_common_1_and_12 AS
SELECT 
	-- "id_basin"=
		CASE
			WHEN LC1.id_basin IS NULL THEN LC12.id_basin
			ELSE LC1.id_basin
		END AS id_basin,
	-- "id_fish"=
		CASE
			WHEN LC1.id_fish IS NULL THEN LC12.id_fish
			ELSE LC1.id_fish
		END AS id_fish,
	-- "id_region"=
		CASE
			WHEN LC1.id_region IS NULL THEN LC12.id_region
			ELSE LC1.id_region
		END AS id_region,
	-- "id_subject"=
		CASE
			WHEN LC1.id_subject IS NULL THEN LC12.id_subject
			ELSE LC1.id_subject
		END AS id_subject,
	-- "yyyy"=
		CASE
			WHEN LC1.yyyy IS NULL THEN LC12.yyyy
			ELSE LC1.yyyy
		END AS yyyy,
	-- "basin"=
		CASE
			WHEN LC1.basin IS NULL THEN LC12.basin
			ELSE LC1.basin
		END as basin,
	-- "fish"=
		CASE
			WHEN LC1.fish IS NULL THEN LC12.fish
			ELSE LC1.fish
		END AS fish,
	-- "region"=
		CASE
			WHEN LC1.region IS NULL THEN LC12.region
			ELSE LC1.region
		END AS region,
	-- "subject"=
		CASE
			WHEN LC1.subject IS NULL THEN LC12.subject
			ELSE LC1.subject
		END AS subject,
	LC1.f_vol AS f_vol_1,
	LC12.f_vol AS f_vol_12
	FROM 
		(SELECT * FROM q09.vw_limits_common_actual  WHERE (id_regime=1)and(id_unit=168)) LC1
		FULL OUTER JOIN
		(SELECT * FROM q09.vw_limits_common_actual  WHERE (id_regime=12)and(id_unit=168)) LC12
		ON
		(LC1.id_fish=LC12.id_fish)and(LC1.id_region=LC12.id_region)and
		(LC1.id_subject=LC12.id_subject)and(LC1.yyyy=LC12.yyyy);
		
        /*
        SELECT * FROM q09.vw_limits_common_1_and_12
	ORDER BY 
		id_basin,id_fish,id_region,id_subject,yyyy;*/
/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[vw_lc_all_v2] - представление 
--						  'актуальные ОДУ по видам квот'
--						  (таблица хранит избыточную информацию, 
--						   которая отфильтровывается в данном
--						   представлении)
-- Автор: Иванченко М.В.
-- Дата начала разработки:  18-05-2018
-- Дата обновления:         18-05-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
USE LIMITS_2009C
GO

-- DROP VIEW dbo.vw_lc_all_v2;
CREATE VIEW dbo.vw_lc_all_v2 AS
(
--BEGIN
	SELECT
		 TBPOS.id_regime 
		,TBPOS.id_basin
		,TBPOS.id_fish
		,TBPOS.id_region
		,TBPOS.id_unit
		,TBPOS.id_subject
		,TBPOS.document
		,TBPOS.document_date
		,TBPOS.YYYY
        ,B.basin
        ,F.fish
        ,R.region
        ,S.subject
		,TBPOS.l_vol
		,
		CASE
			WHEN TBPOS.f_vol < 0 THEN 0 -- если значение отрицательное, значит ОДУ отменено
			ELSE TBPOS.f_vol
		END AS f_vol
	FROM
    (--INNER JOIN limits_2009.dbo.subject S ON T1.id_subject=S.id_subject)	
    (--INNER JOIN limits_2009.dbo.region R ON T1.id_region=R.id_region)
    (--INNER JOIN limits_2009.dbo.fish F ON T1.id_fish=F.id_fish)
	(--INNER JOIN limits_2009.dbo.basin B ON T1.id_basin=B.id_basin )
	(
		-- выборка значения ОДУ по видам квот, соответствующего последнему 
		-- приказу, устанавливающему ОДУ для вида квоты, ВБР, района, субъекта и ед.изм
		SELECT
			 T1.id_regime 
			,T1.id_basin
			,T1.id_fish
			,T1.id_region
			,T1.id_unit
			,T1.id_subject
			,T1.document
			,T1.document_date
			,YEAR(T1.[date]) as YYYY
			,T1.catch_volume as l_vol
			,CAST(T1.catch_volume AS FLOAT) as f_vol
		FROM limits_2009.dbo.limits_common T1
			WHERE 
				  -- фильтр последнего приказа
				  (T1.document_date IN (SELECT MAX(DD.document_date)
											FROM limits_2009.dbo.limits_common DD
											WHERE (YEAR(DD.[date])=YEAR(T1.[date]))AND(DD.id_regime=T1.id_regime)AND
												  (DD.id_fish=T1.id_fish)AND(DD.id_region=T1.id_region)AND
												  (DD.id_subject=T1.id_subject)AND(DD.id_unit=T1.id_unit)
									   )
				  )
	) TBPOS 
	INNER JOIN limits_2009.dbo.basin B ON TBPOS.id_basin=B.id_basin )
    INNER JOIN limits_2009.dbo.fish F ON TBPOS.id_fish=F.id_fish )
    INNER JOIN limits_2009.dbo.region R ON TBPOS.id_region=R.id_region )
    INNER JOIN limits_2009.dbo.subject S ON TBPOS.id_subject=S.id_subject )	
	WHERE
		TBPOS.l_vol IN (
						--если на дату приказа есть отмена ОДУ и установка нового значения,
						--то выбираем новое(старое -> отрицательное)
						SELECT MAX(ZZ.catch_volume)
							FROM limits_2009.dbo.limits_common ZZ
							WHERE (YEAR(ZZ.[date])=TBPOS.YYYY)AND(ZZ.id_regime=TBPOS.id_regime)AND
								  (ZZ.id_fish=TBPOS.id_fish)AND(ZZ.id_region=TBPOS.id_region)AND
								  (ZZ.id_subject=TBPOS.id_subject)AND(ZZ.id_unit=TBPOS.id_unit)AND
								  (ZZ.document_date=TBPOS.document_date)
					   )
--END
);

/*
SELECT [id_regime]
      ,[id_basin]
      ,[id_fish]
      ,[id_region]
      ,[id_unit]
      ,[id_subject]
      ,[YYYY]
      ,[basin]
      ,[fish]
      ,[region]
      ,[subject]
      ,[l_vol]
      ,[f_vol]
  FROM [dbo].[vw_lc_all_v2]
  where (id_regime IN(1,12))and(id_unit=168)
  order by id_regime,id_basin,id_fish,id_region,YYYY
GO
*/
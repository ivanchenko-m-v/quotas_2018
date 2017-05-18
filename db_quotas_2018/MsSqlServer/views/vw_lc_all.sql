USE LIMITS_2009C
GO
-- DROP VIEW dbo.vw_lc_all;
CREATE VIEW dbo.vw_lc_all AS
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
		FROM limits_2009c.[dbo].[vw_limits_common_actual]
UNION ALL
	SELECT
		   T1.id_regime 
          ,T1.id_basin
          ,T1.id_fish
          ,T1.id_region
          ,T1.id_unit
          ,T1.id_subject
          ,YEAR(T1.[date]) as YYYY
          ,B.basin
          ,F.fish
          ,R.region
          ,S.subject
          ,T1.catch_volume as l_vol
		  ,0.0 as f_vol
      FROM ((((limits_2009.dbo.limits_common T1 INNER JOIN limits_2009.dbo.basin B ON T1.id_basin=B.id_basin)
    		INNER JOIN limits_2009.dbo.fish F ON T1.id_fish=F.id_fish)
    		INNER JOIN limits_2009.dbo.region R ON T1.id_region=R.id_region)
            INNER JOIN limits_2009.dbo.subject S ON T1.id_subject=S.id_subject)
            WHERE (T1.catch_volume<0)AND
    			   (T1.document_date IN (SELECT MAX(DD.document_date) 
                                            FROM limits_2009.dbo.limits_common DD
                                            WHERE (DD.id_regime=T1.id_regime)AND(DD.id_unit=T1.id_unit)AND(DD.id_subject=T1.id_subject)AND
                                                  (DD.id_region=T1.id_region)AND(DD.id_fish=T1.id_fish)AND
                                                  (YEAR(DD.[date])=YEAR(T1.[date]))
                                        )
                   )AND
				   (
					--(id_regime,id_fish,id_region,id_subject,id_unit,YEAR(T1.[date]))NOT IN
					NOT EXISTS(
								SELECT id_regime,id_fish,id_region,id_subject,id_unit,YYYY 
									FROM limits_2009c.[dbo].[vw_limits_common_actual] VW
								WHERE (VW.id_regime=T1.id_regime)AND(VW.id_unit=T1.id_unit)AND(VW.id_subject=T1.id_subject)AND
                                                  (VW.id_region=T1.id_region)AND(VW.id_fish=T1.id_fish)AND
                                                  (VW.YYYY=YEAR(T1.[date]))
							  )
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
  FROM [dbo].[vw_lc_all]
  where (id_regime IN(1,12))and(id_unit=168)
  order by id_regime,id_basin,id_fish,id_region,YYYY
GO
*/

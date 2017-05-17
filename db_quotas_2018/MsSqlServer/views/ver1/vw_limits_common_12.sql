/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[vw_limits_common_12] - представление 'ОДУ прибрежные квоты'
--							  (ОДУ по виду квоты id_regime=1)
-- Автор: Иванченко М.В.
-- Дата начала разработки:  16-05-2018
-- Дата обновления:         17-05-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
-- 
use limits_2009;
go

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
          ,YEAR(T1.[date]) as _year
          ,T1.catch_volume as l_vol_12
		  ,CAST(T1.catch_volume AS FLOAT) as f_vol_12
      FROM ((((dbo.limits_common T1 INNER JOIN dbo.basin B ON T1.id_basin=B.id_basin)
    		INNER JOIN dbo.fish F ON T1.id_fish=F.id_fish)
    		INNER JOIN dbo.region R ON T1.id_region=R.id_region)
            INNER JOIN dbo.subject S ON T1.id_subject=S.id_subject)
            WHERE (T1.catch_volume>0)AND(T1.id_regime=12)AND(T1.id_unit=168)AND
    			   (T1.document_date IN (SELECT MAX(DD.document_date) 
                                            FROM dbo.limits_common DD
                                            WHERE (DD.id_regime=12)AND(DD.id_unit=T1.id_unit)AND(DD.id_subject=T1.id_subject)AND
                                                  (DD.id_region=T1.id_region)AND(DD.id_fish=T1.id_fish)AND
                                                  (YEAR(DD.[date])=YEAR(T1.[date]))
                                       )
                   )
            ORDER BY T1.id_basin,T1.id_fish,T1.id_region,YEAR(T1.[date]);
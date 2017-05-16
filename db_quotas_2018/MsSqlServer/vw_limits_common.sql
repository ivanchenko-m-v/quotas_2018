USE [limits_2009]
GO

SELECT 
	   T1.[id_basin]
	  ,T1.[id_fish]
	  ,T1.[id_region]
	  ,B.[basin]
	  ,F.[fish]
	  ,R.[region]
      ,year(T1.[date]) as _year
	  ,SUM(T1.[catch_volume]) as catch_volume_1
  FROM [dbo].[limits_common] T1,  
		[dbo].[basin] B, [dbo].[fish] F, [dbo].[region] R
		WHERE (T1.[id_regime]=1)and
				(T1.[id_basin]=B.[id_basin])and(T1.[id_fish]=F.[id_fish])and(T1.[id_region]=R.[id_region])
		group by T1.[id_basin],T1.[id_fish],T1.[id_region],year(T1.[date]),B.[basin],F.[fish],R.[region]
	    order by T1.[id_basin],T1.[id_fish],T1.[id_region],year(T1.[date])
GO



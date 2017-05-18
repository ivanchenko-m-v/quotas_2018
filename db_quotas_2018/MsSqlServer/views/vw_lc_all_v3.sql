/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[vw_lc_all_v3] - представление 
--						  'актуальные ОДУ по видам квот'
--						  (таблица хранит избыточную информацию, 
--						   которая отфильтровывается в данном
--						   представлении)
--						  версия 3
-- Автор: Иванченко М.В.
-- Дата начала разработки:  18-05-2018
-- Дата обновления:         18-05-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
USE [limits_2009c]
GO

--DROP VIEW limits_2009c.dbo.vw_lc_group;
CREATE VIEW vw_lc_group AS
(
	SELECT 
			 LCG.[id_basin]
			,LCG.[YYYY]
			,LCG.[id_regime]
			,LCG.[id_region]
			,LCG.[id_fish]
			,LCG.[id_subject]
			,LCG.[id_unit]
			,B.basin
			,F.fish
			,R.region
			,S.subject
			,LCG.[l_vol]
			,LCG.[f_vol]
	FROM
		(--INNER JOIN limits_2009.dbo.subject S ON T1.id_subject=S.id_subject)	
		(--INNER JOIN limits_2009.dbo.region R ON T1.id_region=R.id_region)
		(--INNER JOIN limits_2009.dbo.fish F ON T1.id_fish=F.id_fish)
		(--INNER JOIN limits_2009.dbo.basin B ON T1.id_basin=B.id_basin )
	(
		SELECT [id_basin]
			  ,YEAR([date]) AS YYYY
			  ,[id_regime]
			  ,[id_region]
			  ,[id_fish]
			  ,[id_subject]
			  ,[id_unit]
			  ,SUM([catch_volume]) AS l_vol
			  ,CAST(SUM([catch_volume]) AS FLOAT) AS f_vol
		  FROM [limits_2009].[dbo].[limits_common]
		  GROUP BY [id_basin]
				  ,YEAR([date])
				  ,[id_regime]
				  ,[id_region]
				  ,[id_fish]
				  ,[id_subject]
				  ,[id_unit]
	) LCG
		INNER JOIN limits_2009.dbo.basin B ON LCG.id_basin=B.id_basin )
		INNER JOIN limits_2009.dbo.fish F ON LCG.id_fish=F.id_fish )
		INNER JOIN limits_2009.dbo.region R ON LCG.id_region=R.id_region )
		INNER JOIN limits_2009.dbo.subject S ON LCG.id_subject=S.id_subject )
);
GO

--SELECT * FROM limits_2009c.dbo.vw_lc_group
--where id_regime in(12)
--ORDER BY id_regime,id_basin,id_fish,id_region,YYYY;	


-- drop view dbo.vw_limits_common_1_and_12;
CREATE VIEW dbo.vw_limits_common_1_and_12 AS
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
		(SELECT * FROM dbo.vw_lc_group  WHERE (id_regime=1)and(id_unit=168)) LC1
		FULL OUTER JOIN
		(SELECT * FROM dbo.vw_lc_group  WHERE (id_regime=12)and(id_unit=168)) LC12
		ON
		(LC1.id_fish=LC12.id_fish)and(LC1.id_region=LC12.id_region)and
		(LC1.id_subject=LC12.id_subject)and(LC1.yyyy=LC12.yyyy);


		/*
SELECT *
	FROM dbo.vw_limits_common_1_and_12
	-- WHERE (f_vol_1=0)OR(f_vol_12=0)
	ORDER BY 
		id_basin,id_fish,id_region,id_subject,yyyy;*/


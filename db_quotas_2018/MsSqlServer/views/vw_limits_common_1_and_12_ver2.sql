/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[vw_limits_common_1_and_12] - представление 
--									 'ОДУ по видам квот промышленные и прибрежные'
-- Автор: Иванченко М.В.
-- Дата начала разработки:  17-05-2018
-- Дата обновления:         17-05-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
USE [limits_2009c]
GO

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
		(SELECT * FROM dbo.vw_limits_common_actual  WHERE (id_regime=1)and(id_unit=168)) LC1
		FULL OUTER JOIN
		(SELECT * FROM dbo.vw_limits_common_actual  WHERE (id_regime=12)and(id_unit=168)) LC12
		ON
		(LC1.id_fish=LC12.id_fish)and(LC1.id_region=LC12.id_region)and
		(LC1.id_subject=LC12.id_subject)and(LC1.yyyy=LC12.yyyy);
		/*
	ORDER BY 
		id_basin,id_fish,id_region,id_subject,yyyy;*/


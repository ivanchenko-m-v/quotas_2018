-- =============================================================================
-- db_quotas_2018
-- vw_limits_common_1_and_12 - представления для отображения ОДУ по видам квот
--                            промышленные(1) и прибрежные(12)
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  17-05-2017
-- Дата обновления:         17-05-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================

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
		END AS basin,
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
		(SELECT * FROM q09.tb_limits_common  WHERE id_regime=1) LC1
		FULL OUTER JOIN
		(SELECT * FROM q09.tb_limits_common  WHERE id_regime=12) LC12
		ON
		(LC1.id_fish=LC12.id_fish)and(LC1.id_region=LC12.id_region)and
		(LC1.id_subject=LC12.id_subject)and(LC1.yyyy=LC12.yyyy)
	ORDER BY 
		id_basin,id_fish,id_region,id_subject,yyyy;

--select * from q09.vw_limits_catch_1_and_12;        

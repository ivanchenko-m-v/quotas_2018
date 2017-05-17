USE [limits_2009c]
GO

SELECT 
	"id_basin"=
		CASE
			WHEN LC1.id_basin IS NULL THEN LC12.id_basin
			ELSE LC1.id_basin
		END,
	"id_fish"=
		CASE
			WHEN LC1.id_fish IS NULL THEN LC12.id_fish
			ELSE LC1.id_fish
		END,
	"id_region"=
		CASE
			WHEN LC1.id_region IS NULL THEN LC12.id_region
			ELSE LC1.id_region
		END,
	"id_subject"=
		CASE
			WHEN LC1.id_subject IS NULL THEN LC12.id_subject
			ELSE LC1.id_subject
		END,
	"yyyy"=
		CASE
			WHEN LC1.yyyy IS NULL THEN LC12.yyyy
			ELSE LC1.yyyy
		END,
	-- "basin"=
		CASE
			WHEN LC1.basin IS NULL THEN LC12.basin
			ELSE LC1.basin
		END as basin,
	"fish"=
		CASE
			WHEN LC1.fish IS NULL THEN LC12.fish
			ELSE LC1.fish
		END,
	"region"=
		CASE
			WHEN LC1.region IS NULL THEN LC12.region
			ELSE LC1.region
		END,
	"subject"=
		CASE
			WHEN LC1.subject IS NULL THEN LC12.subject
			ELSE LC1.subject
		END,
	LC1.f_vol AS f_vol_1,
	LC12.f_vol AS f_vol_12
	FROM 
		(SELECT * FROM dbo.z__tb_limits_common_1_and_12  WHERE id_regime=1) LC1
		FULL OUTER JOIN
		(SELECT * FROM dbo.z__tb_limits_common_1_and_12  WHERE id_regime=12) LC12
		ON
		(LC1.id_fish=LC12.id_fish)and(LC1.id_region=LC12.id_region)and
		(LC1.id_subject=LC12.id_subject)and(LC1.yyyy=LC12.yyyy)
	ORDER BY 
		"id_basin","id_fish","id_region","id_subject","yyyy";


	
USE [limits_2009c]
GO

CREATE TABLE dbo.z__tb_limits_common_1_and_12
(
	id_regime INTEGER NOT NULL,
	id_basin INTEGER NOT NULL,
	id_fish INTEGER NOT NULL,
	id_region INTEGER NOT NULL,
	id_unit INTEGER NOT NULL,
	id_subject INTEGER NOT NULL,
	yyyy INTEGER NOT NULL,
	basin NVARCHAR(128) NOT NULL,
	fish NVARCHAR(128) NOT NULL,
	region NVARCHAR(128) NOT NULL,
	subject NVARCHAR(128) NOT NULL,
	l_vol DECIMAL(38,17) NOT NULL,
	f_vol FLOAT NOT NULL,
	CONSTRAINT [PK_tb_limits_common_1_and_12] PRIMARY KEY CLUSTERED 
	(
		id_regime,
		id_basin,
		id_fish,
		id_region,
		id_unit,
		id_subject,
		yyyy
	)
);
GO

DELETE FROM limits_2009c.dbo.z__tb_limits_common_1_and_12;
-- id_regime=1
INSERT INTO limits_2009c.dbo.z__tb_limits_common_1_and_12
	(
		id_regime,id_basin,id_fish,id_region,id_unit,id_subject,yyyy,
		basin,fish,region,subject,l_vol,f_vol
	)
	    SELECT 
		  1 AS id_regime
          ,T1.id_basin
          ,T1.id_fish
          ,T1.id_region
          ,T1.id_unit
          ,T1.id_subject
          ,YEAR(T1.[date]) as _year
		  ,B.basin
          ,F.fish
          ,R.region
          ,S.subject
          ,T1.catch_volume as l_vol_1
		  ,CAST(T1.catch_volume AS FLOAT) as f_vol_1
      FROM ((((limits_2009.dbo.limits_common T1 INNER JOIN limits_2009.dbo.basin B ON T1.id_basin=B.id_basin)
    		INNER JOIN limits_2009.dbo.fish F ON T1.id_fish=F.id_fish)
    		INNER JOIN limits_2009.dbo.region R ON T1.id_region=R.id_region)
            INNER JOIN limits_2009.dbo.subject S ON T1.id_subject=S.id_subject)
            WHERE (T1.catch_volume>0)AND(T1.id_regime=1)AND(T1.id_unit=168)AND
    			   (T1.document_date IN (SELECT MAX(DD.document_date) 
                                            FROM limits_2009.dbo.limits_common DD
                                            WHERE (DD.id_regime=1)AND(DD.id_unit=T1.id_unit)AND(DD.id_subject=T1.id_subject)AND
                                                  (DD.id_region=T1.id_region)AND(DD.id_fish=T1.id_fish)AND
                                                  (YEAR(DD.[date])=YEAR(T1.[date]))
                                       )
                   );
GO
-- id_regime=12
INSERT INTO dbo.z__tb_limits_common_1_and_12
	(
		id_regime,id_basin,id_fish,id_region,id_unit,id_subject,yyyy,
		basin,fish,region,subject,l_vol,f_vol
	)
    SELECT 
		  12 AS id_regime
          ,T1.id_basin
          ,T1.id_fish
          ,T1.id_region
          ,T1.id_unit
          ,T1.id_subject
          ,YEAR(T1.[date]) as _year
          ,B.basin
          ,F.fish
          ,R.region
          ,S.subject
          ,T1.catch_volume as l_vol_12
		  ,CAST(T1.catch_volume AS FLOAT) as f_vol_12
      FROM ((((limits_2009.dbo.limits_common T1 INNER JOIN limits_2009.dbo.basin B ON T1.id_basin=B.id_basin)
    		INNER JOIN limits_2009.dbo.fish F ON T1.id_fish=F.id_fish)
    		INNER JOIN limits_2009.dbo.region R ON T1.id_region=R.id_region)
            INNER JOIN limits_2009.dbo.subject S ON T1.id_subject=S.id_subject)
            WHERE (T1.catch_volume>0)AND(T1.id_regime=12)AND(T1.id_unit=168)AND
    			   (T1.document_date IN (SELECT MAX(DD.document_date) 
                                            FROM limits_2009.dbo.limits_common DD
                                            WHERE (DD.id_regime=12)AND(DD.id_unit=T1.id_unit)AND(DD.id_subject=T1.id_subject)AND
                                                  (DD.id_region=T1.id_region)AND(DD.id_fish=T1.id_fish)AND
                                                  (YEAR(DD.[date])=YEAR(T1.[date]))
                                       )
                   );
GO
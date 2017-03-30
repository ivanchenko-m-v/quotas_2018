/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[tb_total_allowable_catch] - таблица 'общий допустимый улов(ОДУ) ВБР'
-- Автор: Иванченко М.В.
-- Дата начала разработки:  27-03-2018
-- Дата обновления:         28-03-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
CREATE TABLE [dbo].[tb_total_allowable_catch]
(
	[date_tac] DATETIME NOT NULL,
	[id_basin] INT NOT NULL,
	[id_region] INT NOT NULL,
	[id_aquatic_resource] INT NOT NULL,
	[id_unit] INT NOT NULL,
	[id-document] INT NOT NULL, 
    [total_allowed_catch] DECIMAL(38, 17) NOT NULL, 
    CONSTRAINT [PK_tb_total_allowable_catch] PRIMARY KEY ([date_tac], [id_basin], [id_region], [id_aquatic_resource], [id_unit], [id-document])
);

/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[tb_aquatic_resource] - таблица 'ВБР'
-- Автор: Иванченко М.В.
-- Дата начала разработки:  27-03-2018
-- Дата обновления:         27-03-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
CREATE TABLE [dbo].[tb_aquatic_resource]
(
	[id_aquatic_resource] INT NOT NULL PRIMARY KEY,			--идентификатор ВБР
 	[id_ar_fms] INT NOT NULL DEFAULT 0,						--идентификатор ВБР в ОСМ(FMS - Fishery Monitoring System)
 	[sort_order] INT NOT NULL DEFAULT 0x7FFFFFFF,			--порядок сортировки в справочнике
    [aquatic_resource] NVARCHAR(64) NOT NULL,				--наименование ВБР
    [ar_title_by_order] NVARCHAR(64) NOT NULL DEFAULT ''	--наименование ВБР, согласно утверждённого приказа
);

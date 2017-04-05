﻿/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[tb_region] - таблица 'район добычи(промысла) ВБР'
-- Автор: Иванченко М.В.
-- Дата начала разработки:  27-03-2018
-- Дата обновления:         28-03-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
CREATE TABLE [dbo].[tb_region]
(
	[id_region] INT NOT NULL PRIMARY KEY,						--идентификатор района добычи(промысла) ВБР
 	[id_region_fms] INT NOT NULL DEFAULT 0,						--идентификатор района добычи(промысла) ВБР в ОСМ(FMS - Fishery Monitoring System)
 	[sort_order] INT NOT NULL DEFAULT 0x7FFFFFFF,				--порядок сортировки в справочнике
    [region] NVARCHAR(64) NOT NULL,								--наименование района добычи(промысла) ВБР
    [region_title_by_order] NVARCHAR(64) NOT NULL DEFAULT ''	--наименование района добычи(промысла) ВБР, согласно утверждённого приказа
);
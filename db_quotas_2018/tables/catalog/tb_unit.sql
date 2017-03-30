﻿/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[tb_unit] - таблица 'Единица измерения'
-- Автор: Иванченко М.В.
-- Дата начала разработки:  28-03-2018
-- Дата обновления:         28-03-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
CREATE TABLE [dbo].[tb_unit]
(
	[id_unit] INT NOT NULL PRIMARY KEY,			--идентификатор единицы измерения
    [unit] NVARCHAR(16) NOT NULL DEFAULT ''		--наименование единицы измерения
);

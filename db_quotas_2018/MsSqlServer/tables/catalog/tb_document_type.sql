﻿/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[tb_document_type] - таблица 'Тип нормативного документа'
-- Автор: Иванченко М.В.
-- Дата начала разработки:  28-03-2018
-- Дата обновления:         28-03-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
CREATE TABLE [dbo].[tb_document_type]
(
	[id_document_type] INT NOT NULL PRIMARY KEY,		--идентификатор типа нормативного документа
	[document_type] NVARCHAR(32) NOT NULL DEFAULT '' 	--наименование типа нормативного документа
);

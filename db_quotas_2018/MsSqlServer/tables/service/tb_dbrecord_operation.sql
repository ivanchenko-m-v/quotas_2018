/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[tb_dbrecord_operation] - таблица 'операция над записью БД'
-- Автор: Иванченко М.В.
-- Дата начала разработки:  29-03-2018
-- Дата обновления:         29-03-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
CREATE TABLE [dbo].[tb_dbrecord_operation]
(
	[id_dbrecord_operation] TINYINT NOT NULL PRIMARY KEY,	--Код операции над записью БД
	[record_operation] NVARCHAR(120) NOT NULL DEFAULT ''	--Операция над записью БД
);
GO

INSERT INTO [dbo].[tb_dbrecord_operation] ([id_dbrecord_operation],[record_operation])
	VALUES(1, 'user_ar NEW');
GO

INSERT INTO [dbo].[tb_dbrecord_operation] ([id_dbrecord_operation],[record_operation])
	VALUES(2, 'user_ar CORRECT FIELD VALUES');
GO

INSERT INTO [dbo].[tb_dbrecord_operation] ([id_dbrecord_operation],[record_operation])
	VALUES(3, 'user_ar REORGANIZATION');
GO

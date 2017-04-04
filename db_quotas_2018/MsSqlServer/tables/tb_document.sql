/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[tb_document] - таблица 'Нормативный документ'
-- Автор: Иванченко М.В.
-- Дата начала разработки:  28-03-2018
-- Дата обновления:         03-04-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
CREATE TABLE [dbo].[tb_document]
(
	[id_document] INT NOT NULL PRIMARY KEY,					-- идентификатор нормативного документа
    [id_document_type] INT NOT NULL DEFAULT 0, 				-- идентификатор типа нормативного документа
    [id_organization_approval] INT NOT NULL DEFAULT 0,		-- идентификатор утверждающей организации
    [document_number] NVARCHAR(32) NOT NULL DEFAULT '',		-- номер нормативного документа
    [document_date] DATETIME NOT NULL DEFAULT GETDATE(),	-- дата нормативного документа
	[document_title] NVARCHAR(256) NOT NULL DEFAULT '',		-- заголовок нормативного документа
	[document_person] NVARCHAR(32) NOT NULL DEFAULT '',		-- ответственное лицо, утвердившее нормативный документ
	[document_note] NVARCHAR(256) NOT NULL DEFAULT ''		-- примечание к нормативному документу
);

/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[tb_user_ar] - таблица 'пользователь ВБР'
-- Автор: Иванченко М.В.
-- Дата начала разработки:  27-03-2018
-- Дата обновления:         03-04-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
CREATE TABLE [dbo].[tb_user_ar]
(
	[id_user_ar] INT NOT NULL PRIMARY KEY,						-- Идентификатор пользователя ВБР
    [id_user_ar_fms] INT NOT NULL DEFAULT 0,					-- Код пользователя ВБР/владельца доли в ОСМ(FMS - Fishery Monitoring System)
	[id_dbrecord_operation] TINYINT NOT NULL DEFAULT 1,			-- Код операции над записью БД
	[legal_entity] BIT NOT NULL DEFAULT 1,						-- Признак юр.лицо/инд.предприниматель
    [date_registration] DATETIME NOT NULL DEFAULT GETDATE(),	-- Дата регистрации пользователя ВБР
    [user_ar] NVARCHAR(256) NOT NULL,							-- Название пользователя ВБР
    [shipowner] NVARCHAR(256) NOT NULL DEFAULT '',				-- Наименование судовладельца в ОСМ
    [title_full] NVARCHAR(256) NOT NULL DEFAULT '',				-- Полное название пользователя ВБР/владельца доли
    [case_number] NVARCHAR(24) NOT NULL DEFAULT '',				-- Номер дела пользователя ВБР
    [form_of_ownership] NVARCHAR(24) NOT NULL DEFAULT '',		-- Текстовая аббревиатура формы собственности
    [director] NVARCHAR(32) NOT NULL DEFAULT '',				-- ФИО руководителя и должность
    [address] NVARCHAR(255) NOT NULL DEFAULT '',				-- Юридический адрес
    [postal_address] NVARCHAR(255) NOT NULL DEFAULT '',			-- Почтовый адрес
    [phone] NVARCHAR(64) NOT NULL DEFAULT '',					-- Телефон, включая междугородний код
    [fax] NVARCHAR(32) NOT NULL DEFAULT '',						-- Факс, включая междугородний код
    [telex] NVARCHAR(32) NOT NULL DEFAULT '',					-- Телекс
    [e_mail] NVARCHAR(32) NOT NULL DEFAULT '',					-- E-mail
    [inn] NVARCHAR(16) NOT NULL DEFAULT '',						-- ИНН
    [kpp] NVARCHAR(16) NOT NULL DEFAULT '',						-- КПП
    [ogrn] NVARCHAR(64) NOT NULL DEFAULT '',					-- ОГРН
    [OKPO] NVARCHAR(24) NOT NULL DEFAULT '',					-- ОКПО
    [OKATO] NVARCHAR(24) NOT NULL DEFAULT '',					-- ОКАТО
    [OKVED] NVARCHAR(24) NOT NULL DEFAULT '',					-- ОКВЭД
    [KOPF] NVARCHAR(2) NOT NULL DEFAULT '',						-- ОКОПФ
    [KFS] NVARCHAR(2) NOT NULL DEFAULT '',						-- ОКФС
    [note] NVARCHAR(255) NOT NULL DEFAULT ''					-- Примечание
);



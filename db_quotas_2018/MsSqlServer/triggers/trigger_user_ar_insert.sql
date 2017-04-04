/*
--=============================================================================
-- db_quotas_2018
-- [trigger_user_ar_insert] - триггер на операцию вставки записи в таблицу
--							  [dbo].[tb_user_ar]
-- Автор: Иванченко М.В.
-- Дата начала разработки:  29-03-2018
-- Дата обновления:         30-03-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
CREATE TRIGGER [trigger_user_ar_insert]
ON [dbo].[tb_user_ar]
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON
	--delete previous state on this day
	DELETE 
		FROM [dbo].[tb_archive_user_ar]
		WHERE 
			([dbo].[tb_archive_user_ar].[id_user_ar] IN (SELECT [id_user_ar] FROM inserted))AND
			(DATEDIFF(day, [dbo].[tb_archive_user_ar].[date_update], GETDATE())=0);
	--insert [dbo].[tb_archive_user_ar]
	INSERT INTO [dbo].[tb_archive_user_ar]
		(
			[id_user_ar],			--Идентификатор пользователя ВБР
			[id_user_ar_fms],		--Код пользователя ВБР/владельца доли в ОСМ(FMS - Fishery Monitoring System)
			[id_dbrecord_operation],--Код операции над записью БД
			[legal_entity],			--Признак юр.лицо/инд.предприниматель
			[date_registration],	--Дата регистрации пользователя ВБР
			[user_ar],				--Название пользователя ВБР
			[shipowner],			--Наименование судовладельца в ОСМ
			[title_full],			--Полное название пользователя ВБР/владельца доли
			[case_number],			--Номер дела пользователя ВБР
			[form_of_ownership],	--Текстовая аббревиатура формы собственности
			[director],				--ФИО руководителя и должность
			[address],				--Юридический адрес
			[postal_address],		--Почтовый адрес
			[phone],				--Телефон, включая междугородний код
			[fax],					--Факс, включая междугородний код
			[telex],				--Телекс
			[e_mail],				--E-mail
			[inn],					--ИНН
			[kpp],					--КПП
			[ogrn],					--ОГРН
			[OKPO],					--ОКПО
			[OKATO],				--ОКАТО
			[OKVED],				--ОКВЭД
			[KOPF],					--ОКОПФ
			[KFS],					--ОКФС
			[note],					--Примечание
			[db_responsible]		--Ответственный за корректировку записи
		)
		SELECT	[id_user_ar],			--Идентификатор пользователя ВБР
				[id_user_ar_fms],		--Код пользователя ВБР/владельца доли в ОСМ(FMS - Fishery Monitoring System)
				[id_dbrecord_operation],--Код операции над записью БД
				[legal_entity],			--Признак юр.лицо/инд.предприниматель
				[date_registration],	--Дата регистрации пользователя ВБР
				[user_ar],				--Название пользователя ВБР
				[shipowner],			--Наименование судовладельца в ОСМ
				[title_full],			--Полное название пользователя ВБР/владельца доли
				[case_number],			--Номер дела пользователя ВБР
				[form_of_ownership],	--Текстовая аббревиатура формы собственности
				[director],				--ФИО руководителя и должность
				[address],				--Юридический адрес
				[postal_address],		--Почтовый адрес
				[phone],				--Телефон, включая междугородний код
				[fax],					--Факс, включая междугородний код
				[telex],				--Телекс
				[e_mail],				--E-mail
				[inn],					--ИНН
				[kpp],					--КПП
				[ogrn],					--ОГРН
				[OKPO],					--ОКПО
				[OKATO],				--ОКАТО
				[OKVED],				--ОКВЭД
				[KOPF],					--ОКОПФ
				[KFS],					--ОКФС
				[note],					--Примечание
				SYSTEM_USER				--Ответственный за корректировку записи
		FROM inserted
END

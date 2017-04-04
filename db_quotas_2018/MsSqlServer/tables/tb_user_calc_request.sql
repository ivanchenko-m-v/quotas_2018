/*
--=============================================================================
-- db_quotas_2018
-- [dbo].[tb_user_calc_request] - таблица 'Заявка пользователя ВБР 
--										   на расчёт квот'
-- Автор: Иванченко М.В.
-- Дата начала разработки:  28-03-2018
-- Дата обновления:         03-04-2018
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
--=============================================================================
*/
CREATE TABLE [dbo].[tb_user_calc_request]
(
	[id_user_ar] INT NOT NULL,									-- идентификатор пользователя ВБР
	[id_basin] INT NOT NULL,									-- идентификатор бассейна промысла ВБР
	[id_quota_type] INT NOT NULL,								-- идентификатор вида квоты на добычу ВБР
	[id_region] INT NOT NULL,									-- идентификатор района добычи(промысла) ВБР
	[id_aquatic_resource] INT NOT NULL,							-- идентификатор ВБР
	[id_subject] INT NOT NULL,									-- идентификатор субъекта РФ
	[date_request] DATETIME NOT NULL DEFAULT GETDATE(),			-- дата заявки
	[portion] DECIMAL(38,17) NOT NULL DEFAULT 0,				-- размер запрашиваемой доли
	[date_record] DATETIME NOT NULL DEFAULT GETDATE(),			-- дата регистрации заявки	
	[db_responsible] NVARCHAR(32) NOT NULL DEFAULT SYSTEM_USER 	-- ответственный сотрудник, внесший запись БД
, 
    CONSTRAINT [PK_tb_user_calc_request] PRIMARY KEY ([id_user_ar], [id_subject], [id_basin], [id_quota_type], [id_region], [id_aquatic_resource])
);

-- =============================================================================
-- db_quotas_2018
-- tb_dbrecord_operation - таблица 'операция над записью БД'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  29-03-2017
-- Дата обновления:         03-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
CREATE TABLE IF NOT EXISTS tb_dbrecord_operation
(
	id_dbrecord_operation INT NOT NULL PRIMARY KEY,		-- Код операции над записью БД
	record_operation VARCHAR(120) NOT NULL DEFAULT ''	-- Операция над записью БД
);
-- добавлен новый пользователь ВБР
INSERT INTO tb_dbrecord_operation (id_dbrecord_operation, record_operation)
	VALUES(1, 'user_ar NEW');

-- исправление ошибок данных пользователя ВБР
INSERT INTO tb_dbrecord_operation (id_dbrecord_operation, record_operation)
	VALUES(2, 'user_ar CORRECT FIELD VALUES');

-- реорганизация пользователя ВБР
INSERT INTO tb_dbrecord_operation (id_dbrecord_operation, record_operation)
	VALUES(3, 'user_ar REORGANIZATION');
    
-- распределение доли квоты пользователя ВБР
INSERT INTO tb_dbrecord_operation (id_dbrecord_operation, record_operation)
	VALUES(11, 'portion DISTRIBUTED');
    
-- передача доли квоты пользователя ВБР
INSERT INTO tb_dbrecord_operation (id_dbrecord_operation, record_operation)
	VALUES(12, 'portion TRANSFERRED');

-- изъятие доли квоты пользователя ВБР
INSERT INTO tb_dbrecord_operation (id_dbrecord_operation, record_operation)
	VALUES(13, 'portion WITHDRAWN');

-- исправление ошибок данных доли квоты пользователя ВБР
INSERT INTO tb_dbrecord_operation (id_dbrecord_operation, record_operation)
	VALUES(14, 'portion CORRECT FIELD VALUES');

-- изменение объёма доли квоты пользователя ВБР
INSERT INTO tb_dbrecord_operation (id_dbrecord_operation, record_operation)
	VALUES(15, 'portion CHANGE VOLUME');

-- =============================================================================
-- db_quotas_2018
-- tb_cnn - таблица 'Параметр соединения с БД'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  19-04-2017
-- Дата обновления:         19-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
CREATE SCHEMA IF NOT EXISTS cnn;
DROP TABLE IF EXISTS cnn.tb_cnn;
CREATE TABLE IF NOT EXISTS cnn.tb_cnn
(
	lgn VARCHAR(16) NOT NULL PRIMARY KEY,	-- заданное пользователем программы «имя входа» в форме авторизации
	hsh VARCHAR(32) NOT NULL DEFAULT '',	-- md5-hash заданного пользователем программы «пароля на вход» в форме авторизации
	client VARCHAR(16) NOT NULL DEFAULT '',	-- имя роли БД для создания программного соединения с БД
	input VARCHAR(16) NOT NULL DEFAULT ''	-- пароль программного соединения с БД
);

-- insert into cnn.tb_cnn values('ban','x5x6', 'bantik', 'fantik');
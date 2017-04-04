-- =============================================================================
-- db_quotas_2018
-- tb_ar_hierarchy - таблица 'Иерархия ВБР'
-- PostgreSQL
-- Автор: Иванченко М.В.
-- Дата начала разработки:  28-03-2017
-- Дата обновления:         03-04-2017
-- Первый релиз:            0.0.0.0
-- Текущий релиз:           0.0.0.0
-- =============================================================================
CREATE TABLE IF NOT EXISTS tb_ar_hierarchy
(
	id_aquatic_resource INT NOT NULL,		--идентификатор ВБР
    id_aquatic_resource_top INT NOT NULL	--идентификатор ВБР верхнего(обобщающего) уровня
,
    CONSTRAINT PK_tb_ar_hierarchy PRIMARY KEY (id_aquatic_resource, id_aquatic_resource_top) 
);

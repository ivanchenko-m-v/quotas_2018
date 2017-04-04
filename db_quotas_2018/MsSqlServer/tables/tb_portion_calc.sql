CREATE TABLE [dbo].[tb_portion_calc]
(
	[id_portion_calc] INT NOT NULL PRIMARY KEY,
	[date_calc] DATETIME NOT NULL DEFAULT GETDATE()
)

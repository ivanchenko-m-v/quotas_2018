USE [limits_2009c]
GO

/****** Object:  Table [dbo].[declarant_history]    Script Date: 07.04.2017 12:48:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[declarant_history](
	[id_declarant_history] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[id_declarant] [int] NOT NULL,
	[date_registration] [datetime] NULL,
	[declarant] [varchar](250) NULL,
	[work_number] [varchar](20) NULL,
	[declarant_type] [varchar](20) NULL,
	[address] [varchar](150) NULL,
	[postal_address] [varchar](200) NULL,
	[director] [varchar](80) NULL,
	[phone] [varchar](40) NULL,
	[fax] [varchar](20) NULL,
	[telex] [varchar](20) NULL,
	[e_mail] [varchar](50) NULL,
	[declarant_full] [varchar](150) NULL,
	[inn] [varchar](20) NULL,
	[kpp] [varchar](9) NULL,
	[reg_number] [varchar](50) NULL,
	[OKPO] [varchar](50) NULL,
	[OKATO] [varchar](5) NULL,
	[OKVED] [varchar](10) NULL,
	[KOPF] [varchar](2) NULL,
	[KFS] [varchar](2) NULL,
	[date_expiration] [datetime] NULL,
	[id_own] [int] NULL,
	[own] [varchar](250) NULL,
	[note] [varchar](255) NULL,
	[responsible] [varchar](30) NULL,
	[juridical] [tinyint] NULL,
	[timestamp_] [datetime] NULL,
	[del_comment] [nvarchar](255) NULL,
	[id_declarant_history_was] [int] NULL,
	[sign] [int] NULL,
 CONSTRAINT [PK_declarant_history] PRIMARY KEY CLUSTERED 
(
	[id_declarant_history] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[declarant_history]  WITH CHECK ADD  CONSTRAINT [FK_declarant_history_okfs] FOREIGN KEY([KFS])
REFERENCES [dbo].[okfs] ([kfs_code])
GO

ALTER TABLE [dbo].[declarant_history] CHECK CONSTRAINT [FK_declarant_history_okfs]
GO

ALTER TABLE [dbo].[declarant_history]  WITH CHECK ADD  CONSTRAINT [FK_declarant_history_okopf] FOREIGN KEY([KOPF])
REFERENCES [dbo].[okopf] ([kopf_code])
GO

ALTER TABLE [dbo].[declarant_history] CHECK CONSTRAINT [FK_declarant_history_okopf]
GO

ALTER TABLE [dbo].[declarant_history]  WITH CHECK ADD  CONSTRAINT [FK_declarant_history_okved] FOREIGN KEY([OKVED])
REFERENCES [dbo].[okved] ([okved_code])
GO

ALTER TABLE [dbo].[declarant_history] CHECK CONSTRAINT [FK_declarant_history_okved]
GO

ALTER TABLE [dbo].[declarant_history]  WITH CHECK ADD  CONSTRAINT [FK_declarant_history_subject_okato] FOREIGN KEY([OKATO])
REFERENCES [dbo].[subject_okato] ([subject_okato_code])
GO

ALTER TABLE [dbo].[declarant_history] CHECK CONSTRAINT [FK_declarant_history_subject_okato]
GO



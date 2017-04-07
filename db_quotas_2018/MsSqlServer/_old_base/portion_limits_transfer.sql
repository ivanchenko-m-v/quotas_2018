USE [limits_2009c]
GO

/****** Object:  Table [dbo].[portion_limits_transfer]    Script Date: 07.04.2017 13:06:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[portion_limits_transfer](
	[id_index] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[id_history] [int] NOT NULL,
	[portion_limit_flag] [tinyint] NOT NULL,
	[id_declarant_from] [int] NOT NULL,
	[id_declarant_to] [int] NOT NULL,
	[id_basin] [int] NOT NULL,
	[id_regime] [int] NOT NULL,
	[id_region] [int] NOT NULL,
	[id_fish] [int] NOT NULL,
	[id_subject_from] [int] NOT NULL,
	[id_subject] [int] NOT NULL,
	[id_unit] [int] NOT NULL,
	[portion_limit] [decimal](28, 12) NULL,
	[date] [datetime] NULL,
	[document] [varchar](50) NULL,
	[document_date] [datetime] NULL,
	[transfer_number] [varchar](60) NOT NULL,
	[transfer_date] [datetime] NOT NULL,
	[transfer_reason] [varchar](150) NULL,
	[declarant_from] [varchar](250) NULL,
	[declarant_from_inn] [varchar](20) NULL,
	[declarant_to] [varchar](250) NULL,
	[declarant_to_inn] [varchar](20) NULL,
	[id_history_from] [int] NULL,
	[id_history_to] [int] NULL,
	[report_organization] [varchar](150) NULL,
	[report_number] [varchar](60) NULL,
	[report_date] [datetime] NULL,
	[report_document] [varchar](50) NULL,
	[contract_organization] [varchar](150) NULL,
	[contract_number] [varchar](60) NULL,
	[contract_date] [datetime] NULL,
	[note] [varchar](255) NULL,
	[responsible] [varchar](30) NULL,
	[timestamp_] [datetime] NULL,
 CONSTRAINT [PK_portion_limits_transfer] PRIMARY KEY CLUSTERED 
(
	[id_index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[portion_limits_transfer]  WITH CHECK ADD  CONSTRAINT [FK_portion_limits_transfer_basin] FOREIGN KEY([id_basin])
REFERENCES [dbo].[basin] ([id_basin])
GO

ALTER TABLE [dbo].[portion_limits_transfer] CHECK CONSTRAINT [FK_portion_limits_transfer_basin]
GO

ALTER TABLE [dbo].[portion_limits_transfer]  WITH CHECK ADD  CONSTRAINT [FK_portion_limits_transfer_declarant] FOREIGN KEY([id_declarant_from])
REFERENCES [dbo].[declarant] ([id_declarant])
GO

ALTER TABLE [dbo].[portion_limits_transfer] CHECK CONSTRAINT [FK_portion_limits_transfer_declarant]
GO

ALTER TABLE [dbo].[portion_limits_transfer]  WITH CHECK ADD  CONSTRAINT [FK_portion_limits_transfer_fish] FOREIGN KEY([id_fish])
REFERENCES [dbo].[fish] ([id_fish])
GO

ALTER TABLE [dbo].[portion_limits_transfer] CHECK CONSTRAINT [FK_portion_limits_transfer_fish]
GO

ALTER TABLE [dbo].[portion_limits_transfer]  WITH CHECK ADD  CONSTRAINT [FK_portion_limits_transfer_regime] FOREIGN KEY([id_regime])
REFERENCES [dbo].[regime] ([id_regime])
GO

ALTER TABLE [dbo].[portion_limits_transfer] CHECK CONSTRAINT [FK_portion_limits_transfer_regime]
GO

ALTER TABLE [dbo].[portion_limits_transfer]  WITH CHECK ADD  CONSTRAINT [FK_portion_limits_transfer_region] FOREIGN KEY([id_region])
REFERENCES [dbo].[region] ([id_region])
GO

ALTER TABLE [dbo].[portion_limits_transfer] CHECK CONSTRAINT [FK_portion_limits_transfer_region]
GO

ALTER TABLE [dbo].[portion_limits_transfer]  WITH CHECK ADD  CONSTRAINT [FK_portion_limits_transfer_subject] FOREIGN KEY([id_subject])
REFERENCES [dbo].[subject] ([id_subject])
GO

ALTER TABLE [dbo].[portion_limits_transfer] CHECK CONSTRAINT [FK_portion_limits_transfer_subject]
GO

ALTER TABLE [dbo].[portion_limits_transfer]  WITH CHECK ADD  CONSTRAINT [FK_portion_limits_transfer_unit] FOREIGN KEY([id_unit])
REFERENCES [dbo].[unit] ([id_unit])
GO

ALTER TABLE [dbo].[portion_limits_transfer] CHECK CONSTRAINT [FK_portion_limits_transfer_unit]
GO



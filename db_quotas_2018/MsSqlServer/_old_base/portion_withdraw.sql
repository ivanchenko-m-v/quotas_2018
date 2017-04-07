USE [limits_2009c]
GO

/****** Object:  Table [dbo].[portion_withdraw]    Script Date: 07.04.2017 13:07:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[portion_withdraw](
	[id_history] [int] NOT NULL,
	[id_declarant] [int] NOT NULL,
	[id_basin] [int] NOT NULL,
	[id_regime] [int] NOT NULL,
	[id_region] [int] NOT NULL,
	[id_fish] [int] NOT NULL,
	[id_subject] [int] NOT NULL,
	[portion] [decimal](38, 17) NULL,
	[date_open] [datetime] NULL,
	[date_close] [datetime] NULL,
	[report_organization] [varchar](150) NULL,
	[report_number] [varchar](60) NULL,
	[report_date] [datetime] NULL,
	[report_document] [varchar](50) NULL,
	[contract_organization] [varchar](150) NULL,
	[contract_number] [varchar](60) NULL,
	[contract_date] [datetime] NULL,
	[contract_cancel_organization] [varchar](100) NULL,
	[contract_cancel_number] [varchar](60) NULL,
	[contract_cancel_date] [datetime] NULL,
	[contract_cancel_document] [varchar](50) NULL,
	[transfer_number] [varchar](150) NULL,
	[transfer_date] [datetime] NULL,
	[transfer_reason] [varchar](150) NULL,
	[note] [varchar](255) NULL,
	[responsible] [varchar](30) NULL,
	[timestamp_] [datetime] NULL,
	[id_declarant_history] [int] NOT NULL,
 CONSTRAINT [PK_portion_withdraw] PRIMARY KEY CLUSTERED 
(
	[id_history] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[portion_withdraw]  WITH CHECK ADD  CONSTRAINT [FK_portion_withdraw_basin] FOREIGN KEY([id_basin])
REFERENCES [dbo].[basin] ([id_basin])
GO

ALTER TABLE [dbo].[portion_withdraw] CHECK CONSTRAINT [FK_portion_withdraw_basin]
GO

ALTER TABLE [dbo].[portion_withdraw]  WITH CHECK ADD  CONSTRAINT [FK_portion_withdraw_declarant] FOREIGN KEY([id_declarant])
REFERENCES [dbo].[declarant] ([id_declarant])
GO

ALTER TABLE [dbo].[portion_withdraw] CHECK CONSTRAINT [FK_portion_withdraw_declarant]
GO

ALTER TABLE [dbo].[portion_withdraw]  WITH CHECK ADD  CONSTRAINT [FK_portion_withdraw_fish] FOREIGN KEY([id_fish])
REFERENCES [dbo].[fish] ([id_fish])
GO

ALTER TABLE [dbo].[portion_withdraw] CHECK CONSTRAINT [FK_portion_withdraw_fish]
GO

ALTER TABLE [dbo].[portion_withdraw]  WITH CHECK ADD  CONSTRAINT [FK_portion_withdraw_portion_history] FOREIGN KEY([id_history])
REFERENCES [dbo].[portion_history] ([id_history])
GO

ALTER TABLE [dbo].[portion_withdraw] CHECK CONSTRAINT [FK_portion_withdraw_portion_history]
GO

ALTER TABLE [dbo].[portion_withdraw]  WITH CHECK ADD  CONSTRAINT [FK_portion_withdraw_regime] FOREIGN KEY([id_regime])
REFERENCES [dbo].[regime] ([id_regime])
GO

ALTER TABLE [dbo].[portion_withdraw] CHECK CONSTRAINT [FK_portion_withdraw_regime]
GO

ALTER TABLE [dbo].[portion_withdraw]  WITH CHECK ADD  CONSTRAINT [FK_portion_withdraw_region] FOREIGN KEY([id_region])
REFERENCES [dbo].[region] ([id_region])
GO

ALTER TABLE [dbo].[portion_withdraw] CHECK CONSTRAINT [FK_portion_withdraw_region]
GO

ALTER TABLE [dbo].[portion_withdraw]  WITH CHECK ADD  CONSTRAINT [FK_portion_withdraw_subject] FOREIGN KEY([id_subject])
REFERENCES [dbo].[subject] ([id_subject])
GO

ALTER TABLE [dbo].[portion_withdraw] CHECK CONSTRAINT [FK_portion_withdraw_subject]
GO



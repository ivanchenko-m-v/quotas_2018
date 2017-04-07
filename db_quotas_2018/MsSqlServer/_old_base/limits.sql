USE [limits_2009c]
GO

/****** Object:  Table [dbo].[limits]    Script Date: 07.04.2017 12:55:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[limits](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[id_declarant] [int] NOT NULL,
	[id_basin] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[id_regime] [int] NOT NULL,
	[id_region] [int] NOT NULL,
	[id_fish] [int] NOT NULL,
	[id_subject] [int] NOT NULL,
	[id_unit] [int] NOT NULL,
	[catch_volume] [decimal](38, 17) NULL,
	[document] [varchar](50) NOT NULL,
	[document_date] [datetime] NOT NULL,
	[document_change] [varchar](50) NULL,
	[document_change_date] [datetime] NULL,
	[person] [varchar](50) NULL,
	[note] [varchar](255) NULL,
	[responsible] [varchar](30) NULL,
	[timestamp_] [datetime] NULL,
 CONSTRAINT [PK_limits] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[limits]  WITH CHECK ADD  CONSTRAINT [FK_limits_basin] FOREIGN KEY([id_basin])
REFERENCES [dbo].[basin] ([id_basin])
GO

ALTER TABLE [dbo].[limits] CHECK CONSTRAINT [FK_limits_basin]
GO

ALTER TABLE [dbo].[limits]  WITH CHECK ADD  CONSTRAINT [FK_limits_declarant] FOREIGN KEY([id_declarant])
REFERENCES [dbo].[declarant] ([id_declarant])
GO

ALTER TABLE [dbo].[limits] CHECK CONSTRAINT [FK_limits_declarant]
GO

ALTER TABLE [dbo].[limits]  WITH CHECK ADD  CONSTRAINT [FK_limits_fish] FOREIGN KEY([id_fish])
REFERENCES [dbo].[fish] ([id_fish])
GO

ALTER TABLE [dbo].[limits] CHECK CONSTRAINT [FK_limits_fish]
GO

ALTER TABLE [dbo].[limits]  WITH CHECK ADD  CONSTRAINT [FK_limits_regime] FOREIGN KEY([id_regime])
REFERENCES [dbo].[regime] ([id_regime])
GO

ALTER TABLE [dbo].[limits] CHECK CONSTRAINT [FK_limits_regime]
GO

ALTER TABLE [dbo].[limits]  WITH CHECK ADD  CONSTRAINT [FK_limits_region] FOREIGN KEY([id_region])
REFERENCES [dbo].[region] ([id_region])
GO

ALTER TABLE [dbo].[limits] CHECK CONSTRAINT [FK_limits_region]
GO

ALTER TABLE [dbo].[limits]  WITH CHECK ADD  CONSTRAINT [FK_limits_subject] FOREIGN KEY([id_subject])
REFERENCES [dbo].[subject] ([id_subject])
GO

ALTER TABLE [dbo].[limits] CHECK CONSTRAINT [FK_limits_subject]
GO



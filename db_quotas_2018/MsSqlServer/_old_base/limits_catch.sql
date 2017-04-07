USE [limits_2009c]
GO

/****** Object:  Table [dbo].[limits_catch]    Script Date: 07.04.2017 12:56:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[limits_catch](
	[date] [datetime] NOT NULL,
	[id_basin] [int] NOT NULL,
	[id_subject] [int] NOT NULL,
	[id_declarant] [int] NOT NULL,
	[id_regime] [int] NOT NULL,
	[id_region] [int] NOT NULL,
	[id_fish] [int] NOT NULL,
	[id_unit] [int] NOT NULL,
	[portion_sign] [int] NOT NULL,
	[portion] [decimal](28, 10) NULL,
	[limits_volume] [decimal](28, 10) NULL,
	[catch_volume_stat] [decimal](28, 10) NULL,
	[catch_volume_stat_oper] [decimal](28, 10) NULL,
	[catch_volume_1] [decimal](28, 10) NULL,
	[catch_volume_2] [decimal](28, 10) NULL,
	[catch_volume_oper] [decimal](28, 10) NULL,
 CONSTRAINT [PK_limits_catch] PRIMARY KEY CLUSTERED 
(
	[date] ASC,
	[id_basin] ASC,
	[id_subject] ASC,
	[id_declarant] ASC,
	[id_regime] ASC,
	[id_region] ASC,
	[id_fish] ASC,
	[id_unit] ASC,
	[portion_sign] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[limits_catch]  WITH CHECK ADD  CONSTRAINT [FK_limits_catch_basin] FOREIGN KEY([id_basin])
REFERENCES [dbo].[basin] ([id_basin])
GO

ALTER TABLE [dbo].[limits_catch] CHECK CONSTRAINT [FK_limits_catch_basin]
GO

ALTER TABLE [dbo].[limits_catch]  WITH CHECK ADD  CONSTRAINT [FK_limits_catch_fish] FOREIGN KEY([id_fish])
REFERENCES [dbo].[fish] ([id_fish])
GO

ALTER TABLE [dbo].[limits_catch] CHECK CONSTRAINT [FK_limits_catch_fish]
GO

ALTER TABLE [dbo].[limits_catch]  WITH CHECK ADD  CONSTRAINT [FK_limits_catch_regime] FOREIGN KEY([id_regime])
REFERENCES [dbo].[regime] ([id_regime])
GO

ALTER TABLE [dbo].[limits_catch] CHECK CONSTRAINT [FK_limits_catch_regime]
GO

ALTER TABLE [dbo].[limits_catch]  WITH CHECK ADD  CONSTRAINT [FK_limits_catch_region] FOREIGN KEY([id_region])
REFERENCES [dbo].[region] ([id_region])
GO

ALTER TABLE [dbo].[limits_catch] CHECK CONSTRAINT [FK_limits_catch_region]
GO

ALTER TABLE [dbo].[limits_catch]  WITH CHECK ADD  CONSTRAINT [FK_limits_catch_subject] FOREIGN KEY([id_subject])
REFERENCES [dbo].[subject] ([id_subject])
GO

ALTER TABLE [dbo].[limits_catch] CHECK CONSTRAINT [FK_limits_catch_subject]
GO



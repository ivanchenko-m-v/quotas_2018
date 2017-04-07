USE [limits_2009c]
GO

/****** Object:  Table [dbo].[limits_common_distribution]    Script Date: 07.04.2017 12:58:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[limits_common_distribution](
	[id_distribution_cl] [int] NOT NULL,
	[id_basin] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[id_regime] [int] NOT NULL,
	[id_region] [int] NOT NULL,
	[id_fish] [int] NOT NULL,
	[id_subject] [int] NOT NULL,
	[id_unit] [int] NOT NULL,
	[catch_volume] [decimal](38, 17) NULL,
	[responsible] [varchar](50) NULL,
	[timestamp_] [datetime] NULL,
 CONSTRAINT [PK_limits_common_distribution] PRIMARY KEY CLUSTERED 
(
	[id_distribution_cl] ASC,
	[id_basin] ASC,
	[date] ASC,
	[id_regime] ASC,
	[id_region] ASC,
	[id_fish] ASC,
	[id_subject] ASC,
	[id_unit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[limits_common_distribution]  WITH CHECK ADD  CONSTRAINT [FK_limits_common_distribution_basin] FOREIGN KEY([id_basin])
REFERENCES [dbo].[basin] ([id_basin])
GO

ALTER TABLE [dbo].[limits_common_distribution] CHECK CONSTRAINT [FK_limits_common_distribution_basin]
GO

ALTER TABLE [dbo].[limits_common_distribution]  WITH CHECK ADD  CONSTRAINT [FK_limits_common_distribution_distribution_cl] FOREIGN KEY([id_distribution_cl])
REFERENCES [dbo].[distribution_cl] ([id_distribution_cl])
GO

ALTER TABLE [dbo].[limits_common_distribution] CHECK CONSTRAINT [FK_limits_common_distribution_distribution_cl]
GO

ALTER TABLE [dbo].[limits_common_distribution]  WITH CHECK ADD  CONSTRAINT [FK_limits_common_distribution_fish] FOREIGN KEY([id_fish])
REFERENCES [dbo].[fish] ([id_fish])
GO

ALTER TABLE [dbo].[limits_common_distribution] CHECK CONSTRAINT [FK_limits_common_distribution_fish]
GO

ALTER TABLE [dbo].[limits_common_distribution]  WITH CHECK ADD  CONSTRAINT [FK_limits_common_distribution_regime] FOREIGN KEY([id_regime])
REFERENCES [dbo].[regime] ([id_regime])
GO

ALTER TABLE [dbo].[limits_common_distribution] CHECK CONSTRAINT [FK_limits_common_distribution_regime]
GO

ALTER TABLE [dbo].[limits_common_distribution]  WITH CHECK ADD  CONSTRAINT [FK_limits_common_distribution_region] FOREIGN KEY([id_region])
REFERENCES [dbo].[region] ([id_region])
GO

ALTER TABLE [dbo].[limits_common_distribution] CHECK CONSTRAINT [FK_limits_common_distribution_region]
GO

ALTER TABLE [dbo].[limits_common_distribution]  WITH CHECK ADD  CONSTRAINT [FK_limits_common_distribution_subject] FOREIGN KEY([id_subject])
REFERENCES [dbo].[subject] ([id_subject])
GO

ALTER TABLE [dbo].[limits_common_distribution] CHECK CONSTRAINT [FK_limits_common_distribution_subject]
GO



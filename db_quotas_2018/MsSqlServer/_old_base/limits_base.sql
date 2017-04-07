USE [limits_2009c]
GO

/****** Object:  Table [dbo].[limits_base]    Script Date: 07.04.2017 12:55:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[limits_base](
	[id_basin] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[id_region] [int] NOT NULL,
	[id_fish] [int] NOT NULL,
	[id_unit] [int] NOT NULL,
	[catch_volume] [decimal](38, 17) NULL,
	[document] [varchar](50) NOT NULL,
	[document_date] [datetime] NOT NULL,
	[person] [varchar](50) NULL,
	[responsible] [varchar](30) NULL,
	[timestamp_] [datetime] NULL,
 CONSTRAINT [PK_limits_base] PRIMARY KEY CLUSTERED 
(
	[id_basin] ASC,
	[date] ASC,
	[id_region] ASC,
	[id_fish] ASC,
	[id_unit] ASC,
	[document] ASC,
	[document_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[limits_base]  WITH CHECK ADD  CONSTRAINT [FK_limits_base_basin] FOREIGN KEY([id_basin])
REFERENCES [dbo].[basin] ([id_basin])
GO

ALTER TABLE [dbo].[limits_base] CHECK CONSTRAINT [FK_limits_base_basin]
GO

ALTER TABLE [dbo].[limits_base]  WITH CHECK ADD  CONSTRAINT [FK_limits_base_fish] FOREIGN KEY([id_fish])
REFERENCES [dbo].[fish] ([id_fish])
GO

ALTER TABLE [dbo].[limits_base] CHECK CONSTRAINT [FK_limits_base_fish]
GO

ALTER TABLE [dbo].[limits_base]  WITH CHECK ADD  CONSTRAINT [FK_limits_base_region] FOREIGN KEY([id_region])
REFERENCES [dbo].[region] ([id_region])
GO

ALTER TABLE [dbo].[limits_base] CHECK CONSTRAINT [FK_limits_base_region]
GO



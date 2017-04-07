USE [limits_2009c]
GO

/****** Object:  Table [dbo].[fish_p]    Script Date: 07.04.2017 12:52:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[fish_p](
	[id_fish] [int] NOT NULL,
	[id_fish_parent] [int] NOT NULL,
 CONSTRAINT [PK_fish_p] PRIMARY KEY CLUSTERED 
(
	[id_fish] ASC,
	[id_fish_parent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



USE [limits_2009c]
GO

/****** Object:  Table [dbo].[basin]    Script Date: 07.04.2017 12:41:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[basin](
	[id_basin] [int] NOT NULL,
	[basin] [varchar](30) NULL,
	[basin_abbr] [char](2) NULL,
 CONSTRAINT [PK_basin] PRIMARY KEY CLUSTERED 
(
	[id_basin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



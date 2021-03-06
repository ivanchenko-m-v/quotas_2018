USE [limits_2009c]
GO

/****** Object:  Table [dbo].[sign]    Script Date: 07.04.2017 13:12:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sign](
	[sign] [int] NOT NULL,
	[sign_name] [varchar](50) NULL,
 CONSTRAINT [PK_sign] PRIMARY KEY CLUSTERED 
(
	[sign] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



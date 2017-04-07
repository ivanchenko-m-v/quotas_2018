USE [limits_2009c]
GO

/****** Object:  Table [dbo].[okved]    Script Date: 07.04.2017 13:01:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[okved](
	[okved_code] [varchar](10) NOT NULL,
	[okved] [varchar](250) NULL,
 CONSTRAINT [PK_okved] PRIMARY KEY CLUSTERED 
(
	[okved_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



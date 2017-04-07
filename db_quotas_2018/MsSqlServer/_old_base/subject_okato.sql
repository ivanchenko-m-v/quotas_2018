USE [limits_2009c]
GO

/****** Object:  Table [dbo].[subject_okato]    Script Date: 07.04.2017 13:13:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[subject_okato](
	[subject_okato_code] [varchar](5) NOT NULL,
	[subject_name] [varchar](125) NULL,
	[id_basin] [varchar](10) NULL,
 CONSTRAINT [PK_subject_okato] PRIMARY KEY CLUSTERED 
(
	[subject_okato_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



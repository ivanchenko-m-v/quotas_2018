USE [limits_2009c]
GO

/****** Object:  Table [dbo].[okopf]    Script Date: 07.04.2017 13:01:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[okopf](
	[kopf_code] [varchar](2) NOT NULL,
	[kopf_name_99] [varchar](125) NULL,
	[kopf_name_93] [varchar](125) NULL,
 CONSTRAINT [PK_okopf] PRIMARY KEY CLUSTERED 
(
	[kopf_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



USE [limits_2009c]
GO

/****** Object:  Table [dbo].[okfs]    Script Date: 07.04.2017 13:00:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[okfs](
	[kfs_code] [varchar](2) NOT NULL,
	[kfs_name_99] [varchar](125) NULL,
	[kfs_name_93] [varchar](125) NULL,
 CONSTRAINT [PK_okfs] PRIMARY KEY CLUSTERED 
(
	[kfs_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



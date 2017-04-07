USE [limits_2009c]
GO

/****** Object:  Table [dbo].[subsidiary_list]    Script Date: 07.04.2017 13:14:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[subsidiary_list](
	[id_subsidiary_list] [int] NOT NULL,
	[subsidiary_list] [varchar](100) NULL,
	[subsidiary_list_sort] [int] NOT NULL,
	[subsidiary_list_name] [varchar](3000) NULL,
 CONSTRAINT [PK_subsidiary_list] PRIMARY KEY CLUSTERED 
(
	[id_subsidiary_list] ASC,
	[subsidiary_list_sort] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



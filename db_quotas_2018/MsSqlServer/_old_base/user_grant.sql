USE [limits_2009c]
GO

/****** Object:  Table [dbo].[user_grant]    Script Date: 07.04.2017 13:16:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[user_grant](
	[PCName] [varchar](30) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[permission] [varchar](50) NOT NULL,
	[permission_value] [int] NULL,
 CONSTRAINT [PK_user_grant] PRIMARY KEY CLUSTERED 
(
	[PCName] ASC,
	[UserName] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



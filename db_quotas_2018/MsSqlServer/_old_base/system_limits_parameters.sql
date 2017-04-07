USE [limits_2009c]
GO

/****** Object:  Table [dbo].[system_limits_parameters]    Script Date: 07.04.2017 13:15:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[system_limits_parameters](
	[id_parameter] [int] NOT NULL,
	[parameter] [varchar](150) NULL,
	[parameter_int_value] [int] NULL,
	[parameter_char_value] [varchar](50) NULL,
 CONSTRAINT [PK_system_limits_parameters] PRIMARY KEY CLUSTERED 
(
	[id_parameter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



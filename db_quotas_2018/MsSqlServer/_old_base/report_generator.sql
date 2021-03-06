USE [limits_2009c]
GO

/****** Object:  Table [dbo].[report_generator]    Script Date: 07.04.2017 13:10:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[report_generator](
	[id_report] [int] NOT NULL,
	[trbkzag] [int] NOT NULL,
	[elname] [varchar](150) NULL,
	[elname_order] [varchar](150) NULL,
	[code_] [int] NULL,
	[order_] [int] NOT NULL,
 CONSTRAINT [PK_report_generator] PRIMARY KEY CLUSTERED 
(
	[id_report] ASC,
	[trbkzag] ASC,
	[order_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[report_generator]  WITH CHECK ADD  CONSTRAINT [FK_report_generator_report] FOREIGN KEY([id_report])
REFERENCES [dbo].[report] ([id_report])
GO

ALTER TABLE [dbo].[report_generator] CHECK CONSTRAINT [FK_report_generator_report]
GO



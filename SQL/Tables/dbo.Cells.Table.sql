USE [AlexLeontievBattleships2017]
GO
/****** Object:  Table [dbo].[Cells]    Script Date: 6/28/2017 3:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cells](
	[CellId] [int] NOT NULL,
	[X] [int] NOT NULL,
	[Y] [int] NOT NULL,
 CONSTRAINT [PK_Cells] PRIMARY KEY CLUSTERED 
(
	[CellId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

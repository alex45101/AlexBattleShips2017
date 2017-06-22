USE [AlexLeontievBattleships2017]
GO
/****** Object:  Table [dbo].[Ships]    Script Date: 6/22/2017 2:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ships](
	[ShipId] [int] NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[Size] [int] NOT NULL,
 CONSTRAINT [PK_Ships] PRIMARY KEY CLUSTERED 
(
	[ShipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [AlexLeontievBattleships2017]
GO
/****** Object:  Table [dbo].[GameStatuses]    Script Date: 6/26/2017 3:12:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameStatuses](
	[StatusId] [int] NOT NULL,
	[Description] [nchar](30) NOT NULL,
 CONSTRAINT [PK_GameStatuses] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

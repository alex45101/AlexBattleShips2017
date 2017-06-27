USE [AlexLeontievBattleships2017]
GO
/****** Object:  Table [dbo].[GameBoards]    Script Date: 6/27/2017 1:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameBoards](
	[GameBoardId] [int] IDENTITY(1,1) NOT NULL,
	[CellId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsFilled] [bit] NOT NULL,
	[IsHit] [bit] NOT NULL,
 CONSTRAINT [PK_GameBoards] PRIMARY KEY CLUSTERED 
(
	[GameBoardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[GameBoards]  WITH CHECK ADD  CONSTRAINT [FK_GameBoards_Cells] FOREIGN KEY([CellId])
REFERENCES [dbo].[Cells] ([CellId])
GO
ALTER TABLE [dbo].[GameBoards] CHECK CONSTRAINT [FK_GameBoards_Cells]
GO
ALTER TABLE [dbo].[GameBoards]  WITH CHECK ADD  CONSTRAINT [FK_GameBoards_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[GameBoards] CHECK CONSTRAINT [FK_GameBoards_Users]
GO

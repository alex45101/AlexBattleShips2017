USE [AlexLeontievBattleships2017]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 6/27/2017 2:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[TimeCreated] [datetime] NOT NULL,
	[PublicRoomId] [uniqueidentifier] NOT NULL,
	[HostId] [int] NOT NULL,
	[JoinedId] [int] NULL,
	[HostReady] [bit] NOT NULL,
	[JoinReady] [bit] NOT NULL,
	[HostGameBoardId] [int] NULL,
	[JoinedGameBoardId] [int] NULL,
	[StatusId] [int] NOT NULL,
	[IsPrivate] [bit] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_GameBoards] FOREIGN KEY([HostGameBoardId])
REFERENCES [dbo].[GameBoards] ([GameBoardId])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_GameBoards]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_GameBoards1] FOREIGN KEY([JoinedGameBoardId])
REFERENCES [dbo].[GameBoards] ([GameBoardId])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_GameBoards1]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_GameStatuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[GameStatuses] ([StatusId])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_GameStatuses]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Users] FOREIGN KEY([HostId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Users]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Users1] FOREIGN KEY([JoinedId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Users1]
GO

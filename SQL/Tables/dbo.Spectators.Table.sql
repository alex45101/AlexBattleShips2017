USE [AlexLeontievBattleships2017]
GO
/****** Object:  Table [dbo].[Spectators]    Script Date: 6/23/2017 3:06:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spectators](
	[SpectatorId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_Spectators] PRIMARY KEY CLUSTERED 
(
	[SpectatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Spectators]  WITH CHECK ADD  CONSTRAINT [FK_Spectators_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomId])
GO
ALTER TABLE [dbo].[Spectators] CHECK CONSTRAINT [FK_Spectators_Rooms]
GO
ALTER TABLE [dbo].[Spectators]  WITH CHECK ADD  CONSTRAINT [FK_Spectators_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Spectators] CHECK CONSTRAINT [FK_Spectators_Users]
GO

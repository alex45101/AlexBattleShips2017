USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_changeHostReady]    Script Date: 6/25/2017 5:31:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_changeHostReady]
		@RoomId int		
AS
BEGIN
	UPDATE Rooms
	SET HostReady = 1
	WHERE RoomId = @RoomId
END
GO

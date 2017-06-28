USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_changeHostReady]    Script Date: 6/27/2017 7:24:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[usp_changeHostReady]
		@PublicRoomId uniqueidentifier		
AS
BEGIN
	DECLARE @RoomId int

	SELECT @RoomId = RoomId
	FROM Rooms
	WHERE Rooms.PublicRoomId = @PublicRoomId

	UPDATE Rooms
	SET HostReady = 1
	WHERE RoomId = @RoomId
END


GO

USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_changeJoinedIdRooms]    Script Date: 6/27/2017 2:20:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_changeJoinedIdRooms]
	@PublicRoomId uniqueidentifier,
	@PublicJoinedId uniqueidentifier
AS
BEGIN
	DECLARE @RoomId int

	SELECT @RoomId = RoomId
	FROM Rooms
	WHERE Rooms.PublicRoomId = @PublicRoomId

	DECLARE @JoinedId int

	SELECT @JoinedId = UserId
	FROM Users
	WHERE Users.PublicUserId = @PublicJoinedId

	UPDATE Rooms
	SET JoinedId = @JoinedId
	WHERE RoomId = @RoomId
END

GO

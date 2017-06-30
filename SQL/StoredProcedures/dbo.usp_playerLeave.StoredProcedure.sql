USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_playerLeave]    Script Date: 6/30/2017 2:47:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_playerLeave]
		@PublicRoomId uniqueidentifier,
		@PublicUserId uniqueidentifier
AS
BEGIN
	DECLARE @RoomId int
	DECLARE @JoinedId int

	SELECT	@RoomId = RoomId
	FROM Rooms
	WHERE Rooms.PublicRoomId = @PublicRoomId

	SELECT @JoinedId = UserId
	FROM Users
	WHERE Users.PublicUserId = @PublicUserId

	UPDATE Rooms
	SET JoinedId = NULL
	,	JoinReady = 0
	,	StatusId = 1
	WHERE	RoomId = @RoomId
	AND		JoinedId = @JoinedId

	SELECT	vw_RoomInfo.StatusId	
	,		vw_RoomInfo.Status	
	FROM vw_RoomInfo
	WHERE	RoomId = @PublicRoomId
END
GO

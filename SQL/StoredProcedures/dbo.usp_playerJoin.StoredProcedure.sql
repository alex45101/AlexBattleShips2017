USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_playerJoin]    Script Date: 6/30/2017 2:47:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROC [dbo].[usp_playerJoin]
	@PublicRoomId uniqueidentifier,
	@PublicJoinedId uniqueidentifier
AS
BEGIN
	DECLARE @RoomId int
	DECLARE @JoinedId int
	DECLARE @PreviousRoomStatus int

	SELECT	@RoomId = RoomId
	,		@PreviousRoomStatus = StatusId
	FROM Rooms
	WHERE Rooms.PublicRoomId = @PublicRoomId

	SELECT @JoinedId = UserId
	FROM Users
	WHERE Users.PublicUserId = @PublicJoinedId


	IF EXISTS (SELECT * FROM Rooms WHERE RoomId = @RoomId AND StatusId = 1)
	BEGIN
		UPDATE Rooms
		SET JoinedId = @JoinedId
		,	StatusId = 2
		WHERE RoomId = @RoomId
	END

	SELECT	vw_RoomInfo.StatusId	
	,		vw_RoomInfo.Status	
	FROM vw_RoomInfo
	WHERE	RoomId = @PublicRoomId
	AND		StatusId = @PreviousRoomStatus

END



GO

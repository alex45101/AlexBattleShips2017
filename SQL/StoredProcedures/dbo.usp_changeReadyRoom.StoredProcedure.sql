USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_changeReadyRoom]    Script Date: 6/29/2017 8:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[usp_changeReadyRoom]
	@PublicRoomId	uniqueidentifier,
	@PublicUserId	uniqueidentifier,
	@ReadyStatus	bit	
AS
BEGIN
	DECLARE @IsRoomReady bit

	DECLARE @RoomId int
	SELECT @RoomId = RoomId
	FROM Rooms
	WHERE Rooms.PublicRoomId = @PublicRoomId

	DECLARE @UserId int
	SELECT @UserId  = UserId
	FROM Users
	WHERE Users.PublicUserId =  @PublicUserId

	IF EXISTS(SELECT * FROM Rooms WHERE RoomId = @RoomId AND HostId = @UserId)
	BEGIN
		UPDATE Rooms
		SET HostReady = @ReadyStatus
		WHERE RoomId = @RoomId

		SELECT	vw_RoomInfo.Name		as	RoomName
		,		vw_RoomInfo.RoomId		as	PublicRoomId
		,		vw_Users.PublicUserId
		,		vw_RoomInfo.HostUser	as	Username	
		,		vw_RoomInfo.HostReady	as	ReadyStatus
		FROM	vw_RoomInfo
		JOIN vw_Users
		ON RoomId = @PublicRoomId	
		AND vw_Users.PublicUserId = @PublicUserId
	END
	ELSE
	BEGIN
		IF EXISTS(SELECT * FROM Rooms WHERE RoomId = @RoomId AND JoinedId = @UserId)
		BEGIN
			UPDATE Rooms
			SET JoinReady = @ReadyStatus
			WHERE RoomId = @RoomId

			SELECT	vw_RoomInfo.Name		as	RoomName
			,		vw_RoomInfo.RoomId		as	PublicRoomId
			,		vw_Users.PublicUserId	
			,		vw_RoomInfo.JoinedUser	as	Username
			,		vw_RoomInfo.JoinedReady	as	ReadyStatus
			FROM vw_RoomInfo
			JOIN vw_Users
			ON RoomId = @PublicRoomId	
			AND vw_Users.PublicUserId = @PublicUserId		
		END
	END
	
	SET @IsRoomReady = dbo.fn_IsRoomReady(@RoomId)

	IF(@IsRoomReady = 1)
	BEGIN
		UPDATE Rooms
		SET StatusId = 3
		WHERE RoomId = @RoomId
	END

END



GO

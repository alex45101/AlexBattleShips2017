USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_setSpectator]    Script Date: 6/29/2017 11:17:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_setSpectator]
	@UserPublicId uniqueidentifier,
	@RoomPublicId uniqueidentifier
AS
BEGIN
	DECLARE @UserId int
	DECLARE @RoomId int

	SELECT @UserId = UserId
	FROM Users
	WHERE Users.PublicUserId = @UserPublicId

	SELECT @RoomId = RoomId
	FROM Rooms
	WHERE Rooms.PublicRoomId = @RoomPublicId

	INSERT Spectators
	VALUES (@UserId, @RoomId)

END
GO

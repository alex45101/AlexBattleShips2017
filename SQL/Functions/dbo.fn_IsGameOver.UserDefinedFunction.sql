USE [AlexLeontievBattleships2017]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_IsGameOver]    Script Date: 6/27/2017 1:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_IsGameOver]
(
		@PublicRoomId	uniqueidentifier,
		@PublicUserId	uniqueidentifier
)
RETURNS bit
AS
BEGIN
	DECLARE @roomId int
	SELECT @roomId = RoomId
	FROM Rooms
	WHERE PublicRoomId = @PublicRoomId

	DECLARE @userId int
	SELECT @userId = UserId
	FROM Users
	WHERE PublicUserId = @PublicUserId

	DECLARE @shipAmount int
	DECLARE @shipHitAmount int

	SELECT	@shipAmount = COUNT(GameBoards.IsFilled),
			@shipHitAmount	=	COUNT(GameBoards.IsHit)
	FROM	GameBoards
	WHERE 	GameBoards.RoomId	=	@roomId
	AND		GameBoards.UserId	=	@userId
	AND		GameBoards.IsFilled	=	1

	IF(@shipHitAmount = @shipAmount)
	BEGIN
		RETURN 1
	END

	RETURN 0
END



GO

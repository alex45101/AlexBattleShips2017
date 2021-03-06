USE [AlexLeontievBattleships2017]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_IsGameOver]    Script Date: 6/29/2017 11:17:45 AM ******/
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
	
	SELECT	@shipAmount = COUNT(GameBoards.IsFilled)
	FROM	GameBoards
	WHERE 	GameBoards.RoomId	=	@roomId
	AND		GameBoards.UserId	=	@userId
	AND		GameBoards.IsFilled	=	1

	SELECT	@shipHitAmount = COUNT(GameBoards.IsFilled)
	FROM	GameBoards
	WHERE 	GameBoards.RoomId	=	@roomId
	AND		GameBoards.UserId	=	@userId
	AND		GameBoards.IsFilled	=	1
	AND		GameBoards.IsHit	=	1

	IF(@shipHitAmount = @shipAmount)
	BEGIN
		RETURN 1
	END

	RETURN 0
END




GO

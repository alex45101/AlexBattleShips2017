USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_Attack]    Script Date: 6/27/2017 12:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Attack]
		@publicRoomId	uniqueidentifier,
		@publicUserId	uniqueidentifier,
		@x				int,
		@y				int
AS
BEGIN
	DECLARE @hitShip bit
	SET	@hitShip = dbo.fn_HitCell (@publicRoomId, @publicUserId, @x, @y)

	DECLARE @userId int
	SELECT @userId = UserId
	FROM Users
	WHERE PublicUserId = @PublicUserId

	DECLARE @roomId int
	SELECT @roomId = RoomId
	FROM Rooms
	WHERE PublicRoomId = @PublicRoomId

	DECLARE @cellId int
	SELECT @cellId = CellId
	FROM Cells
	WHERE	Cells.X = @X
	AND		Cells.Y = @Y

	IF(@hitShip = 1)
	BEGIN
		UPDATE GameBoards
		SET IsHit = 1
		WHERE	GameBoards.RoomId = @roomId
		AND		GameBoards.UserId = @userId
		AND		GameBoards.CellId = @cellId
	END
	ELSE
	BEGIN
		EXEC usp_setEmptyCellGameBoard @publicRoomId, @publicUserId, @x, @y
	END

	DECLARE @isGameOver bit
	SET @isGameOver = dbo.fn_IsGameOver (@publicRoomId, @publicUserId)

	IF(@isGameOver = 0)
	BEGIN
		DECLARE	@nextTurn int
		SET @nextTurn = dbo.fn_ChangeTurn (@publicRoomId)

		UPDATE Rooms
		SET StatusId = @nextTurn
		WHERE	Rooms.RoomId = @RoomId 
	END
	ELSE
	BEGIN
		UPDATE Rooms
		SET StatusId = 5
		WHERE	Rooms.RoomId = @RoomId 
	END
END
GO

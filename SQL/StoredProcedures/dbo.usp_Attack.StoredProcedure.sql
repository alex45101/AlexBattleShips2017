USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_Attack]    Script Date: 7/9/2017 6:52:02 PM ******/
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
	DECLARE @hitSamePlace bit = 0
	DECLARE	@nextTurn int = dbo.fn_ChangeTurn (@publicRoomId)
	DECLARE @hitShip bit = dbo.fn_HitCell (@publicRoomId, @publicUserId, @x, @y)	
	DECLARE @userId int
	DECLARE @roomId int
	DECLARE @cellId int

	SELECT @userId = UserId
	FROM Users
	WHERE PublicUserId = @PublicUserId

	
	SELECT @roomId = RoomId
	FROM Rooms
	WHERE PublicRoomId = @PublicRoomId
	
	SELECT	@cellId = CellId
	FROM	Cells
	WHERE	Cells.X = @X
	AND		Cells.Y = @Y

	IF(dbo.fn_IsHost(@userId) = 0 AND @nextTurn = 4 OR dbo.fn_IsHost(@userId) = 1 AND @nextTurn = 3)
	BEGIN
		IF NOT EXISTS(SELECT * FROM GameBoards WHERE CellId = @cellId AND UserId = @userId AND RoomId = @roomId AND IsHit = 1)
		BEGIN
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

			DECLARE @isGameOver bit = dbo.fn_IsGameOver (@publicRoomId, @publicUserId)			

			IF(@isGameOver = 0)
			BEGIN
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
	END

	SELECT	vw_RoomInfo.StatusId
	,		vw_RoomInfo.Status
	,		vw_BoardInfo.IsShip
	,		vw_BoardInfo.IsHit
	FROM	vw_RoomInfo
	JOIN	vw_BoardInfo	
	ON		vw_BoardInfo.RoomId	= vw_RoomInfo.RoomId
	WHERE	vw_BoardInfo.XPos = @x
	AND		vw_BoardInfo.YPos = @y
	AND	vw_RoomInfo.RoomId = @publicRoomId
END


GO

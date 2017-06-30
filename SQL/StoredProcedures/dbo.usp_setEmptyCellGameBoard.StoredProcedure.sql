USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_setEmptyCellGameBoard]    Script Date: 6/30/2017 3:55:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_setEmptyCellGameBoard]
		@PublicRoomId uniqueidentifier,	
		@PublicUserId uniqueidentifier,		
		@X int,
		@Y int
AS
BEGIN
	DECLARE @UserId int
	DECLARE @RoomId int
	DECLARE @CellId int
	DECLARE @IsFilled bit

	SELECT @UserId = UserId
	FROM Users
	WHERE Users.PublicUserId = @PublicUserId
	
	SELECT @RoomId = RoomId
	FROM Rooms
	WHERE Rooms.PublicRoomId = @PublicRoomId
	
	SELECT @CellId = CellId
	FROM Cells
	WHERE Cells.X = @X AND Cells.Y = @Y

	SET @IsFilled = dbo.fn_IsCellFilled(@RoomId, @UserId, @CellId)
	
	IF(@IsFilled = 0)
	BEGIN
		INSERT GameBoards
		VALUES(@CellId, @RoomId, @UserId, 0, 1)
	END

	SELECT	vw_BoardInfo.IsShip
	,		vw_BoardInfo.XPos
	,		vw_BoardInfo.YPos
	FROM	vw_BoardInfo
	WHERE	vw_BoardInfo.XPos = @X
	AND		vw_BoardInfo.YPos = @Y
END


GO

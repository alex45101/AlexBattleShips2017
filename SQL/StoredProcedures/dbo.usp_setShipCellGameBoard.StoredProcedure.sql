USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_setShipCellGameBoard]    Script Date: 6/29/2017 8:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_setShipCellGameBoard]
		@PublicRoomId uniqueidentifier,	
		@PublicUserId uniqueidentifier,		
		@X int,
		@Y int
AS
BEGIN
	DECLARE @UserId int	
	DECLARE @RoomId int
	DECLARE @CellId int
	
	SELECT @UserId = UserId
	FROM Users
	WHERE Users.PublicUserId = @PublicUserId

	SELECT @RoomId = RoomId
	FROM Rooms
	WHERE Rooms.PublicRoomId = @PublicRoomId
	
	SELECT @CellId = CellId
	FROM Cells
	WHERE Cells.X = @X AND Cells.Y = @Y

	IF NOT EXISTS(SELECT * FROM GameBoards WHERE CellId = @CellId AND RoomId = @RoomId AND UserId = @UserId)
	BEGIN
		DECLARE @CanAddBoard bit = dbo.fn_IsGameSettingUpBoard (@PublicRoomId)		
		DECLARE @IsFilled bit = dbo.fn_IsCellFilled(@RoomId, @UserId, @CellId)

		IF(@CanAddBoard = 1 AND @IsFilled = 0)
		BEGIN
			INSERT GameBoards
			VALUES(@CellId, @RoomId, @UserId, 1, 0)
		END
	END

	SELECT	vw_BoardInfo.IsShip
	,		vw_BoardInfo.XPos
	,		vw_BoardInfo.YPos
	FROM vw_BoardInfo
	WHERE	vw_BoardInfo.XPos = @X
	AND		vw_BoardInfo.YPos = @Y

END


GO

USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_setEmptyCellGameBoard]    Script Date: 6/28/2017 3:02:19 PM ******/
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

	SELECT @UserId = UserId
	FROM Users
	WHERE Users.PublicUserId = @PublicUserId

	DECLARE @RoomId int

	SELECT @RoomId = RoomId
	FROM Rooms
	WHERE Rooms.PublicRoomId = @PublicRoomId

	DECLARE @CellId int
	
	SELECT @CellId = CellId
	FROM Cells
	WHERE Cells.X = @X AND Cells.Y = @Y

	INSERT GameBoards
	VALUES(@CellId, @RoomId, @UserId, 0, 1)

END

GO

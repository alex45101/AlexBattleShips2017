USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_changeHitCell]    Script Date: 6/26/2017 3:12:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_changeHitCell]
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

	UPDATE GameBoards
	SET IsHit = 1
	WHERE	GameBoards.RoomId = @RoomId
	AND		GameBoards.UserId = @UserId
	AND		GameBoards.CellId = @CellId

END
GO

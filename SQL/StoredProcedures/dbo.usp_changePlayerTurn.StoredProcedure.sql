USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_changePlayerTurn]    Script Date: 6/26/2017 3:12:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_changePlayerTurn]
		@PublicRoomId uniqueidentifier
AS
BEGIN
	DECLARE @StatusId int
	DECLARE @RoomId int

	SELECT	@StatusId = StatusId
	,		@RoomId	=	RoomId
	FROM Rooms
	WHERE Rooms.PublicRoomId = @PublicRoomId
	
	DECLARE @NextTurnId	int = 3

	SELECT * FROM GameStatuses

	IF(@StatusId = 3)
	BEGIN
		SET @NextTurnId = 4
	END

	UPDATE Rooms
	SET StatusId = @NextTurnId
	WHERE	Rooms.RoomId = @RoomId 
	AND		Rooms.StatusId = @StatusId
END

GO

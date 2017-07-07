USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_setStatusRoom]    Script Date: 7/6/2017 8:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_setStatusRoom]
		@publicRoomId	uniqueidentifier,
		@statusId		int
AS
BEGIN
	DECLARE @roomId int
	SELECT @roomId = RoomId
	FROM Rooms
	WHERE PublicRoomId = @publicRoomId

	UPDATE Rooms
	SET StatusId = @statusId
	WHERE RoomId = @roomId
END
GO

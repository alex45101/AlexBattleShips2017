USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_setStatusRoom]    Script Date: 6/28/2017 3:02:19 PM ******/
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

USE [AlexLeontievBattleships2017]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_IsGameSettingUpBoard]    Script Date: 6/28/2017 3:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_IsGameSettingUpBoard] 
(
	@PublicRoomId uniqueidentifier
)
RETURNS bit
AS
BEGIN
	DECLARE @RoomId int
	SELECT @RoomId = RoomId
	FROM Rooms
	WHERE Rooms.PublicRoomId = @PublicRoomId
	
	DECLARE @gameStatus int
	SELECT @gameStatus = StatusId
	FROM Rooms
	WHERE RoomId = @RoomId

	IF (@gameStatus = 2)
	BEGIN
		RETURN 1
	END
	
	RETURN 0
END



GO

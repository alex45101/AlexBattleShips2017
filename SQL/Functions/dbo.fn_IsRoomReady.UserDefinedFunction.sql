USE [AlexLeontievBattleships2017]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_IsRoomReady]    Script Date: 6/28/2017 3:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_IsRoomReady]
(
		@RoomId int
)
RETURNS bit
AS
BEGIN
	IF EXISTS (SELECT * FROM Rooms WHERE Rooms.HostReady = 1 AND Rooms.JoinReady = 1 AND Rooms.RoomId = @RoomId)
	BEGIN
		RETURN 1
	END

	RETURN 0
END


GO

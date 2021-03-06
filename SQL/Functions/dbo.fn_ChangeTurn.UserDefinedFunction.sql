USE [AlexLeontievBattleships2017]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ChangeTurn]    Script Date: 6/29/2017 11:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[fn_ChangeTurn]
(
		@PublicRoomId	uniqueidentifier		
)
RETURNS int
AS
BEGIN
	DECLARE @StatusId int
	DECLARE @RoomId int

	SELECT	@StatusId = StatusId
	,		@RoomId	=	RoomId
	FROM Rooms
	WHERE Rooms.PublicRoomId = @PublicRoomId
	
	DECLARE @NextTurnId	int = 3

	IF(@StatusId = 3)
	BEGIN
		SET @NextTurnId = 4
	END

	RETURN @NextTurnId
END



GO

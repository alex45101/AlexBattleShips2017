USE [AlexLeontievBattleships2017]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_HitCell]    Script Date: 6/28/2017 3:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_HitCell] 
(
	-- Add the parameters for the function here
	@PublicRoomId	uniqueidentifier,
	@PublicUserId	uniqueidentifier,
	@X				int,
	@Y				int
)
RETURNS bit
AS
BEGIN
	DECLARE @userId int
	SELECT @userId = UserId
	FROM Users
	WHERE PublicUserId = @PublicUserId

	DECLARE @roomId int
	SELECT @roomId = RoomId
	FROM Rooms
	WHERE PublicRoomId = @PublicRoomId

	DECLARE @cellId int
	SELECT @cellId = CellId
	FROM Cells
	WHERE	Cells.X = @X
	AND		Cells.Y = @Y

	-- Add the T-SQL statements to compute the return value here
	IF EXISTS (SELECT  * FROM vw_BoardInfo WHERE RoomId = @PublicRoomId AND UserId = @PublicUserId AND XPos = @X AND YPos = @Y)
	BEGIN
		RETURN 1
	END
	-- Return the result of the function
	RETURN 0

END

GO

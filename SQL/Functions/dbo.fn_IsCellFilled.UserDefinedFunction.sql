USE [AlexLeontievBattleships2017]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_IsCellFilled]    Script Date: 6/29/2017 11:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_IsCellFilled]
(
		@RoomId int,
		@UserId int,
		@CellId	int
)
RETURNS bit
AS
BEGIN
	
	DECLARE @filled bit = 0

	IF EXISTS(SELECT * FROM GameBoards WHERE RoomId = @RoomId AND UserId = @UserId AND CellId = @CellId)
	BEGIN
		SET @filled = 1
	END

	RETURN @filled
END

GO

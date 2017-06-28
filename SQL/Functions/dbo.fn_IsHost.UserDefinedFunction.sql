USE [AlexLeontievBattleships2017]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_IsHost]    Script Date: 6/28/2017 3:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_IsHost]
(
		@UserId int
)
RETURNS bit
AS
BEGIN
	IF EXISTS (SELECT * FROM Rooms WHERE Rooms.HostId = @UserId)
	BEGIN
		RETURN 1
	END
	
	RETURN 0
END



GO

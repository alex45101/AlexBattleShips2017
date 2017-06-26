USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getSpectator]    Script Date: 6/26/2017 3:12:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_getSpectator]
	@PublicUserId uniqueidentifier
AS
BEGIN
	DECLARE @UserId int

	SELECT @UserId = UserId
	FROM Users
	WHERE Users.PublicUserId = @PublicUserId

	SELECT * FROM Spectators
	WHERE Spectators.UserId = @UserId
END


GO

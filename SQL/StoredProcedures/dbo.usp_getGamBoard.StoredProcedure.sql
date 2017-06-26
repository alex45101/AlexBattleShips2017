USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getGamBoard]    Script Date: 6/26/2017 1:30:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[usp_getGamBoard]
		@PublicUserID uniqueidentifier
AS
BEGIN

DECLARE @UserId int

SELECT @UserId = UserId
FROM Users
WHERE Users.PublicUserId = @PublicUserID

SELECT * FROM	GameBoards
WHERE	GameBoards.UserId = @UserId
END


GO

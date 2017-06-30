USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getUser]    Script Date: 6/30/2017 2:47:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[usp_getUser]
	@PublicUserId uniqueidentifier
AS
BEGIN	
	SELECT  Username
	,		PublicUserId
	FROM Users
	WHERE Users.PublicUserId = @PublicUserId
END


GO

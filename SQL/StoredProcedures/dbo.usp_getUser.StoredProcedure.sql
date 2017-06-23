USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getUser]    Script Date: 6/23/2017 2:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_getUser]
	@UserId int
AS
BEGIN
SELECT * FROM Users
WHERE UserId = @UserId
END

GO

USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_setUser]    Script Date: 6/29/2017 3:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROC [dbo].[usp_setUser]
	@Username nvarchar(20)
AS

DECLARE @id uniqueidentifier = NEWID()

INSERT Users
VALUES(@Username, @id)

SELECT * 
FROM vw_Users
WHERE	Username = @Username
AND		PublicUserId = @id



GO

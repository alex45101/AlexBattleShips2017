USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getGameBoard]    Script Date: 6/27/2017 2:20:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROC [dbo].[usp_getGameBoard]
		@PublicUserID uniqueidentifier
AS
BEGIN

SELECT * FROM	vw_BoardInfo
WHERE	vw_BoardInfo.UserId = @PublicUserID
END



GO

USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getGameBoard]    Script Date: 6/28/2017 3:02:19 PM ******/
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

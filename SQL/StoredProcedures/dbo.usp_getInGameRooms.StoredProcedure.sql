USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getInGameRooms]    Script Date: 6/26/2017 1:30:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_getInGameRooms]
AS
BEGIN
	SELECT	*
	FROM vw_RoomInfo
	WHERE InGame = 1
END
GO

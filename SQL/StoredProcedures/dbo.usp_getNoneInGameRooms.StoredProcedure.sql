USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getNoneInGameRooms]    Script Date: 6/26/2017 1:30:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_getNoneInGameRooms]
AS
BEGIN
	SELECT	*
	FROM vw_RoomInfo
	WHERE InGame = 0
END
GO

USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getNoneInGameRooms]    Script Date: 6/26/2017 3:12:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_getNoneInGameRooms]
AS
BEGIN
	SELECT	*
	FROM vw_RoomInfo
	WHERE StatusId != 3
END

GO

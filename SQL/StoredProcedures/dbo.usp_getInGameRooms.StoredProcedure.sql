USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getInGameRooms]    Script Date: 6/29/2017 11:17:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_getInGameRooms]
AS
BEGIN
	SELECT	*
	FROM vw_RoomInfo
	WHERE StatusId = 3
END

GO

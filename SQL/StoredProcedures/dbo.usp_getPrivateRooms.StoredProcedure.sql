USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getPrivateRooms]    Script Date: 6/27/2017 3:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[usp_getPrivateRooms]
AS
BEGIN
	SELECT	*
	FROM vw_RoomInfo
	WHERE IsPrivate = 1
END
GO
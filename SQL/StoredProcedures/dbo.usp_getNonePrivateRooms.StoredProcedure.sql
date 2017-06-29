USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getNonePrivateRooms]    Script Date: 6/29/2017 11:17:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_getNonePrivateRooms]
AS
BEGIN
	SELECT	*
	FROM vw_RoomInfo
	WHERE IsPrivate = 0
END
GO

USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getNonePrivateRooms]    Script Date: 6/29/2017 3:07:13 PM ******/
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

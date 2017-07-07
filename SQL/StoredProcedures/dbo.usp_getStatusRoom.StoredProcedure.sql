USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getStatusRoom]    Script Date: 7/6/2017 8:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_getStatusRoom]
		@publicRoomId uniqueidentifier
AS
BEGIN
	SELECT	StatusId
		,	Status
	FROM	vw_RoomInfo
	WHERE vw_RoomInfo.RoomId = @publicRoomId
END
GO

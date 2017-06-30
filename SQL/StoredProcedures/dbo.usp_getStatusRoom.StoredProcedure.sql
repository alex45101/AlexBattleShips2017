USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getStatusRoom]    Script Date: 6/30/2017 2:47:16 PM ******/
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

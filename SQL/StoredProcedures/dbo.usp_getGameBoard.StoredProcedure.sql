USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getGameBoard]    Script Date: 7/6/2017 8:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROC [dbo].[usp_getGameBoard]
		@PublicUserId uniqueidentifier,
		@PublicRoomId uniqueidentifier
AS
BEGIN

SELECT * FROM	vw_BoardInfo
WHERE	vw_BoardInfo.UserId = @PublicUserId
AND		vw_BoardInfo.RoomId = @PublicRoomId

END




GO

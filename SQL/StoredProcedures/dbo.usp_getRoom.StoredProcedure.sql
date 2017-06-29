USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getRoom]    Script Date: 6/29/2017 11:17:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROC [dbo].[usp_getRoom]
	@PublicRoomId uniqueidentifier
AS
BEGIN
	SELECT *
	FROM vw_RoomInfo
	WHERE RoomId = @PublicRoomId
END





GO

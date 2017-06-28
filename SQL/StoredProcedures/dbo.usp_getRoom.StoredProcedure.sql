USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getRoom]    Script Date: 6/27/2017 8:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROC [dbo].[usp_getRoom]
	@PublicRoomId uniqueidentifier
AS
BEGIN
	SELECT	Name
	,		TimeCreated
	,		PublicRoomId
	,		HostId
	,		JoinedId
	,		HostReady
	,		JoinReady
	,		HostGameBoardId
	,		JoinedGameBoardId
	,		StatusId
	,		IsPrivate
	FROM Rooms
	WHERE PublicRoomId = @PublicRoomId
END




GO

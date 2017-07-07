USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getUsersInRoom]    Script Date: 7/6/2017 8:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_getUsersInRoom]
	@PublicRoomId uniqueidentifier
AS
BEGIN

	SELECT	Joined.PublicUserId	as	JoinedId
	,		Host.PublicUserId	as	HostId
	FROM Rooms
	JOIN Users	as	Host
	ON	Rooms.HostId = Host.UserId AND PublicRoomId	= @PublicRoomId
	LEFT JOIN Users	as	Joined
	ON	Rooms.JoinedId	=	Joined.UserId	
END
GO

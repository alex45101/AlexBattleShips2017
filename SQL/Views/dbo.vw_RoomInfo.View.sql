USE [AlexLeontievBattleships2017]
GO
/****** Object:  View [dbo].[vw_RoomInfo]    Script Date: 6/28/2017 3:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vw_RoomInfo]
AS
SELECT	Name
	,	TimeCreated
	,	rm.PublicRoomId			as	RoomId
	,	hostUser.Username		as	HostUser	
	,	rm.HostReady			as	HostReady
	,	joinedUser.Username		as	JoinedUser
	,	rm.JoinReady			as	JoinedReady
	,	gmStatus.StatusId	
	,	gmStatus.Description	as	Status
	,	IsPrivate
FROM Rooms			as	rm
JOIN Users			as	hostUser
ON rm.HostId	=	hostUser.UserId
LEFT JOIN Users		as	joinedUser
ON rm.JoinedId	 =	joinedUser.UserId
LEFT JOIN GameStatuses	as gmStatus
ON rm.StatusId = gmStatus.StatusId






GO

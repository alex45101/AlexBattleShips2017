USE [AlexLeontievBattleships2017]
GO
/****** Object:  View [dbo].[vw_RoomInfo]    Script Date: 6/25/2017 5:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_RoomInfo]
AS
SELECT	Name
	,	TimeCreated
	,	PublicId
	,	hostUser.Username		as	HostUser	
	,	joinedUser.Username		as	JoinedUser
	,	InGame
	,	IsPrivate
FROM Rooms			as	rm
JOIN Users			as	hostUser
ON rm.HostId	=	hostUser.UserId
LEFT JOIN Users		as	joinedUser
ON rm.JoinedId	 =	joinedUser.UserId

GO

USE [AlexLeontievBattleships2017]
GO
/****** Object:  View [dbo].[vw_Spectators]    Script Date: 6/28/2017 3:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_Spectators]
AS
SELECT	Name		as	RoomName
	,	TimeCreated
	,	rm.PublicRoomId	as	RoomId
	,	Username	as	Spectator
	,	InGame
	,	IsPrivate
FROM		Rooms		as	rm
JOIN		Spectators	as	spec
ON	rm.RoomId = spec.RoomId
LEFT JOIN	Users		as	specUser
ON	specUser.UserId = spec.UserId


GO

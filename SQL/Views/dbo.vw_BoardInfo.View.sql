USE [AlexLeontievBattleships2017]
GO
/****** Object:  View [dbo].[vw_BoardInfo]    Script Date: 6/26/2017 3:12:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_BoardInfo]
AS
SELECT	rm.Name		as	RoomName
	,	u.Username	as	Username
	,	c.X			as	XPos
	,	c.Y			as	YPos
	,	gb.IsFilled	as	IsShip
	,	gb.IsHit
FROM		Rooms	as	rm
JOIN		GameBoards as gb
ON		gb.RoomId = rm.RoomId
JOIN	Cells	as	c
ON		gb.CellId = c.CellId
LEFT JOIN	Users	as	u
ON		u.UserId = gb.UserId




GO

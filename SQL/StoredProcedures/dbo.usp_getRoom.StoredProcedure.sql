USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getRoom]    Script Date: 6/30/2017 2:47:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE PROC [dbo].[usp_getRoom]
	@PageNumber int,
	@PageSize int = 10
AS
BEGIN
	SELECT * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY vw_RoomInfo.TimeCreated DESC) AS RowNumber, Name as RoomName, RoomId, HostUser, Status, IsPrivate
					FROM vw_RoomInfo
					WHERE JoinedUser IS NULL) list
	WHERE list.RowNumber > (@PageNumber - 1) * @PageSize AND list.RowNumber < (@PageNumber * @PageSize)
	ORDER BY RowNumber
END


GO

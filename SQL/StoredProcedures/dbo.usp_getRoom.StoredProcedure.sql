USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getRoom]    Script Date: 6/29/2017 3:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROC [dbo].[usp_getRoom]
	@PageNumber int,
	@PageSize int = 10
AS
BEGIN
	SELECT * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY vw_RoomInfo.TimeCreated DESC) AS RowNumber, *
					FROM vw_RoomInfo
					WHERE JoinedUser IS NULL) list
	WHERE list.RowNumber > (@PageNumber - 1) * @PageSize AND list.RowNumber < (@PageNumber * @PageSize)
	ORDER BY RowNumber
END






GO

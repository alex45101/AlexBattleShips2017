USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getRoom]    Script Date: 6/23/2017 2:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_getRoom]
	@RoomId int
AS
BEGIN
SELECT * FROM Rooms
WHERE RoomId = @RoomId
END

GO

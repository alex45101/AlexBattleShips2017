USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getSpectator]    Script Date: 6/23/2017 3:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_getSpectator]
	@SpectatorId int
AS
BEGIN
SELECT * FROM Spectators
WHERE SpectatorId = @SpectatorId
END

GO

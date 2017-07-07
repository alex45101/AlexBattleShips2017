USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_setCell]    Script Date: 7/6/2017 8:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_setCell]
	@X int,
	@Y int
AS
INSERT Cells
VALUES(@X, @Y)
GO

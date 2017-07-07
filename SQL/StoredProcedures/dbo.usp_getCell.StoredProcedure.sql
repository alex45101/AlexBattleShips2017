USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getCell]    Script Date: 7/6/2017 8:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_getCell]
		@CellId int
AS
BEGIN
SELECT * FROM	Cells
WHERE			CellId = @CellId
END
GO

USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_getCell]    Script Date: 6/29/2017 3:07:13 PM ******/
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

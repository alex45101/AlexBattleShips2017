USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_setUser]    Script Date: 6/27/2017 7:24:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[usp_setUser]
	@Username nvarchar(20)
AS

INSERT Users
VALUES(@Username, NEWID())



GO

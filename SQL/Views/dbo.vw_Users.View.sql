USE [AlexLeontievBattleships2017]
GO
/****** Object:  View [dbo].[vw_Users]    Script Date: 6/28/2017 3:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Users]
AS
SELECT	Username
,		PublicUserId
FROM Users
GO

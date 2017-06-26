USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_setRoom]    Script Date: 6/25/2017 5:31:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_setRoom]
	@Name nvarchar(25),
	@HostId int,
	@IsPrivate bit
AS
INSERT Rooms
VALUES(@Name, GETDATE(), NEWID(), @HostId, NULL, 0, 0, NULL, NULL, 0, @IsPrivate)
GO

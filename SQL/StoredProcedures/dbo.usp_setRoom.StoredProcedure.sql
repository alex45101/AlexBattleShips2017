USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_setRoom]    Script Date: 6/26/2017 1:30:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_setRoom]
	@Name nvarchar(25),
	@PublicHostId uniqueidentifier,
	@IsPrivate bit
AS

DECLARE @HostId int

SELECT @HostId = UserId
FROM Users
WHERE Users.PublicId = @PublicHostId

INSERT Rooms
VALUES(@Name, GETDATE(), NEWID(), @HostId, NULL, 0, 0, NULL, NULL, 0, @IsPrivate)

GO

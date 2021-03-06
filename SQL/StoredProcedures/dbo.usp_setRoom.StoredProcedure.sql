USE [AlexLeontievBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_setRoom]    Script Date: 6/29/2017 11:17:19 AM ******/
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
DECLARE @id uniqueidentifier = NEWID()


SELECT @HostId = UserId
FROM Users
WHERE Users.PublicUserId = @PublicHostId

INSERT Rooms
VALUES(@Name, GETDATE(), @id, @HostId, NULL, 0, 0, NULL, NULL, 1, @IsPrivate)

SELECT *
FROM vw_RoomInfo
WHERE	Name	= @Name
AND		RoomId	= @id


GO

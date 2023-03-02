USE [EDIFECSProcess]
GO

/****** Object:  Trigger [dbo].[myOutboundHSencSourceError]    Script Date: 12/6/2021 2:48:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE TRIGGER [dbo].[myOutboundHSencSourceError] 
       ON [dbo].[OutboundHSencSourceError] AFTER INSERT,UPDATE
  AS
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insClaimID varchar(25), 
           @insLineNumber smallint, 
           @insSourceSystem varchar(50), 
           @insSubLine smallint,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount

IF @NUMROWS > 0
BEGIN

       DECLARE @Now datetime2(0);
       SET @Now = CURRENT_TIMESTAMP;

       -- maintain the LastModifiedTimestamp column for any modified rows
       IF EXISTS(SELECT * FROM deleted) -- only maintain for updates - DEFAULTs take care of inserts
       BEGIN
       UPDATE [dbo].[OutboundHSencSourceError]
              SET LastModifiedTimestamp = @Now
              FROM [dbo].[OutboundHSencSourceError] AS T
              JOIN deleted AS d
                      ON T.ClaimID = d.ClaimID AND
      T.SourceSystem = d.SourceSystem 
              WHERE (1=2
                      OR T.[ClaimSource] <> d.[ClaimSource]
                      OR T.[DeletedFlag] <> d.[DeletedFlag]
                      OR T.[ClaimStatusCode] <> d.[ClaimStatusCode]
                      OR (T.[ClaimStatusCode] IS NULL AND d.[ClaimStatusCode] IS NOT NULL)
                      OR (T.[ClaimStatusCode] IS NOT NULL AND d.[ClaimStatusCode] IS NULL)
                      OR T.[ClaimProcessType] <> d.[ClaimProcessType]
                      OR (T.[ClaimProcessType] IS NULL AND d.[ClaimProcessType] IS NOT NULL)
                      OR (T.[ClaimProcessType] IS NOT NULL AND d.[ClaimProcessType] IS NULL)
                      OR T.[ErrorMessage] <> d.[ErrorMessage]
                      );
       END;

END;
  RETURN
ERROR:
    RAISERROR (@errmsg, @errno, 1);
    ROLLBACK TRANSACTION;
END;




GO

ALTER TABLE [dbo].[OutboundHSencSourceError] ENABLE TRIGGER [myOutboundHSencSourceError]
GO

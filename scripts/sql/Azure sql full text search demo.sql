/* Drop existing structure */

DROP TABLE IF EXISTS [dbo].[Complaint] 

GO 
CREATE TABLE [dbo].[Complaint] (
    [ComplaintId] INT            IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (MAX) NULL,
    [WhatHappend] NVARCHAR (MAX) NULL,
    [Company]     NVARCHAR (MAX) NULL,
    [SentDate]    DATETIME       NOT NULL,
    CONSTRAINT [PK_dbo.Complaint] PRIMARY KEY CLUSTERED ([ComplaintId] ASC)   
);
	
/* Populate data */

INSERT INTO [dbo].[Complaint] ([Title],[WhatHappend],[Company],[SentDate])  VALUES ('Complaint 1','Missing software','Apple' ,getdate())
INSERT INTO [dbo].[Complaint] ([Title],[WhatHappend],[Company],[SentDate])  VALUES ('Complaint 2','Missing software','Apple' ,getdate())
INSERT INTO [dbo].[Complaint] ([Title],[WhatHappend],[Company],[SentDate])  VALUES ('Complaint 3','Missing software','Apple' ,getdate())
INSERT INTO [dbo].[Complaint] ([Title],[WhatHappend],[Company],[SentDate])  VALUES ('Complaint 4','Missing software','Apple' ,getdate())

INSERT INTO [dbo].[Complaint] ([Title],[WhatHappend],[Company],[SentDate])  VALUES ('Complaint 5','Missing hardware','IBM' ,getdate())
INSERT INTO [dbo].[Complaint] ([Title],[WhatHappend],[Company],[SentDate])  VALUES ('Complaint 6','Missing hardware','IBM' ,getdate())
INSERT INTO [dbo].[Complaint] ([Title],[WhatHappend],[Company],[SentDate])  VALUES ('Complaint 7','Missing hardware','IBM' ,getdate())
INSERT INTO [dbo].[Complaint] ([Title],[WhatHappend],[Company],[SentDate])  VALUES ('Complaint 8','Missing hardware','IBM' ,getdate())

/* Show data */
SELECT * FROM [dbo].[Complaint]

GO




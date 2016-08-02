USE [/***** YOUR DATABASE HERE *****/]
GO

/****** Object:  Table [dbo].[links]    Script Date: 8/2/2016 1:02:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[links](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](35) NOT NULL,
	[link] [varchar](120) NOT NULL,
	[icon] [varchar](120) NOT NULL,
	[username] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


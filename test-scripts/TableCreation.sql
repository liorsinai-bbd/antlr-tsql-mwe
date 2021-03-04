-- Movies table
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [varchar](120) NULL,
	[ReleaseDate] [date] NULL,
	[RunningTime] [int] NULL,
	[MovieDescription] [varchar](8000) NULL,
	[Genre] [varchar](1000) NULL,
	MoviePoster VARBINARY(MAX) NULL,
	CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
	(
		[MovieID] ASC
	)
);
GO
CREATE OR ALTER PROCEDURE INSERT_INTO_DIM_COMPETITIONS
(@JSON VARCHAR(MAX) = '')
AS BEGIN

DROP TABLE IF EXISTS [dbo].[dim_Competitions]

CREATE TABLE [dbo].[dim_Competitions](
	[country_id] [bigint] NULL,
	[country_name] [nvarchar](50) NULL,
	[league_id] [bigint] NULL,
	[league_name] [nvarchar](50) NULL,
	[league_season] [nvarchar](36) NULL
) ON [PRIMARY]


INSERT INTO [dbo].[dim_Competitions]
SELECT country_id, country_name, league_id, league_name, league_season
	FROM OPENJSON(@json)
	WITH (
		country_id NVARCHAR(50) '$.country_id',
		country_name NVARCHAR(50) '$.country_name',
		league_id NVARCHAR(50) '$.league_id',
		league_name NVARCHAR(50) '$.league_name',
		league_season VARCHAR(1) '$.league_season'
		)

END
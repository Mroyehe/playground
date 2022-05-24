CREATE OR ALTER PROCEDURE INSERT_INTO_DIM_COMPETITIONS
(@JSON VARCHAR(MAX) = '')
AS BEGIN

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
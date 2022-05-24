USE [Better_DB_v2]
GO
/****** Object:  Table [dbo].[AVG_Fact_joins]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AVG_Fact_joins](
	[league_id] [bigint] NULL,
	[league_name] [nvarchar](50) NULL,
	[FTHG] [numeric](38, 6) NULL,
	[FTAG] [numeric](38, 6) NULL,
	[HS] [float] NULL,
	[AS] [float] NULL,
	[HST] [float] NULL,
	[AST] [float] NULL,
	[HomeTotalPasses] [float] NULL,
	[AwayTotalPasses] [float] NULL,
	[HomePossession] [float] NULL,
	[AwayPossession] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[DateValue] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataForAlgorithm]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataForAlgorithm](
	[HomeTeam] [bigint] NULL,
	[AwayTeam] [bigint] NULL,
	[match_date] [date] NULL,
	[Home_HomeGoals] [decimal](19, 4) NULL,
	[Home_AwayGoals] [decimal](19, 4) NULL,
	[Away_HomeGoals] [decimal](19, 4) NULL,
	[Away_AwayGoals] [decimal](19, 4) NULL,
	[Home_HomeGoalAttempts] [decimal](19, 4) NULL,
	[Home_AwayGoalAttempts] [decimal](19, 4) NULL,
	[Away_HomeGoalAttempts] [decimal](19, 4) NULL,
	[Away_AwayGoalAttempts] [decimal](19, 4) NULL,
	[Home_HomeShotsOnGoal] [decimal](19, 4) NULL,
	[Home_AwayShotsOnGoal] [decimal](19, 4) NULL,
	[Away_HomeShotsOnGoal] [decimal](19, 4) NULL,
	[Away_AwayShotsOnGoal] [decimal](19, 4) NULL,
	[Home_HomeTotalPasses] [decimal](19, 4) NULL,
	[Home_AwayTotalPasses] [decimal](19, 4) NULL,
	[Away_HomeTotalPasses] [decimal](19, 4) NULL,
	[Away_AwayTotalPasses] [decimal](19, 4) NULL,
	[H_HomePossession] [decimal](19, 4) NULL,
	[H_AwayPossession] [decimal](19, 4) NULL,
	[A_HomePossession] [decimal](19, 4) NULL,
	[A_AwayPossession] [decimal](19, 4) NULL,
	[Home_HomeGoalsAgainst] [decimal](19, 4) NULL,
	[Home_AwayGoalsAgainst] [decimal](19, 4) NULL,
	[Away_HomeGoalsAgainst] [decimal](19, 4) NULL,
	[Away_AwayGoalsAgainst] [decimal](19, 4) NULL,
	[GameResult] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Cards]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Cards](
	[match_id] [bigint] NULL,
	[time] [nvarchar](16) NULL,
	[home_fault] [nvarchar](100) NULL,
	[card] [nvarchar](20) NULL,
	[away_fault] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Cards_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Cards_back](
	[match_id] [bigint] NULL,
	[time] [nvarchar](16) NULL,
	[home_fault] [nvarchar](100) NULL,
	[card] [nvarchar](20) NULL,
	[away_fault] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Coaches]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Coaches](
	[team_key] [nvarchar](16) NULL,
	[team_name] [nvarchar](68) NULL,
	[coach_name] [nvarchar](80) NULL,
	[coach_country] [nvarchar](64) NULL,
	[coach_age] [nvarchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Coaches_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Coaches_back](
	[team_key] [nvarchar](16) NULL,
	[team_name] [nvarchar](68) NULL,
	[coach_name] [nvarchar](80) NULL,
	[coach_country] [nvarchar](64) NULL,
	[coach_age] [nvarchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Coaches_test]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Coaches_test](
	[team_key] [nvarchar](16) NULL,
	[team_name] [nvarchar](68) NULL,
	[coach_name] [nvarchar](80) NULL,
	[coach_country] [nvarchar](64) NULL,
	[coach_age] [nvarchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Competitions]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Competitions](
	[country_id] [bigint] NULL,
	[country_name] [nvarchar](50) NULL,
	[league_id] [bigint] NULL,
	[league_name] [nvarchar](50) NULL,
	[league_season] [nvarchar](36) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Competitions_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Competitions_back](
	[country_id] [bigint] NULL,
	[country_name] [nvarchar](50) NULL,
	[league_id] [bigint] NULL,
	[league_name] [nvarchar](50) NULL,
	[league_season] [nvarchar](36) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_GoalScorer]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_GoalScorer](
	[match_id] [bigint] NULL,
	[time] [nvarchar](16) NULL,
	[away_scorer] [nvarchar](100) NULL,
	[home_scorer] [nvarchar](100) NULL,
	[score] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_GoalScorer_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_GoalScorer_back](
	[match_id] [bigint] NULL,
	[time] [nvarchar](16) NULL,
	[away_scorer] [nvarchar](100) NULL,
	[home_scorer] [nvarchar](100) NULL,
	[score] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_LineUps]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_LineUps](
	[match_id] [bigint] NULL,
	[lineup_player] [nvarchar](100) NULL,
	[lineup_number] [smallint] NULL,
	[lineup_position] [smallint] NULL,
	[IsHome] [int] NULL,
	[IsStarting] [int] NULL,
	[IsCoach] [int] NULL,
	[IsMissing] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_LineUps_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_LineUps_back](
	[match_id] [bigint] NULL,
	[lineup_player] [nvarchar](100) NULL,
	[lineup_number] [smallint] NULL,
	[lineup_position] [smallint] NULL,
	[IsHome] [int] NULL,
	[IsStarting] [int] NULL,
	[IsCoach] [int] NULL,
	[IsMissing] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Odds]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Odds](
	[match_id] [bigint] NULL,
	[odd_bookmakers] [nvarchar](150) NULL,
	[odd_date] [datetime] NULL,
	[odd_1] [float] NULL,
	[odd_x] [float] NULL,
	[odd_2] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Odds_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Odds_back](
	[match_id] [bigint] NULL,
	[odd_bookmakers] [nvarchar](150) NULL,
	[odd_date] [datetime] NULL,
	[odd_1] [float] NULL,
	[odd_x] [float] NULL,
	[odd_2] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Players]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Players](
	[team_key] [bigint] NULL,
	[team_name] [nvarchar](100) NULL,
	[player_key] [bigint] NULL,
	[player_name] [nvarchar](200) NULL,
	[player_number] [int] NULL,
	[player_country] [nvarchar](100) NULL,
	[player_type] [nvarchar](50) NULL,
	[player_age] [smallint] NULL,
	[player_match_played] [int] NULL,
	[player_goals] [int] NULL,
	[player_yellow_cards] [int] NULL,
	[player_red_cards] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Players_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Players_back](
	[team_key] [bigint] NULL,
	[team_name] [nvarchar](100) NULL,
	[player_key] [bigint] NULL,
	[player_name] [nvarchar](200) NULL,
	[player_number] [int] NULL,
	[player_country] [nvarchar](100) NULL,
	[player_type] [nvarchar](50) NULL,
	[player_age] [smallint] NULL,
	[player_match_played] [int] NULL,
	[player_goals] [int] NULL,
	[player_yellow_cards] [int] NULL,
	[player_red_cards] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Predictions]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Predictions](
	[match_id] [bigint] NULL,
	[match_status] [nvarchar](50) NULL,
	[match_hometeam_score] [smallint] NULL,
	[match_awayteam_score] [smallint] NULL,
	[match_hometeam_system] [nvarchar](50) NULL,
	[match_awayteam_system] [nvarchar](50) NULL,
	[prob_HW] [float] NULL,
	[prob_D] [float] NULL,
	[prob_AW] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Predictions_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Predictions_back](
	[match_id] [bigint] NULL,
	[match_status] [nvarchar](50) NULL,
	[match_hometeam_score] [smallint] NULL,
	[match_awayteam_score] [smallint] NULL,
	[match_hometeam_system] [nvarchar](50) NULL,
	[match_awayteam_system] [nvarchar](50) NULL,
	[prob_HW] [float] NULL,
	[prob_D] [float] NULL,
	[prob_AW] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Standings]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Standings](
	[country_name] [nvarchar](50) NULL,
	[league_id] [bigint] NULL,
	[league_name] [nvarchar](50) NULL,
	[team_id] [bigint] NULL,
	[team_name] [nvarchar](50) NULL,
	[overall_promotion] [nvarchar](300) NULL,
	[overall_league_position] [smallint] NULL,
	[overall_league_played] [smallint] NULL,
	[overall_league_W] [smallint] NULL,
	[overall_league_D] [smallint] NULL,
	[overall_league_L] [smallint] NULL,
	[overall_league_GF] [smallint] NULL,
	[overall_league_GA] [smallint] NULL,
	[overall_league_PTS] [smallint] NULL,
	[home_league_position] [smallint] NULL,
	[home_promotion] [nvarchar](80) NULL,
	[home_league_played] [smallint] NULL,
	[home_league_W] [smallint] NULL,
	[home_league_D] [smallint] NULL,
	[home_league_L] [smallint] NULL,
	[home_league_GF] [smallint] NULL,
	[home_league_GA] [smallint] NULL,
	[home_league_PTS] [smallint] NULL,
	[away_league_position] [smallint] NULL,
	[away_promotion] [nvarchar](80) NULL,
	[away_league_played] [smallint] NULL,
	[away_league_W] [smallint] NULL,
	[away_league_D] [smallint] NULL,
	[away_league_L] [smallint] NULL,
	[away_league_GF] [smallint] NULL,
	[away_league_GA] [smallint] NULL,
	[away_league_PTS] [smallint] NULL,
	[league_round] [nvarchar](80) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Standings_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Standings_back](
	[country_name] [nvarchar](50) NULL,
	[league_id] [bigint] NULL,
	[league_name] [nvarchar](50) NULL,
	[team_id] [bigint] NULL,
	[team_name] [nvarchar](50) NULL,
	[overall_promotion] [nvarchar](300) NULL,
	[overall_league_position] [smallint] NULL,
	[overall_league_played] [smallint] NULL,
	[overall_league_W] [smallint] NULL,
	[overall_league_D] [smallint] NULL,
	[overall_league_L] [smallint] NULL,
	[overall_league_GF] [smallint] NULL,
	[overall_league_GA] [smallint] NULL,
	[overall_league_PTS] [smallint] NULL,
	[home_league_position] [smallint] NULL,
	[home_promotion] [nvarchar](80) NULL,
	[home_league_played] [smallint] NULL,
	[home_league_W] [smallint] NULL,
	[home_league_D] [smallint] NULL,
	[home_league_L] [smallint] NULL,
	[home_league_GF] [smallint] NULL,
	[home_league_GA] [smallint] NULL,
	[home_league_PTS] [smallint] NULL,
	[away_league_position] [smallint] NULL,
	[away_promotion] [nvarchar](80) NULL,
	[away_league_played] [smallint] NULL,
	[away_league_W] [smallint] NULL,
	[away_league_D] [smallint] NULL,
	[away_league_L] [smallint] NULL,
	[away_league_GF] [smallint] NULL,
	[away_league_GA] [smallint] NULL,
	[away_league_PTS] [smallint] NULL,
	[league_round] [nvarchar](80) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_statistics]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_statistics](
	[match_id] [bigint] NULL,
	[type] [nvarchar](100) NULL,
	[home] [nvarchar](20) NULL,
	[away] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_statistics_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_statistics_back](
	[match_id] [bigint] NULL,
	[type] [nvarchar](100) NULL,
	[home] [nvarchar](20) NULL,
	[away] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Subs]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Subs](
	[match_id] [bigint] NULL,
	[time] [nvarchar](16) NULL,
	[substitution] [nvarchar](300) NULL,
	[Player_out] [nvarchar](300) NULL,
	[Player_in] [nvarchar](300) NULL,
	[IsHome] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Subs_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Subs_back](
	[match_id] [bigint] NULL,
	[time] [nvarchar](16) NULL,
	[substitution] [nvarchar](300) NULL,
	[Player_out] [nvarchar](300) NULL,
	[Player_in] [nvarchar](300) NULL,
	[IsHome] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Teams]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Teams](
	[team_key] [bigint] NULL,
	[team_name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Teams_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Teams_back](
	[team_key] [bigint] NULL,
	[team_name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_teams_new]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_teams_new](
	[team_key] [bigint] NULL,
	[team_name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Teams_With_Dup]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Teams_With_Dup](
	[team_key] [bigint] NULL,
	[team_name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Events]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Events](
	[match_id] [bigint] NULL,
	[country_id] [bigint] NULL,
	[country_name] [nvarchar](50) NULL,
	[league_id] [bigint] NULL,
	[league_name] [nvarchar](50) NULL,
	[match_date] [date] NULL,
	[match_status] [nvarchar](30) NULL,
	[match_time] [nvarchar](20) NULL,
	[match_hometeam_id] [bigint] NULL,
	[match_hometeam_name] [nvarchar](50) NULL,
	[match_hometeam_score] [smallint] NULL,
	[match_awayteam_name] [nvarchar](50) NULL,
	[match_awayteam_id] [bigint] NULL,
	[match_awayteam_score] [smallint] NULL,
	[match_hometeam_halftime_score] [smallint] NULL,
	[match_awayteam_halftime_score] [smallint] NULL,
	[match_hometeam_extra_score] [smallint] NULL,
	[match_awayteam_extra_score] [smallint] NULL,
	[match_hometeam_penalty_score] [smallint] NULL,
	[match_awayteam_penalty_score] [smallint] NULL,
	[match_hometeam_ft_score] [smallint] NULL,
	[match_awayteam_ft_score] [smallint] NULL,
	[match_hometeam_system] [nvarchar](50) NULL,
	[match_awayteam_system] [nvarchar](50) NULL,
	[match_live] [smallint] NULL,
	[match_round] [nvarchar](50) NULL,
	[match_stadium] [nvarchar](200) NULL,
	[match_referee] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Events_back]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Events_back](
	[match_id] [bigint] NULL,
	[country_id] [bigint] NULL,
	[country_name] [nvarchar](50) NULL,
	[league_id] [bigint] NULL,
	[league_name] [nvarchar](50) NULL,
	[match_date] [date] NULL,
	[match_status] [nvarchar](30) NULL,
	[match_time] [nvarchar](20) NULL,
	[match_hometeam_id] [bigint] NULL,
	[match_hometeam_name] [nvarchar](50) NULL,
	[match_hometeam_score] [smallint] NULL,
	[match_awayteam_name] [nvarchar](50) NULL,
	[match_awayteam_id] [bigint] NULL,
	[match_awayteam_score] [smallint] NULL,
	[match_hometeam_halftime_score] [smallint] NULL,
	[match_awayteam_halftime_score] [smallint] NULL,
	[match_hometeam_extra_score] [smallint] NULL,
	[match_awayteam_extra_score] [smallint] NULL,
	[match_hometeam_penalty_score] [smallint] NULL,
	[match_awayteam_penalty_score] [smallint] NULL,
	[match_hometeam_ft_score] [smallint] NULL,
	[match_awayteam_ft_score] [smallint] NULL,
	[match_hometeam_system] [nvarchar](50) NULL,
	[match_awayteam_system] [nvarchar](50) NULL,
	[match_live] [smallint] NULL,
	[match_round] [nvarchar](50) NULL,
	[match_stadium] [nvarchar](200) NULL,
	[match_referee] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Events_Before_Fix_2020_12_04]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Events_Before_Fix_2020_12_04](
	[match_id] [bigint] NULL,
	[country_id] [bigint] NULL,
	[country_name] [nvarchar](50) NULL,
	[league_id] [bigint] NULL,
	[league_name] [nvarchar](50) NULL,
	[match_date] [date] NULL,
	[match_status] [nvarchar](30) NULL,
	[match_time] [nvarchar](20) NULL,
	[match_hometeam_id] [bigint] NULL,
	[match_hometeam_name] [nvarchar](50) NULL,
	[match_hometeam_score] [smallint] NULL,
	[match_awayteam_name] [nvarchar](50) NULL,
	[match_awayteam_id] [bigint] NULL,
	[match_awayteam_score] [smallint] NULL,
	[match_hometeam_halftime_score] [smallint] NULL,
	[match_awayteam_halftime_score] [smallint] NULL,
	[match_hometeam_extra_score] [smallint] NULL,
	[match_awayteam_extra_score] [smallint] NULL,
	[match_hometeam_penalty_score] [smallint] NULL,
	[match_awayteam_penalty_score] [smallint] NULL,
	[match_hometeam_ft_score] [smallint] NULL,
	[match_awayteam_ft_score] [smallint] NULL,
	[match_hometeam_system] [nvarchar](50) NULL,
	[match_awayteam_system] [nvarchar](50) NULL,
	[match_live] [smallint] NULL,
	[match_round] [nvarchar](50) NULL,
	[match_stadium] [nvarchar](200) NULL,
	[match_referee] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_joins]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_joins](
	[match_id] [bigint] NULL,
	[HomeTeam] [nvarchar](50) NULL,
	[AwayTeam] [nvarchar](50) NULL,
	[match_date] [date] NULL,
	[match_hometeam_id] [bigint] NULL,
	[match_awayteam_id] [bigint] NULL,
	[FTHG] [smallint] NULL,
	[FTAG] [smallint] NULL,
	[HS] [nvarchar](20) NULL,
	[AS] [nvarchar](20) NULL,
	[HST] [nvarchar](20) NULL,
	[AST] [nvarchar](20) NULL,
	[HomeTotalPasses] [nvarchar](20) NULL,
	[AwayTotalPasses] [nvarchar](20) NULL,
	[HomePossession] [float] NULL,
	[AwayPossession] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Formations]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formations](
	[Formation] [nvarchar](50) NULL,
	[Success_Percentage] [numeric](30, 15) NULL,
	[Total_Games_Played] [int] NULL,
	[Total_Games_Won] [int] NULL,
	[Total_Games_Tie] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nullable]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nullable](
	[Rn] [int] NULL,
	[TableName] [nvarchar](100) NULL,
	[PKcol] [nvarchar](max) NULL,
	[pkable] [int] NULL,
	[Notes] [nvarchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oz]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oz](
	[HomeTeam] [nvarchar](50) NULL,
	[AwayTeam] [nvarchar](50) NULL,
	[HomeGoals] [smallint] NULL,
	[AwayGoals] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oz_Fact]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oz_Fact](
	[match_id] [bigint] NULL,
	[HomeTeam] [nvarchar](50) NULL,
	[AwayTeam] [nvarchar](50) NULL,
	[FTHG] [smallint] NULL,
	[FTAG] [smallint] NULL,
	[FTR] [varchar](1) NOT NULL,
	[HS] [nvarchar](20) NULL,
	[AS] [nvarchar](20) NULL,
	[HST] [nvarchar](20) NULL,
	[AST] [nvarchar](20) NULL,
	[HomeTotalPasses] [nvarchar](20) NULL,
	[AwayTotalPasses] [nvarchar](20) NULL,
	[HomePossession] [nvarchar](20) NULL,
	[AwayPossession] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tablescolumns]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablescolumns](
	[RN] [int] NULL,
	[ColumnName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TablesForback]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablesForback](
	[TableName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TablesToNull]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablesToNull](
	[RN] [int] NULL,
	[TableName] [nvarchar](100) NULL,
	[PKcol] [nvarchar](max) NULL,
	[pkable] [int] NULL,
	[Notes] [nvarchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Top15]    Script Date: 12/25/2020 5:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Top15](
	[Formation] [nvarchar](50) NULL,
	[Success_Percentage] [numeric](30, 15) NULL,
	[Total_Games_Played] [int] NULL,
	[Total_Games_Won] [int] NULL,
	[Total_Games_Tie] [int] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Better_DB_v2] SET  READ_WRITE
GO

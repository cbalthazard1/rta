Table.create!([
  {country_abbr: "BR", level: 1, name: "Brasileirao", config: {"fbref_url"=>"https://fbref.com/en/comps/24/Serie-A-Stats", "fbref_table_name"=>"Série A"}, gender: "men's", club_or_international: "club"},
  {country_abbr: "EN", level: 1, name: "Premier League", config: {"fbref_url"=>"https://fbref.com/en/comps/9/Premier-League-Stats", "fbref_table_name"=>"Premier League"}, gender: "men's", club_or_international: "club"},
  {country_abbr: "ES", level: 1, name: "La Liga", config: {"fbref_url"=>"https://fbref.com/en/comps/12/La-Liga-Stats", "fbref_table_name"=>"La Liga"}, gender: "men's", club_or_international: "club"},
  {country_abbr: "IT", level: 1, name: "Serie A", config: {"fbref_url"=>"https://fbref.com/en/comps/11/Serie-A-Stats", "fbref_table_name"=>"Serie A"}, gender: "men's", club_or_international: "club"}
])
TableRow.create!([
  {position: 1, team_name: "Manchester City", points: 9, goal_difference: 7, table_id: 1, xg_diff_per90: 1.71, club_id: 1, season: nil},
  {position: 2, team_name: "Liverpool", points: 9, goal_difference: 7, table_id: 1, xg_diff_per90: 1.49, club_id: nil, season: nil},
  {position: 3, team_name: "Brighton", points: 7, goal_difference: 4, table_id: 1, xg_diff_per90: 0.45, club_id: nil, season: nil},
  {position: 4, team_name: "Arsenal", points: 7, goal_difference: 4, table_id: 1, xg_diff_per90: 0.22, club_id: nil, season: nil},
  {position: 5, team_name: "Newcastle Utd", points: 7, goal_difference: 2, table_id: 1, xg_diff_per90: -0.6, club_id: nil, season: nil},
  {position: 6, team_name: "Brentford", points: 6, goal_difference: 1, table_id: 1, xg_diff_per90: -0.09, club_id: nil, season: nil},
  {position: 7, team_name: "Aston Villa", points: 6, goal_difference: 0, table_id: 1, xg_diff_per90: 0.33, club_id: nil, season: nil},
  {position: 8, team_name: "Bournemouth", points: 5, goal_difference: 1, table_id: 1, xg_diff_per90: 0.3, club_id: 5, season: nil},
  {position: 9, team_name: "Nott'ham Forest", points: 5, goal_difference: 1, table_id: 1, xg_diff_per90: 0.83, club_id: nil, season: nil},
  {position: 10, team_name: "Tottenham", points: 4, goal_difference: 3, table_id: 1, xg_diff_per90: 0.43, club_id: nil, season: nil},
  {position: 11, team_name: "Chelsea", points: 4, goal_difference: 2, table_id: 1, xg_diff_per90: 0.57, club_id: 4, season: nil},
  {position: 12, team_name: "Fulham", points: 4, goal_difference: 0, table_id: 1, xg_diff_per90: -0.12, club_id: 6, season: nil},
  {position: 13, team_name: "West Ham", points: 3, goal_difference: -1, table_id: 1, xg_diff_per90: -0.64, club_id: nil, season: nil},
  {position: 14, team_name: "Manchester Utd", points: 3, goal_difference: -3, table_id: 1, xg_diff_per90: 0.32, club_id: 3, season: nil},
  {position: 15, team_name: "Leicester City", points: 1, goal_difference: -2, table_id: 1, xg_diff_per90: -0.74, club_id: nil, season: nil},
  {position: 16, team_name: "Crystal Palace", points: 1, goal_difference: -3, table_id: 1, xg_diff_per90: -0.75, club_id: nil, season: nil},
  {position: 17, team_name: "Ipswich Town", points: 1, goal_difference: -5, table_id: 1, xg_diff_per90: -1.89, club_id: nil, season: nil},
  {position: 18, team_name: "Wolves", points: 1, goal_difference: -6, table_id: 1, xg_diff_per90: -0.25, club_id: nil, season: nil},
  {position: 20, team_name: "Everton", points: 0, goal_difference: -8, table_id: 1, xg_diff_per90: -0.95, club_id: 2, season: nil},
  {position: 1, team_name: "Inter", points: 7, goal_difference: 6, table_id: 4, xg_diff_per90: 0.6, club_id: nil, season: nil},
  {position: 2, team_name: "Juventus", points: 7, goal_difference: 6, table_id: 4, xg_diff_per90: 0.61, club_id: nil, season: nil},
  {position: 3, team_name: "Torino", points: 7, goal_difference: 2, table_id: 4, xg_diff_per90: -0.52, club_id: nil, season: nil},
  {position: 4, team_name: "Udinese", points: 7, goal_difference: 2, table_id: 4, xg_diff_per90: -1.21, club_id: nil, season: nil},
  {position: 5, team_name: "Hellas Verona", points: 6, goal_difference: 2, table_id: 4, xg_diff_per90: 0.0, club_id: nil, season: nil},
  {position: 6, team_name: "Napoli", points: 6, goal_difference: 1, table_id: 4, xg_diff_per90: 0.49, club_id: nil, season: nil},
  {position: 7, team_name: "Empoli", points: 5, goal_difference: 1, table_id: 4, xg_diff_per90: 0.1, club_id: nil, season: nil},
  {position: 1, team_name: "Barcelona", points: 12, goal_difference: 10, table_id: 2, xg_diff_per90: 2.03, club_id: nil, season: nil},
  {position: 2, team_name: "Real Madrid", points: 8, goal_difference: 5, table_id: 2, xg_diff_per90: 1.06, club_id: nil, season: nil},
  {position: 3, team_name: "Atlético Madrid", points: 8, goal_difference: 4, table_id: 2, xg_diff_per90: 1.0, club_id: nil, season: nil},
  {position: 4, team_name: "Villarreal", points: 8, goal_difference: 2, table_id: 2, xg_diff_per90: -0.04, club_id: nil, season: nil},
  {position: 5, team_name: "Girona", points: 7, goal_difference: 3, table_id: 2, xg_diff_per90: 0.79, club_id: nil, season: nil},
  {position: 6, team_name: "Alavés", points: 7, goal_difference: 2, table_id: 2, xg_diff_per90: 0.34, club_id: nil, season: nil},
  {position: 7, team_name: "Osasuna", points: 7, goal_difference: -2, table_id: 2, xg_diff_per90: -0.6, club_id: nil, season: nil},
  {position: 8, team_name: "Celta Vigo", points: 6, goal_difference: 1, table_id: 2, xg_diff_per90: -0.13, club_id: nil, season: nil},
  {position: 9, team_name: "Leganés", points: 5, goal_difference: 0, table_id: 2, xg_diff_per90: -0.44, club_id: nil, season: nil},
  {position: 10, team_name: "Mallorca", points: 5, goal_difference: 0, table_id: 2, xg_diff_per90: 0.32, club_id: nil, season: nil},
  {position: 11, team_name: "Rayo Vallecano", points: 4, goal_difference: -1, table_id: 2, xg_diff_per90: -0.38, club_id: nil, season: nil},
  {position: 12, team_name: "Athletic Club", points: 4, goal_difference: -1, table_id: 2, xg_diff_per90: -0.37, club_id: nil, season: nil},
  {position: 13, team_name: "Real Sociedad", points: 4, goal_difference: -1, table_id: 2, xg_diff_per90: -0.51, club_id: nil, season: nil},
  {position: 14, team_name: "Espanyol", points: 4, goal_difference: -1, table_id: 2, xg_diff_per90: -0.17, club_id: nil, season: nil},
  {position: 15, team_name: "Valladolid", points: 4, goal_difference: -9, table_id: 2, xg_diff_per90: -1.19, club_id: nil, season: nil},
  {position: 16, team_name: "Getafe", points: 3, goal_difference: 0, table_id: 2, xg_diff_per90: 0.45, club_id: nil, season: nil},
  {position: 17, team_name: "Betis", points: 2, goal_difference: -2, table_id: 2, xg_diff_per90: -0.07, club_id: nil, season: nil},
  {position: 18, team_name: "Las Palmas", points: 2, goal_difference: -3, table_id: 2, xg_diff_per90: -1.01, club_id: nil, season: nil},
  {position: 19, team_name: "Sevilla", points: 2, goal_difference: -3, table_id: 2, xg_diff_per90: -0.16, club_id: nil, season: nil},
  {position: 20, team_name: "Valencia", points: 1, goal_difference: -4, table_id: 2, xg_diff_per90: -0.82, club_id: nil, season: nil},
  {position: 8, team_name: "Lazio", points: 4, goal_difference: 1, table_id: 4, xg_diff_per90: 1.01, club_id: nil, season: nil},
  {position: 9, team_name: "Parma", points: 4, goal_difference: 0, table_id: 4, xg_diff_per90: 0.11, club_id: nil, season: nil},
  {position: 10, team_name: "Genoa", points: 4, goal_difference: -1, table_id: 4, xg_diff_per90: 0.17, club_id: nil, season: nil},
  {position: 11, team_name: "Fiorentina", points: 3, goal_difference: 0, table_id: 4, xg_diff_per90: 0.34, club_id: nil, season: nil},
  {position: 12, team_name: "Atalanta", points: 3, goal_difference: -1, table_id: 4, xg_diff_per90: 0.3, club_id: nil, season: nil},
  {position: 13, team_name: "Lecce", points: 3, goal_difference: -5, table_id: 4, xg_diff_per90: -0.81, club_id: nil, season: nil},
  {position: 14, team_name: "Milan", points: 2, goal_difference: -1, table_id: 4, xg_diff_per90: 0.17, club_id: nil, season: nil},
  {position: 15, team_name: "Monza", points: 2, goal_difference: -1, table_id: 4, xg_diff_per90: -0.7, club_id: nil, season: nil},
  {position: 16, team_name: "Roma", points: 2, goal_difference: -1, table_id: 4, xg_diff_per90: -0.22, club_id: nil, season: nil},
  {position: 17, team_name: "Cagliari", points: 2, goal_difference: -1, table_id: 4, xg_diff_per90: -0.16, club_id: nil, season: nil},
  {position: 18, team_name: "Bologna", points: 2, goal_difference: -3, table_id: 4, xg_diff_per90: 0.27, club_id: nil, season: nil},
  {position: 19, team_name: "Venezia", points: 1, goal_difference: -3, table_id: 4, xg_diff_per90: -0.74, club_id: nil, season: nil},
  {position: 20, team_name: "Como", points: 1, goal_difference: -4, table_id: 4, xg_diff_per90: 0.19, club_id: nil, season: nil},
  {position: 19, team_name: "Southampton", points: 0, goal_difference: -4, table_id: 1, xg_diff_per90: -0.63, club_id: 7, season: nil},
  {position: 1, team_name: "Botafogo (RJ)", points: 50, goal_difference: 19, table_id: 3, xg_diff_per90: 0.36, club_id: nil, season: nil},
  {position: 2, team_name: "Fortaleza", points: 48, goal_difference: 8, table_id: 3, xg_diff_per90: 0.06, club_id: nil, season: nil},
  {position: 3, team_name: "Palmeiras", points: 47, goal_difference: 19, table_id: 3, xg_diff_per90: 0.74, club_id: nil, season: nil},
  {position: 4, team_name: "Flamengo", points: 44, goal_difference: 11, table_id: 3, xg_diff_per90: 0.2, club_id: nil, season: nil},
  {position: 5, team_name: "Cruzeiro", points: 41, goal_difference: 8, table_id: 3, xg_diff_per90: -0.09, club_id: nil, season: nil},
  {position: 6, team_name: "São Paulo", points: 41, goal_difference: 7, table_id: 3, xg_diff_per90: 0.28, club_id: nil, season: nil},
  {position: 7, team_name: "Bahia", points: 39, goal_difference: 7, table_id: 3, xg_diff_per90: 0.27, club_id: nil, season: nil},
  {position: 8, team_name: "Vasco da Gama", points: 34, goal_difference: -5, table_id: 3, xg_diff_per90: -0.37, club_id: nil, season: nil},
  {position: 9, team_name: "Atlético Mineiro", points: 33, goal_difference: -1, table_id: 3, xg_diff_per90: 0.13, club_id: nil, season: nil},
  {position: 10, team_name: "Internacional", points: 32, goal_difference: 3, table_id: 3, xg_diff_per90: 0.64, club_id: nil, season: nil},
  {position: 11, team_name: "Red Bull Bragantino", points: 30, goal_difference: -1, table_id: 3, xg_diff_per90: -0.25, club_id: nil, season: nil},
  {position: 12, team_name: "Ath Paranaense", points: 29, goal_difference: -2, table_id: 3, xg_diff_per90: -0.01, club_id: nil, season: nil},
  {position: 13, team_name: "Criciúma", points: 28, goal_difference: -3, table_id: 3, xg_diff_per90: -0.21, club_id: nil, season: nil},
  {position: 14, team_name: "Juventude", points: 28, goal_difference: -6, table_id: 3, xg_diff_per90: -0.67, club_id: nil, season: nil},
  {position: 15, team_name: "Grêmio", points: 27, goal_difference: -5, table_id: 3, xg_diff_per90: -0.02, club_id: nil, season: nil},
  {position: 16, team_name: "Fluminense", points: 27, goal_difference: -6, table_id: 3, xg_diff_per90: -0.38, club_id: nil, season: nil},
  {position: 17, team_name: "Corinthians", points: 25, goal_difference: -9, table_id: 3, xg_diff_per90: -0.13, club_id: nil, season: nil},
  {position: 18, team_name: "Vitória", points: 22, goal_difference: -13, table_id: 3, xg_diff_per90: -0.12, club_id: nil, season: nil},
  {position: 19, team_name: "Cuiabá", points: 21, goal_difference: -12, table_id: 3, xg_diff_per90: -0.24, club_id: nil, season: nil},
  {position: 20, team_name: "Atl Goianiense", points: 18, goal_difference: -19, table_id: 3, xg_diff_per90: -0.19, club_id: nil, season: nil}
])
Club.create!([
  {name: "Everton FC", location: "Liverpool, England", country_abbr: "EN", config: {"fbref_table_name"=>"Everton", "fbref_club_page_name"=>"Everton", "fbref_url"=>"https://fbref.com/en/squads/d3fd31cc/Everton-Stats", "club_elo_name"=>"Everton"}, gender: "men's", club_or_international: "club", short_name: "Everton"},
  {name: "Southampton FC", location: "Southampton, England", country_abbr: "EN", config: {"fbref_table_name"=>"Southampton", "fbref_club_page_name"=>"Southampton", "fbref_url"=>"https://fbref.com/en/squads/33c895d4/Southampton-Stats", "club_elo_name"=>"Southampton"}, gender: "men's", club_or_international: "club", short_name: "Southampton"},
  {name: "Manchester City FC", location: "Manchester, England", country_abbr: "EN", config: {"fbref_table_name"=>"Manchester City", "fbref_club_page_name"=>"Manchester City", "fbref_url"=>"https://fbref.com/en/squads/b8fd03ef/Manchester-City-Stats", "club_elo_name"=>"Man City"}, gender: "men's", club_or_international: "club", short_name: "Manchester City"},
  {name: "AFC Bournemouth", location: "Bournemouth, England", country_abbr: "EN", config: {"fbref_table_name"=>"Bournemouth", "fbref_club_page_name"=>"Bournemouth", "fbref_url"=>"https://fbref.com/en/squads/4ba7cbea/Bournemouth-Stats", "club_elo_name"=>"Bournemouth"}, gender: "men's", club_or_international: "club", short_name: "Bournemouth"},
  {name: "Manchester United FC", location: "Manchester, England", country_abbr: "EN", config: {"fbref_table_name"=>"Manchester Utd", "fbref_club_page_name"=>"Manchester United", "fbref_url"=>"https://fbref.com/en/squads/19538871/Manchester-United-Stats", "club_elo_name"=>"Man United"}, gender: "men's", club_or_international: "club", short_name: "Manchester United"},
  {name: "Chelsea FC", location: "London, England", country_abbr: "EN", config: {"fbref_table_name"=>"Chelsea", "fbref_club_page_name"=>"Chelsea", "fbref_url"=>"https://fbref.com/en/squads/cff3d9bb/Chelsea-Stats", "club_elo_name"=>"Chelsea"}, gender: "men's", club_or_international: "club", short_name: "Chelsea"},
  {name: "Fulham FC", location: "London, England", country_abbr: "EN", config: {"fbref_table_name"=>"Fulham", "fbref_club_page_name"=>"Fulham", "fbref_url"=>"https://fbref.com/en/squads/fd962109/Fulham-Stats", "club_elo_name"=>"Fulham"}, gender: "men's", club_or_international: "club", short_name: "Fulham"}
])

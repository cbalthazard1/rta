class ClubService
	def refresh_club(club_id)
		# all data sources are included in the job - could be split out later
		UpdateClubJob.perform_later(club_id)
	end

	def refresh_all_tables
		Club.all.each do |club|
	      refresh_club(club[:id])
	    end
	end

	# takes in club, returns array of hashes, each of which contains table and table_rows
	def generate_table_snippets(club)
	    tables = club.tables
	    tables.each_with_object([]) do |table, arr|
	      club_position = TableRow.where(:table => table, :club => club).first[:position]
	      max_table_position = TableRow.where(:table => table).map{ |k| k[:position] }.max()

	      positions_to_include = table_snippet_positions(club_position, max_table_position)

	      table_rows = TableRow.where(:table => table).select do |row|
	      	positions_to_include.include?(row[:position])
	      end

	      arr << {
	      	table: table,
	      	table_rows: table_rows
	      }
	    end
	end

	# ensures we're not looking for any nonexistent club positions
	def table_snippet_positions(club_position, max_table_position)
		case
		when (1..3).include?(club_position)
			(1..5)
		when (club_position + 2) > max_table_position
			((max_table_position-4)..max_table_position)
		else
			((club_position-2)..(club_position+2))
		end
	end

	def associate_club(club)
		tables = associate_club_with_tables(club)
		tables.each do |table|
			associate_club_with_matches(club, table)
		end
		
		associate_club_with_elo(club)
	end

	def associate_club_with_tables(club)
		# check name first to minimize joins on country abbreviation
		# only need to check table name, since club name should already be associated
		matching_table_rows = TableRow.where(:team_name=>club.config["fbref_table_name"], :club=>nil).joins(:table).where(table: { country_abbr: club.country_abbr })
		matching_table_rows.each_with_object([]) do |table_row, tables_arr|
			table_row.club = club
			table_row.save
			tables_arr << table_row.table
		end
	end

	def associate_club_with_matches(club, table)
		# only need to check table name, since club name should already be associated
		home_matches_involved = Match.where(:table=>table, :home_team_name=>club.config["fbref_table_name"], :home_team=>nil)
		home_matches_involved.each do |match|
			match.home_team = club
			match.save
		end

		away_matches_involved = Match.where(:table=>table, :away_team_name=>club.config["fbref_table_name"], :away_team=>nil)
		away_matches_involved.each do |match|
			match.away_team = club
			match.save
		end
	end

	def associate_club_with_elo(club)
		matching_elo = Elo.where(:club_name=>club.config["club_elo_name"], :club=>nil).first
		return if matching_elo.nil?

		matching_elo.club = club
		matching_elo.save
	end

	# find all matches a club is involved in
	def find_matches(club)
		home_matches = Match.where(home_team: club).to_a
		away_matches = Match.where(away_team: club).to_a
		# the include keeps Club associations for home and away team
		home_matches.concat(away_matches).sort_by(&:date_time)
	end

	# determine result for a match for a club
	def determine_result(match, club)
		goals_level = match["home_goals"] == match["away_goals"]
		return "Draw" if goals_level && match["home_penalties"].nil?

		home_team_wins = (match["home_goals"] > match["away_goals"])
		home_team_wins = (match["home_penalties"] > match["away_penalties"]) if match["home_penalties"].present?

		((club_in_home_slot?(match, club) && home_team_wins) || (!club_in_home_slot?(match, club) && !home_team_wins)) ? "Win" : "Loss"
	end

	def club_in_home_slot?(match, club)
		club[:config]["fbref_table_name"] == match["home_team_name"] || club[:config]["fbref_club_page_name"] == match["home_team_name"]
	end
end

# add colors for table rows to more easily visualize differences when sorting
# swap goodjob in for sidekiq
# find where to get form table data (by league? build it myself?)
# figure out how to get everything populated quickly
# add support for years; first add support for empty match results

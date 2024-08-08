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

	# find all matches a club is involved in
	def find_matches(club)
		home_matches = Match.where(home_team: club).to_a
		away_matches = Match.where(away_team: club).to_a
		home_matches.concat(away_matches).sort_by(&:date_time).as_json.map do |match|
			match["result"] = determine_result(match, club)
			match["date"] = match["date_time"].to_date
			match
		end
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
		club[:config]["fbref_table_name"] == match["home_team_name"]
	end
end

# add venue
# implement this: https://stackoverflow.com/questions/16324016/first-or-create-with-update-on-match
# add support for years; first add support for empty match results

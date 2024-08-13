class ClubEloService
	def self.pull_club_elo_data
		data = ::Clients::ClubEloV1.pull_data

		data.each do |row|
			club = Club.where("config->>'club_elo_name' = ?", row[:club_name]).first

			Elo.where(
	          club_name: row[:club_name]
	        ).first_or_create.update(
	          elo_rating: row[:elo_rating],
	          club: club
	        )
		end
	end

	def self.get_club_elo_data(club_id)
		# pull from db table
	end
end
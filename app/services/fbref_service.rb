class FbrefService
	def self.pull_table_data(table_id)
		::Clients::FbrefApiV1.pull_table_data(table_id)
	end

	def self.pull_club_fixture_data(club_id)
		::Clients::FbrefApiV1.pull_club_fixture_data(club_id)
	end

	def self.pull_individual_stats_data(club_id)
		::Clients::FbrefApiV1.pull_individual_stats_data(club_id)
	end
end
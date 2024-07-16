class FbrefService
	def self.pull_data(table_id)
		::Clients::FbrefApiV1.pull_data(table_id)
	end
end
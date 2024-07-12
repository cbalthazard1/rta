class FbrefService
	def self.pull_data
		::Clients::FbrefApiV1.pull_data
	end
end
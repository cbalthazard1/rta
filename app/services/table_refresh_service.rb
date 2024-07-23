class TableRefreshService
	def refresh_table(table_id)
		# start with fbref stuff
		UpdateTablesJob.perform_later(table_id)
		# move on to other data sources to build table up (ELO, e.g.)
	end

	def refresh_all_tables
		# iterate over all tables and refresh
	end
end
class TableRefreshService
	def refresh_table(table_id)
		# all data sources are included in the job - could be split out later
		UpdateTablesJob.perform_later(table_id)
	end

	def refresh_all_tables
		# TODO: GoodJob::Bulk.enqueue([MyJob.new, AnotherJob.new])
		Table.all.each do |table|
	      refresh_table(table[:id])
	    end
	end
end
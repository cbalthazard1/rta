# require_dependency 'app/services/fbref_service.rb'

class UpdateTablesJob < ApplicationJob
  queue_as :default

  # args[0] is the id of the table
  def perform(*args)
    # currently calling in a console with UpdateTablesJob.perform_later(1)

    table_id = args[0]

    data = FbrefService.pull_data(table_id)

    # interim parse step to come

    # remove previous data and save new to db
    TableRow.where(:table=> Table.find(table_id)).destroy_all
    data.each do |row|
      table_row = TableRow.new(position: row[:rank], team_name: row[:team], points: row[:points], goal_difference: row[:goal_difference], xg_diff_per90: row[:xg_diff_per90], table: Table.find(table_id))
      table_row.save
    end

    # should implement a try catch here with saved data from above, in case the pull was not successful for some reason
  end
end

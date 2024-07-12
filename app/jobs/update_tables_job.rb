# require_dependency 'app/services/fbref_service.rb'

class UpdateTablesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later

    # can put this debugging statement here but it doesn't display well.
    # going to work on pulling the data manually next and then connecting that here,
    # and then parsing it into the db on callback
    # currently calling in a console with UpdateTablesJob.perform_later('fake_arg', 5)
    # require 'pry'; binding.pry
    puts "running job"

    data = FbrefService.pull_data

    # interim parse step to come

    # remove previous data and save new to db
    TableRow.where(:table=> Table.find(1)).destroy_all
    data.each do |row|
      table_row = TableRow.new(position: row[:rank], team_name: row[:team], points: row[:points], goal_difference: row[:goal_difference], xg_diff_per90: row[:xg_diff_per90], table: Table.find(1))
      table_row.save
    end

    # should implement a try catch here with saved data from above
  end
end

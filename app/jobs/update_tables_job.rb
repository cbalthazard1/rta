class UpdateTablesJob < ApplicationJob
  queue_as :default

  # args[0] is the id of the table
  def perform(*args)
    # currently calling in a console with UpdateTablesJob.perform_later(1)

    table_id = args[0]
    country_abbr = Table.find(table_id)[:country_abbr]

    fbref_data = FbrefService.pull_table_data(table_id)

    # interim parse step to come

    # remove previous data and save new to db
    TableRow.where(:table=> Table.find(table_id)).destroy_all
    fbref_data.each do |row|
      # find right club
      club = Club.where(:country_abbr=>country_abbr).where("config->>'fbref_table_name' = ?", row[:team]).first

      table_row = TableRow.new(
        position: row[:rank],
        team_name: row[:team],
        points: row[:points],
        goal_difference: row[:goal_difference],
        xg_diff_per90: row[:xg_diff_per90],
        table: Table.find(table_id),
        club: club
      )
      table_row.save
    end

    # add other data sources with conditions here IFF they are table-specific and not club-specific
  end
end

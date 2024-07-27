class UpdateClubJob < ApplicationJob
  queue_as :default

  # args[0] is the id of the club
  def perform(*args)
    # currently calling in a console with UpdateClubJob.perform_later(1)

    club_id = args[0]
    country_abbr = Club.find(club_id)[:country_abbr]

    fbref_fixture_data = FbrefService.pull_club_fixture_data(club_id)
    # fbref_individual_stats_data = FbrefService.pull_individual_stats_data(club_id)
    # elo_data = ClubEloService.pull_club_elo_data (should have elo table as reference, maybe?)

    # interim parse step to come

    # save data to db (start with fbref_api method, then do this step)
    # Club.where(:club=> Club.find(club_id)).destroy_all
    # fbref_data.each do |row|
    #   # find right club
    #   club = Club.where(:country_abbr=>country_abbr).where("config->>'fbref_table_name' = ?", row[:team]).first

    #   table_row = TableRow.new(position: row[:rank], team_name: row[:team], points: row[:points], goal_difference: row[:goal_difference], xg_diff_per90: row[:xg_diff_per90], table: Table.find(table_id), club: club)
    #   table_row.save
    # end

    # add other data sources with conditions here IFF they are table-specific and not club-specific
  end
end

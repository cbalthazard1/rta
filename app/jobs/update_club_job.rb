class UpdateClubJob < ApplicationJob
  queue_as :default

  # args[0] is the id of the club
  def perform(*args)
    # currently calling in a console with UpdateClubJob.perform_later(1)

    club_id = args[0]
    country_abbr = Club.find(club_id)[:country_abbr]

    fbref_fixture_data = FbrefService.pull_club_fixture_data(club_id)
    # fbref_individual_stats_data = FbrefService.pull_individual_stats_data(club_id)
    elo_data = ClubEloService.get_club_elo_data(club_id)

    # remove previous data and save new to db
    Match.where(:home_team=> Club.find(club_id)).destroy_all
    Match.where(:away_team=> Club.find(club_id)).destroy_all

    # save match data to db
    fbref_fixture_data.each do |row|
      # find right club
      home_club = Club.where(:country_abbr=>country_abbr).where("config->>'fbref_table_name' = ?", row[:home_team_name]).first ||
        Club.where(:country_abbr=>country_abbr).where("config->>'fbref_club_page_name' = ?", row[:home_team_name]).first
      away_club = Club.where(:country_abbr=>country_abbr).where("config->>'fbref_table_name' = ?", row[:away_team_name]).first ||
        Club.where(:country_abbr=>country_abbr).where("config->>'fbref_club_page_name' = ?", row[:away_team_name]).first

      table = Table.where(:country_abbr=>country_abbr).where("config->>'fbref_table_name' = ?", row[:competition_name]).first

      begin
        # check index to see if match already exists, then add it if not
        Match.where(
          date_time: row[:date_time],
          home_team: home_club,
          away_team: away_club
        ).first_or_create.update(
          competition_name: row[:competition_name],
          round: row[:round],
          attendance: row[:attendance],
          neutral_site: row[:neutral_site],
          home_goals: row[:home_goals],
          away_goals: row[:away_goals],
          home_xg: row[:home_xg],
          away_xg: row[:away_xg],
          home_penalties: row[:home_penalties],
          away_penalties: row[:away_penalties],
          table: table,
          home_team_name: row[:home_team_name],
          away_team_name: row[:away_team_name]
        )
        rescue ActiveRecord::RecordNotUnique => e
          next if(e.message =~ /unique.*constraint.*index_matches_on_date_time_and_away_team_id/)
          next if(e.message =~ /unique.*constraint.*index_matches_on_date_time_and_home_team_id/)
          raise
        end
    end

    # add other data sources with conditions here IFF they are club-specific
  end
end

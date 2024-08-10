class RemoveIndexFromMatches < ActiveRecord::Migration[7.1]
  def change
    remove_index :matches, column: ["date_time", "home_team_name", "away_team_name"]
  end
end

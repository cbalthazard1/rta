class AddIndexToMatches < ActiveRecord::Migration[7.1]
  def change
    add_index :matches, [:date_time, :home_team_id], unique: true, where: 'home_team_id IS NOT NULL'
    add_index :matches, [:date_time, :away_team_id], unique: true, where: 'away_team_id IS NOT NULL'
  end
end

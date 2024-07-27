class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.datetime :date_time
      t.string :competition_name
      t.references :table, foreign_key: true
      t.string :round
      t.string :home_team_name
      t.string :away_team_name
      t.references :home_team, foreign_key: true
      t.references :away_team, foreign_key: true
      t.integer :home_goals
      t.integer :away_goals
      t.integer :home_penalties
      t.integer :away_penalties
      t.float :home_xg
      t.float :away_xg
      t.integer :attendance

      t.timestamps
    end

    add_index :matches, [:date_time, :home_team_name, :away_team_name], unique: true
  end
end

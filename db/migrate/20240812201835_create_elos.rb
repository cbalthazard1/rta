class CreateElos < ActiveRecord::Migration[7.1]
  def change
    create_table :elos do |t|
      t.string :club_name
      t.integer :elo_rating
      t.references :club, foreign_key: true

      t.timestamps
    end
  end
end

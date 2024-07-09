class CreateTableRows < ActiveRecord::Migration[7.1]
  def change
    create_table :table_rows do |t|
      t.integer :position
      t.string :team_name
      t.integer :points
      t.integer :goal_difference
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateTables < ActiveRecord::Migration[7.1]
  def change
    create_table :tables do |t|
      t.string :country_abbr
      t.integer :level
      t.string :name

      t.timestamps
    end
  end
end

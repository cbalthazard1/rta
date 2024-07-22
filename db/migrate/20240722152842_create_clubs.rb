class CreateClubs < ActiveRecord::Migration[7.1]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :location
      t.string :country_abbr
      t.json :config

      t.timestamps
    end
  end
end

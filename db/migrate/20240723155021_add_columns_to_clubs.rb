class AddColumnsToClubs < ActiveRecord::Migration[7.1]
  def change
    add_column :clubs, :gender, :string
    add_column :clubs, :club_or_international, :string
  end
end

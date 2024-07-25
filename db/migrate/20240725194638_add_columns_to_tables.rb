class AddColumnsToTables < ActiveRecord::Migration[7.1]
  def change
    add_column :tables, :gender, :string
    add_column :tables, :club_or_international, :string
  end
end

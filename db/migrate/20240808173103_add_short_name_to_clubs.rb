class AddShortNameToClubs < ActiveRecord::Migration[7.1]
  def change
    add_column :clubs, :short_name, :string
  end
end

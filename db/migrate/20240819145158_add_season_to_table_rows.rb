class AddSeasonToTableRows < ActiveRecord::Migration[7.1]
  def change
    add_column :table_rows, :season, :string
  end
end

class AddXgDiffPer90ToTableRows < ActiveRecord::Migration[7.1]
  def change
    add_column :table_rows, :xg_diff_per90, :float
  end
end

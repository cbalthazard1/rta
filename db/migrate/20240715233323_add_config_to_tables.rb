class AddConfigToTables < ActiveRecord::Migration[7.1]
  def change
    add_column :tables, :config, :jsonb, default: {}
  end
end

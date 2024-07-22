class AddDefaultToClub < ActiveRecord::Migration[7.1]
  def change
    change_column_default :clubs, :config, from: nil, to: {}
  end
end

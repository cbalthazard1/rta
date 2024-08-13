class TableRow < ApplicationRecord
  belongs_to :table
  belongs_to :club, optional: true

  validates_associated :table

  def elo_rating
    club&.elo&.elo_rating
  end
end

class TableRow < ApplicationRecord
  belongs_to :table
  belongs_to :club, optional: true

  validates_associated :table
end

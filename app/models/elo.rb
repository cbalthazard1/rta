class Elo < ApplicationRecord
  belongs_to :club, optional: true

  validates :club_name, presence: true
  validates :elo_rating, presence: true
end

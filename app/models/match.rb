class Match < ApplicationRecord
  belongs_to :table, optional: true
  belongs_to :home_team, :class_name => 'Club', optional: true
  belongs_to :away_team, :class_name => 'Club', optional: true

  validates :date_time, presence: true
  validates :round, presence: true, length: { maximum: 40 }
  validates :home_goals, presence: true
  validates :away_goals, presence: true
  validates :home_team_name, presence: true, length: { maximum: 100 }
  validates :away_team_name, presence: true, length: { maximum: 100 }
  validates :neutral_site, inclusion: [true, false]
end
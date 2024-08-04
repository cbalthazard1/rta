class Table < ApplicationRecord
	has_many :table_rows
	has_many :clubs, through: :table_rows
	has_many :matches

	validates :country_abbr, presence: true, length: { minimum: 2, maximum: 2 }
 	validates :level, presence: true, numericality: { only_integer: true }
 	validates :name, presence: true, length: { maximum: 100 }
	validates :config, presence: true
	validates :gender, presence: true, inclusion: { in: %w(women's men's), message: "%{value} is not a valid league gender" }
	validates :club_or_international, presence: true, inclusion: { in: %w(club international), message: "%{value} is not a valid value" }
end

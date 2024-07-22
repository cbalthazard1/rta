class Club < ApplicationRecord
	has_many :table_rows
	has_many :tables, through: :table_rows

	validates :name, presence: true, length: { maximum: 100 }
	validates :location, presence: true, length: { maximum: 100 }
	validates :country_abbr, presence: true, length: { minimum: 2, maximum: 2 }
	validates :config, presence: true
end

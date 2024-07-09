class Table < ApplicationRecord
	has_many :table_rows

	validates :country_abbr, presence: true, length: { minimum: 2, maximum: 2 }
 	validates :level, presence: true, numericality: { only_integer: true }
 	validates :name, presence: true, length: { maximum: 100 }
end

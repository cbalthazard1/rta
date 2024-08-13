#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'
require 'open-uri'
require 'nokogiri'

module Clients
	class ClubEloV1
		def self.pull_data
			doc = Nokogiri::HTML(URI.open("http://clubelo.com/Ranking"))

			table = doc.xpath('//table[@class="ranking"]').first

			# get table rows from table
			table_rows = table.children.select{ |node| node.name=="tr" }

			parse_rows(table_rows.drop(1))
	 	end

	 	def self.parse_rows(rows)
	 		rows.map do |row|
				{
					club_name: row.css('.l').css('a').text,
					elo_rating: row.css('.r').first.text
				}
	 		end
	 	end

	 	# run in console using load './app/services/clients/club_elo_v1.rb'
	 	# pull_data
	end
end
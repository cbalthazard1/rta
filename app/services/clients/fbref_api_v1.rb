#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'
require 'open-uri'
require 'nokogiri'

module Clients
	class FbrefApiV1
		def self.pull_data
			doc = Nokogiri::HTML(URI.open("https://fbref.com/en/comps/9/Premier-League-Stats"))

			# find league table by exact table id - not great
			table = doc.xpath('//table[@id="results2023-202491_overall"]')

			# get body of table
			tbody = table.children.select{ |node| node.name=="tbody"}.first

			# get table rows from body
			table_rows = tbody.children.select{ |node| node.name=="tr" }

			parse_rows(table_rows)
	 	end

	 	def self.parse_rows(table_rows)
	 		table_rows.map do |row|
				{
					rank: get_simple_value(row, 'rank'),
					team: get_team_value(row),
					games: get_simple_value(row, 'games'),
					points: get_simple_value(row, 'points'),
					goal_difference: get_simple_value(row, 'goal_diff'),
					xg_diff_per90: get_simple_value(row, 'xg_diff_per90')
				}
	 		end
	 	end

	 	def self.get_simple_value(row, val)
	 		attr = row.children.select do |node|
	 			node.attribute_nodes.any? { |attr_node| attr_node.name == "data-stat" && attr_node.value == val }
	 		end.first
	 		attr.children.first.text
	 	end

	 	def self.get_team_value(row)
	 		attr = row.children.select do |node|
	 			node.attribute_nodes.any? { |attr_node| attr_node.name == "data-stat" && attr_node.value == "team" }
	 		end.first
	 		attr.children[2].children.text
	 	end
	end
end
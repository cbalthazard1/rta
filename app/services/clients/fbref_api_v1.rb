#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'
require 'open-uri'
require 'nokogiri'

module Clients
	class FbrefApiV1
		def self.pull_table_data(table_id)
			url = Table.find(table_id)[:config]["fbref_url"]
			doc = Nokogiri::HTML(URI.open(url))

			table = doc.xpath('//table[starts-with(.,results-2023-2024)]').first

			# get body of table
			tbody = table.children.select{ |node| node.name=="tbody"}.first

			# get table rows from body
			table_rows = tbody.children.select{ |node| node.name=="tr" }

			parse_table_rows(table_rows)
	 	end

	 	def self.parse_table_rows(table_rows)
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

	 	def self.pull_club_data(club_id)
	 		url = Club.find(club_id)[:config]["fbref_url"]
			doc = Nokogiri::HTML(URI.open(url))

			# TODO
			table = doc.xpath('//table[@id="matchlogs_for"]').first

			# get body of table
			tbody = table.children.select{ |node| node.name=="tbody"}.first

			# get table rows from body
			club_rows = tbody.children.select{ |node| node.name=="tr" }
			# testing file write with File.open('tmpfile.html', 'w') { |file| file.write(table) }

			parse_club_rows(club_rows)
	 	end

	 	def self.parse_club_rows(club_rows)
	 		club_rows.map do |row|
	 			require "pry"
				binding.pry
				{
					date: get_simple_value(row, 'date'),
					time: get_simple_value(row, 'start_time'),
					# start here
					games: get_simple_value(row, 'games'),
					points: get_simple_value(row, 'points'),
					goal_difference: get_simple_value(row, 'goal_diff'),
					xg_diff_per90: get_simple_value(row, 'xg_diff_per90')
				}
	 		end
	 	end

	 	# run in console using load './app/services/clients/fbref_api_v1.rb'
	 	pull_club_data(1)
	end
end

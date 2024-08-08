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
					rank: get_simple_int_value(row, 'rank'),
					team: get_team_value(row),
					games: get_simple_int_value(row, 'games'),
					points: get_simple_int_value(row, 'points'),
					goal_difference: get_simple_int_value(row, 'goal_diff'),
					xg_diff_per90: get_simple_float_value(row, 'xg_diff_per90')
				}
	 		end
	 	end

	 	def self.get_simple_text_value(row, val)
	 		attr = row.children.select do |node|
	 			node.attribute_nodes.any? { |attr_node| attr_node.name == "data-stat" && attr_node.value == val }
	 		end.first
	 		if attr.children.first
	 			a = attr.children.select{ |child| child.name == "a"}
	 			if a.any?
	 				a.first.text
	 			else
	 				attr.children.first.text
	 			end
	 		else
	 			nil
	 		end
	 	end

	 	def self.get_simple_int_value(row, val)
	 		attr = row.children.select do |node|
	 			node.attribute_nodes.any? { |attr_node| attr_node.name == "data-stat" && attr_node.value == val }
	 		end.first
	 		if attr.children.first
	 			attr.children.first.text.delete(',').to_i
	 		else
	 			nil
	 		end
	 	end

	 	def self.get_simple_float_value(row, val)
	 		attr = row.children.select do |node|
	 			node.attribute_nodes.any? { |attr_node| attr_node.name == "data-stat" && attr_node.value == val }
	 		end.first

	 		if attr.children.first
	 			attr.children.first.text.delete(',').to_f
	 		else
	 			nil
	 		end
	 	end

	 	def self.get_team_value(row)
	 		attr = row.children.select do |node|
	 			node.attribute_nodes.any? { |attr_node| attr_node.name == "data-stat" && attr_node.value == "team" }
	 		end.first
	 		attr.children[2].children.text
	 	end

	 	def self.pull_club_fixture_data(club_id)
	 		url = Club.find(club_id)[:config]["fbref_url"]
			doc = Nokogiri::HTML(URI.open(url))

			# TODO
			table = doc.xpath('//table[@id="matchlogs_for"]').first
			club_name = doc.xpath('//a[contains(text(), "Stats & History")]').first.children.first.text.gsub(" Stats & History", "")

			# get body of table
			tbody = table.children.select{ |node| node.name=="tbody"}.first

			# get table rows from body
			club_rows = tbody.children.select{ |node| node.name=="tr" }
			# testing file write with File.open('tmpfile.html', 'w') { |file| file.write(table) }

			parse_club_rows(club_rows, club_name)
	 	end

	 	def self.parse_club_rows(club_rows, club_name)
	 		club_rows.map do |row|
				{
					date_time: get_date_time_from_date_and_time(row),
					competition_name: get_simple_text_value(row, 'comp'),
					round: get_simple_text_value(row, 'round'),
					attendance: get_simple_int_value(row, 'attendance'),
					neutral_site: get_simple_text_value(row, 'venue') == "Neutral",
					home_team_name: home_team?(row, club_name) ? club_name : get_simple_text_value(row, 'opponent'),
					away_team_name: home_team?(row, club_name) ? get_simple_text_value(row, 'opponent') : club_name,
					home_goals: home_team?(row, club_name) ? get_simple_int_value(row, 'goals_for') : get_simple_int_value(row, 'goals_against'),
					away_goals: home_team?(row, club_name) ? get_simple_int_value(row, 'goals_against') : get_simple_int_value(row, 'goals_for'),
					home_xg: home_team?(row, club_name) ? get_simple_float_value(row, 'xg_for') : get_simple_float_value(row, 'xg_against'),
					away_xg: home_team?(row, club_name) ? get_simple_float_value(row, 'xg_against') : get_simple_float_value(row, 'xg_for'),
					home_penalties: home_team?(row, club_name) ? get_penalty_value(row, 'goals_for') : get_penalty_value(row, 'goals_against'),
					away_penalties: home_team?(row, club_name) ? get_penalty_value(row, 'goals_against') : get_penalty_value(row, 'goals_for')
				}
	 		end
	 	end

	 	def self.get_date_time_from_date_and_time(row)
	 		date = get_simple_text_value(row, 'date')
	 		time = get_simple_text_value(row, 'start_time')
	 		"#{date} #{time}".to_datetime
	 	end

	 	def self.home_team?(row, club_name)
	 		case get_simple_text_value(row, 'venue')
 			when "Home"
 				true
			when "Away"
				false
			else
				# compare team name with opponent name and take first alphabetically
				club_name < get_simple_text_value(row, 'opponent')
			end
	 	end

	 	def self.get_penalty_value(row, val)
	 		attr = row.children.select do |node|
	 			node.attribute_nodes.any? { |attr_node| attr_node.name == "data-stat" && attr_node.value == val }
	 		end.first

	 		if attr.children[1]
	 			attr.children[1].children.text.delete('()').to_i
	 		else
	 			nil
	 		end
	 	end

	 	# run in console using load './app/services/clients/fbref_api_v1.rb'
	 	# pull_club_data(1)
	end
end

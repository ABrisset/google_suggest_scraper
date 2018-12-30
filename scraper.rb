#!/usr/bin/env ruby
# encoding: UTF-8

require 'cgi'
require 'nokogiri'
require 'open-uri'
require 'optparse'
require_relative "lib/suggest_scrapper"

## Add arguments requirements
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: scraper.rb [options]"
  opts.on('-q', '--query=QUERY', String) { |v| options[:search_query] = v }
  opts.on('-l', '--lang [LANG]', String) { |l| options[:lang] = l }
end.parse!

## Check if query is present
if options[:search_query].nil?
  print 'Enter query : '
  options[:search_query] = gets.chomp
end

## Set query and lang
query = options[:search_query]
lang = options[:lang] ||= "fr"

## Get suggestions
scraper = SuggestScraper.new(query, lang)
scraper.process
results = scraper.results

## Store results
File.open("#{query}.txt", 'w') do |file| 
  results.sort.each do |keyword|
    file.write(keyword)
    file.write("\n")
  end
  puts "File is ready."
end
require_relative "motorsport_news/version.rb"
require_relative "motorsport_news/CLI.rb"
require_relative "motorsport_news/news.rb"
require_relative "motorsport_news/scraper.rb"

require 'nokogiri'
require 'pry'
require 'open-uri'

module MotorsportNews
  class Error < StandardError; end
  # Your code goes here...
end

require 'httparty'

class Recipe < ActiveRecord::Base
	include HTTParty

	key_value = ENV['FOOD2FORK_KEY']
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"

	default_params key: "#{key_value}", fields: "image_url,source_url,title,social_rank"
	format :json

	def self.for (search_term)
		# Rails.logger.debug("self.for")
		get("/search", query: { q: search_term })["recipes"]
	end

end

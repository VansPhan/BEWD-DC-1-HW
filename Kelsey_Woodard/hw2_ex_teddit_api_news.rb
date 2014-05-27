# We're going to add a remote data source to pull in stories from Mashable, Digg, and reddit.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
  # http://www.reddit.com/.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"

require 'rest_client'
require 'json'

def get_mashable_stories # Pulls the json and parses story
	response = JSON.parse(RestClient.get 'http://mashable.com/stories.json')
	news_array = []
	response['new'].each do |story|
		title = story['title']
		category = story['channel'].downcase
		upvotes = calculate_upvotes(title, category) # Calls calculate_upvotes method
		hash = { :title => "#{title}", :category => "#{category}", :upvotes => "#{upvotes}" }
		news_array << hash # Inserts hashes into the array
	end
	puts "========== Mashable Stories =========="	
	puts ''
	front_page(news_array)
end

def get_digg_stories # Pulls the json and parses story
	response = JSON.parse(RestClient.get 'http://digg.com/api/news/popular.json')
	news_array = []
	response['data']['feed'].each do |story|
		title = story['content']['title']
		category = story['content']['tags'][0]['name'].downcase
		upvotes = calculate_upvotes(title, category) # Calls calculate_upvotes method
		hash = { :title => "#{title}", :category => "#{category}", :upvotes => "#{upvotes}" }
		news_array << hash # Inserts hashes into the array
	end
	puts "========== Digg Stories =========="
	puts ''
	front_page(news_array)
end

def get_reddit_stories # Pulls the json and parses story
	response = JSON.parse(RestClient.get 'http://www.reddit.com/.json')
	news_array = []
	response['data']['children'].each do |story|
		title = story['data']['title']
		category = story['data']['subreddit'].downcase
		upvotes = calculate_upvotes(title, category) # Calls calculate_upvotes method
		hash = { :title => "#{title}", :category => "#{category}", :upvotes => "#{upvotes}" }
		news_array << hash # Inserts hashes into the array
	end
	puts "========== Reddit Stories =========="
	puts ''
	front_page(news_array)
end

def front_page(news_array) # Displays front page
	news_array.each do |story| 
		puts "#{story[:title]}"
		puts "Category: #{story[:category]}"
		puts "Current Upvotes: #{story [:upvotes]}"
		puts ""
	end
end


def calculate_upvotes(title, category) # Calculates upvotes
	upvotes = 1
	if category.include?('food') || title.include?('food')
		upvotes *= 5 
	end

	if category.include?('tech') || title.include?('tech')
		upvotes *= 8 
	end

	if category.include?('business') || title.include?('business')
		upvotes *= 3 
	end

	upvotes
end

puts ''
puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
puts ''
get_mashable_stories
get_digg_stories
get_reddit_stories

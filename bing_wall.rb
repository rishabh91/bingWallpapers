require 'httparty'
require 'vine'
require 'open-uri'

base_url = "https://www.bing.com"

response = HTTParty.get("#{base_url}/HPImageArchive.aspx?format=js&idx=0&n=2&mkt=en-IN")

image_url_from_response = response.access("images")
image_url_from_response = image_url_from_response.first.access("url")
image_filename = image_url_from_response.split('/').last

File.open("wallpapers/#{image_filename}", 'wb') do |file|
  file << open(base_url+image_url_from_response).read
end
require_relative "../config/application"
require_relative "../models/post"
require_relative "../models/user"
require 'faker'

# Seed you database with post data from hacker news
# And fake users using Faker gem

puts "Seeding database..."

#TODO: Your code goes here
# 1. create fake users
20.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email)
end


# 2. Scrape news from https://news.ycombinator.com/ and associate posts to your existing users
doc = Nokogiri::HTML(open('https://news.ycombinator.com/'))
nb_of_posts_on_hackernews = 30

for i in 0..nb_of_posts_on_hackernews-1 do
a = doc.css("td[class ='title'] a")[i]
 Post.create(name: a.text, date: Time.now, source_url: a['href'] )

################### DOES NOT WORK, CHECK EX11 SOLUTION #############

##rating
# b = doc.css("table tr td span")[i]
# puts "rating   #{b.text[0..-8] if b.text[-6..-1] == 'points'}"
#
# #user
#  c = doc.css("table tr td a[href]")[i]
# puts "user     #{c.text if c['href'][0..4] == 'user?'}"
# puts "\n\n"
end






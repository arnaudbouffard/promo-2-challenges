require_relative 'config/application'
require_relative 'models/post'

def ask_and_get(param)
  puts "What is the #{param} of your piece of news?"
  gets.chomp
end

while true

  puts "Hey you, what do you want to do today? Enter <task_id>"
  puts "1. Create a post"
  puts "2. Read your posts"
  puts "3. Delete all posts"
  puts "4. Exit"
  puts "5. Update"

  choice =  gets.chomp.to_i

  case choice
  when 1
    name = ask_and_get("name")
    source_url = ask_and_get("source url")
    rating = ask_and_get("rating")
    #TODO: use ActiveRecord to add a new entry to the DB
    post = Post.create( name: name, date: Time.now, source_url: source_url, rating: rating )
    puts post.name
    puts post.date
    puts post.source_url
    puts post.rating
  when 2
    #TODO: use ActiveRecord to get all entries from the DB
    Post.all.each do |post|
     puts "     ID = #{post.id}"
     puts "     name = #{post.name}"
     puts "     date = #{post.date}"
     puts "     url = #{post.source_url}"
     puts "     rating = #{post.rating}"
     puts "\n"
   end
 when 3
    #TODO: use ActiveRecord to delete all entries from the DB
    Post.all.each { |post| post.destroy }
  when 4
    break
  when 5
    Post.all.each do |post|
     puts "     ID = #{post.id}"
     puts "     name = #{post.name}"
     puts "     date = #{post.date}"
     puts "     url = #{post.source_url}"
     puts "     rating = #{post.rating}"
     puts "\n"
   end
   puts "Which post do you want to update? Enter <post_id>"
   chosen_post = Post.find_by(id: gets.chomp.to_i)
   puts "\nOk, now tell me which field you'd like to update. Enter <field_id>"
   puts "1. ID"
   puts "2. name"
   puts "3. date"
   puts "4. url"
   puts "5. rating"
   case gets.chomp.to_i
   when 1
    puts "\nNow type new value."
    chosen_post.id = gets.chomp.to_i
  when 2
    puts "\nNow type new value."
    chosen_post.name = gets.chomp
  when 3
    puts "\nNow type new value."
    chosen_post.date = gets.chomp
  when 4
    puts "\nNow type new value."
    chosen_post.source_url = gets.chomp
  when 5
    puts "\nNow type new value."
    chosen_post.rating = gets.chomp.to_i
  end
  chosen_post.save
  puts "     ID = #{chosen_post.id}"
  puts "     name = #{chosen_post.name}"
  puts "     date = #{chosen_post.date}"
  puts "     url = #{chosen_post.source_url}"
  puts "     rating = #{chosen_post.rating}"
  puts "\n"
end
end

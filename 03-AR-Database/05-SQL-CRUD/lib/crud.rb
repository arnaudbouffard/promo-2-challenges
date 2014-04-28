require 'sqlite3'

def create_scheme(db)
  #TODO: create your db scheme
  sql = %q{ CREATE TABLE posts(
    name VARCHAR,
    rating INTEGER,
    source_url VARCHAR,
    date
  )}  # %q allows for multiline string in ruby -SINGLE QUOTE
  db.execute(sql)
end

def create_post(db, post)
  #TODO: add a new post to your db
  sql = %Q{ INSERT INTO posts(name, rating, source_url, date) VALUES(
    '#{post[:name]}',
    '#{post[:rating]}',
    '#{post[:source_url]}',
    '#{post[:date]}'
  )}
  db.execute(sql)

# %Q allows for multiline string in ruby -DOUBLE QUOTE

end

def get_posts(db)
   #TODO: list all posts
   sql = %Q{ SELECT  * FROM posts
  }
  puts "\n"
  db.execute(sql) do |row|
    p row
  end
  puts "\n"
end

def get_post(db, id)
  #TODO: get a specific post
end

def update_post(db, id, name)
	#TODO: update a post's name in your db
end

def delete_posts(db)
  #TODO: delete all posts in your db
  sql = %Q{ DELETE FROM posts}
  db.execute(sql)
  puts "\n All posts have been deleted \n"
end

def delete_post(db, id)
  #TODO: delete a specific post in your db
end

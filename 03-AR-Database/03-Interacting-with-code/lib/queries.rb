require 'sqlite3'

# opens the database
DATABASE_PATH = "db/jukebox.sqlite"
db = SQLite3::Database.new(DATABASE_PATH)


db.execute( "select * from artists" ) do |row|
  p row
end

def number_of_rows(db, table_name)
  #TODO: count number of rows in table table_name

#    How many rows contains each table ?
#    Return the list of all the artists and sort them by name (alphabetical #order). Tip: use the order by SQL filter.
#    Find all the love songs (i.e the tracks that contain "love" in their name) #and count them. Tip: use the where and like SQL conditions.
#    Return all the tracks that are longer than 10 minutes and sort them by #length. Tip: you can use the comparison operator > in SQL.

end

def sorted_artists(db)
  #TODO: return array of artists' names sorted alphabetically
end

def love_tracks(db)
  #TODO: return array of love songs
end

def long_tracks(db, min_length)
  #TODO: return tracks verifying: duration > min_length (minutes)
end

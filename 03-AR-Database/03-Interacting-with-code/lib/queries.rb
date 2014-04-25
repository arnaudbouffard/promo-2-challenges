require 'sqlite3'

def divider
  puts "\n ----------------------------------------------------------------------------------------"
end

3.times do divider end

def mill_to_min(mill)
  mill/1000/60
end

def min_to_mill(min)
  min*60*1000
end

# opens the database
DATABASE_PATH = "db/jukebox.sqlite"
db = SQLite3::Database.new(DATABASE_PATH)
tables_titles = [] << "Album" << "Artist" << "Genre" << "Mediatype" << "Track"


def number_of_rows(db, table_name)
    row_counter = 0
    db.execute( "select * from #{table_name}" ) do |row|
      row_counter +=1
    end
    row_counter.to_s
end

def display_number_of_rows(db, table_name)
    print "      - " + table_name + " table is " + number_of_rows(db, table_name) + " rows long \n"
end

def sorted_artists(db)
  #TODO: return array of artists' names sorted alphabetically
  nb_artists = number_of_rows(db, "Artist")

  db.execute( "select Name from Artist order by Name" ) do |row|
      p row
    end
end

def love_tracks(db)
  #TODO: return array of love songs
    nb_songs = number_of_rows(db, "Track")
    love_songs = []
  db.execute( "select Name from Track where Name like '%love%'" ) do |row|
      p row
      love_songs << row
    end
    puts "\n      There are #{love_songs.length} love songs!"
end

def long_tracks(db, min_length)
  #TODO: return tracks verifying: duration > min_length (minutes)
    long_songs = []
  db.execute( "select Name, Milliseconds from Track where Milliseconds > #{min_length} order by Milliseconds" ) do |row|
      long_songs << row
    end
    long_songs.each { |song| puts "        - #{song[0]}, #{mill_to_min(song[1])} mins"}
    puts "\n      There are #{number_of_rows(db, "Track")} songs out of which #{long_songs.length} are more than #{mill_to_min(min_length)} mins long!"
end



tables_titles.each { |tables_title| display_number_of_rows(db, tables_title)}
divider
sorted_artists(db)
divider
love_tracks(db)
divider
long_tracks(db, min_to_mill(10))
3.times do divider end


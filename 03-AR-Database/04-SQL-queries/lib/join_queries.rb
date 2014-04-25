require 'sqlite3'

# opens the database
DATABASE_PATH = "db/jukebox.sqlite"
db = SQLite3::Database.new(DATABASE_PATH)

def divider
  puts "\n ----------------------------------------------------------------------------------------"
end

3.times do divider end

  def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  db.execute( "SELECT Track.Name, Artist.Name, Album.Title FROM Track
    JOIN Album ON Track.AlbumID = Album.AlbumID
    JOIN Artist ON Album.ArtistID = Artist.ArtistID") do |row|
  p row
end
end

def mill_to_min(mill)
  mill/1000/60
end

def stats_on(db, category)
  #TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  stats = []
  db.execute( "SELECT Genre.Name, Count(Track.TrackID) AS NumberTracks, Avg(Track.Milliseconds) AS AverageLength  FROM Track
    LEFT JOIN Genre
    ON Track.GenreID = Genre.GenreID
    WHERE Genre.Name = '#{category}'
    GROUP BY Genre.Name") do |row|
  stats << { category: row[0], number_of_songs: row[1], avg_length: mill_to_min(row[2]).round(1) }
end
puts stats
end

def top_five_rock_artists(db)
  #TODO: return list of top 5 rock artists
  db.execute( "SELECT Artist.Name, Count(Track.TrackID) AS NumberTracks FROM Artist
    JOIN Album ON Artist.ArtistId = Album.ArtistId
    JOIN Track ON Album.AlbumId = Track.AlbumId
    JOIN Genre ON Genre.GenreId = Track.GenreId
    WHERE Genre.Name = 'Rock'
    GROUP BY Artist.Name
    ORDER BY NumberTracks desc
    LIMIT 5
    " ) do |row|
  p row
end
#join
#Count
#group by
#order by
#limit#

end

#detailed_tracks(db)
# stats_on(db, "Rock")
# top_five_rock_artists(db)

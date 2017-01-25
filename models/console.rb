require 'pry-byebug'
require_relative './Artist'
require_relative './Album'

artist1 = Artist.new({'name' => 'Super Furry Animals'})
artist2 = Artist.new({'name' => 'Brian Eno'})

artist1.save
artist2.save

album1 = Album.new({'title' => 'Fuzzy Logic', 'genre' => 'Pop/Rock', 'artist_id' => artist1.artist_id})
album2 = Album.new({'title' => 'Rings Around the World', 'genre' => 'Pop/Rock', 'artist_id' => artist1.artist_id})
album3 = Album.new({'title' => 'Music for Airports', 'genre' => 'Ambient', 'artist_id' => artist2.artist_id})

album1.save
album2.save
album3.save

binding.pry
nil
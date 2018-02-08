require("pry")
require_relative("../models/album")
require_relative("../models/artist")



artist1 = Artist.new({ 'name' => 'Craig Leon' })
artist1.save

album1 = Album.new({
  'name' => 'Early Electronic Works',
  'genre' => 'Electronic',
  'artist_id' => artist1.id
  })
album1.save

artist2 = Artist.new({ 'name' => 'Suzanne Ciani' })
artist2.save

album2 = Album.new({
  'name' => 'Lixiviation',
  'genre' => 'Electronic',
  'artist_id' => artist2.id
  })
album2.save


album3 = Album.new({
  'name' => 'Buchla Concerts 1975',
  'genre' => 'Electronic',
  'artist_id' => artist2.id
  })
album3.save







binding.pry
nil

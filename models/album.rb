require ('pg')
require_relative('./artist')
require_relative('../db/sql_runner')

class Album

  attr_accessor :name, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  # def create(name)
  #   sql = "INSERT INTO albums (name, genre, artist_id) VALUES ($1) RETURNING id"
  #   values = []
  #
  # end


  def save()
    sql = "INSERT INTO albums (name, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end


  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end


  def self.list_all()
    sql = "SELECT * FROM albums"
    found = SqlRunner.run(sql)
    albums = found.map { |album| Album.new(album)  }
    return albums
  end


end

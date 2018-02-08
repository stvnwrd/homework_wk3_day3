require('pg')
require_relative('../db/sql_runner.rb')


class Artist

  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end


  # def self.create(name)
  #   sql = "INSERT INTO artists(name) VALUES ($1) RETURNING id"
  #   values =[name]
  #   @id = SqlRunner.run(sql, values)[0]["id"].to_i
  # end


  def save()
    sql = "INSERT INTO artists(name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end


  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql, values)
  end


  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end


  def self.list_all()
    sql = "SELECT * FROM artists"
    found = SqlRunner.run(sql)
    artists = found.map { |artist| Artist.new(artist)  }
    return artists
  end

  def all_albums_by_artist
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end

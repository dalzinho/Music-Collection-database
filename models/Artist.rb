require_relative '../db/SqlRunner'
require_relative './AlbumDetail'
require 'pry-byebug'

class Artist

  attr_reader :artist_id
  attr_accessor :name

  def initialize(options)
    @artist_id = options['artist_id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @artist_id = result.first['artist_id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    SqlRunner.run(sql).map { |artist| Artist.new(artist)}
  end

  def all_albums()
    sql = "SELECT art.name, alb.title, alb.genre FROM artists art INNER JOIN albums alb ON art.artist_id = alb.artist_id WHERE alb.artist_id = #{@artist_id};"
    SqlRunner.run(sql).map { |album| AlbumDetail.new(album) }
    # SqlRunner.run(sql).map { |album| Album.new(album)}
  end

  def update()
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE artist_id = #{@artist_id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists WHERE artist_id = #{@artist_id};"
    SqlRunner.run(sql)
  end

  def self.get_by_id(search_id)
    sql = "SELECT * FROM artists WHERE artist_id = #{search_id};"
    result = SqlRunner.run(sql).first

    return Artist.new(result)
  end


end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
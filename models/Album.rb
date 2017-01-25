require './db/SqlRunner'
require_relative './Artist'

class Album

  attr_accessor :title, :genre, :artist_id

  def initialize(options)

    @album_id = options['album_id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i

  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{@artist_id}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result.first['artist_id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    SqlRunner.run(sql).map {|album| Album.new(album)}
  end

  def artist()
    sql = "SELECT name FROM artists WHERE artist_id = #{@artist_id}"
    result = SqlRunner.run(sql).first
    return Artist.new( result )
  end

  def update()
    sql = "UPDATE albums SET (title, genre, artist_id) = ('#{@title}', '#{@genre}', #{artist_id}) WHERE album_id = #{@album_id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE album_id = #{@album_id}"
    SqlRunner.run(sql)
  end

  def self.get_by_id(album_id)
    sql = "SELECT * FROM albums WHERE album_id = #{album_id.to_i}"
    result = SqlRunner.run(sql).first
    return Album.new(result)
  end



end
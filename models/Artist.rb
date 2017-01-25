require_relative '../db/SqlRunner'

class Artist

  attr_reader :artist_id, :name

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
    sql = "SELECT * FROM albums WHERE artist_id = #{@artist_id}"
    SqlRunner.run(sql).map { |album| Album.new(album)}

  end

end   
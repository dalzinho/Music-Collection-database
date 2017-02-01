class AlbumDetail

  attr_reader :name, :title, :genre

  def initialize(options)
    @name = options['name']
    @title = options['title']
    @genre = options['genre']
  end

end

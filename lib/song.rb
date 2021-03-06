class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    file_segments = filename.split(" - ")

    new_song = self.new(file_segments[1])
    new_song.artist_name=(file_segments[0])
    new_song
  end
end

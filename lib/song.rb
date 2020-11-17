class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = false, artist_name = false)
    @name = name if name
    @artist_name = artist_name if artist_name
    puts self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    @name = name
    new_song = self.new(name)
    new_song
  end

  def self.create_by_name(name)
    @@all << self.new_by_name(name)
    @@all.last
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name) 
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name[0] }
  end

  def self.new_from_filename(filename)
    artist, name = filename.split(/\s+-\s+/)
    new_song = self.new(name.chop[0...-3], artist)
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end

end

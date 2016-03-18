require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.new_by_name(song_string)
    song = self.new
    song.name = song_string
    song
  end

  def self.create_by_name(song_string)
    song = self.new
    song.name = song_string
    @@all << song
    song
  end

  def self.find_by_name(song_string)
    @@all.detect {|song| song.name == song_string}
  end

  def self.find_or_create_by_name(song_string)
    self.find_by_name(song_string)
    self.create_by_name(song_string)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(artist_and_song)
    artist_and_song.slice!(".mp3")
    art_arr = artist_and_song.split(" - ")
    song = self.new
    song.name = art_arr[1]
    song.artist_name = art_arr[0]
    song
  end

  def self.create_from_filename(artist_and_song)
    artist_and_song.slice!(".mp3")
    art_arr = artist_and_song.split(" - ")
    song = self.new
    song.name = art_arr[1]
    song.artist_name = art_arr[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
end

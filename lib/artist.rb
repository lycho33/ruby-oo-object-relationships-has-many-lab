require 'pry'
class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self #the song's artist belongs to the artist class
    end

    def add_song_by_name(name)
        song = Song.new(name)
        song.artist = self
    end

    def songs #has many songs
        Song.all.select {|song| song.artist == self} 
        #song.artist is calling the Song class' artist
        #we want to comapare song.artist to the artists in the artist class itself and only select the ones that match
    end

   def self.song_count
        Song.all.count #calls the Song class & counts it
   end
end
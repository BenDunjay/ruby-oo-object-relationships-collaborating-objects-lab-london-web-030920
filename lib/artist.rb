require 'pry'
class Artist
attr_accessor :name

@@all = []

def initialize(name)
    @name = name
    save
end

def save
@@all << self
end

def self.all
    @@all
end

def add_song(song)
        song.artist = self
end

def songs
    Song.all.select {|song| song.artist == self}
end

def self.find_or_create_by_name(name)
    if !self.all.find { |artist| artist.name == name}
        self.new(name)
        end
        self.all.find { |artist| artist.name == name}
end

def print_songs
    Song.all.find{|song| 
    if song.artist == self
        puts song.name
    end
    }
end

end
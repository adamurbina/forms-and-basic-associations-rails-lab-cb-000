class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(content_array)
    content_array.each do |phrase|
      note_contents << phrase if phrase != ''
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content.split("++")
    end
  end

end

class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist

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

  def note_contents
    Notes.each do |note|
      note.content if note.song.id = self.id
    end
  end



end

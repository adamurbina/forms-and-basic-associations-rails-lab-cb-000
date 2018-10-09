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
    note = Note.find_or_create_by(song_id: self.id)
    note.content = note.content + parse_content(content_array)
    note.save
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def parse_content(content)
    content_string = ''
    content.each do |phrase|
      if phrase != ''
        content_string = content_string + phrase
      end
    end
    content_string
  end



end

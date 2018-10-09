class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

end

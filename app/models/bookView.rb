class BookView < ApplicationRecord
  def self.search(authorName)
    where(" upper(name) LIKE upper(?) or upper(name_author) LIKE upper(?)", "%#{authorName}%", "%#{authorName}%")
  end
end
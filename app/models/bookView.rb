class BookView < ApplicationRecord
  def self.search(bookName)
    where(" upper(name) LIKE upper(?) or upper(name_author) LIKE upper(?)", "%#{bookName}%", "%#{bookName}%")
  end
end
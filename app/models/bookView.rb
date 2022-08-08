class BookView < ApplicationRecord
  def self.search(bookName)
    where(" upper(nameBook) LIKE upper(?) or upper(nameAuthor) LIKE upper(?)", "%#{bookName}%", "%#{bookName}%")
  end
end
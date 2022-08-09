class BookFreeView < ApplicationRecord
  def self.search(searchText)
    where(" upper(name) LIKE upper(?) or upper(name_author) LIKE upper(?)", "%#{searchText}%", "%#{searchText}%")
  end
end
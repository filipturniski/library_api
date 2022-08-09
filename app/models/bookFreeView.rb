class BookFreeView < ApplicationRecord
  def self.search(searchText)
    where(" book_name is ? and (author_id is ? or ? is null)  and (status_id = 4 or status_id is null)", "%#{searchText}%", "%#{searchText}%", "%#{searchText}%")
  end
end
class BookFreeView < ApplicationRecord
  def self.search(bookSearch, authorSearch)
    where(" book_name is ? and (author_id is ? or ? is null)  and (status_id = 4 or status_id is null)", "#{bookSearch}", "#{authorSearch}", "#{authorSearch}")
  end
end
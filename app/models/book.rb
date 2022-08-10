class Book < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true

  belongs_to :author
  belongs_to :status
  #belongs_to   :creator
  #belongs_to   :updater

  def self.search(bookName)
    where(" upper(name) like upper(?) or authors_id in (select id from authors where upper(name_author) like upper(?))
                and status_id = 1", "%#{bookName}%", "%#{bookName}%")
  end

  def self.searchActiveBookId(searchId)
    where(" id is ? and status_id = 1", "#{searchId}")
  end

  def self.searchActiveBookName(searchId)
    where(" name is ? and status_id = 1", "#{searchId}")
  end
end

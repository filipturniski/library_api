class Book < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :creator_id, presence: true
  validates :updater_id, presence: true

  belongs_to :author
  belongs_to :status

  def self.active()
    where("status_id  <> 5")
  end

  def self.search(bookName)
    where(" upper(name) like upper(?) or author_id in (select id from authors where upper(name_author) like upper(?))
                and status_id  <> 5", "%#{bookName}%", "%#{bookName}%")
  end

  def self.searchActiveBookId(searchId)
    where(" id is ? and status_id  <> 5", "#{searchId}")
  end

  def self.searchActiveBookName(searchName)
    where(" name is ? and status_id  <> 5", "#{searchName}")
  end

  def self.searchActiveBookNameAuthor(searchId, searchAuthor)
    where(" name is ? and status_id  <> 5 and author_id is ?", "#{searchId}", "#{searchAuthor}")
  end

end

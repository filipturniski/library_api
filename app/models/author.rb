class Author < ApplicationRecord
  validates :name_author, presence: true
  validates :creator_id, presence: true
  validates :updater_id, presence: true
  belongs_to :status
  def self.search(searchMember)
    where(" upper(name_author) LIKE upper(?) and status_id <> 5", "%#{searchMember}%")
  end

  def self.active()
    where("status_id  <> 5")
  end

  def self.searchActiveAuthorsId(searchId)
    where(" id is ? and status_id  <> 5", "#{searchId}")
  end

  def self.searchActiveAuthorsName(searchId)
    where(" id is ? and status_id  <> 5", "#{searchId}")
  end
end

class Authors < ApplicationRecord
  validates :name_author, presence: true
  belongs_to :status
  def self.search(searchMember)
    where(" upper(name_author) LIKE upper(?) and status_id = 1", "%#{searchMember}%")
  end

  def self.searchActiveAuthorsId(searchId)
    where(" id is ? and status_id = 1", "#{searchId}")
  end

  def self.searchActiveAuthorsName(searchId)
    where(" id is ? and status_id = 1", "#{searchId}")
  end
end

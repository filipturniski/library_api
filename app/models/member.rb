class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  belongs_to :status
  #belongs_to :creator
  #belongs_to :updater

  def self.search(searchText)
    where(" upper(first_name) LIKE upper(?) or upper(last_name) LIKE upper(?) or upper(username) LIKE upper(?)", "%#{searchText}%", "%#{searchText}%", "%#{searchText}%")
  end
end

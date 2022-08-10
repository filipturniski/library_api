class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  belongs_to :status
  #belongs_to :creator
  #belongs_to :updater
  #encrypts :password

  def self.search(searchText)
    where(" upper(first_name) LIKE upper(?) or upper(last_name) LIKE upper(?) or upper(username) LIKE upper(?)", "%#{searchText}%", "%#{searchText}%", "%#{searchText}%")
  end

  def self.searchActiveMemeberId(searchId)
    where(" id is ? and status_id = 1", "#{searchId}")
  end

  def self.searchActiveMemeberName(searchId)
    where(" name is ? and status_id = 1", "#{searchId}")
  end

  def self.searchActiveMemeberUsername(searchId)
    where(" username is ? and status_id = 1", "#{searchId}")
  end
end

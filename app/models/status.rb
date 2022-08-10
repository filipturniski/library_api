class Status < ApplicationRecord
  validates :description_status, presence: true
  def self.search(searchId)
    where(" id = ?", "%#{searchId}%")
  end
end

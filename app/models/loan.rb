class Loan < ApplicationRecord
  validates :creator_id, presence: true
  validates :updater_id, presence: true

  def self.search(searchMember)
    where(" user_id = ? and status_id <> 5", "#{searchMember}")
  end

  def self.active()
    where("status_id  <> 5")
  end

  def self.activeLoans(searchId)
    where("status_id  <> 5 and id is ? ", "#{searchId}")
  end

  def self.searchActiveLoans(searchId)
    where(" user_id = ? and status_id <> 5", "#{searchId}")
  end

  def self.searchActiveMemeberLoans(searchId)
    where(" user_id = ? and status_id = 3", "#{searchId}")
  end
end

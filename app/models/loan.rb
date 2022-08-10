class Loan < ApplicationRecord
  def self.search(searchMember)
    where(" user_id = ? and status_id <> 5", "#{searchMember}")
  end

  def self.searchActiveMemeberLoans(searchId)
    where(" user_id = ? and status_id = 3", "#{searchId}")
  end
end

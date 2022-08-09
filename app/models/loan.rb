class Loan < ApplicationRecord
  def self.search(searchMember)
    where(" member_id = ? and status_id <> 5", "#{searchMember}")
  end

  def self.searchActiveMemeberLoans(searchId)
    where(" member_id = ? and status_id = 3", "#{searchId}")
  end
end

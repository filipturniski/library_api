class Loan < ApplicationRecord
  def self.search(searchMember)
    where(" member_id = ? and status_id <> 5", "#{searchMember}")
  end
end

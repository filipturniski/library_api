class Loan < ApplicationRecord
  validates :idMember, presence: true
  validates :idBook, presence: true
  validates :status, presence: true
  validates :createDate, presence: true
  validates :createBy, presence: true
end

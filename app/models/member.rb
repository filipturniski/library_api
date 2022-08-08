class Member < ApplicationRecord
  validates :idMember, presence: true
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :username, presence: true
  validates :status, presence: true
  validates :createDate, presence: true
  validates :createBy, presence: true
end

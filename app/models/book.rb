class Book < ApplicationRecord
  validates :idBook, presence: true
  validates :idAuthor, presence: true
  validates :nameBook, presence: true
  validates :bookLocation, presence: true
  validates :status, presence: true
  validates :createDate, presence: true
  validates :createBy, presence: true
end

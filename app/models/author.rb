class Author < ApplicationRecord
  validates :idAuthor, presence: true
  validates :nameAuthor, presence: true
  validates :status, presence: true
  validates :createDate, presence: true
  validates :createBy, presence: true
end

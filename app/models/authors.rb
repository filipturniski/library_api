class Authors < ApplicationRecord
  validates :name_author, presence: true
  belongs_to :status
end

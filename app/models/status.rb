class Status < ApplicationRecord
  validates :idStatus, presence: true
  validates :descriptionStatus, presence: true
end

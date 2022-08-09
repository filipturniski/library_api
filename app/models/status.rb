class Status < ApplicationRecord
  validates :descriptionStatus, presence: true
end

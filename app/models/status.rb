class Status < ApplicationRecord
  validates :description_status, presence: true
end

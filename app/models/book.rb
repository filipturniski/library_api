class Book < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  belongs_to :status
  belongs_to :authors
  #belongs_to :creator
  #belongs_to :updater
end

class Location < ApplicationRecord
  belongs_to :event
  has_many :listings
  has_one_attached :image
  has_many :waypoints
end
